#!/usr/bin/env python3
"""Checks the program PDF (D33). Run from anywhere: python3 scripts/check-pdf.py
(scripts/build-pdf.sh runs it after every build.)

Fails if the PDF is missing, the wrong size or page count, uses a fallback font, has a page whose
content overflowed, or no longer contains every piece of guest-facing text on public/index.html
(schedule, honoree names and presenters, verbatim bios, closing note, About, links). Needs poppler.
"""
import html.parser, os, re, subprocess, sys, unicodedata

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SITE = os.path.join(ROOT, "public", "index.html")
SRC = os.path.join(ROOT, "pdf", "program.html")
PDF_REL = "assets/2026-annual-awards-banquet-program.pdf"
PDF = os.path.join(ROOT, "public", PDF_REL)
PDF_MAX = 1_500_000  # 1.5 MB (docs/03-design-system.md)

# Web-only wording that the PDF leaves out on purpose.
WEB_ONLY = ["Tap one to see it full size."]

BLOCKS = {"p", "h1", "h2", "h3", "h4", "li", "time", "figcaption", "summary"}
SKIP_CLASSES = {"sr-only", "tabbar", "pdf", "skip"}


class Blocks(html.parser.HTMLParser):
    """Collects the text of every innermost text block (p, li, h1–h4, …) on the site."""

    def __init__(self):
        super().__init__()
        self.stack, self.out = [], []

    def handle_starttag(self, tag, attrs):
        if tag in {"img", "br", "meta", "link", "input", "source"}:
            return
        a = dict(attrs)
        cls = set((a.get("class") or "").split())
        block = tag in BLOCKS or (tag == "span" and cls & {"seg", "honor"})
        skip = bool(cls & SKIP_CLASSES) or tag in {"summary", "script", "style", "head", "button"}
        if block:
            for e in self.stack:
                if e["block"]:
                    e["leaf"] = False
        self.stack.append({"tag": tag, "block": block, "leaf": True, "skip": skip, "text": []})

    def handle_endtag(self, tag):
        if not self.stack or tag in {"img", "br"}:
            return
        while self.stack:
            e = self.stack.pop()
            if e["tag"] == tag:
                break
        text = "".join(e["text"])
        if e["block"] and e["leaf"] and not any(x["skip"] for x in self.stack) and not e["skip"]:
            if text.strip():
                self.out.append(" ".join(text.split()))
        if self.stack and not e["skip"]:
            self.stack[-1]["text"].append(" " + text + " " if e["block"] else text)

    def handle_data(self, data):
        if self.stack:
            self.stack[-1]["text"].append(data)


def squash(s):
    """Compare text ignoring case, spacing, and hyphens, so layout can't cause false alarms.
    (pdftotext joins a word split at a line-end hyphen and drops the hyphen: "CT-01" becomes "CT01".)"""
    s = unicodedata.normalize("NFKC", s).casefold()
    return re.sub(r"[\s-]+", "", s)


def run(*cmd):
    return subprocess.run(cmd, check=True, capture_output=True, text=True).stdout


def size_label(n):
    return f"{round(n / 1000)} KB" if n < 1_000_000 else f"{n / 1_000_000:.1f} MB"


def main():
    problems = []
    if not os.path.isfile(PDF):
        sys.exit(f"MISSING: {PDF}. Run: bash scripts/build-pdf.sh")
    src = open(SRC, encoding="utf-8").read()
    site = open(SITE, encoding="utf-8").read()
    size = os.path.getsize(PDF)

    info = run("pdfinfo", PDF)
    pages = int(re.search(r"^Pages:\s+(\d+)", info, re.M).group(1))
    want_pages = len(re.findall(r'class="page[ "]', src))
    print(f"PDF {size:,} bytes ({size_label(size)}), {pages} pages")
    if pages != want_pages:
        problems.append(f"{pages} pages, expected {want_pages}: something spilled onto an extra page")
    if "612 x 792" not in info:
        problems.append("page size is not US Letter")
    if size > PDF_MAX:
        problems.append(f"PDF is {size:,} bytes, over the {PDF_MAX:,} budget")

    fonts = [l.split()[0] for l in run("pdffonts", PDF).splitlines()[2:] if l.strip()]
    bad = sorted({f for f in fonts if "Poppins" not in f and "Allura" not in f})
    if bad:
        problems.append("fallback fonts embedded (a web font failed to load or lacks a character): " + ", ".join(bad))
    for need in ("Poppins-Regular", "Poppins-Bold", "Allura"):
        if not any(need in f for f in fonts):
            problems.append(f"font {need} is not embedded")

    text = run("pdftotext", "-enc", "UTF-8", PDF, "-")
    if "PAGE OVERFLOW" in text:
        problems.extend("content too tall: " + l for l in text.splitlines() if "PAGE OVERFLOW" in l)

    parser = Blocks()
    parser.feed(site)
    flat = squash(text)
    missing = []
    for item in parser.out:
        for w in WEB_ONLY:
            item = item.replace(w, "")
        if item.strip() and squash(item) not in flat:
            missing.append(item)
    print(f"Text check: {len(parser.out) - len(missing)} of {len(parser.out)} site text blocks found in the PDF")
    problems.extend("not in the PDF (or different): " + m for m in missing)

    web_imgs = re.findall(r'src="assets/img/(?:ads/)?([\w-]+)\.webp"', site)
    pdf_imgs = re.findall(r'src="img/([\w-]+)\.jpg"', src)
    if web_imgs != pdf_imgs:
        problems.append(f"photos/ads differ from the site: site {web_imgs}, PDF {pdf_imgs}")

    label = "PDF · " + size_label(size)
    m = re.search(r'<a[^>]+href="' + re.escape(PDF_REL) + r'"[^>]*>(.*?)</a>', site, re.S)
    if not m:
        print(f"Note: public/index.html has no link to {PDF_REL} yet. Label it: {label}")
    elif label not in m.group(1):
        problems.append(f"the download link's size label is out of date; it should say: {label}")
    else:
        print(f"Download link label OK: {label}")

    if problems:
        print("FAILED:")
        for p in problems:
            print("  - " + p)
        sys.exit(1)
    print("OK: the PDF matches the site")


if __name__ == "__main__":
    main()

# 05 · Launch checklist: QR code, PDF, QA, event day

## A. QR code spec (the only thing we can't fix after printing)

- **Encode exactly:** `HTTPS://PROGRAM.STRATFORDDEMOCRATS.COM` (or the final D1 address).
  - All caps is intentional. QR codes store uppercase letters in a compact “alphanumeric” mode, which makes a **less dense code that scans faster in dim light.** Domain names aren't case-sensitive, so the link works the same.
  - Never encode a `*.github.io`, `*.vercel.app`, `*.chatgpt.site`, or URL-shortener address. **Never use a “dynamic QR” service** either. Those add redirects, tracking, and expiry dates.
- **Error correction:** M (15%). Use Q if the cards might get splashed or folded. No logo in the middle, because a plain code scans more reliably.
- **Print size:** at least **1.25 in (3.2 cm)** square. 1.5 in is better for a table tent read from a seated position.
- **Colors:** dark navy or black on white or cream. Never gold on navy (too little contrast for scanners), and never an inverted code.
- **Quiet zone:** a margin of 4 modules on every side.
- **Paper:** matte, because gloss causes glare under ballroom lights.
- **Label under the code:** “**Scan for tonight's program**” (or “today's”; it's a brunch) plus the address in plain text: `program.stratforddemocrats.com`.
- ✅ **Generated 2026-09-23** in `print/`: `qr-program.svg` (vector, for the designer or printer) and `qr-program-1200px.png`. It's a version 2 code (25×25 modules), error correction M, navy `#0a1230` on white, with a 4-module quiet zone. A decode check (Chrome BarcodeDetector) returned exactly `HTTPS://PROGRAM.STRATFORDDEMOCRATS.COM`.
  To regenerate:
  ```bash
  npx --yes qrcode@1 -t svg -e M -q 4 -d 0a1230 -l ffffff -o print/qr-program.svg "HTTPS://PROGRAM.STRATFORDDEMOCRATS.COM"
  ```
- **Test before sending to print:** iPhone Camera, Android Camera/Google Lens, and one older phone. Test at arm's length, in a dim room, and from a printed proof (not the screen).

## B. Build the PDF (keepsake / backup)

The recommended default (D7) is to generate it from the site, so it always matches.
1. Start the preview server (see AGENTS.md).
2. Print with headless Chrome:
   ```bash
   "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless=new --disable-gpu \
     --no-pdf-header-footer --print-to-pdf="public/assets/2026-annual-awards-banquet-program.pdf" \
     "http://127.0.0.1:4173/"
   ```
   The print stylesheet expands every bio automatically. If headless printing doesn't fire `beforeprint`, add `<details open>` temporarily, or print from Chrome's Print dialog with “Background graphics” off.
3. Check the file: letter size, readable, names correct, **≤ 1.5 MB**.
4. Update the button label in `public/index.html` with the real size (e.g. `PDF · 420 KB`). `scripts/check-budget.sh` prints the size.

If the committee prefers the Canva design as the PDF: export it from Canva as **“PDF Standard”** (not Print), then compress it to 2 MB or less. Also check that its content matches the web page exactly.

## C. Pre-launch QA (Friday)

**Content**
- [ ] Every name is spelled exactly: Afriyie, D’Angelo-Powers, Folsom-O’Keefe, the Volunteers of the Year, and all sponsors
- [ ] Times match the final run of show, and the award order matches the stage order
- [ ] Bios match `content/honorees.md` word for word. The “Photo by Luke Franke” credit is under **Corrie’s** photo.
- [ ] No `Draft:` notes, placeholder text, or `DRAFT COPY` comments remain, **or** each remaining one is approved
- [ ] The “Paid for by…” decision is applied
- [ ] Every link opens correctly: Volunteer, email updates, Facebook, Instagram, website, email, phone, and PDF

**Devices** (real phones, not just DevTools)
- [ ] iPhone in Safari: tab bar clears the home indicator, “Read full bio” opens, the PDF opens
- [ ] Android in Chrome: same checks
- [ ] Tablet (iPad) portrait
- [ ] System text size set to **Large** on both phones: nothing overlaps
- [ ] 320px width in DevTools: no horizontal scrolling

**Speed**
- [ ] `bash scripts/check-budget.sh` → OK
- [ ] DevTools → Network → **Slow 4G**, with cache disabled: the first screen shows in under 2 s
- [ ] Lighthouse (mobile): Performance ≥ 95, Accessibility = 100, Best Practices ≥ 95

**Accessibility**
- [ ] VoiceOver or TalkBack reads the headings in order, and the photos have alt text
- [ ] Keyboard: the skip link works and focus rings are visible

**Hosting**
- [ ] `https://program.stratforddemocrats.com` loads over HTTPS in a private window, on cellular data
- [ ] `http://` redirects to `https://`
- [ ] No login wall and no host banner

## D. Launch (Saturday)

- [x] Delete `.draft-banner` (done 2026-09-23 at Blake's request)
- [ ] Delete each remaining `.draft-note` and `.placeholder` as its content arrives
- [ ] Apply D9 (`noindex` or not)
- [ ] Add og:image and og:url
- [ ] Publish. Scan a **printed** table card and confirm it shows the final version.
- [ ] `git tag v1.0-event` (with the owner's OK)
- [ ] Print 10–15 backup copies of the PDF (D13)

## E. Event day

- [ ] **9:30 AM freeze.** After this, fix only real errors.
- [ ] 10:15 AM on site: scan a card on cellular at 2–3 spots in the room. Check guest Wi-Fi.
- [ ] Put backup printed copies at registration
- [ ] Someone who can edit (Blake) keeps a laptop or phone with GitHub access nearby
- [ ] An emergency fix takes 1–10 min to publish, plus up to 10 min of cache for guests who already opened the page

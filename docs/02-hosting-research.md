# 02 · Hosting research: ChatGPT Sites, Vercel, GitHub Pages (and others)

*Researched 2026-09-23 by Claude, using official docs and live header checks. Tags: **[C]** confirmed from a source, **[I]** inference. Prices and limits change, so re-check before relying on a number.*

## TL;DR recommendation

1. **Build it as plain static files** in `public/`, no framework. Codex and Claude can both edit it, and every host below can serve it.
2. **Host it on GitHub Pages** (free, allowed for organizations, no login walls, no framework overhead).
3. **Put our own address in the QR code:** `https://program.stratforddemocrats.com`, a CNAME record in the domain's DNS. The printed code then never depends on a vendor. If a host fails, we point the DNS at another host and the same QR code keeps working.
4. **Don't host the guest-facing program on ChatGPT Sites.** Use Codex to *write* the code, and don't use ChatGPT Sites to *serve* it. The reasons are below.

## Our situation (found during kickoff)

- The main site `www.stratforddemocrats.com` is Astro on **Netlify's Free plan** (`stratford-dtc-preview.netlify.app`). [C: response headers and the main repo's `ops/netlify-setup.md`]
- **The domain's DNS is at Wix** (nameservers `ns6.wixdns.net` and `ns7.wixdns.net`). Adding `program.stratforddemocrats.com` means adding one CNAME record in the Wix DNS panel. [C: `dig NS`]
- Netlify Free has a hard credit cap. A production deploy costs 15 credits, and if credits run out, **every project on the account pauses, including the main website**. [C: Netlify docs] Adding a series of program edits to the main site's Netlify account during event week is avoidable risk. At most, the main site gets **one** deploy to add a “View the digital program” link (D11).
- `gh` is signed in as **Blake32p**. The main site repo `Blake32p/stratford-democrats` is private.

## Option comparison

| | **GitHub Pages** (recommended) | **Vercel Hobby** | **ChatGPT Sites** (Codex) | Cloudflare Pages (backup) | Netlify (main site's account) |
|---|---|---|---|---|---|
| Cost | Free | Free | Needs ChatGPT Plus/Pro/Business | Free | Free, credit-capped |
| Allowed for a party committee? | ✅ “personal **and organizational** projects”; no e-commerce [C] | ⚠️ “**non-commercial personal use only**”; **paid ads count as commercial** [C] | ⚠️ Beta; usage policy bars “political campaigning” (a program isn't campaigning, but it's a gray area) [C/I] | ✅ No non-commercial clause found [I] | ✅ Already the org's host |
| Public URL, no login | ✅ | ⚠️ Production is public; preview URLs sit behind a Vercel login by default [C] | ⚠️ New Sites start private, so you must switch them to “Anyone on the internet” [C] | ✅ | ✅ |
| Custom domain | ✅ CNAME + free HTTPS [C] | ✅ CNAME + free HTTPS [C] | “Where available”; plans not documented [C] | ✅ CNAME [C] | ✅ |
| Speed | Good: HTTP/2, gzip (no Brotli), cache `max-age=600` [C: curl] | Best: Brotli, HTTP/3, headers under our control [C] | Slower: a React/vinext runtime, about 128 KB of JS on every visit, and HTML sent `no-store` [C: observed] | Best: Brotli, HTTP/3, `_headers` [C] | Very good |
| Time for an edit to go live | 1–10 min to publish, plus up to 10 min of browser cache [C] | Seconds [C] | Instant [C] | Seconds–1 min [C] | Build time; costs 15 credits each |
| Repo visibility | **Public repo required** on a free account [C] | Private OK (personal account) | n/a | Private OK | Existing private repo |
| Who can edit | Any collaborator, in the browser on GitHub | Hobby: only the owner's commits deploy [C] | Only the ChatGPT account owner | Account members | One Netlify member on Free [C] |
| Risks | Public repo (see “Keep private things private”); slower edits on the day | Terms-of-service risk if ads appear; login wall on previews | Beta limits can stop a busy Site staying public; OpenAI can remove a Site “at any time”; OpenAI may add a “powered by” footer; making a Site public licenses OpenAI to use its names and logos [C] | A new account to set up | Pausing the **main** website |

### Why not ChatGPT Sites for this program?
ChatGPT Sites (launched as “Sites” in Codex on Jun 2, 2026, and renamed in the Jul 9 public beta) is impressive for internal tools. For **this** job it has five problems:
1. **Speed:** it ships a JavaScript framework and uncached HTML. Our page needs no JavaScript to work and weighs about 104 KB in total.
2. **Permanence:** it's a beta with per-plan limits and discretionary takedowns. The QR code will be printed.
3. **Politics:** OpenAI's usage policy restricts political campaigning. An awards program probably isn't that, but we don't want to find out at 11 AM on Sunday.
4. **Terms:** a public Site grants OpenAI a license to the names and logos on it and allows OpenAI attribution in the footer.
5. **Lock-in:** OpenAI doesn't document exporting a Site made on the web.

**Codex is still a great tool for this project.** Run the Codex app, CLI, or IDE extension against this folder. It reads `AGENTS.md` and edits `public/index.html` like any developer would.

### Why not Vercel Hobby?
Vercel is technically excellent. But Hobby is “non-commercial **personal** use only,” and Vercel counts advertising as commercial. The 2026 banquet **sold ad-book ads**. If the program shows sponsors' ads, Vercel Hobby is clearly the wrong fit. Vercel Pro ($20/month) removes that concern if the committee prefers Vercel.

## Setup: status as of 2026-09-23

> Blake approved D1 on 2026-09-23. Claude did steps 1–3 with his `gh` login. **Step 4 needs Blake in Wix.**

- ✅ 1–2. The repo is https://github.com/Blake32p/banquet-program-2026 (public). The first deploy passed, and the page was checked live at the github.io address.
- ✅ 3. The Pages source is GitHub Actions, and the custom domain is set to `program.stratforddemocrats.com`.
- ⏳ 4. **Wix CNAME** (Blake).
- ⏳ 5. Optional domain verification (Blake, GitHub UI).
- ⏳ 6. HTTPS certificate, then **Enforce HTTPS** (Claude or Codex, after DNS).
- ⏳ 7. Phone test on cellular.

Original steps, for reference or for repeating on another repo:

1. **Create the repo** (public): `Blake32p/banquet-program-2026`, or put it under a free GitHub organization for the DTC so it can be handed over later. First check `.gitignore` and confirm `git status` shows no private files.
2. **Push** this folder. The workflow `.github/workflows/pages.yml` deploys `public/` on every push to `main` that changes `public/`.
3. **GitHub → repo Settings → Pages:** set Source to **GitHub Actions**. Set the custom domain to `program.stratforddemocrats.com`.
4. **Wix → Domains → stratforddemocrats.com → Manage DNS records → CNAME:** set Host to `program` and Value to `blake32p.github.io` (the org's `*.github.io` name if you use an org). Leave the TTL at the default.
5. **Recommended:** verify the domain in GitHub (Settings → Pages → Verified domains, which adds a TXT record in Wix) to prevent subdomain takeover.
6. Wait for DNS and the HTTPS certificate. It's often under an hour, but allow up to 24 hours. **Do it Wed or Thu.** Then turn on **Enforce HTTPS**.
7. Test `https://program.stratforddemocrats.com` in a **private/incognito window on a phone using cellular data** (Wi-Fi off).

### Plan B if DNS isn't ready by Thursday
Print the QR code for **`https://www.stratforddemocrats.com/program`** and add one redirect rule to the main site's `netlify.toml` (`/program` → the program's host, 302). That's one Netlify deploy (15 credits). The redirect adds one extra network round trip for guests (about 0.3–1 s on weak signal), so it's a fallback, not the first choice.

### Plan C if GitHub Pages misbehaves on event day
Cloudflare Pages: `npx wrangler pages deploy public`. Add `program.stratforddemocrats.com` to that project, then change the Wix CNAME to its `*.pages.dev` target. The printed QR code keeps working.

## Keep private things private (public repo)
- `.gitignore` excludes `reference/` (the Canva draft, which may hold unreleased content), `content/private/` (the internal run of show), and `.DS_Store`.
- Bios and photos are already public on the main website, so publishing them is fine.
- Before every commit, run `git status` and read the list.

## Sources
- GitHub Pages limits: https://docs.github.com/en/pages/getting-started-with-github-pages/github-pages-limits
- GitHub Pages terms: https://docs.github.com/en/site-policy/github-terms/github-terms-for-additional-products-and-features
- GitHub Pages custom domains: https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site
- GitHub Pages HTTPS: https://docs.github.com/en/pages/getting-started-with-github-pages/securing-your-github-pages-site-with-https
- GitHub Pages publishing source: https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site
- Vercel fair use: https://vercel.com/docs/limits/fair-use-guidelines
- Vercel Hobby: https://vercel.com/docs/plans/hobby
- Vercel deployment protection: https://vercel.com/docs/deployment-protection
- Vercel compression: https://vercel.com/docs/how-vercel-cdn-works/compression
- ChatGPT Sites docs: https://learn.chatgpt.com/docs/sites
- ChatGPT Sites help: https://help.openai.com/en/articles/20001339-creating-and-managing-chatgpt-sites
- ChatGPT Sites terms: https://openai.com/policies/chatgpt-sites-terms/
- OpenAI usage policies: https://openai.com/policies/usage-policies/
- ChatGPT release notes (Jul 9, Aug 20, Sep 3, 2026): https://help.openai.com/en/articles/6825453-chatgpt-release-notes
- Codex AGENTS.md: https://learn.chatgpt.com/docs/agent-configuration/agents-md
- Claude Code memory / CLAUDE.md imports: https://code.claude.com/docs/en/memory
- Cloudflare Pages limits: https://developers.cloudflare.com/pages/platform/limits/
- Cloudflare Pages custom domains: https://developers.cloudflare.com/pages/configuration/custom-domains/
- Netlify credit pricing: https://docs.netlify.com/manage/accounts-and-billing/billing/billing-for-credit-based-plans/credit-based-pricing-plans/

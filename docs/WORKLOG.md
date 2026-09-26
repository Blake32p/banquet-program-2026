# Work log

**Newest entry first.** Every agent session (Claude or Codex) and every meaningful human session adds an entry here *before stopping*. That lets the next person or agent pick up without re-reading the chat history.

### Template (copy it to the top)
```
## YYYY-MM-DD HH:MM ET · <Claude | Codex | Blake | …> · <one-line summary>
**Did:** bullets of what changed (files)
**Checked:** what was verified (budget script, widths, devices)
**Decisions:** any D# changed (also update DECISIONS.md)
**Blocked on / waiting for:** …
**Next step (exact):** the very next thing to do, specific enough to start cold
```

---

## 2026-09-25 16:53 ET · Claude · Built the downloadable PDF keepsake and linked it at the bottom of the program (local, not yet published)

**Did:** Per Blake (a PDF “based on this site,” referencing the flyer and promo graphics Blake attached): new `pdf/program.html`, 10 US Letter pages in the flyer’s look (full-bleed navy with soft lights, gold Poppins caps, Allura “Banquet,” gold sparkles): (1) cover modeled on the flyer, with logo, title, “Sunday, September 27, 2026 · 11 AM – 2 PM · Blackhawk Country Club · 385 Oronoque Ln, Stratford” (address from the flyer), and the framed “Celebrating our 2026 honorees” box; (2) Program; (3–5) one honoree per page (medallion portrait, presenter, full verbatim bio, Corrie’s photo credit); (6–8) Tributes: ad 1 under the section title, ads 2 and 3 together, Patti Moonan’s full-page ad alone; (9) Karen and Kathleen’s closing; (10) About, Stay connected (visible URLs), logo. No Volunteers of the Year (D14), no email or phone (D24). The Tributes line drops the web-only “Tap one to see it full size.” New `pdf/background.html` (page backgrounds), `scripts/build-pdf.sh` (JPEG copies of the site’s images → background JPEGs → headless Chrome print over a temporary local server → checks) and `scripts/check-pdf.py`. Output: `public/assets/2026-annual-awards-banquet-program.pdf`. In `public/index.html`, “Draft: PDF to come” is now a link: gold underlined “Download the program” with “PDF · 1.1 MB” below, using `download` (D20); the label copy keeps its DRAFT COPY marker. `.gitignore` now excludes `pdf/img/`. Updated `AGENTS.md` (folder map, a rule to rebuild the PDF after any content change, the build command), D7, D20, D33, docs 01/03/04/05.
**Checked:** Build passes: 1,131,218 bytes, 10 Letter pages, only Poppins Regular/Bold and Allura embedded, no page overflow, all 76 guest-facing text blocks on the site found in the PDF, same 7 images as the site, and the link label matches. Tagged PDF, `/Lang en`, title set, bookmarks for every section and honoree, alt text on the portraits and ads, 5 working website links, 8 internal links (cover and schedule names → honoree pages). Viewed every page at 60 dpi and details at 150 dpi. Site at 375 and 320px: the link is 81px tall, the PDF returns 200 `application/pdf`, no horizontal overflow, no console errors. Budget OK (first visit 111,454; full page 231,744). `git diff --check` passes. Nothing committed or pushed. Not opened on a real phone.
**Gotchas (for whoever rebuilds):** Chrome won’t load web fonts into a `file://` page, and Allura is installed on Blake’s Mac, which hides the failure, so the build serves over HTTP and the PDF uses unique font-family names. Chrome re-encodes WebP losslessly (~5× larger) but passes JPEG through, and rasterizes semi-transparent gradients on every page (~100 KB each), so backgrounds are one shared JPEG. The overflow check waits for `document.fonts.ready`.
**Decisions:** D7 adopted (see D33); D20 applied locally; D33 recorded as PROPOSED pending Blake’s review.
**Published (2026-09-26 09:20 ET):** Blake approved this version (“there may be some additional changes but let’s publish this version for now”). D33 and D20 marked ADOPTED. Committed `9fd77af` and pushed to `main`; Pages run 36244723427 succeeded. The live `index.html` and PDF are byte-identical to local; the PDF returns 200 `application/pdf` (1,131,218 bytes); on the live site the link reads “Download the program / PDF · 1.1 MB,” with no console errors and no horizontal overflow.
**Blocked on / waiting for:** Blake’s further PDF changes (expected). Patti Moonan’s higher-resolution ad (ad 4 prints at ~111 dpi, slightly soft).
**Next step (exact):** Apply Blake’s next PDF changes in `pdf/program.html`, run `bash scripts/build-pdf.sh` (update the link label in `public/index.html` if the check says the size changed), and publish with Blake’s OK. **From now on, every content change to `public/index.html` needs the same change in `pdf/program.html` and a rebuild** (the build fails otherwise). If Jill’s bio grows, her page is nearly full (~0.04 in spare); the check will flag it.

---

## 2026-09-25 16:23 ET · Claude · Blumenthal moved before Lamont; Volunteers of the Year and Campaign Volunteer Recognition removed (local, not yet published)

**Did:** (1) Per Blake, Welcome remarks order is now Kathleen Callahan → Susan Bysiewicz → Stephanie Thomas → Sean Scanlon → **Richard Blumenthal** → Ned Lamont (last). `content/run-of-show.md` table + dated change note first, then `public/index.html`. (2) Per Blake, Volunteers of the Year will not be announced at this event: removed the “Volunteers of the Year / To be announced” row from the honoree roll and the `#volunteers` heading + draft placeholder from Honorees; removed the now-unused `.roll .tba` and `.placeholder` CSS. (3) Then, per Blake, removed the schedule’s “Campaign Volunteer Recognition — Kathleen Callahan” Awards item: `content/run-of-show.md` table row removed with a dated change note and the editorial note marked resolved (raw v1 text unchanged), then `public/index.html`; D14 updated. Updated `content/honorees.md`, `AGENTS.md` (honorees list), D14 (DECIDED) and D19 wording, and the brief, task list, and launch checklist items that asked for volunteer names.
**Checked:** :4173 at 375px: speaker order correct; roll and Honorees list only Democrats of the Year and the Terry Backer award; Corrie’s card ends Honorees with the same 60px gap to the Tributes divider as Program → Honorees; no broken in-page anchors, no console errors, no horizontal overflow. Budget OK (HTML 11,127 bytes gzipped; first visit 111,390; full page 231,680). `git diff --check` passes.
**Decisions:** D14 decided (not at this event); D19 wording updated.
**Also checked:** Awards now lists Opening remarks → Terry Backer → Stratford Democrat of the Year ×2; the first item has no top rule; no horizontal overflow.
**Published (16:26 ET):** With Blake’s OK, committed `71967ce` and pushed to `main`; Pages run 36185736926 succeeded. The live HTML is byte-identical to `public/index.html`: speaker order ends Blumenthal → Lamont, and neither “Volunteers of the Year” nor “Campaign Volunteer Recognition” appears.
**Blocked on / waiting for:** a higher-resolution (and possibly corrected) ad from Patti Moonan.
**Next step (exact):** Remaining draft items before the Sat lock: “Draft: PDF to come,” “Presented by” confirmation (D17), and the Honorees and Tributes intro lines (agent copy awaiting approval).

---

## 2026-09-24 16:36 ET · Claude · Governor Lamont moved to last in Welcome remarks; full-page ad matches other ad widths (local, not yet published)

**Did:** (1) Per Blake, Welcome remarks order is now Kathleen Callahan → Richard Blumenthal → Susan Bysiewicz → Stephanie Thomas → Sean Scanlon → **Ned Lamont** (last). `content/run-of-show.md` updated first (table + dated change note), then `public/index.html`. (2) Per Blake, Patti Moonan’s ad is a paid full-page ad, so it must be as wide as the other ads: removed the `.ad.tall` 22rem cap and its class. Updated the Tributes line in `docs/03-design-system.md`.
**Checked:** :4173: speaker order correct at 375px; all four ads the same width at 375 (338px), 768, and 1024 (640px); ad 4 is 1013px tall at 640px wide; no horizontal overflow. Budget OK (first visit 111,525; full page 231,815). `git diff --check` passes. Note: ad 4’s source is only 653px wide, so it is slightly soft at 640 CSS px on 2x tablet/desktop screens and a little soft on 3x phones. Searched the project for a larger copy: none. `original-ad-images/` has only the 653×1034 PNG, and `reference/canva-program-draft-2025-template.pdf` has no image with the ad’s proportions. A higher-resolution export from Patti (≥1300px wide; ~2000px ideal) is needed, and could come with the corrected spelling. Do not upscale or recreate the artwork.
**Decisions:** none new (layout detail under D32).
**Published (16:45 ET):** With Blake’s OK, committed `fdf018d` and pushed to `main`; Pages run 36056965846 succeeded. The live HTML is byte-identical to `public/index.html`; the live speaker order ends with Ned Lamont, and the ad width cap is gone.
**Blocked on / waiting for:** a higher-resolution (and possibly corrected) ad from Patti Moonan.
**Next step (exact):** When Patti’s new file arrives: encode it with `cwebp` (≤ 45 KB, ~1300px wide), replace `public/assets/img/ads/ad-4.webp`, update its `width`/`height` and alt text (spelling), and run the budget script. Remaining draft items before the Sat lock: Volunteers of the Year placeholder, “Draft: PDF to come,” “Presented by” (D17), the Honorees and Tributes intro lines.

---

## 2026-09-24 13:07 ET · Claude · Added State Comptroller Sean Scanlon to Welcome remarks (local, not yet published)

**Did:** Per Blake (chat), added “State Comptroller **Sean Scanlon**” after Secretary of the State Stephanie Thomas in Welcome remarks. Source first: `content/run-of-show.md` guest-facing table updated, and a “Changes since v1” note added (raw v1 text left as received). Then `public/index.html` `#program`: one new `.people` list item. Title: Blake first gave “Comptroller,” then chose the formal “State Comptroller.”
**Checked:** :4173 at 375px: six Welcome remarks speakers in order, new line styled like the others, no horizontal overflow. Budget script OK (first visit 111,543 bytes; full page 231,833). `git diff --check` passes.
**Decisions:** none.
**Published (13:12 ET):** With Blake’s OK, committed `e036c1e` and pushed to `main`; Pages run 36032629538 succeeded. The live HTML is byte-identical to `public/index.html` and contains the new line.
**Blocked on / waiting for:** none.
**Next step (exact):** Remaining guest-visible draft items before the Sat lock: Volunteers of the Year placeholder, “Draft: PDF to come,” “Presented by” confirmation (D17), the Honorees and Tributes intro lines (agent copy awaiting approval).

---

## 2026-09-24 12:56 ET · Claude · Ad book named “Tributes”; Blake’s decisions applied (still local, not published)

**Did:** Renamed the section and third tab to **Tributes** (`id="tributes"`, `#tributes`, h2 “Tributes”). Intro: “Messages of congratulations from our friends and supporters. Tap one to see it full size.” (DRAFT COPY marker kept). Ad frames now use the card tint instead of white, so slow-loading ads don’t show as bright boxes. `scripts/check-budget.sh`: Tributes ads (`assets/img/ads/`) get a 45 KB per-ad cap and are reported separately from the 200 KB first-visit target; the full page must stay under the 300 KB hard cap. `.gitignore` now excludes `original-ad-images/`. Updated `AGENTS.md` (tab list, closing placement, ad budget, advertiser contact-detail exception, originals out of repo), D5, D15 (DECIDED: no “Paid for by”), D32 (ADOPTED), `docs/03-design-system.md`, `docs/01-project-brief.md`, and a pointer in `docs/06-redesign-plan.md`.
**Checked:** :4173 at 320px: heading, intro, and tab read “Tributes” (64px text in an 80px tab); 5 items with the closing last; the Tributes tab and marker activate; all four ads load; no horizontal overflow, no console errors, no failed requests. Budget script OK: first visit 111,523 bytes; Tributes ads 120,290; full page 231,813 of 307,200. `git diff --check` passes. Nothing committed or pushed.
**Decisions (Blake, in chat):** name “Tributes”; Monica J. Peterson’s card published as is; page weight accepted; no “Paid for by” line; Patti Moonan’s “Carol Ann Reid” spelling left as supplied (a corrected ad may replace it; swap `ad-4.webp` and its alt text); originals stay out of the repo.
**Published (12:59 ET):** With Blake’s OK, committed `143b0bd` “Add the Tributes section (ad book) and a fourth tab” and pushed to `main`; Pages run 36031084017 succeeded. Live HTML is byte-identical to `public/index.html`; all four ads return 200 at their expected sizes. On the live site at 375px: tabs read Program | Honorees | Tributes | About; tapping Tributes jumps there and highlights it; all ads load; no console errors. Guests with the page already open may see the old copy for up to 10 minutes.
**Blocked on / waiting for:** none for Tributes. A corrected ad from Patti Moonan may arrive (swap `public/assets/img/ads/ad-4.webp`, update its alt text and `width`/`height`, rerun the budget script).
**Next step (exact):** Remaining guest-visible draft items before the Sat lock: Volunteers of the Year placeholder, “Draft: PDF to come,” “Presented by” confirmation (D17), the Honorees and Tributes intro lines (agent copy awaiting approval).

---

## 2026-09-24 12:51 ET · Claude · Ad book section and fourth tab built locally (not published; name pending)

**Did:** Per Blake, added an ad book to `public/index.html` (the live source; mockup is a record). New `<section id="adbook">` between Honorees and the footer: divider, placeholder heading “Ad book,” draft intro line, and an ordered list of the four ads from `original-ad-images/` (numbered order), then Karen and Kathleen’s closing moved inside as the fifth and last item (its heading is now an sr-only h3; `id="congratulations"` kept). Each ad is a link to its own image (new tab, sr-only notice) with alt text transcribing the ad. Ads compressed with `cwebp` into `public/assets/img/ads/ad-1…4.webp` (1000px wide; ad 4 native 653px): 32,378 / 23,912 / 23,122 / 40,878 bytes. Ad 2 cropped to remove print crop marks and a timestamp; ad 3 trimmed to its outer border; ad 4 flattened onto white. No ad content altered. Tab bar now Program | Honorees | Ad book | About; the gliding marker is ¼ width with a 4th position; the JS no longer maps the closing to About (the ad book section covers it). Print: ads avoid page breaks. Updated `AGENTS.md` (closing placement, tab list, 78px label limit) and D32 (IN PROGRESS).
**Checked:** Local server :4173 at 375px: ads render in order in gold-edged frames, the closing follows as the last ad, the “Ad book” tab highlights through the ads and closing, 24 scroll-linked effects attach (3 new dividers), ad links return 200. At 320px: four tabs fit (text 47–73px in 80px tabs; “Program” and “Honorees” sit close), no horizontal overflow. **Budget script FAILS:** ads 1 and 4 exceed the 30 KB photo cap and the total is 231,806 bytes vs. the 204,800 target (hard cap 307,200 not exceeded). HTML is 11,253 bytes gzipped. `git diff --check` passes. Nothing committed or pushed.
**Decisions:** D32 recorded as IN PROGRESS.
**Blocked on / waiting for:** Blake: section/tab name (brainstorm in chat); OK to publish Monica J. Peterson’s phone and email (her ad; conflicts with the AGENTS.md phone rule); budget treatment for ad images; “Paid for by” for the Gresko and Moonan ads (D15); “Carol Ann Reid” (ad) vs. “Carolann Reid” (program); whether to commit `original-ad-images/` to the public repo.
**Next step (exact):** Apply Blake’s chosen name in the `<h2 id="adbook-h">` and the third tab label (keep it ≤ ~78px at 15px bold). Resolve the budget question (update `scripts/check-budget.sh` or recompress), then commit and publish only with Blake’s OK.

---

## 2026-09-23 21:30 ET · Claude · Published the redesign: mockup ported to `public/index.html` (D31)

**Did:** At Blake’s request (“merge this to main and make it the live version”), replaced `public/index.html` with the approved mockup: the live page’s `<head>` (title, description, OG tags, data-URI favicon, `noindex` per D9) + the mockup’s CSS/body/JS with `../../public/assets/` → `assets/`. Logo kept as `<img>` in header and footer (one cached file); inlining it would put HTML at 14,106 of 14,336 bytes. `git rm` of the now-unreferenced `public/assets/fonts/playfair-700-italic.woff2`. D18 and D19 marked adopted; D31 recorded. Updated `AGENTS.md` folder map, `docs/03-design-system.md`, and `docs/06-redesign-plan.md` so they describe the published page. Pre-port copy of the old page saved in the session scratchpad (also recoverable from git: `ffa60f5:public/index.html`).
**Checked:** Visible-text diff, old live page vs mockup: only approved design changes (D19 roll, D22 sections, D24 footer, “Presented by”); bios and schedule identical. All 12 bio paragraphs match `content/honorees.md`; closing note and About match `content/`; photo credit and spellings present. Budget script: HTML 10,590 bytes gzipped, first visit 110,853 bytes (was 115,316), OK. JS 1,469 bytes. Served from `public/` on :4173: no console errors, every asset 200 (no 404s), fonts loaded, all images load, 21 scroll-linked effects attach, 3 “Show less” buttons, 5 outbound links `_blank` + `noopener noreferrer`, `noindex` present; no horizontal overflow at 320/375/768/1024. Not tested on a real iPhone.
**Decisions:** D31 adopted; D18, D19 adopted (published). D20 still applies once the PDF exists.
**Blocked on / waiting for:** Guest-visible draft items still to resolve before the Sat lock: Volunteers placeholder (shows `content/honorees.md`), “Draft: PDF to come,” “Presented by” confirmation (D17), “Paid for by” (D15), unmarked Honorees intro line.
**Deployed:** Committed as `a721c89` “Publish the program redesign” and pushed to `main` with Blake’s OK. Pages run 35943260739 succeeded at 21:31 ET. `https://program.stratforddemocrats.com` returns HTTP 200 with HTML byte-identical to `public/index.html`; the Allura font, logo, closing art, and a portrait each return 200. In the browser at 375px: no console errors, fonts loaded, logo loaded, 21 scroll-linked effects attached; a fresh visit opens at the top. Guests with the old page open may see it for up to 10 minutes (`max-age=600`).
**iPhone check (22:09):** Blake tested the live site on an iPhone and reports it works well. This closes the open real-device check for D29 and D30.
**Next step (exact):** Resolve the guest-visible draft items listed above before the Sat content lock, editing `public/index.html` directly (the mockup is now a record).

---

## 2026-09-23 21:28 ET · Claude · Closing page glow no longer shows a hard edge

**Did:** In `docs/mockups/redesign-v1.html`, changed the `.finale` background from `radial-gradient(ellipse 85% 60% at 50% 32%, … 0, … 70%)` to `radial-gradient(closest-side at 50% 36%, rgba(64,92,196,.55), rgba(64,92,196,0))`. The old ellipse was still ~13% opaque at the section’s top edge on phones (and ~9% at the side edges of the rounded box from 768px up), so the glow stopped in a visible line or rectangle. `closest-side` makes the glow reach zero exactly at the nearest top and side edges at any size. Colors, peak brightness, and the glow position behind the artwork are kept. Also corrected my earlier worklog timestamps (the motion work was 21:20, not 20:25; the logo note 21:22; the review 20:10).
**Checked:** Browser at 375, 768, and 1024px, before and after: the top line (phones) and the rounded-rectangle outline (768px and up) are gone; the glow reads as a soft oval behind the artwork. Computed background confirmed from the saved file; no horizontal overflow. Glow strength behind the “Thank you” text is about the same as before (≈0.26 vs 0.25 opacity), and even at the glow’s peak, warm-white text stays about 9.8:1 (AAA). Mockup 10,466 bytes gzipped; budget script (production unchanged) and `git diff --check` pass.
**Decisions:** none (bug fix; D18’s color question stays open).
**Blocked on / waiting for:** the real-iPhone check from the entry below.
**Next step (exact):** Same as below: check the mockup on an iPhone, then carry D28–D30 and this glow fix into `public/index.html` during the production port.

---

## 2026-09-23 21:20 ET · Claude · Added scroll-linked motion, a gliding tab marker, and two motion fixes

**Did:** In `docs/mockups/redesign-v1.html`: added a new `@supports (animation-timeline:view())` + reduced-motion block. Divider and award-title rules draw out from the center (star turns); schedule dots glow as they cross mid-screen; portraits settle from 0.9 to 1 as the gold ring closes; closing art rises from 0.88 and brightens. All of it reverses on scroll-up and touches no text. Added a single gliding gold tab marker (`.tabbar ul::after` positioned with `:has()`; the per-tab inset bar remains the reduced-motion fallback). Removed the `.honoree:target` highlight and its keyframes. Moved `.awards .honor a:hover` underline into the `(hover:hover) and (pointer:fine)` block. Updated `AGENTS.md` motion rule, `docs/03-design-system.md` Motion, `docs/06-redesign-plan.md` (Motion + rejected ideas), and D30.
**Checked:** Chrome 152 in the pane: 21 scroll-linked animations attach (10 rules, 2 stars, 5 dots, 3 portraits, 1 closing art). Tapping Corrie in the roll: her portrait scales 0.9→1 as it arrives on screen (~0.75–0.9s into the scroll). Tab marker width and position match the active tab at 320 and 1024px after the 320ms glide. No horizontal overflow at 320/375/1024. Hover-underline rule confirmed inside the hover media query. Playwright with `reducedMotion: reduce`: 0 animations, glider not generated, per-tab bar shown, portrait untransformed, `scroll-behavior: auto`; temp `.playwright-mcp/` deleted. Mockup 10,420 bytes gzipped; JS unchanged at 1,469 bytes. Budget script (production unchanged) and `git diff --check` pass. **Not tested in Safari or on a real iPhone.**
**Also (21:22):** Blake reported the logos missing. Cause: after file edits the app opens a second pane tab that loads the mockup as a `data:` URL, where relative `../../public/assets/...` paths can’t resolve, so every image and font fails there. On `http://127.0.0.1:4174/docs/mockups/redesign-v1.html` both logos load (1172×233). The live site inlines the logo SVG and is unaffected. No code change. Review the mockup only at the 4174 URL.
**Decisions:** D30 adopted (Blake, in chat).
**Blocked on / waiting for:** A real-iPhone check (iOS 26+ should get the scroll effects; older iOS should show the static page). The `.finale` glow’s hard edge was fixed in the entry above.
**Next step (exact):** Open the mockup on an iPhone (or Safari 26+) and scroll the full page down and back up; confirm effects play and reverse smoothly and that nothing flickers. Carry D28–D30 into `public/index.html` during the production port.

---

## 2026-09-23 20:10 ET · Claude · Reviewed the D25 motion; prototyped scroll-linked animation (not applied)

**Did:** Review only; no project files changed. Findings on the D25 motion in `docs/mockups/redesign-v1.html`: (1) the `.honoree:target` highlight never shows when you tap an honoree in the roll: it lasts 700ms, but the smooth scroll to the card takes ~1.5s, so the card is still off-screen when it ends (measured at 375px). (2) Bio paragraph fade (85%→100% in 180ms) is imperceptible. (3) The summary chevron rotation is no longer seen with JS because D29 hides the summary while open. (4) Opening flourish and control feedback are fine. (5) `.awards .honor a:hover{text-decoration:underline}` (line 120) sits outside the `(hover:hover)` block, so iPhones keep the underline after a tap. (6) The `.finale` glow shows a hard top edge where the section starts.
Prototyped, injected into the browser only, Blake’s “animate as you scroll” idea using CSS scroll-driven animations (`animation-timeline: view()`, behind `@supports` and `prefers-reduced-motion: no-preference`): dividers and award-title rules draw out from the sparkle; schedule dots glow as they cross mid-screen; portrait medallions settle from 0.9 to 1 as the ring closes; the closing art rises and brightens; one tab indicator glides between tabs (`:has()`, no JS). Effects play forward when scrolling down and reverse when scrolling up. No text is hidden or moved. Prototype CSS is in the session scratchpad (not in the repo).
**Checked:** Chrome 152 in the pane at 375px: all 21 scroll-linked animations attach; verified mid-states and the reverse on scroll-up; the tab indicator follows sections. About +409 bytes gzipped (mockup would be ~10.2 KB), 0 JS. Not tested in Safari or on a real iPhone; older browsers without support show today’s static page.
**Decisions:** none yet. Applying the scroll effects would extend D25 (and the AGENTS.md motion rule), so it needs Blake’s OK and a new D-number.
**Blocked on / waiting for:** Blake’s choice of which scroll effects to adopt.
**Next step (exact):** If approved, add the chosen effects to the mockup’s motion block, replace or lengthen `.honoree:target` (the medallion effect covers arrival), move the hover underline into the `(hover:hover)` block, record the decision, update the AGENTS.md motion rule and doc 03, then verify at 320/375/1024px and with reduced motion on.

---

## 2026-09-23 20:00 ET · Claude · Bio “Show less” now sits at the end of the text

**Did:** In `docs/mockups/redesign-v1.html`, added the approved fix for review item #8. JS (inside the existing script) appends a “Show less” button to each bio’s `<details>` and marks it `.enh`; CSS hides the summary while an enhanced bio is open, so paragraph 1 flows into paragraph 2. Opening moves focus to the first revealed paragraph (no outline); “Show less” closes the bio, returns focus to “Read full bio,” and centers it on screen. The button shares the summary’s styles (gold, 19px bold, 48px tall, up chevron), focus ring, active/transition feedback, and is hidden in print. Updated `docs/03-design-system.md`, `docs/06-redesign-plan.md`, and D29.
**Checked:** Browser at 375px: tap open/close on Jill’s bio (no scroll jump on open; after close, “Read full bio” centered at 406 of 812px, no stray focus ring). Keyboard on Corrie’s: Enter opens and focuses paragraph 2; Tab reaches “Show less” with the sky focus ring; Space closes and returns a visible focus to “Read full bio.” No-JS proxy (enhancements removed in page): native summary toggles as before. Print media (Playwright): summary and “Show less” hidden, all 9 extra paragraphs shown; temporary `.playwright-mcp/` folder deleted. Mockup JS 1,469 bytes (≤ 2 KB); mockup HTML 9,742 bytes gzipped. Budget script (production unchanged) and `git diff --check` pass. Not tested on a real iPhone/VoiceOver. No `public/` edits, commit, or deployment.
**Also (20:05):** At Blake’s request, Corrie’s card now has `Joe&nbsp;Gresko` in its “Presented by” line so the name never splits. Checked at 320/360/375/414/768px: “Joe Gresko” stays on one line. Then, at Blake’s request, did the same for `Carolann&nbsp;Reid` (Anthony’s card) and `Karen&nbsp;Tracy` (Jill’s card; it split at 414px). Rechecked all three at 320/360/375/390/414/430/768px: every presenter name stays on one line, no horizontal overflow. The schedule’s presenter names were already kept together by `<strong>` (nowrap).
**Decisions:** D29 adopted (Blake, in chat).
**Blocked on / waiting for:** Same open review items as the entry below (D17 “Presented by,” guest-visible Draft blocks, D15, the unmarked Honorees intro line).
**Next step (exact):** Continue with Blake’s next review item. When porting to production, carry D28 and D29 into `public/index.html` and test “Read full bio”/“Show less” on a real phone with VoiceOver.

---

## 2026-09-23 19:50 ET · Claude · Reviewed the mockup; speakers in the Awards schedule no longer read as recipients

**Did:**
- Full review of `docs/mockups/redesign-v1.html` for Blake (UI/UX, branding, functions). Findings given in chat, not in a file.
- Fixed review item #1: in the Awards list, “Opening remarks” and “Campaign Volunteer Recognition” were set in the large white honoree style, so Kathleen Callahan looked like a recipient. They now use the Welcome remarks style (`<p>` with soft title and bold white name), matching `public/index.html:215-216` and `content/run-of-show.md`. No CSS added; wording unchanged.
- `docs/06-redesign-plan.md`: added a line on speaker-only segments. `docs/DECISIONS.md`: D28.
- Prototyped (in the browser only, no file changes) a fix for review item #8: with ~600 bytes of JS, the bio’s “Show less” moves to the end of the text, focus goes to the first revealed paragraph, and closing scrolls “Read full bio” to the center. Native `<details>` stays the no-JS fallback. Blake has not yet approved applying it; open questions are where “Show less” lands and per-honoree button labels.

**Checked:** Browser at 375 and 320px: speaker lines 19px, soft text with white bold names; honoree rows unchanged (21px, linked, “Presented by”); no horizontal overflow. Budget script passes (production unchanged, 115,316 bytes); mockup 9,418 bytes gzipped; `git diff --check` passes. No `public/` edits, commit, or deployment.
**Decisions:** D28 adopted (Blake, in chat).
**Blocked on / waiting for:** Blake’s go-ahead on the “Show less” fix. Remaining review items for Blake/committee: confirm “Presented by” (D17); remove guest-visible “Draft:” blocks (Volunteers placeholder shows `content/honorees.md`; PDF line) if content doesn’t arrive by Sat lock; “Paid for by” (D15); the Honorees intro line “Recognizing service, leadership…” is agent copy without a `DRAFT COPY` marker in the mockup or the live page.
**Next step (exact):** If Blake approves the bio fix, add the prototype JS/CSS to `docs/mockups/redesign-v1.html` (share the `summary` styles with `.bio-less`, hide it in print), record it as D29, and update the JS note in `docs/03-design-system.md`. Otherwise, continue with Blake’s next review item.

---

## 2026-09-23 19:32 ET · Codex · Removed the overdrive experiment and retained the original direction

**Did:** At Blake’s request, deleted `docs/mockups/redesign-overdrive.html` and `docs/mockups/overdrive-notes.md`. Closed the experiment’s preview tab; the original `redesign-v1.html?v=4#about` is the only remaining browser tab. Recorded D27. Historical worklog entries remain as a record of the discarded experiment.
**Checked:** `docs/mockups/` now contains only `redesign-v1.html`. The original mockup and production HTML retain their exact pre-experiment SHA-256 hashes. Budget script and `git diff --check` pass. No experimental styling was transferred, no shared assets changed, and nothing was committed or published.
**Decisions:** D27 adopted: continue the original mockup and its approved refinements.
**Blocked on / waiting for:** none.
**Next step (exact):** Continue work only on `docs/mockups/redesign-v1.html` as Blake directs. The Gold-foil experiment is discarded; production port remains a separate requested step.

---

## 2026-09-23 19:30 ET · Codex · Created a separate Gold-foil invitation overdrive experiment

**Did:** Used the Impeccable overdrive playbook, presented three directions, and built Blake’s selected Gold-foil invitation in `docs/mockups/redesign-overdrive.html`. Added a clipped-corner double gold frame with a one-time SVG-masked light sweep, a split cover/honoree roll on wide screens, a more open schedule layout, and larger framed portraits alternating sides on desktop. Kept the navy/gold/Poppins/Allura identity and responsive single-column reading on phones. Added `docs/mockups/overdrive-notes.md` to scope the experiment and record validation. Opened it in a separate retained browser tab; original tab remains available.
**Checked:** One bounded visual/interaction pass at 320, 375, 768, 1024, and 1280px; no horizontal overflow. Body remains 19px; measured visible controls are at least 48px. Biography click and Enter controls work; all outbound links preserve `_blank`. No captured browser errors/warnings. A disposable no-script fixture exercised the static motion branch and native links/disclosures; no OS-level preference or real-device frame-rate test. Fixture/tab removed and viewport reset. Exact source comparisons preserve all bios, schedule, closing, footer, and script. Experiment HTML is 11,301 bytes gzipped; referenced-resource estimate is 111,529 bytes; JS is unchanged at 905 bytes. Original mockup and `public/index.html` SHA-256 hashes match the before-work values recorded in the experiment notes. Budget script and `git diff --check` pass. Shared assets and approved design documentation were not changed; no commit or deployment.
**Decisions:** Gold-foil direction selected for this experiment only. No existing design decisions were replaced or promoted to production.
**Blocked on / waiting for:** none for the requested experiment.
**Next step (exact):** Compare `http://127.0.0.1:4174/docs/mockups/redesign-overdrive.html` with `http://127.0.0.1:4174/docs/mockups/redesign-v1.html?v=4`. Keep further changes isolated to the experiment unless Blake explicitly chooses to bring them into the primary mockup.

---

## 2026-09-23 19:21 ET · Codex · Synchronized project documentation with approved refinements

**Did:** Updated the README, project brief, design system, task board, launch checklist, redesign plan, `AGENTS.md`, and `content/sponsors-and-about.md` to reflect D21–D26. Removed active sponsor/ad-artwork and extra award-blurb requests, corrected the three-tab navigation and closing/footer order, documented the footer logo without email/phone, 8px narrow-phone biography padding, restrained motion, and external links opening in new tabs. Consolidated D16/D21 wording with later decisions. Marked sponsor material as archived reference; retained the stable source filename and historical worklog/research. Corrected related stale statuses (Allura identified, run-of-show v1 received) and distinguished the local mockup from the still-unported production page. No website, content wording, or deployment changes.
**Checked:** Searched current requirements for stale Sponsors tabs/tasks, four-tab layouts, no-animation rules, and old footer contact requirements; remaining sponsor references describe omission or history. Cross-checked implementation details against the current mockup and source documents. `bash scripts/check-budget.sh` passes for unchanged production; `git diff --check` passes. Historical critique/worklog entries remain unchanged.
**Decisions:** No new decisions. D16/D21 clarified to reflect D22/D24; existing approvals D21–D26 propagated through the documentation. D18–D20 production choices and other open items retain their statuses.
**Blocked on / waiting for:** none for documentation cleanup; volunteer content and PDF/other existing content decisions remain pending.
**Next step (exact):** Continue reviewing `docs/mockups/redesign-v1.html`. When Blake requests a production port, follow the updated implementation plan in `docs/06-redesign-plan.md`, reconcile the latest content, and run `docs/05-launch-checklist.md` before authorized publication.

---

## 2026-09-23 19:14 ET · Codex · External links now preserve the program tab

**Did:** Updated all five outbound links in `docs/mockups/redesign-v1.html` (Volunteer, email updates, Facebook, Instagram, Website) with `target="_blank"`, `rel="noopener noreferrer"`, and accessible labels announcing the new tab. In-page links and visible labels are unchanged. Recorded D26 and added the outbound-link rule to `AGENTS.md` for future edits.
**Checked:** Browser confirms all five external links have the attributes and all 11 internal anchors retain same-tab behavior. Clicked Volunteer: a separate tab opened at the correct destination while the program tab stayed open. Closed the test tab and returned to About. Budget script and `git diff --check` pass. No public-page edits, commit, or deployment.
**Decisions:** D26 adopted.
**Blocked on / waiting for:** none.
**Next step (exact):** Continue mockup review at `http://127.0.0.1:4174/docs/mockups/redesign-v1.html?v=4#about`; carry the external-link behavior into the production port when Blake requests it.

---

## 2026-09-23 19:12 ET · Codex · Added restrained motion using Impeccable animate and delight

**Did:** Applied the animate/delight playbooks to `docs/mockups/redesign-v1.html`. The opening’s existing gold stars glint once and its date rule extends from the center (700–800ms total); link, button, social, and navigation states respond quickly; biography chevrons turn in 200ms and expanded paragraphs settle from 85% to full opacity in 180ms. Honoree anchor targets receive a brief border highlight. All animated effects are gated by `prefers-reduced-motion:no-preference` and screen media. No content is hidden awaiting animation, no loops, dependencies, new assets, or added JavaScript. Updated the original motion prohibition in `AGENTS.md` to reflect Blake’s explicit request and recorded D25.
**Checked:** One bounded browser inspection round spanning 320, 375, and 1024px: no horizontal overflow; biography width remains 266px at 320px. Observed single-iteration 700ms opening animation with title opacity 1. Biography click opens and Enter closes, with expected chevron state and timing. A temporary fixture disabled the motion media blocks and removed page scripts: opening/disclosure animations were `none`, transition duration was `0s`, scroll behavior was `auto`, and native anchor/disclosure/keyboard behavior worked. This tests the static fallback, not an OS-level preference switch. Fixture and comparison copy deleted, test tab closed, viewport reset. Entire body markup and JavaScript match the pre-change version exactly. Mockup HTML 9,328 bytes gzipped; JavaScript unchanged at 905 bytes. Production budget and `git diff --check` pass. No public-page edits, commit, or deployment.
**Decisions:** D25 adopted; user request supersedes the earlier no-animation rule. Preserve the banquet’s Read-mode usability and existing identity.
**Blocked on / waiting for:** none.
**Next step (exact):** Reload `http://127.0.0.1:4174/docs/mockups/redesign-v1.html?v=4` to see the brief opening flourish, then try a honoree link and “Read full bio.” Keep further changes scoped to Blake’s feedback; production port remains separate.

---

## 2026-09-23 19:08 ET · Codex · Replaced footer contact block with the logo

**Did:** Removed the footer email address and telephone number from `docs/mockups/redesign-v1.html`. Replaced the bottom committee-name line with the existing light Stratford Democrats SVG, using the same responsive size as the header logo and descriptive alt text. Removed unused contact-block styles. Updated the content source and D24. About text and other footer links remain unchanged.
**Checked:** Refreshed the browser and visually verified the centered logo; footer has no email/telephone links. Logo renders at 240px in the current viewport. `bash scripts/check-budget.sh` and `git diff --check` pass. No new assets, public-page edits, commit, or deployment.
**Decisions:** D24 adopted, refining earlier footer contact-detail requirements.
**Blocked on / waiting for:** none.
**Next step (exact):** Continue review at `http://127.0.0.1:4174/docs/mockups/redesign-v1.html?v=4#about`; apply only further changes Blake requests before the separate production port.

---

## 2026-09-23 19:07 ET · Codex · Widened biographies on the smallest phones

**Did:** Added one narrow-screen CSS rule in `docs/mockups/redesign-v1.html`: honoree-card side padding is 8px below 360px. No page content or other design changes. Recorded D23 and marked only the biography-width critique item addressed.
**Checked:** Browser at 320px: all three biographies have 266px reading width (previously 250px), 8px side padding, and 19px text; no horizontal overflow. Visually inspected Anthony’s card. At 360px, the existing 16.2px padding remains and there is no horizontal overflow. Reset viewport. Budget script and whitespace check pass; published page unchanged.
**Decisions:** D23 adopted. The unavailable-PDF wording suggestion was not approved or applied.
**Blocked on / waiting for:** none.
**Next step (exact):** Continue reviewing the mockup at `http://127.0.0.1:4174/docs/mockups/redesign-v1.html?v=4`. Wait for Blake’s next requested change; production port and publication remain separate.

---

## 2026-09-23 19:04 ET · Codex · Simplified sections and moved About into the footer

**Did:** Removed Sponsors and its bottom-navigation tab from `docs/mockups/redesign-v1.html`. Moved About below Karen and Kathleen’s sign-off, directly above Stay connected. Removed the additional Terry Backer award-background heading and draft paragraph from About; retained Corrie’s award heading and biography. Removed unused sponsor/draft styles. Updated `AGENTS.md`, `docs/DECISIONS.md`, `content/sponsors-and-about.md`, and `docs/06-redesign-plan.md` to record Blake’s requested section order. Refreshed the existing preview tab. No changes to `public/`, commit, or deployment.
**Checked:** Exact before/after source comparisons confirm biographies, schedule, and congratulations markup are unchanged. Verified removed section/link/draft are absent and footer order is correct. Browser confirms About sits immediately above Stay connected; the About tab scrolls there and highlights correctly. `bash scripts/check-budget.sh` passes for unchanged production (HTML 12,480 bytes gzipped; total 115,316 bytes); `git diff --check` passes. Removed the temporary source-comparison copy.
**Decisions:** D5, D6, and D16 updated; D22 adopted. Production port remains separate.
**Blocked on / waiting for:** none for this change. The local preview server had stopped; restarted `python3 -m http.server 4174 --bind 127.0.0.1` from the project root (session 75410), leaving it running for review.
**Next step (exact):** Review `http://127.0.0.1:4174/docs/mockups/redesign-v1.html?v=4#about`. Apply further requested edits to this mockup; port it into `public/index.html` only when Blake requests that step.

---

## 2026-09-23 18:58 ET · Codex · Second Impeccable critique of the revised mockup

**Did:** Completed independent visual and detector/source assessments of `docs/mockups/redesign-v1.html?v=4`. Saved `.impeccable/critique/2026-09-23-1858-docs-mockups-redesign-v1-html.md`. Two minor recommendations remain: slightly more biography width below 360px, and status-only wording until the PDF exists. Retain the approved visual direction and footer order. No page edits.
**Checked:** Visual pass at 320, 375, and 1024px; no major design issue found. All 12 biography paragraphs match the content source. Mockup HTML 9,201 bytes gzipped, JS 905 bytes, referenced-resource estimate 109,429 bytes. Production budget passes. Detector ran once; its four warnings did not establish a new on-screen defect. Technical review's separate browser attempt hit a local connection refusal, so its interaction checks were not completed; the independent visual pass supplies browser coverage. A closed its tab/reset viewport. B's failed creation left a hidden error tab inaccessible for cleanup through the browser URL policy; no other temporary artifacts or servers were created.
**Decisions:** none changed. Recommendations only.
**Blocked on / waiting for:** no blocker to the delivered critique; committee content and PDF remain pending.
**Next step (exact):** If Blake requests the small polish pass, adjust narrow-phone card padding and the unavailable-PDF label in the mockup. Then finish the pending content before the production port. Do not reopen settled palette, typography, or footer-placement decisions.

---

## 2026-09-23 17:53 ET · Codex · Removed the mockup’s top design banner

**Did:** Removed the “Design mockup v1 · not the live page” banner, its CSS, and its print selector from `docs/mockups/redesign-v1.html`, as Blake requested. Refreshed the existing preview tab.
**Checked:** Browser confirms the banner element and visible text are absent; the event heading remains. `bash scripts/check-budget.sh` and `git diff --check` pass.
**Decisions:** D21 updated to include the banner removal.
**Blocked on / waiting for:** none for this change.
**Next step (exact):** Continue review at `http://127.0.0.1:4174/docs/mockups/redesign-v1.html?v=4`. The published page is unchanged.

---

## 2026-09-23 17:46 ET · Codex · Applied approved mockup refinements and moved Stay connected into the footer

**Did:**
- Updated `docs/mockups/redesign-v1.html` (preview query `?v=4`): tighter opening spacing; schedule rows with simple separators, wider text, quieter award labels, and full-width 48px links; simpler sponsor sample rows; accessible named groups in the honoree roll; portrait jump clearance increased to include the whole medallion.
- Moved Stay connected, social links, PDF availability, email, and telephone into a separate footer after Karen and Kathleen’s exact sign-off, per Blake. About remains highlighted while the footer is on screen. Balanced the closing paragraph line breaks and reduced redundant space below the signature.
- Replaced the link to the nonexistent PDF with a visible draft label until the file arrives. No new factual copy; the draft label carries the approval comment.
- Updated `AGENTS.md`, D16/D21 in `docs/DECISIONS.md`, and `docs/06-redesign-plan.md` to record the approved footer placement and mockup refinements. Marked the prior critique addressed, with the footer recommendation superseded by Blake’s direction.

**Checked:**
- Browser at 320, 375, 414, 768, and 1024px: no horizontal overflow. All visible links meet the 48px height minimum; body stays 19px. At 375px the roll begins at 435px (previously 479px). At 320px the schedule text gets 260px instead of roughly 220px inside the old cards.
- Direct Corrie jump at 320px: portrait starts at y25px, fully visible, instead of y−55px. Biography opens by click and closes with Enter. Award group labels appear in the accessibility tree. Footer follows the sign-off and highlights About. No captured browser warnings/errors.
- Exact source comparisons: all bios, schedule markup, and closing text/art markup unchanged. JS is 905 bytes. Final mockup HTML is 9,288 bytes gzipped; referenced-resource estimate 109,516 bytes.
- `bash scripts/check-budget.sh` passes for the unchanged production page: HTML 12,480 bytes gzipped, first visit 115,316 bytes. Detector ran once: existing print-color and year-size warnings, uppercase award-label warning, and a border/padding false positive (the row with no top padding also has no border, confirmed in computed styles). No full print or throttled-network audit.
- Reviewed source diff; closed the temporary browser tab and reset viewport override. No changes to `public/`, no commit, no deployment.

**Decisions:** D16 clarified; D21 adopted by Blake. D18–D20 remain the separate production-redesign proposals.

**Blocked on / waiting for:** no blocker to this mockup refinement; committee content and PDF remain pending.

**Next step (exact):** Open `http://127.0.0.1:4174/docs/mockups/redesign-v1.html?v=4` on a phone for the revised mockup. When Blake requests the production port, apply its design to `public/index.html`, preserve the latest content and draft markers, and rerun budget and responsive checks before publication.

---

## 2026-09-23 17:32 ET · Codex · Reviewed redesign v1 on mobile and desktop

**Did:**
- Reviewed `docs/mockups/redesign-v1.html?v=3` with separate design and browser-evidence passes using the Impeccable critique workflow. Saved the qualitative review in `.impeccable/critique/2026-09-23-docs-mockups-redesign-v1-html.md`.
- Identified refinements to opening-screen height, repeated frames and schedule insets, biography anchor offsets, accessible award labels, touch targets, and the closing footer placement. No mockup, public page, or content edits; no commit or deployment.

**Checked:**
- Browser widths 320, 375, 414, 768, and desktop. No document-level horizontal overflow at the four measured widths. Body text 19px; smallest visible text 15px. Navigation highlighting and biography toggles worked.
- Confirmed direct biography jumps clip the portrait top (portrait y about −55px while the card lands at y24px). Schedule links are 44px tall; footer links about 22.5px, below the project's 48px target. Award labels in the cover roll are hidden from the accessibility tree.
- Detector ran once: four warnings, with the year-size warning disproved by rendered measurements and the contrast warning not established on screen. Temporary browser tabs closed and viewport overrides reset; no overlay or extra server used.
- `bash scripts/check-budget.sh` passed: production HTML 12,480 bytes gzipped, first visit 115,316 bytes. Separate mockup estimate: 9,169 bytes gzipped HTML, 109,397 bytes with referenced assets. PDF file is still absent. No throttled-network or physical-device test performed.

**Decisions:** none changed; D18–D20 remain proposed. This was a critique, not approval to port or publish.

**Blocked on / waiting for:** Blake's preferred refinement direction and existing committee content decisions.

**Next step (exact):** Use the critique to refine `docs/mockups/redesign-v1.html` when Blake requests implementation: fix portrait anchor clearance and accessible award labels, raise short touch targets to 48px, then adjust cover spacing and narrow-phone schedule padding. Keep biographies and closing text verbatim. Review the mockup before porting it into `public/index.html`.

---

## 2026-09-23 17:24 ET · Claude (Claude Code, Fable 5.1) · D4 answered: the script font is Allura; subset added, mockup updated

**Did:**
- Blake confirmed the flyer’s script is **Allura** (Google Fonts, SIL OFL 1.1). **D4 → ADOPTED** in `docs/DECISIONS.md`; the redesign plan’s type table and Phase 0 updated.
- Fetched `@fontsource/allura` 5.3.0 and subset it with fontTools: **`public/assets/fonts/allura-400.woff2`, 17.2 KB** (ASCII letters, digits, punctuation, curly quotes, dashes; contextual alternates kept). The full Latin file (26.5 KB), the license, a 5.7 KB phrases-only variant, and the re-subset command are in `source-assets/fonts/allura/`. Nothing in `public/index.html` references the new file yet, so the live page is unchanged.
- `docs/mockups/redesign-v1.html` now loads Allura (one weight, `font-weight:400`, sizes raised about 1.4× because Allura runs small). The “stand-in” note is gone.

**Checked:**
- Mockup at 375×812: `document.fonts.check` confirms Allura loaded; “Banquet”, “Celebrating our 2026 honorees”, and “Karen and Kathleen” render in it; no horizontal scroll; the roll starts at 479 px from the top (was 497).
- `bash scripts/check-budget.sh` still passes and is unaffected (the new font is not referenced by `index.html` yet).

**Decisions:** D4 adopted (Allura). D18–D20 still waiting for Blake.

**Blocked on / waiting for:** Blake’s OK on the redesign (D18–D20) after looking at the mockup on a phone.

**Next step (exact):**
1. On Blake’s OK, port the mockup into `public/index.html` (see the entry below for the file-by-file list). Add the Allura `@font-face` (`assets/fonts/allura-400.woff2`), set `--script:Allura,cursive`, and delete `playfair-700-italic.woff2` and its `@font-face`. Expected fonts total: 15.7 KB Poppins + 17.2 KB Allura = 32.9 KB (was 38.9 KB).
2. Update the fonts line in the `AGENTS.md` folder map and `docs/03-design-system.md` once Playfair is gone.
3. Run `bash scripts/check-budget.sh`, preview at 320/375/768, and add a WORKLOG entry.

---

## 2026-09-23 16:01 ET · Claude (Claude Code, Fable 5.1) · Design review and redesign plan (nothing under `public/` changed)

**Did:**
- Reviewed v0 in the browser at 320, 375, and 768 px, including the run-of-show v1 and closing-page changes another session had on disk at the time.
- Wrote **`docs/06-redesign-plan.md`**: findings, direction (“the invitation, continued”), token and type changes, per-section wireframes, budget estimate, a phased plan, and the decisions it needs.
- Built a clickable mockup, **`docs/mockups/redesign-v1.html`** (not in `public/`, not deployed). It uses the same bios, run of show, photos, and Poppins files as the live page. The script face is a macOS stand-in (Snell Roundhand) until D4 is answered.
- Added a `mockup` preview server to `.claude/launch.json` (port 4174, serves the project root so the mockup can load `public/assets/`) and a note in `CLAUDE.md`.
- Added **D18–D20** as PROPOSED in `docs/DECISIONS.md` (D16 and D17 had just been taken by the other session, so the plan uses D18–D20).
- Did **not** touch `public/index.html`, `content/`, or `docs/03-design-system.md`.

**Checked:**
- Mockup at 375×812: no horizontal scroll, the hero is 497 px tall before the roll, so the honoree roll starts on the first screen; Poppins and the photos load; the medallion cards, timeline, About, and closing page render as planned.
- Mockup at 320×640 and 768×1024: no horizontal scroll; smallest text 15 px; tab labels 15 px at 320.
- Budget script unaffected (no change under `public/`).

**Decisions:** proposed D18 (closing page on navy/gold, refines D16), D19 (honoree roll replaces the welcome sentence and jump pills), D20 (PDF as a text link). D4 recommendation: Canva SVG wordmarks for “Banquet” and “Celebrating our 2026 honorees”.

**Blocked on / waiting for:**
- **Blake:** open the mockup on a phone (`preview_start` → `mockup`, then http://127.0.0.1:4174/docs/mockups/redesign-v1.html), decide D18–D20, and export the two script wordmarks from Canva as SVG (or send the font name) for D4.

**Next step (exact):**
1. After Blake’s OK, port the mockup into `public/index.html`: replace the `<style>` block and the hero, program, honorees, about, and closing markup with the mockup’s, keeping the inlined logo SVG, the `<!-- DRAFT COPY -->` markers, the draft notes, and any content the other session added since. Phases 1–4 in `docs/06-redesign-plan.md`, about 4 hours; finish by Thursday evening.
2. Remove `playfair-700-italic.woff2` and its `@font-face`. Add the script asset from D4 (or keep the `cursive` fallback until it arrives).
3. Run `bash scripts/check-budget.sh` (HTML ≤ 14 KB gzipped), preview at 320/375/768, update the tokens and layout notes in `docs/03-design-system.md`, and add a WORKLOG entry.

---

## 2026-09-23 16:25 ET · Claude · Removed the top DRAFT banner; volunteer names are coming

**Did:** At Blake's request, removed the “DRAFT v0” band at the top of the page (the element, its CSS, and the print rule). Blake says the **Volunteers of the Year names are coming**, so the `#volunteers` card and its jump pill stay. Updated D14, `content/honorees.md`, and docs 03 and 05. Published.
**Checked:** Budget OK (first visit 115 KB). The live page no longer has the banner.
**Still showing as draft notes on the page:** Volunteers of the Year and Sponsors (dashed placeholder boxes), and the About → Terry Backer blurb. Each goes away when its content arrives.
**Next step (exact):** when the volunteer names arrive, replace the `.placeholder` inside `#volunteers` in `public/index.html` with one card per volunteer (same markup as `.honoree`, photo optional), using the names and citations saved in `content/honorees.md` first.

---

## 2026-09-23 16:10 ET · Claude · Published run of show v1 + closing page

**Did:** With Blake's OK, committed `c9abf45` and pushed. The Actions deploy run 35911503101 succeeded.
**Checked:** https://program.stratforddemocrats.com serves the new Program section (it contains “Governor Ned Lamont” and the “Anthony Afriyie” link) and `#congratulations`. `congratulations.svg` returns 200 (10.7 KB). `http://` now 301s to `https://` (the earlier cached 200 has cleared).
**Blocked on / waiting for:** event team answers on D14, D15, and D17; sponsors (D6); the Terry Backer blurb; run of show v2 if it changes.
**Next step (exact):** Blake test-scans a printed proof of `print/qr-program.svg` on iPhone and Android, then sends the table cards to print (by Thu 9/24). Apply run-of-show updates using `content/run-of-show.md` → “How to apply a new version.”

---

## 2026-09-23 16:00 ET · Claude (Claude Code, Opus 5.5) · HTTPS live; run of show v1 and closing page built

**Did:**
- **Domain live.** Blake added the Wix CNAME. The domain didn't get a certificate on its own, because it was attached before the DNS record existed. Re-saving the custom domain (API: clear it, then set it again) got it **issued** right away (Let's Encrypt, expires 2026-12-22). **Enforce HTTPS is on.**
- **Run of show v1** (Blake, 3:37 PM): saved as `reference/run-of-show-2026-09-23.docx` (gitignored). Raw text and the guest-facing table are in `content/run-of-show.md`. Rebuilt `#program`: Arrival 11:00 → Welcome remarks 11:20 (5 speakers) → Brunch 12:00 → Awards 1:00 (5 segments, with award lines linking to honoree cards) → Departure 2:00. On phones, the time now sits above each segment.
- **Closing page** (Blake: “the final page… needs to be included basically as it is… the end of the program”):
  - Extracted the Canva page's own vector art (lettering, burst, rays, and 14 stars) with `pdftocairo -svg`. Removed the background JPEG, the text glyphs, and a stray 24×13 dark mark that appears in the PDF. Pruned unused defs and rounded coordinates → `public/assets/img/congratulations.svg` (38.8 KB, 10.5 KB gzipped).
  - It's the new last section, `#congratulations`: a royal-blue gradient with the exact text as live HTML in `#b8e3f6` (7:1 or more).
  - The About thank-you blockquote was removed so the note isn't repeated. The footer moved below the closing page. The About tab is highlighted while the closing page is on screen.
- Docs: AGENTS (closing page must stay last; the run of show is the source), DECISIONS D14–D17, doc 03 (layout order), `content/sponsors-and-about.md`.

**Checked:**
- https://program.stratforddemocrats.com serves every asset with 200 and the right certificate subject. The github.io address 301s to it.
- Plain `http://` still returned a cached 200 about 8 minutes after enforcement (Fastly `X-Cache: HIT`). Recheck later; the QR code uses https anyway.
- Budget: HTML 12.5 KB gzipped, first visit 115 KB. OK.
- No horizontal overflow at 320, 375, or 768 px. Screenshots of the Awards list and the closing page were reviewed at 375 and 768.

**Decisions:** D16 adopted; D17 proposed; D14 and D15 updated.

**Blocked on / waiting for:**
- ~~Blake: OK to publish~~ Approved and published at 16:10 (see the entry above).
- **Event team:** confirm “Presented by” (D17), the volunteer segment naming (D14), and the “Paid for by” question (D15).

**Next step (exact):** once Blake approves, `git add -A && git commit` (message: "Add run of show v1 and closing Congratulations page") and push. Wait for the Actions run to finish, then load https://program.stratforddemocrats.com on a phone and check the Program and closing sections. When run of show v2 arrives, follow “How to apply a new version” in `content/run-of-show.md`.

---

## 2026-09-23 14:40 ET · Claude (Claude Code, Opus 5.5) · GitHub Pages set up, photo credit corrected, QR code generated

**Did:**
- **Corrected the photo credit:** “Photo by Luke Franke” belongs to **Corrie’s** photo, not Jill’s. It's the `<figcaption>` on Corrie’s photo on the event page, and my kickoff text extraction had attached it to the end of Jill’s bio. Fixed in `public/index.html`, `content/honorees.md`, `AGENTS.md`, and the doc 05 checklist.
- **D1 adopted** (Blake approved): GitHub Pages + `program.stratforddemocrats.com`.
- `git init` (branch `main`). Repo-local identity: Blake Powers `380243+Blake32p@users.noreply.github.com`, matching the main site repo; the global git config wasn't touched. First commit `7d4ff9d`.
- Created the **public** repo https://github.com/Blake32p/banquet-program-2026 and pushed.
- Turned on Pages (`build_type=workflow`). The first Actions deploy passed (run 35903142549). The custom domain is set to `program.stratforddemocrats.com`.
- Generated the QR code → `print/qr-program.svg` and `print/qr-program-1200px.png` (version 2, 25×25 modules, ECC M, navy on white).

**Checked:**
- Before setting the custom domain, the live site at the github.io address returned 200 for the page, a photo, a font, and the logo. The HTML is 11.7 KB gzipped, served with `cache-control: max-age=600` and gzip.
- The live HTML has the credit under Corrie’s photo.
- The QR code was decoded with Chrome’s BarcodeDetector and returns exactly `HTTPS://PROGRAM.STRATFORDDEMOCRATS.COM`.
- `git status` before the commit: `reference/` is ignored, and no private files are included.

**Decisions:** D1 → ADOPTED.

**Notes for later (after the event):** the Actions run warns that `actions/checkout@v4`, `configure-pages@v5`, and `deploy-pages@v4` target Node 20. They're forced onto Node 24 and still work. Bump them to their latest majors **after** the event, not during event week.

**Blocked on / waiting for:**
- **Blake:** add the DNS record in Wix: **CNAME, Host `program`, Value `blake32p.github.io`**. Optional: verify the domain in GitHub (github.com/settings/pages → Add a domain → `stratforddemocrats.com` → add the TXT record it shows in Wix).
- **Committee:** content items (email draft in doc 04).

**Next step (exact):**
1. Once `dig +short CNAME program.stratforddemocrats.com @1.1.1.1` returns `blake32p.github.io.` and `gh api repos/Blake32p/banquet-program-2026/pages --jq .https_certificate.state` returns `approved`, run:
   `gh api -X PUT repos/Blake32p/banquet-program-2026/pages -F https_enforced=true`
   If the certificate stays “none” for more than about 30 minutes after DNS resolves, clear the custom domain and set it again in repo Settings → Pages. That re-triggers the certificate request.
2. Test https://program.stratforddemocrats.com on a phone using cellular data, then scan `print/qr-program.svg` from a printed proof.

---

## 2026-09-23 · Claude (Claude Code, Opus 5.5) · Kickoff: research, plan, v0 prototype

**Did:**
- Reviewed the inputs: the 2026 Save-the-Date flyer, the Canva program PDF (a 2025 template; only page 7 is updated for 2026), the `Logos/` folder, and the event page at stratforddemocrats.com.
- Researched hosting (two parallel research passes, with sources) → `docs/02-hosting-research.md`:
  - “Codex site” = **ChatGPT Sites** (public beta since Jul 9, 2026).
  - Vercel Hobby is “non-commercial personal use only.”
  - GitHub Pages allows organizational projects.
  - The main site is on **Netlify Free** and its DNS is at **Wix**.
- Wrote `AGENTS.md` (shared rules for Codex and Claude) and `CLAUDE.md` (imports AGENTS.md).
- Wrote docs `01` to `05`, `DECISIONS.md`, and this log.
- Content: `content/honorees.md` (bios verbatim from the event page), `content/run-of-show.md` (waiting for the run of show), `content/sponsors-and-about.md`.
- Assets:
  - Honoree photos cropped square, 480px WebP, 13–25 KB each (the originals were 35–95 KB) → `public/assets/img/`. Originals are in `source-assets/`.
  - Logo minified 12.4 → 9.0 KB (3.4 KB gzipped) and inlined.
  - Fonts copied from the main site's @fontsource packages.
- Built the **v0 prototype**, `public/index.html`:
  - Sections: hero, Program (placeholder times, marked Draft), Honorees (real bios with “Read full bio”), Sponsors (placeholder), and About (thank-you note, DTC blurb, links, PDF button).
  - A fixed bottom tab bar with scroll highlighting.
  - Print styles for the PDF.
- Added `scripts/check-budget.sh`, `.github/workflows/pages.yml` (not active until a repo exists), `.gitignore`, and `.claude/launch.json` (preview server).

**Checked:**
- Budget script: HTML **11.7 KB gzipped**, first-visit total **104 KB**. PASS.
- Widths 320, 375, and 768 px: no horizontal scrolling, all 4 tabs fit at 320px, and photos load.
- Contrast computed: body 16.4:1, secondary 11.8:1, gold 10.8:1 (all AAA).
- Fixed a line break in “Folsom-O’Keefe” and the photo-credit placement on tablets.

**Decisions:** proposed D1, D7, D9, D10, D12, and D13. Adopted D2, D3, D5, and D8 (pending review). D4, D6, D14, and D15 are open (see DECISIONS.md).

**Blocked on / waiting for:**
- **Owner:** D1 approval, then the GitHub repo, Pages, and the Wix CNAME. This is the critical path for printing the QR code.
- **Committee:** run of show, Volunteers of the Year, sponsors and ads, Terry Backer blurb, thank-you wording, and the “Paid for by” answer. A draft email is in `docs/04-timeline-and-tasks.md`.

**Next step (exact):**
1. Owner approves D1.
2. `git init` + first commit. Check `git status` first, and confirm `reference/` and `content/private/` are ignored.
3. Create a **public** repo, `Blake32p/banquet-program-2026`, and push.
4. Set Settings → Pages → Source to “GitHub Actions,” and set the custom domain to `program.stratforddemocrats.com`.
5. In Wix DNS, add CNAME `program` → `blake32p.github.io`.
6. Then generate the QR code (doc 05 §A).

**Starter prompt for the next Codex session (copy-paste):**
> Read AGENTS.md, then the newest entry in docs/WORKLOG.md and the open items in docs/DECISIONS.md. The final run of show is pasted in content/run-of-show.md under “Raw run of show.” Write the guest-facing version in the same file, update the #program section of public/index.html to match, remove the program Draft note, run `bash scripts/check-budget.sh`, preview at 320px and 375px, then add a WORKLOG entry. Don't commit.

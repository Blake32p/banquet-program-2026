# 04 · Timeline and task board

*Today is Wed 2026-09-23. The event is Sun 2026-09-27, so we have **4 days**. The printed QR code is the critical path, so the address must be final before anything is printed.*

Legend: 👤 owner (Blake) · 🏛️ committee (Kathleen/Karen/event team) · 🤖 agent (Claude or Codex) · ✅ done

## Wed Sep 23: kickoff ✅ (Claude)
- ✅ Research hosting (ChatGPT Sites, Vercel, GitHub Pages, Cloudflare, Netlify) → `docs/02-hosting-research.md`
- ✅ Project brief, design system, performance budget, decisions log, worklog
- ✅ Pull honoree bios verbatim and compress photos
- ✅ Working prototype `public/index.html` (v0, with draft placeholders)
- ✅ D1 approved: GitHub Pages + `program.stratforddemocrats.com`
- ✅ Repo created and pushed, Pages turned on, first deploy passed, custom domain set (Claude)
- ✅ QR code generated and decode-checked → `print/` (Claude)
- ✅ Wix CNAME `program` → `blake32p.github.io` configured (D1); retain the phone/cellular HTTPS check below
- 🏛️ Send the content request (the email draft is below).

## Thu Sep 24: QR code locked, content integration (Codex)
- 👤/🤖 Confirm `https://program.stratforddemocrats.com` loads over HTTPS on a phone using cellular data.
- 👤 Test-scan `print/qr-program.svg` once the domain is live. Then send the table-card artwork to print.
- 🤖 Integrate revisions to run-of-show v1 in `content/run-of-show.md`, then the page. Version 1 is already received.
- ✖ Volunteers of the Year: not announced at this event; placeholder removed (Blake, 2026-09-25). Sponsors and the extra Terry Backer blurb are omitted (D22).
- 🏛️ Review `docs/mockups/redesign-v1.html` on a phone. Collect feedback in one message.
- 🏛️ Resolve D7 (PDF source) and remaining content decisions. D4 is settled (Allura); D6 is settled (no website Sponsors).

## Fri Sep 25: PDF preparation and full QA
- 👤/🤖 When Blake requests it, port the approved mockup to `public/index.html`, including D21–D26, then run the launch checks. Publication needs separate authorization.
- ✅ Build the PDF (doc 05) and label the link with its real size (Claude, 2026-09-25; D33, published 2026-09-26)
- 🤖 Add the og:image (the link preview when the program is texted)
- 🤖/👤 Full QA checklist on a real iPhone and a real Android phone, including DevTools “Slow 4G”
- 🏛️ Final proofread by the Chair: names, titles, times, and spelling
- 👤 Pick up the printed table cards

## Sat Sep 26: content lock and final release
- 🤖 Resolve remaining draft notes and decide on `noindex` (D9). The top banner is already removed.
- 🤖 With Blake’s authorization, publish the final version and tag the release in git (`v1.0-event`).
- 👤 Scan a printed table card with 2–3 different phones
- 👤 Print 10–15 backup copies of the PDF for the registration table (D13)

## Sun Sep 27: event day
- **9:30 AM:** content freeze. After that, fix only real errors, such as a misspelled name.
- **10:15 AM (on site):** scan a table card at the venue on cellular. Note the signal strength. Ask the club whether there's guest Wi-Fi. If there is, a small “Wi-Fi: ___ / Password: ___” sign next to the QR code helps a lot.
- **If a last-minute change is needed:** edit `public/index.html`, commit, and push. GitHub Pages takes 1–10 min, and a guest who already opened the page may see the old copy for up to 10 more minutes.
- **After the event:** keep the program up for at least 2 weeks. Then decide whether to archive it at `/2026` on the main site.

---

## Content request: draft email to the committee (ready to send)

> **Subject:** Digital program for Sunday: a few items needed by Thursday
>
> Hi Kathleen,
>
> The digital program for Sunday's banquet is underway. Guests will scan a QR code on each table. So I can finish it, could you send the following by **Thursday midday**?
>
> 1. **Any updates to run-of-show version 1,** including times, award order, and confirmation of who is presenting
> 2. ~~**Volunteers of the Year:** names and citations~~ Not needed: not announced at this event (Blake, 2026-09-25)
> 3. ~~**Outstanding Volunteers list**~~ Not needed (Blake, 2026-09-25)
> 4. Does the page need a **“Paid for by…” line**?
>
> Thanks!
> Blake

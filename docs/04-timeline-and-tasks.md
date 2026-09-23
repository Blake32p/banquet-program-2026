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
- 👤 **Add the Wix CNAME `program` → `blake32p.github.io` today**, so HTTPS is ready by Thursday
- 🏛️ Send the content request (the email draft is below).

## Thu Sep 24: QR code locked, content integration (Codex)
- 👤/🤖 Confirm `https://program.stratforddemocrats.com` loads over HTTPS on a phone using cellular data.
- 👤 Test-scan `print/qr-program.svg` once the domain is live. Then send the table-card artwork to print.
- 🤖 Put the run of show into `content/run-of-show.md` → `#program`, as soon as it arrives.
- 🤖 Add Volunteers of the Year and the Terry Backer blurb when they arrive.
- 🏛️ Review the v0 design on a phone. Collect feedback in one message.
- 🏛️ Answer D4 (script font), D6 (ads), and D7 (PDF source).

## Fri Sep 25: content lock (target 5 PM), PDF, full QA
- 🤖 Sponsors section and ad handling (D6)
- 🤖 Build the PDF (doc 05) and label the button with its real size
- 🤖 Add the og:image (the link preview when the program is texted)
- 🤖/👤 Full QA checklist on a real iPhone and a real Android phone, including DevTools “Slow 4G”
- 🏛️ Final proofread by the Chair: names, titles, times, and spelling
- 👤 Pick up the printed table cards

## Sat Sep 26: final
- 🤖 Remove the draft banner and draft notes, and decide on `noindex` (D9)
- 🤖 Publish the final version. Tag the release in git (`v1.0-event`).
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
> 1. **Run of show** (the guest-facing version is fine: times, segments, and who is presenting)
> 2. **Volunteers of the Year:** names (exact spelling) and a short citation for each, plus photos if you'd like them included
> 3. **Outstanding Volunteers list,** if we're doing one again this year
> 4. **Sponsors and advertisers:** names, any tiers, and the ad artwork files
> 5. **One or two sentences about Terry Backer and the award,** for the About section
> 6. **Thank-you note:** is “Thank you, Anthony, Jill, and Corrie… — Karen and Kathleen” still the wording, and how would you like to sign it?
> 7. Does the page need a **“Paid for by…” line**?
> 8. The **name of the script font** used on the Save-the-Date flyer, if you know it
>
> Thanks!
> Blake

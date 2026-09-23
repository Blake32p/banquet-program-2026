# Sponsors, ad book, and About content

## Sponsors / ad book — NEEDED

The 2026 ad book was sold through Anedot (https://secure.anedot.com/stratdems/2026sdtcadbook; purchases are now closed). Ads are the biggest page-weight risk on this project, because each full-page ad image can be 100–500 KB.

Need from the event team:
- [ ] A list of sponsors and advertisers, with tiers if there are any (for example, Gold, Silver, Friend, or full-, half-, and quarter-page)
- [ ] Ad artwork files (PDF, PNG, or JPG, at the highest quality available)
- [ ] Decision **D6**: how ads appear (see `docs/DECISIONS.md`)

Recommended treatment:
- The main page lists sponsor names as text, grouped by tier. Text costs almost nothing to load.
- Ad images go in a “View the ads” section that loads only when a guest taps to open it (`loading="lazy"` inside a `<details>` element). Each image is 800px wide WebP at 60–120 KB or less.
- Ads also appear in the downloadable PDF.

## About section content

### Closing page: “Congratulations!” + thank-you note (from the Canva program’s last page, 2026 wording)

**Blake, 2026-09-23:** this page must be included basically as it is, as **the end of the program**. It's built as the final section `#congratulations` in `public/index.html`: the page's own vector art (`public/assets/img/congratulations.svg`, extracted from the PDF) on the same royal-blue gradient, with the message as live text. Keep it **last**, and keep the wording exactly as below.

> Thank you, Anthony, Jill, and Corrie – for your dedication and commitment to the care, protection, and enhancement of our beloved town of Stratford.
> — Karen and Kathleen

- Wording and signature are used exactly as on the Canva page (first names only).

### About the Stratford Democratic Town Committee (from the Sept 10 press release boilerplate)
> The Stratford Democratic Town Committee works to support Democratic candidates, encourage civic participation and promote Democratic values while helping elect leaders who serve the people of Stratford and Connecticut.

### About the Terry Backer Environmental Champion Award — NEEDED
- [ ] One or two sentences about Terry Backer and the award, approved by the DTC. Don't have Claude or Codex write historical facts about Terry Backer without a source; ask the Chair for approved text.

### Stay connected (from the website footer)
- Website: https://www.stratforddemocrats.com
- Email: info@stratforddemocrats.com
- Phone: 203-296-3147
- Facebook: https://www.facebook.com/StratfordDTC/
- Instagram: https://www.instagram.com/stratforddtc/
- YouTube: https://www.youtube.com/channel/UCUFmmJA_Q8qh6iB7NuLAVig
- Volunteer / donate / email sign-up: use the pages on the main site

### Legal / attribution — CONFIRM
- [ ] Ask the Chair or Treasurer whether this page needs a “Paid for by…” attribution line. The main website footer doesn't currently show one. The program doesn't promote candidates, but confirm before launch.

### Upcoming dates to mention — OPTIONAL
- [ ] Next DTC meeting date and location (the main site lists Oct 22 and Dec 3 meetings at DTC Headquarters)
- [ ] Election Day, Tuesday, November 3, 2026, with a link to the main site's 2026 Election Guide (https://www.stratforddemocrats.com/voting-information)

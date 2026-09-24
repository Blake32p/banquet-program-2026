# 01 · Project brief

*Written at kickoff; updated 2026-09-23 to reflect Blake’s decisions through D26. The latest design is in `docs/mockups/redesign-v1.html`; `public/index.html` remains the deployed version until a separately authorized port and publication.*

## The job

Replace the Canva PDF program with a **fast, phone-first web page** that guests open from a QR code on their table at the 2026 Annual Awards Banquet. There will be no printed program, except a few backup copies (see D13).

## Event facts

| | |
|---|---|
| Event | Stratford Democrats 2026 Annual Awards Banquet |
| When | **Sunday, September 27, 2026 · 11 AM – 2 PM** (Sunday brunch) |
| Where | Blackhawk Country Club, 385 Oronoque Ln, Stratford, CT 06614 |
| Tickets | $80 per person (sales closed) |
| Host | Stratford Democratic Town Committee (Chair: Kathleen Callahan) |
| Event page | https://www.stratforddemocrats.com/annual-awards-banquet/2026 |

## Audience and context

- **Guests:** about 150–250 people of all ages, many 55+. They'll hold a phone at arm's length at a brunch table, probably without reading glasses.
- **Room:** a country-club ballroom at midday. Light can range from bright window glare to dimmed lights during speeches. The design works in both: a dark navy background with very high-contrast text.
- **Network:** cell service may be weak, and many people will scan at the same moment when they sit down. **Speed is a feature.** The page has to appear even on one bar of LTE.
- **Devices:** everything from new iPhones to 5-year-old Android phones, and a few tablets. No app install and no login.

## Goals, in priority order

1. **Loads almost instantly on a weak connection.** First screen in under 2 s on “Slow 4G.” The whole page under 200 KB.
2. **Easy to read:** body text 19px or larger, AAA contrast, and big tap targets.
3. **Guests can find the schedule and the honorees in one tap,** from the fixed bottom bar: Program | Honorees | About.
4. **Looks like the 2026 invitation** (navy, gold, and script) so it feels like part of the same event.
5. **Easy to hand off between Claude and Codex, and between volunteers.** Plain files and a documented process.
6. **A downloadable PDF keepsake,** clearly labeled with its size so nobody taps it by accident on weak signal.

## Out of scope

- Ticketing, payments, donations, RSVP forms, live polling, and photo uploads
- Logins or personalization
- A CMS. Edits are made in plain HTML by an agent or a volunteer.
- Sponsors/ad-book content on the website, and a separate Terry Backer award-background blurb (D22). Corrie’s award title and full biography remain.

## Approved page structure

Hero and honoree roll → Program → Honorees → Congratulations and Karen and Kathleen’s exact sign-off → footer with About, Stay connected, PDF availability, and the Stratford Democrats logo. The footer omits the email address and phone number. Outbound website links open in a new tab; internal navigation stays in the program (D22, D24, D26).

## Content inventory

| Content | Status | Source / owner |
|---|---|---|
| Event details | ✅ Have | Event page and flyer |
| Honoree bios (Anthony, Jill, Corrie) | ✅ Have, verbatim | Event page → `content/honorees.md` |
| Honoree photos | ✅ Have, compressed | Event page → `public/assets/img/` |
| **Run of show** | ✅ Version 1 received; revisions expected | Event team → `content/run-of-show.md` |
| **Volunteers of the Year** (names and citations) | ❓ Needed | Committee |
| Outstanding Volunteers list (last year had about 50) | ❓ Ask whether there is one | Committee |
| Thank-you note from Karen and Kathleen | ✅ Keep exact approved wording and sign-off | Canva closing page; D16 |
| “Paid for by” attribution line | ❓ Confirm whether it's needed | Chair / Treasurer |
| Logo | ✅ Have | `Logos/stratford-democrats-light.svg` |
| Script font used on the flyer | ✅ Allura 400, self-hosted subset (D4) | Confirmed by Blake |
| PDF keepsake | ❓ Not built; source decision D7 pending | Owner / committee |

## What we learned from last year's program

The Canva file (`reference/canva-program-draft-2025-template.pdf`) has 7 pages. It's **3.8 MB**, mostly because the same 1600×1600 background image is embedded 7 times. On a weak connection that takes 30 seconds or more, and it's hard to read on a phone because it's a letter-size layout. Its structure is still good, and we're keeping it:

1. Cover: the event and the honorees
2. Program schedule
3. Honoree pages with a circular photo and a citation
4. Volunteers of the Year citations
5. Outstanding Volunteers name list (#VolunteersWinElections)
6. Thank you and upcoming dates
7. A congratulations note from Karen and Kathleen

> Note: pages 1–6 of that PDF still have **2025** content (May 10, Lisa Carroll Fabian, and others). Only page 7 has been updated for 2026. Don't copy dates or names from pages 1–6.

## Success measures

- The page appears in under 2 s on Chrome DevTools “Slow 4G” (Lighthouse mobile performance of 95 or higher).
- No horizontal scrolling at 320 px. All text is 15px or larger.
- The QR code scans on first try from a seated position, in dim light, on both iPhone and Android.
- Nobody at the event asks “where's the program?”

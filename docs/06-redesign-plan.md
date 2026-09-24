# 06 · Redesign plan: “the invitation, continued”

*Later change (2026-09-24, D32): a fourth tab and a **Tributes** section (the ad book) now sit between Honorees and the footer, with the closing page as its last ad. This plan otherwise records the redesign as published.*

*Initial proposal by Claude, updated through Blake’s approved mockup refinements D21–D26 on 2026-09-23. Current design: `docs/mockups/redesign-v1.html`, served from the project root at `http://127.0.0.1:4174/docs/mockups/redesign-v1.html?v=4`. **Published to `public/index.html` on 2026-09-23 (D31)** at Blake’s request; D18 and D19 were adopted as built. D20 applies once the PDF exists.*

## The short version

**Current approved refinements:** no Sponsors section/tab or extra Terry Backer award-background block. The closing note and exact sign-off precede a footer ordered About → Stay connected → PDF availability → Stratford Democrats logo; no footer email address or phone number. Navigation is Program | Honorees | About. Biographies have 8px side padding below 360px. Restrained motion respects reduced-motion preferences. All five outbound links open in a new tab with an accessible notice. The mockup’s top design banner is removed. D21–D26 govern these requirements.

v0 is fast, accessible, and structurally right. It doesn't yet *feel* like the invitation, and its first screen doesn't do the program's job. The redesign keeps every non-negotiable (speed budget, AAA contrast, bottom tabs, verbatim bios, no JS growth) and changes five things:

1. **The first screen becomes the program's table of contents.** A shorter hero, then the flyer's gold-framed “Celebrating our 2026 honorees” box, made tappable. It replaces the generic welcome sentence and the first-name jump pills.
2. **Gold gets one job.** Gold marks awards, times, links, and the script. Names, headings, and body text are white. Today everything is gold, so nothing stands out.
3. **A real script.** Playfair Display Italic is a serif italic, not a script. The flyer's script is **Allura** (Blake, 2026-09-23), an open-licensed Google font, so it is self-hosted as a small subset. Dropping Playfair saves 23 KB.
4. **Framed, not filled.** Honoree cards become gold-framed pages with the portrait as a medallion overlapping the top edge. The schedule becomes a timeline. Pills, filled cards, and the gold underline bars go.
5. **One design system to the end.** The closing “Congratulations!” page keeps Blake's art and the note, but sits on navy with gold instead of the Canva royal blue. (D16 adopted the closing page itself; the color treatment is a separate proposal, D18.)

## Review of v0 (historical rationale, not the current mockup)

1. **The first screen is a poster, not a program.** At 375×812 the hero fills the whole viewport and the “Program” heading sits at the fold. Nothing above the fold says who is honored today or invites a tap. The only copy is a generic welcome sentence (draft). The flyer solved this with its “Celebrating our 2026 honorees” box.
2. **Gold does every job, so hierarchy is flat.** Eyebrow, year, “Banquet”, section underlines, award titles, role labels, times, segment labels, honoree links, jump pills, “Read full bio”, buttons, and the active tab are all gold. In the schedule, two gold treatments compete: a bold gold label above an underlined gold link.
3. **The “script” isn't a script.** Playfair Display Bold Italic is the heaviest font on the page (23 KB of the 39 KB font payload) and is used for one word. It reads as a magazine italic. The flyer's script is the invitation's most recognizable element.
4. **Surfaces don't separate.** The card fill `#111c45` on the page `#0a1230` is about 1.3:1, so cards read as muddy rectangles held together by a faint border. One pill shape does three jobs: jump links, the bio disclosure, and buttons.
5. **Honoree cards are long and repetitive.** “Our honorees” → “Democrats of the Year” → “CO-DEMOCRAT OF THE YEAR” names the award three times before the bio starts. A card is about 590 px tall on a tablet before the bio opens. The jump pills use first names only (“Anthony”, “Jill”), which reads casual for a formal program.
6. **The schedule is a text list.** No visual timeline, times are the same size as body text, presenters' long titles wrap to three lines, and honoree names look like ordinary hyperlinks. Last year's PDF used a timeline because it scans.
7. **About is a wall of six identical buttons.** The PDF keepsake is the only solid-gold button on the page, so it reads as the primary action. Link arrows are inconsistent (→ vs ↗).
8. **The closing page is a different design.** The new “Congratulations!” panel uses the Canva royal-blue radial gradient, light-blue text (`#b8e3f6`), and a brush-lettered SVG. It is the only celebratory moment on the page, and it looks pasted in from another document.
9. **Small tells.** The “·” separator dangles at the end of the time line from 320 to 414 px. The three sparkles float at arbitrary spots. The gold underline bar under every h2 is a web-template habit. The dark-red draft banner clashed with everything; another session removed it from the live page later the same afternoon.

Already good, and kept: the load budget (115 KB first visit, 12.5 KB HTML gzipped), AAA contrast, 19 px body text, the bottom tab bar, `<details>` bios, print styles, the logo treatment, and the photos.

## Direction

Keep **D3** (navy, gold, script, from the flyer). The thesis: **opening the page should feel like unfolding the printed program at your seat**, not landing on a website with a poster on top. Every device below is borrowed from the flyer: the gold hairline rule, the four-point sparkle, uppercase Poppins, the script, and the thin gold frame around the honorees.

**Signature element:** the **honoree roll** on the first screen. It is the flyer's framed box turned into the program's table of contents. The portraits appear further down as medallions pinned to the top of each honoree's page.

## Design system changes

### Color (tokens in `:root`)

| Token | Value | Change |
|---|---|---|
| `--bg` | `#0a1230` | Same value. The page now runs a vertical gradient (`#101b48` at the top → `#0a1230` → `#060b20` at the bottom) with a soft radial glow behind the hero. Zero bytes of assets. |
| `--text` / `--text-soft` | `#f5f2ea` / `#c9cfe2` | Same |
| `--gold` | `#ecc062` | Same value. **New rule: gold text only for award labels, times, links, the active tab, and the script.** Names, headings, and body text are white. |
| `--gold-deep` | `#b8903a` | Same: portrait rings and rules |
| `--sky` | `#8dd0e5` | Same: focus rings only |
| `--frame` | gold at 50% | New: the 1 px frame around the roll and the honoree cards |
| `--rule` / `--rule-soft` | gold at 38% / 22% | Dividers, the timeline |
| `--bg-raised` | `#111c45` | **Removed.** No filled cards. Cards sit on the page with at most a 2.5% white tint. |

Every text/background pair stays at 7:1 or better. The darkest gradient stop only raises contrast.

### Type

| Role | Face | Size |
|---|---|---|
| Display (“ANNUAL AWARDS”, section titles) | Poppins 700, uppercase for the h1 only | h1 `clamp(2.5rem, 12vw, 4.25rem)`; h2 2–2.625 rem |
| Script (“Banquet”, “Celebrating our 2026 honorees”, the sign-off) | **Allura** 400 (D4, adopted). Self-hosted subset WOFF2, `public/assets/fonts/allura-400.woff2`. Never synthesize bold: Allura has one weight. The mockup uses it. | 2.75–5.5 rem (Allura runs small, so it is set about 1.4× the sans size) |
| Award labels (eyebrows) | Poppins 700, uppercase, tracking .08em, gold | 15–17 px |
| Names | Poppins 700, white | roll 20 px · schedule 21 px · cards 28–34 px |
| Body | Poppins 400 | 19 px / 1.6 (unchanged) |
| Meta and credits | Poppins 400, soft | 15–17 px |

Playfair Display is removed (−23 KB).

### Surfaces and ornament

- **Frame:** 1 px gold at 50%, radius 10–20 px. Used for the roll and the honoree cards.
- **Medallion:** 160 px circular portrait, 2 px gold ring with a 4 px navy gap, overlapping the card's top edge by 80 px.
- **Divider:** a centered gold hairline with one four-point sparkle at the top of each section (the flyer's rule). The gold underline bars under h2s go.
- **Hero sparkles:** two, placed like the flyer (top-right of “2026”, bottom-left of “Banquet”), inside the title box so nothing overflows at 320 px.
- **Timeline:** a 2 px soft-gold line with gold dots.
- **Motion (D25, D30):** one opening gold-star/rule flourish, brief control/disclosure feedback, a gliding tab marker, and scroll-linked ornament: divider rules draw out, schedule dots glow at mid-screen, portrait medallions settle in, and the closing art rises, all reversing when scrolling up. Text never moves or hides. All animation and smooth scrolling respect reduced motion; scroll-linked effects fall back to the static page where unsupported. No JavaScript for motion. See doc 03 for details.

## Page, section by section

### Hero (target: 60% of a 375×812 screen, then the roll)

```
        [STRATFORD DEMOCRATS]          logo at 60vw (was 76vw)
              2026 ✦                   gold
          ANNUAL AWARDS                white, uppercase
        ✦   Banquet                    script, gold
        ──────────────────
       SUNDAY, SEPTEMBER 27            gold, uppercase
           11 AM – 2 PM                white bold, two lines, no “·”
        Blackhawk Country Club
┌──────────────────────────────────┐
│  Celebrating our 2026 honorees   │   script, gold
│ DEMOCRATS OF THE YEAR            │   gold eyebrow
│ Anthony Afriyie               ›  │   52 px rows, hairline-separated
│ Jill D’Angelo-Powers          ›  │
│ TERRY BACKER ENVIRONMENTAL       │
│ CHAMPION AWARD                   │
│ Corrie Folsom-O’Keefe         ›  │
│ VOLUNTEERS OF THE YEAR           │
│ To be announced               ›  │
└──────────────────────────────────┘
```

- The welcome sentence and the jump pills are removed. The roll is a `<nav aria-label="Today’s honorees">`, and each row links to the honoree's card.
- No thumbnails in the roll. They would pull 53 KB of photos into the first paint. The medallions below do that job.

### Program

```
Program
Times are approximate.
●  11:00 AM
│  Arrival
│  Coffee, tea & cocktails
●  11:20 AM
│  Welcome remarks
│  Stratford Democrats Chair Kathleen Callahan
│  Governor Ned Lamont …
●  1:00 PM
│  Awards
│  Opening remarks
│  Stratford Mayor David Chess
│  ───────────────────────────────────────────
│  Terry Backer Environmental Champion
│  Corrie Folsom-O’Keefe  ›                        the name is the link, white
│  Presented by State Representative Joe Gresko
●  2:00 PM
   Departure
```

- Times in gold tabular figures on their own line. Segment names in white at 23 px.
- Award segments use simple separators: quiet gold award label, white name linking to the card (48px tall), presenter in soft text. Wording stays exactly as the run of show; the diagram is only an excerpt.
- Speaker-only segments (Opening remarks, Campaign Volunteer Recognition) are written like Welcome remarks: soft title, bold white name, body size, no link. Only honoree names get the large white linked treatment, so a speaker never reads as a recipient (D28).
- Considered and rejected: a “happening now” marker. Times are approximate, so it would often be wrong.

### Honorees

```
Honorees
── DEMOCRATS OF THE YEAR ──          gold eyebrow with hairlines
          (portrait)                 medallion overlapping the frame
┌─────────────────────────────┐
│       Anthony Afriyie       │      h4, white, 28–34 px
│  Presented by Carolann Reid │      soft (from the run of show)
│  First paragraph…           │      left-aligned
│  Read full bio ⌄            │      text disclosure, gold, 48 px tall
└─────────────────────────────┘
```

- The in-card role label (“CO-DEMOCRAT OF THE YEAR”) goes. The group eyebrow already says it. In its place: “Presented by …”, which ties the card to the schedule. (Needs the “presented by” confirmation noted in `content/run-of-show.md`.)
- “Photo by Luke Franke” stays directly under Corrie's medallion.
- Tablets: the same centered layout with the text measure capped at 34 rem. v0's side-by-side layout goes: the medallion doesn't work with it, and tablets are rare here.
- Below 360px, card side padding is 8px; body text remains 19px and all biographies stay verbatim (D23).
- With JavaScript, an open bio reads straight through: “Read full bio” hides and a matching “Show less ⌃” sits after the last paragraph. Closing returns focus to “Read full bio” and scrolls it to the center of the screen. Without JavaScript, the native `<details>` behaves as before (D29).
- Volunteers of the Year: the same eyebrow, then a framed card per volunteer (name, citation, optional medallion), or a simple list if there are no photos.

### Closing, then About and the footer

```
Congratulations! artwork and exact note
Karen and Kathleen
─────────────────────────────────
About
Stratford Democratic Town Committee: verbatim description

Stay connected
[ Volunteer with us ]                                stacked outline buttons
[ Get email updates ]
   (f)          (◎)          (🌐)                     icon + label, 52 px targets
 Facebook    Instagram     Website
Download the program
Draft: PDF to come                                    status until file exists

[ STRATFORD DEMOCRATS LOGO ]
```

- Sponsors and the extra award-background blurb are omitted (D22). Corrie’s actual award heading and biography remain in Honorees.
- The current PDF block is a draft paragraph, not a link. The later suggestion to remove its “Download the program” wording was not approved; do not apply it as cleanup. Restore an actual link and real file size when the PDF exists (D20).

### Closing page (“Congratulations!”, last program section)

- Keep the art and the note word for word. The background becomes the page navy with a soft blue-violet radial glow (the same glow as the hero), the text is warm white, and “Karen and Kathleen” is set in the script in gold, like a signature.
- Optional SVG edit (about 10 minutes): recolor the two mid-blue rays (`#3983b0`) to gold and drop the near-invisible burst lines. That also shrinks the file from 10.5 KB to roughly 4 KB gzipped.
- Alternative, if Blake prefers fidelity to the Canva page: keep the royal blue exactly as built. This is decision **D18**. (D16 adopted the closing page itself; D18 is only about its colors.)

### Footer and tab bar

- The footer starts with left-aligned About, followed by centered Stay connected, social links, PDF availability, and the light logo. There is no email address or phone number. About remains highlighted while viewing the closing/footer area (D22/D24).
- Volunteer, email updates, Facebook, Instagram, and Website links have at least 48px touch targets and open a new tab with `noopener noreferrer` and an accessible notice. Internal links remain in this program (D26).
- Three text tabs: **Program | Honorees | About**, with a gold active state and 60px minimum height plus the safe area. No tab icons or Sponsors tab.

## What doesn't change

One page, no framework, native `<details>` bios (D8), print styles, verbatim bios, name spellings, the photo credit, the budget, and `noindex` pending D9. The mockup’s JavaScript was 905 bytes through the motion and external-link refinements; the bio “Show less” control (D29) brings it to 1,469 bytes, within the 2 KB limit.

## Budget

Use the limits in doc 03 and measurements in the latest WORKLOG. Before the port, production measured 12,480 bytes gzipped HTML and 115,316 bytes first visit; the published redesign measures 10,590 and 110,853 bytes. Allura replaced Playfair (the Playfair file was removed from `public/`).

## Implementation plan

Done 2026-09-23 (D31). The steps as followed:

1. Confirm the remaining production choices D18–D20. D4 is answered: Allura. Preserve the approved refinements D21–D26.
2. Start from the current mockup and reconcile it with the latest content sources and any newer production edits. Adjust asset paths from the mockup’s `../../public/assets/` to production paths; do not overwrite newer content with an older mockup copy.
3. Verify biographies and closing text verbatim, photo credit, three-tab navigation, footer order, motion preferences, and external-link behavior. Keep draft markers for unapproved/missing content.
4. Run the budget script and doc 05 QA, including phone widths, keyboard, screen reader, large text, reduced motion, no-JS operation, and print output.
5. Commit/publish only with Blake’s authorization. The timeline’s QR deadline and Saturday content lock still apply.

## Decisions needed

- **D4 (adopted 2026-09-23):** Allura, self-hosted subset.
- **D18 (production choice, refines D16):** closing page on navy and gold (current mockup) vs. the Canva royal blue.
- **D19 (production choice):** the current mockup’s honoree roll replaces the welcome sentence and the first-name jump pills, retaining Volunteers of the Year.
- **D20 (production choice):** once the PDF exists, present a quiet text link with its actual size.

## Considered and rejected

- A “happening now” marker in the schedule (times are approximate).
- Thumbnails in the roll (53 KB earlier on the critical path).
- Tab-bar icons (text is clearer for this audience).
- A light theme or a toggle (glare in a dim room; AAA already holds in daylight).
- Parallax and looping/decorative motion beyond the restrained effects approved in D25 and D30.
- Scroll “reveals” that fade or slide text in (D30 animates ornaments, dots, portraits, and art only; text is always visible).
- A schedule line that fills as you scroll (it could read as “this part of the event is over”; the dot glow comes and goes instead).
- A second accent color for the environmental award (`--sky`). One accent keeps the page calm, and the award label does the job.

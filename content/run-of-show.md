# Run of show / program schedule

**Status:** Version 1 received from Blake on 2026-09-23 at 3:37 PM (`reference/run-of-show-2026-09-23.docx`, gitignored). **More changes are expected**, so keep this file and `#program` in `public/index.html` in sync.

## How to apply a new version

1. Save the new file as `reference/run-of-show-YYYY-MM-DD.docx`. Paste its text below under a new “Raw run of show vN” heading. Keep the older versions, newest first.
   - Extract the text with: `textutil -convert txt -stdout "file.docx"`
   - If a version includes internal cues (staff notes, mic handoffs, private phone numbers), put the raw text in `content/private/` instead. This repo is **public**.
2. Update the “Guest-facing schedule” table.
3. Update `#program` in `public/index.html` to match it exactly. Award items link to the honoree cards (`#corrie`, `#anthony`, `#jill`).
4. Run `bash scripts/check-budget.sh`, preview at 320px, and add a line to `docs/WORKLOG.md`.

Guest-facing style rules:
- Times use the format `11:00 AM`, with a space before AM/PM.
- Names are **bold**. Titles stay in the run of show's own wording.
- **Name spellings follow `content/honorees.md`, not the run of show.**

## Guest-facing schedule (from v1)

| Time | Segment | Speakers / details |
|---|---|---|
| 11:00 AM | Arrival | Coffee, tea & cocktails |
| 11:20 AM | Welcome remarks | Stratford Democrats Chair **Kathleen Callahan** · Governor **Ned Lamont** · Senator **Richard Blumenthal** · Lieutenant Governor **Susan Bysiewicz** · Secretary of the State **Stephanie Thomas** |
| 12:00 PM | Brunch | |
| 1:00 PM | Awards | Opening remarks: Stratford Mayor **David Chess** |
| | | Campaign Volunteer Recognition: **Kathleen Callahan** |
| | | Terry Backer Environmental Champion: **Corrie Folsom-O’Keefe**, presented by State Representative **Joe Gresko** |
| | | Stratford Democrat of the Year: **Anthony Afriyie**, presented by State Senate Candidate **Carolann Reid** |
| | | Stratford Democrat of the Year: **Jill D’Angelo-Powers**, presented by Stratford Democrats Political Director and Treasurer **Karen Tracy** |
| 2:00 PM | Departure | |

### Editorial notes on v1 (confirm with the event team)
- **Spelling:** the run of show says “Anthony Afiyie.” The correct spelling is **Afriyie** (event page, flyer, bio), and that's what the program uses.
- **“Presented by”** is our reading of the layout: each award block lists a person and then the award in bold, so that person presents the award. Please confirm.
- **“Campaign Volunteer Recognition”** (run of show) and **“Volunteers of the Year”** (flyer) may be the same segment. We need to know whether any volunteers are named, and which title to use.
- Times are start times. The program page says times are approximate.

## Raw run of show v1 (as received 2026-09-23, text only)

```
11:00	Arrival, Coffee/Tea/Cocktails

11:20	Welcome Remarks
Stratford Democrats Chair Kathleen Callahan
Governor Ned Lamont
Senator Richard Blumenthal
Lieutenant Governor Susan Bysiewicz
Secretary of the State Stephanie Thomas

12:00	Brunch

1:00	Awards
Stratford Mayor David Chess
Opening Remarks
Kathleen Callahan
Campaign Volunteer Recognition
State Representative Joe Gresko
Terry Backer Environmental Champion Corrie Folsom-O’Keefe
State Senate Candidate Carolann Reid
Stratford Democrat of the Year Anthony Afiyie
Stratford Democrats Political Director and Treasurer Karen Tracy
Stratford Democrat of the Year Jill D’Angelo-Powers

2:00	Departure
```
(In the original, the times and segment names are bold. Under Awards, each person's name is followed by their segment in bold.)

## Last year's structure (for reference only; 2025 was an evening event)

| Time | Item |
|---|---|
| 7:00 PM | Registration check-in · Cocktails and mingling |
| 7:30 PM | Opening remarks, awards presentation: Terry Backer Environmental Champion, Democrat of the Year |
| 8:15 PM | Dinner |
| 9:00 PM | Volunteer celebration: Volunteers of the Year, Outstanding Volunteers |
| 9:45 PM | Closing remarks, dessert/coffee, dancing, and networking |

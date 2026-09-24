---
target: docs/mockups/redesign-v1.html
target_slug: docs-mockups-redesign-v1-html
date: 2026-09-23
method: dual-agent
assessment_a: /root/recritique_design
assessment_b: /root/recritique_evidence
assessment_type: qualitative
source_sha256: 9928cd30e6267dbc4479d7da681ab2463d4d8c055e5bfc574879ab2e893f5baf
status: open
---

# Second critique of the revised mockup

The current design needs a limited final polish pass. Its invitation-derived typography, restrained ornament, portrait medallions, chronological schedule, and fixed navigation form a coherent reading experience. Retain the approved palette, fonts, and closing-note/contact-footer order.

## What works

- The opening establishes the event and exposes the honoree links. Removing the banner and tightening the cover spacing gives more room to the program itself.
- The schedule has a clear hierarchy of time, segment, recipient, and presenter. The simpler separators preserve usable width on phones.
- The closing note and contact footer have a clear boundary. All contact information follows Karen and Kathleen, as requested.
- Persistent navigation, named award groups, native biography disclosures, and left-aligned reading text support guests who move between the page and the event.

## Remaining priority issues

### P3: Give biographies more width on the smallest phones

**Addressed 2026-09-23 (D23):** Blake approved only this item. Card side padding is now 8px below 360px; verified a 266px biography column at 320px with 19px text and no horizontal overflow. The PDF suggestion below remains unapplied.

At 320px, the card padding leaves a 250px reading column. The first biography consequently wraps frequently, and its disclosure sits below the initial card viewport. Reduce horizontal card padding from 16px to approximately 8px below 360px. Keep 19px text and the complete, verbatim first paragraph. This is a small improvement for narrow phones, not a reason to shorten the biographies or restructure the cards.

Source: `docs/mockups/redesign-v1.html:127`. Suggested follow-up: `$impeccable adapt` or `$impeccable polish`.

### P3: Make the unavailable PDF read as a status

“Download the program” currently appears in bold even though it is a paragraph without a link. The following draft note explains why, but the initial wording still promises an action. Until the file exists, show only the draft availability message; restore the action label together with the actual download link.

Source: `docs/mockups/redesign-v1.html:374`. Suggested follow-up: `$impeccable clarify` or `$impeccable polish`.

## Reading and usability assessment

| Heuristic | Qualitative assessment |
|---|---|
| Visible status | Disclosure labels and section indicators provide context; PDF wording can be clearer. |
| Familiar language | Event and program labels follow familiar conventions. |
| User control | Native anchors and reversible disclosures support navigation and return. |
| Consistency | Typography, color, framing, and interaction patterns form a coherent system. |
| Error prevention | Missing PDF is not linked, avoiding a broken download; action wording remains misleading. |
| Recognition | Four visible destinations and grouped honoree names avoid reliance on memory. |
| Efficiency | Section and recipient jumps offer direct access within a long document. |
| Visual economy | Schedule framing is restrained; remaining biography wrapping is a small-screen concern. |
| Error recovery | Not materially applicable to the static reading flow; no forms were assessed. |
| Help | Contact details provide a suitable help route for this surface. |

Cognitive load is low: the main navigation has four choices, award links are grouped, and extended biographies are optional. A distracted phone reader benefits from the stable bottom navigation; a narrow-phone reader still encounters lengthy biography previews. For assistive access, the source provides native links, details elements, focus styling, and named groups, but this pass was not a full screen-reader audit.

The visual journey now progresses from event identity through the schedule and honoree profiles to the closing note, then a separate contact footer. Draft sponsor samples, volunteer names, the award description, and the PDF remain content-completion dependencies. They should not prompt another redesign while their real content is pending.

## Deterministic evidence and limitations

Assessment A inspected a fresh browser tab at 320×640, 375×812, and 1024×900, then closed it and reset the viewport. It found no major design problem. Assessment B independently ran the detector once and reviewed source; findings were held until A finished.

The detector returned four warnings and no errors, with no precise line locations. The year-size warning incorrectly resolves inherited sizing: source establishes a minimum 24px year. The contrast warning uses a print-only color and does not establish a screen defect. The uppercase warning concerns an award label rather than body prose. The padding warning overlooks that the first row removes its top border as well as padding. Print contrast remains unverified.

Source confirms a 19px base, 48px minimum schedule/contact/disclosure controls, 52px roll links, and 60px bottom navigation. Main navigation and disclosures work without JavaScript; active-section highlighting requires it. Root verified all 12 biography paragraphs against `content/honorees.md`, 9,201-byte gzipped mockup HTML, 905-byte JS, and an estimated 109,429 bytes of referenced resources. The unchanged production budget script passes at 115,316 bytes total.

Assessment B's fresh browser attempt received a local connection refusal, so no fresh interaction or viewport measurements were completed by B. Its failed tab creation left a hidden browser error tab that could not be selected for cleanup under the browser URL policy. No overlay, new server, viewport override, or temporary files were created by B. A's completed visual pass supplies the browser coverage for this review. No page edits or publication occurred.

Questions skipped: two minor priority issues; no new design-direction decision is needed.

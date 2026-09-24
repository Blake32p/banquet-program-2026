---
target: docs/mockups/redesign-v1.html
target_slug: docs-mockups-redesign-v1-html
date: 2026-09-23
method: independent design review and detector/browser evidence
assessment_a: /root/design_review
assessment_b: /root/browser_evidence
assessment_type: qualitative
status: addressed
---

# Design critique: redesign v1

**Implementation update, 2026-09-23:** Blake approved the refinements, with Stay connected and all contact information following the sign-off in a separate footer. The mockup now implements the approved changes. The original closing-placement recommendation below is superseded by D16/D21; the remaining findings were addressed. This document preserves the original review evidence. See the 17:46 ET WORKLOG entry for verification.

Scope: the mockup at `http://127.0.0.1:4174/docs/mockups/redesign-v1.html?v=3`. This review concerns presentation, reading, navigation, and accessibility. No page edits or publication were performed. Recommendations remain unapproved; D18–D20 retain their current status.

## Existing design structure

The page has a consistent typographic cover, framed contents, chronological schedule, portrait-led biographies, and closing note. Navy, gold, Poppins, Allura, and the portrait rings recur across sections. The next refinement should focus on information hierarchy, narrow-screen spacing, and anchor behavior.

- Allura is limited to display accents; Poppins handles the primary reading text. Biography text is left-aligned below centered portraits and names.
- Four fixed navigation destinations remain available through the page. The active state uses both a gold label and a top rule.
- Native biography disclosures keep the full text accessible on the same page. Tested disclosures opened and closed by mouse and keyboard, with the label changing to “Show less.”

## Refinements

### Opening-screen height

The honoree roll begins at y=479px on a 375×812 viewport and y=452px on a 320×640 viewport. At the smaller size, recipient names require scrolling below the fixed navigation. The title, event details, and roll have substantial cumulative height.

Tighten the spacing between logo, title, event details, and roll. Preserve the body size, script identity, and touch targets. A compact title composition would expose more of the contents sooner; a cover-like opening remains a valid choice if intentional. Source: hero and roll styles, lines 74–93.

### Repeated frames and narrow schedule rows

Rounded frames appear on the contents, schedule segments, biographies, and sponsor samples. The schedule additionally combines timeline indentation and framed-row padding. At 320px, its awards block is about 254px wide before the row removes another 32px of horizontal space. Long uppercase award labels wrap across several lines before the recipient and presenter.

Reserve the strongest framing for the contents and biographies. Use lighter separators or reduce nested padding in the schedule, especially on narrow screens. Keep the original wording and readable text size; adjust layout rather than shortening titles or bios. Sources: lines 89, 106, 117–125, 127, and 150.

### Biography jump positions

Following a direct honoree link cuts off the upper portion of the portrait. Corrie’s card landed at y=24.2px, while the portrait began at y=−54.8px. The portrait extends 80px above the card, but the anchor clearance is only 24px. Anthony’s jump exhibited the same behavior at desktop width.

Anchor a wrapper that includes the full portrait, or increase the scroll offset to cover the protruding image and its ring. Sources: lines 127–130.

### Accessible groups and touch targets

The cover’s award-category labels are marked `aria-hidden="true"`, so assistive navigation exposes recipient links without the visible category context. Keep category labels in the accessibility tree; hide only ornament. Source: lines 213–222.

The three schedule recipient links measure 44px tall at 375/414px, below the project’s 48px minimum. Footer link boxes measure 22.5px. Increase the clickable areas. The contents rows are 52px, disclosure controls 48px, and bottom navigation 60px. Sources: lines 93, 120, 136, 176, and 360.

### Closing placement

The closing artwork and note appear after About, followed by a separate contact footer. Moving those contact details into About would make the requested closing note the final content encountered. Preserve the exact closing text and artwork. Source: lines 350–361; AGENTS.md requires the closing page to remain the end of the program.

## Reading considerations

For guests glancing between the stage and phone, the stable navigation and disclosure controls reduce the need to retain a mental map of the long page. Small-phone readers would benefit most from wider schedule rows and less repeated framing. Screen-reader users need the award categories currently hidden in the contents. These changes do not require rewriting any approved content.

The PDF link currently references a file absent from the workspace. Treat it as unfinished mockup content and make it actionable only when the file exists. Sponsor layout also remains provisional until actual names and artwork arrive.

## Verification evidence

- Browser inspection covered 320, 375, 414, and 768px, plus desktop. No document-level horizontal overflow was observed at the four measured widths.
- Body text measured 19px; minimum visible text 15px. Presenter text is 17px and footer text 16px.
- Allura and both Poppins weights appeared in observed font resources. Font appearance was inspected visually; direct FontFaceSet inspection was unavailable.
- All four navigation links received the matching current-section state after scrolling settled.
- The detector ran once and returned four warnings across three rules. The year-size warning was a false positive: the year actually measured 24–40.8px, not 9.6px. The reported contrast pair referenced a print-only color and did not establish an on-screen contrast defect. The two uppercase warnings concerned label-length patterns, without precise selectors; this review treats uppercase wrapping as a manual layout observation, not a confirmed body-text failure.
- No full contrast, screen-reader, physical-device, or throttled-network audit was conducted.
- Production budget script passed: 12,480 bytes gzipped HTML and 115,316 bytes total referenced first-visit resources. Separately, a local mockup size estimate was 9,169 bytes gzipped HTML and 109,397 bytes with referenced assets. This is a size estimate, not a transfer-time measurement.

## Direction to resolve

For the next mockup, choose whether to keep the current cover-like opening with tighter spacing, or make the opening more compact so more contents are visible immediately. The portrait-anchor and accessibility fixes apply in either direction.

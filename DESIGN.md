# VLearn Course Player & AI Tutor — Design System (DESIGN.md)

## 1. Brand & Design Paradigm (Stitch Light Theme)
- **Design Archetype:** Clean Educational Studio (derived directly from Stitch Screen `c9e5e0cd58694dd59ac4dd529f6de0b9`).
- **Theme:** Crisp Light Mode with warm neutral undertones and high readability.
- **Tone:** Friendly, direct, calm, distraction-free.
- **Core Principle:** Simple UI, friendly UX. No redundant text or bureaucratic tags. Human maintains full agency at all times.

---

## 2. Core Rule: No Redundant Text
1. **Zero Boilerplate:** Eliminate meta tags like `"Track 1 - Day 18"`, `"Gate 1-5"`, `"Case A"`, or internal project tags in user-facing UI.
2. **Direct, Conversational Copy:** Buttons and labels must use active, everyday verbs (e.g., `"Tôi chưa hiểu"`, `"Xem giải thích"`, `"Quay lại bài"`).
3. **Information Density:** Avoid walls of explanatory text. If an element can be understood visually, omit superfluous explanatory subtitles.
4. **Single-Purpose Routing:** No persistent multi-tab switchers in the navigation bar. The screen renders directly based on the active path (`/option-a`, `/option-b`, `/option-c`).

---

## 3. Color System & Semantic Tokens (Light Mode)

### Canvas & Surfaces
- **Canvas Base:** `#f3f4f6` (Tailwind `neutral-100`)
- **Card / Panel Surface:** `#ffffff` (White)
- **Subtle Surface / Hover:** `#f9fafb` (Tailwind `neutral-50`)
- **Divider & Border:** `#e5e7eb` (Tailwind `neutral-200`)
- **Focus / Subtle Border:** `#d1d5db` (Tailwind `neutral-300`)

### Brand & Interactive Accents
- **Brand Red (Stitch Primary):** `#c92a2a` (Hover: `#b02525`, Soft tint: `#fef2f2`)
- **Primary Blue (Interactive Action):** `#2563eb` (Hover: `#1d4ed8`, Soft tint: `#eff6ff`)
- **Sky Blue (AI Indicators):** `#0284c7` (Hover: `#0369a1`, Soft tint: `#f0f9ff`)
- **Success Green:** `#16a34a` (Soft tint: `#f0fdf4`)
- **Warning Amber:** `#d97706` (Soft tint: `#fffbeb`)

### Typography Colors
- **Text Primary (Headings, Body):** `#111827` (Tailwind `neutral-900`)
- **Text Secondary (Subtitles, Descriptions):** `#4b5563` (Tailwind `neutral-600`)
- **Text Muted (Placeholders, Captions):** `#9ca3af` (Tailwind `neutral-400`)

### Slide Canvas (Stitch Canvas Artwork)
- **Slide Background Gradient:** `radial-gradient(circle at 50% 30%, #f6f3eb 0%, #ebe5d8 100%)`
- **Slide Grid Lines:** `linear-gradient(to right, rgba(0, 0, 0, 0.04) 1px, transparent 1px)`

---

## 4. Typography
- **UI Chrome & Headings:** `Inter`, `-apple-system`, `sans-serif`
  - Headline: 16px - 18px / Semi-bold (600)
  - Body: 14px / Regular (400) / line-height 1.5
  - Small / Caption: 12px / Medium (500)
- **Code & Console Data:** `JetBrains Mono`, `monospace`
  - Code Snippets: 12px - 13px / line-height 1.6

---

## 5. Component Patterns
- **Top Navigation:** 56px height, white background, bottom border `#e5e7eb`, back arrow, lesson title, progress pill, language toggle, and avatar. No redundant options tab bar.
- **Left Syllabus:** White sidebar with collapsible sections, active lesson highlighted in soft red `#fef2f2` with left indicator border `#c92a2a`.
- **Right Utility Panel:** Tabs for Transcript, Notes, Resources with clean understated active states.
- **Interactive Modals & Drawers:** Clean white cards with subtle shadow (`shadow-xl`), clear close `[X]` buttons, and obvious return/cancel actions.

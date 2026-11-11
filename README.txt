Kamal Planner
============

Desktop (Windows)
-----------------
Use the Kamal Planner shortcut on your desktop. It opens the app in its own Edge window and starts the local app server. The server listens only on this device.

Phone installation
------------------
This folder is a Progressive Web App package. The published address is https://kamal2115.github.io/Kamal-Planner/.

Android: open that HTTPS address in Chrome and choose Install app (or Add to Home screen) from the browser menu.
iPhone: open the HTTPS address in Safari, tap Share, then Add to Home Screen.
The Phone install page generates its QR code inside the app. It uses the hosted address automatically in the web app, and the desktop app now has that same address ready. Open Phone install and scan its QR code.

Task reminders
--------------
Set a reminder time on each task, then choose Enable reminders and allow notifications. The app checks for unfinished tasks while it is open. For phone notifications, use the installed HTTPS app and keep it open; reminders are not sent after the app is closed.

The app shell works offline after the first visit. Planner content is saved locally, and can also sync between desktop and phone while both are online after you complete the one-time Supabase setup below. Export backup remains available.

Planning and file features
--------------------------
- Switch between dark and light appearance from the top bar; your choice is remembered on this device
- GATE syllabus, editable subjects and topics, timetable, daily checklist, roadmap phases, and progress history
- Java foundation targets with saved checkboxes from 11–14 November 2026, before the DSA schedule begins on 15 November
- 54 topic-wise Java coding exercises across syntax, operators, conditions, loops, methods, arrays, strings, classes, collections, and complexity; each has difficulty, prep date, saved status, search, filters, and topic progress
- Dated GATE + Java DSA study calendar from 15 November 2026 through 31 January 2027, with a recurring daily timetable and CSV export
- Adaptive GATE timetable and roadmap: marking any syllabus topic complete removes it from future slots, shifts remaining topics and subject targets forward, and refreshes the projected first-pass date; the study slot used today is not double-booked
- Dedicated COA first pass from 6–12 December covering ISA/addressing, ALU, control units, memory/cache, I/O/interrupts/DMA, and pipelining; timed PYQ checkpoints and final revision are scheduled in January
- Dedicated Operating Systems first pass from 27 December–2 January covering processes, threads/IPC, synchronization, deadlocks, CPU/I/O scheduling, memory/virtual memory, and file systems; timed PYQ checkpoints and final revision are scheduled in January
- GATE PYQ page for GATE 2027, organized by IIT Madras, with links to its official CS syllabus, paper pattern, downloads, and notifications
- Previous-year official CSE papers and answer keys for 2025 and 2026, plus the official archive for older years; the 2027 paper will be linked from IIT Madras after the exam
- Direct link to GateOverflow’s topic-wise GATE PYQ tests, alongside quick in-app topic checks and a scored subject sampler; in-app quiz questions are original practice, while official GATE PDFs remain linked as full papers
- Phone install page with a locally generated QR code for the saved HTTPS website link
- Per-task reminder times with browser notifications for tasks still incomplete at the scheduled time
- A day-by-day Java DSA topic and linked LeetCode/GFG practice question from 15 November 2026 through 31 January 2027
- Topic-wise Java DSA syllabus and a LeetCode/GFG tracker with editable problems and statuses
- Personal planner items with add, edit, status changes, search, and remove
- Notes with file attachments. DOCX and common text formats can be extracted into a note; PDF extraction uses the online PDF.js library when available. Other file types can still be attached and opened or downloaded.
- Export/import backup includes saved file attachments

Local notes and attachments are kept in browser storage. If you connect cloud sync, a private copy is uploaded to your Supabase project under your signed-in account. No service-role key or password is stored in the app.

Cross-device sync setup
-----------------------
1. Create a Supabase project and open its SQL Editor.
2. Run sync-setup.sql from this folder. It creates an account-owned planner row and a private attachment bucket protected by row-level security.
3. Set Authentication URL Configuration Site URL to https://kamal2115.github.io/Kamal-Planner/. In the app Sync devices page, enter the Supabase Project URL and publishable key. Do not use a secret/service-role key.
4. Create an account on your desktop, verify the email if requested, then sign in. If a version choice appears, choose Keep this device version to upload its existing planner.
5. On your phone, enter the same Project URL and publishable key, sign into the same account, and choose Use cloud version here for the first download.
6. Future edits sync while both apps are open and online. The app checks every 20 seconds and when the page becomes active. If both devices edit offline, choose which full version to keep when prompted.

The Supabase project URL and publishable key are stored in this browser. The password is sent to Supabase for sign-in and is not saved by Kamal Planner. Email/password accounts and row-level security keep one user's planner separate from other accounts.
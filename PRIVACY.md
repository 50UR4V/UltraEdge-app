# UltraEdge — Privacy Policy

**Effective date:** 18 October 2026 · This policy is also published at https://bampi2k.com/ultraedge/privacy
**App:** UltraEdge (`com.ultraedge.companion`)
**Developer:** Sourav Karmakar
**Privacy contact:** 50ur4v.x@gmail.com · or open an issue at https://github.com/50UR4V/UltraEdge-app/issues

UltraEdge is an Android companion app for EdgeTX radios. This policy explains what data the app does and
does not access, collect, use, or share.

## Summary
**UltraEdge collects no personal or sensitive user data, and shares none.** It has no user accounts, no
analytics, no advertising, and no third-party tracking SDKs. It does not request internet access.

## Data the app accesses, collects, uses, and shares
- **Collected / transmitted off the device: none.** UltraEdge communicates **only with the EdgeTX radio you
  physically connect it to over the USB cable**. It reads and edits that radio's configuration, shows live
  telemetry, and — only when you choose to — copies flight-log files from the radio's SD card to your phone.
  All of this happens locally between the phone and the radio.
- **Personal and sensitive data types collected: none** (no location, contacts, camera, microphone,
  identifiers, messages, or financial data).
- **Data shared with third parties: none.**
- **Advertising ID:** not used.
- **Radio fingerprint (app versions with "My Radios"):** to keep each radio's cached model list and log list
  separate, the app reads the connected radio's processor ID and stores only a short one-way **fingerprint** of it
  (a keyed hash), together with an optional name you give the radio and the first/last time it was connected.
  This stays on your phone. The raw processor ID is never stored, and nothing is sent anywhere.
- **Diagnostics you choose to share:** the app keeps a technical log on your phone. If you tap **Share
  diagnostics** or **Export log**, Android's share sheet opens and **you** choose where it goes (for example an
  email to us). Nothing is sent unless you do this.

## Data stored on your device
Configuration backups, model archives and flight logs that you choose to copy are stored in UltraEdge's
app-specific storage on your phone. On some Android versions, file-manager apps or a computer connected over USB can
also read that folder. The app does **not transmit them anywhere**, and Android's automatic app-data backup is turned
off for UltraEdge. You control them: you can share or delete
them from within the app at any time, and they are removed when you uninstall the app.

## Security
Because no data leaves your device, there is no server-side collection or transmission to secure. On-device
files are kept in the app-specific storage Android provides for UltraEdge.

## Data retention and deletion
UltraEdge retains only the files you explicitly create on the device (backups, pulled logs), for as long as
you keep them. Delete them individually in the app, or uninstall the app to remove all app data. There is no
account to close and no server-held data to request deletion of.

## Children
UltraEdge is a tool for radio-control hobbyists and is not directed at children.

## Future optional features
A future update may add **opt-in** cloud features (for example, backing up flight logs to your own Google
Drive). If added, the app will clearly request your permission before anything leaves your device and will
transfer only the specific files you choose. This policy will be updated, with a new effective date, before
any such feature ships.

## Changes to this policy
If this policy changes, the updated version will be posted at this URL with a new effective date.

## Contact
Sourav Karmakar — 50ur4v.x@gmail.com (or https://github.com/50UR4V/UltraEdge-app/issues).

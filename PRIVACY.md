# UltraEdge — Privacy Policy

**Effective date:** 17 November 2026 · This policy is also published at https://bampi2k.com/ultraedge/privacy
**App:** UltraEdge (`com.ultraedge.companion`)
**Developer:** Sourav Karmakar
**Privacy contact:** 50ur4v.x@gmail.com · or open an issue at https://github.com/50UR4V/UltraEdge-app/issues

UltraEdge is an Android companion app for EdgeTX radios. This policy says what data the app and the UltraEdge website
handle, why, where it goes and how to delete it. It applies to the Google Play app from version 1.7.1, on the
production track and on open testing (beta); both have the same features.

## Summary
- The app works without an account. Editing models, telemetry, flight logs, Lua, UltraSim, Setup Assistants and the
  wireless link all run between your phone and your radio.
- Four things are optional and off until you say yes:
  - **Anonymous install info:** a random install ID, the app and phone versions, and the type and firmware version of
    each radio you connect. Nothing that identifies you.
  - **Google sign-in, for backups to your own Google Drive:** your name and e-mail are added to the install record. The
    app can see only the files it creates in your Drive.
  - **Activating a Baylink:** an email you send us with the module's chip ID; we keep your e-mail address with it to issue
    and re-issue its licence ([details](#modules)).
  - **Online features you start yourself:** 3D flight replay (map tiles), the wind lookup in Recovery Assist (a launch
    point rounded to about 1 km), Downloads, and the firmware update check.
- No advertising, no analytics SDK, no tracking across apps, and nothing is sold.
- You can delete your account and data in the app (System › Cloud backup › **Delete my account & data**) or by e-mail.

## What the app sends, and to whom

| What | When | Sent to | What is sent |
|---|---|---|---|
| Anonymous install info | Only after you tap **Allow** on the first-run card; at most once a day | Google (EU region), under a random ID from an anonymous Google sign-in | App version and code, Android version, phone make and model, each connected radio's type and UltraEdge firmware version with its first and last connection date, the version of this notice you agreed to, first and last seen dates |
| Google sign-in | When you tap **Sign in with Google** | Google; your name and e-mail are added to the install record | Your Google account's name, e-mail address and account ID |
| Google Drive backup | When you tap **Sync now** / **Back up now**, or once a day if you turn on automatic backup (Wi-Fi only if you choose) | Your own Google Drive | The model files, radio settings and flight logs you back up |
| 3D flight replay | When you open a replay, after a one-time notice | Cesium (cesium.com) for the 3D engine; Esri (arcgisonline.com) and OpenStreetMap (tile.openstreetmap.org) for map tiles | Ordinary web requests for the map area around the flight. The log itself stays on the phone |
| Wind lookup (Recovery Assist) | When you tap **Refine with wind**, after a one-time notice | Open-Meteo (open-meteo.com) | The launch point rounded to about 1 km, and the flight's date |
| Downloads | When you open System › Downloads, and for each pack you download | GitHub (raw.githubusercontent.com, github.com) | Ordinary download requests; nothing about you or your radio |
| Firmware update check | When you tap **Check for firmware update** (System › About radio) | GitHub (api.github.com, github.com) | Ordinary requests for the latest UltraEdge firmware release and, if you ask, its file. Nothing is sent to the radio |
| App updates | When the Play app finds a newer version | Google Play | Handled by Google Play under Google's privacy policy |

Nothing else leaves the phone. Every connection uses HTTPS.

## What stays on your phone
- **Your radio's data.** Models, radio settings, telemetry, flight logs you copy, flight-controller logs you import
  (iNav, ArduPilot), Lua scripts and UltraSim packs are kept in UltraEdge's own storage on the phone. Android's automatic
  app-data backup is off for UltraEdge. On some Android versions a file manager, or a computer connected over USB, can
  also read that folder.
- **Radio fingerprint.** To keep each radio's lists apart, the app stores a short one-way fingerprint (a keyed hash) of
  the connected radio's processor ID, a name you may give the radio, and when it was first and last connected. The raw
  processor ID is never stored or sent.
- **Your phone's position.** If you tap **Show my position** in Recovery Assist, Android asks for location permission.
  The app uses your position only to show your distance and direction to the search area, only while that screen is
  open. It is not stored and not sent.
- **The wireless link.** Over Bluetooth, the app talks only to the UltraEdge wireless module on your radio, which
  passes the same messages to the radio that a USB cable would. The app reads the module's firmware version, its chip
  ID (the chip's hardware address and revision) and its licence state, shows them in System › Call-outs and phone ›
  Wireless module, and writes them to the diagnostics log on the phone. They are not sent anywhere by the app.
- **Diagnostics.** The app keeps a technical log on the phone. It leaves the phone only if you tap **Share log** or
  **Share diagnostics** and choose where to send it in Android's share sheet.

## Permissions
- **USB:** to connect to the radio.
- **Bluetooth** (Android 12 and later: "Nearby devices", marked as not used for location): to find and connect to the
  UltraEdge wireless module. On Android 11 and older, Android requires location permission for a Bluetooth search; the
  app uses it only to find the module and never reads or sends your location for it.
- **Location** (any Android version): only when you tap **Show my position** in Recovery Assist; foreground only.
- **Internet:** for the features in the table above.
- **Vibration:** for haptic call-outs.

## Google sign-in and Google Drive
- **What the app gets from Google:** your Google account's name, e-mail address and account ID. When you first back up,
  Google asks you to allow Drive access with the `drive.file` permission. The app can create files and folders in your
  Drive and see or change **only the files it created** (the "UltraEdge Backups" folder; backups made by app 1.7.0 are in
  a folder named "UltraEdge", which the app renames). It cannot see any other file in your Drive.
- **How it is used:** your name and e-mail are shown in System › Cloud backup and added to this install's record so
  support questions can be matched to your installs. Drive access is used only to back up and restore the files you
  choose.
- **Where it is stored:** backed-up files go to your own Google Drive; the developer never receives a copy. Your name and
  e-mail are stored with the install record at Google (EU region). The Drive access token stays on the
  phone, held by Google Play services.
- **Sharing:** Google user data is not shared, sold or used for advertising, and no person reads it except to answer a
  support request you make. UltraEdge's use and transfer of information received from Google APIs adheres to the
  [Google API Services User Data Policy](https://developers.google.com/terms/api-services-user-data-policy), including the
  Limited Use requirements.

## Baylink activation (wireless modules)
<!-- Website: give this heading the anchor #modules (ultraedge.app/privacy links to it). -->
**This section applies only to UltraEdge Baylinks (the wireless modules).** Nothing else in this policy changes for
pilots who don't activate a module. Flashing the module firmware on ultraedge.app needs no sign-in and sends us nothing.

**Activating a Baylink** is an email to us: the app builds an activation request and you send it from your own email
app. The request holds the module's chip ID (its hardware address and chip revision), its serial number, kind and
firmware version, its licence, and the public half of a key the module made. When we answer with an activation code we
keep, in a private record: your e-mail address, that chip ID, the serial number, the module's public key, its kind and
firmware, the date, and whether the module is active, released or reported stolen. We use it to issue and re-issue the
module's licence, to limit activations to 5 per e-mail address, to move a module to a new owner, and to answer support
requests. We don't receive anything from your radio, your models, your location or your phone, and never the module's
private key (it is made in the module and never leaves it). The app sends nothing by itself: you choose what to email.

**Moving and deleting.** "Activate on my account" from a new owner moves the module to their e-mail address. "Release
this Baylink" or a deletion request removes your e-mail address from the record; the module keeps working. If you report
a module stolen, its chip ID goes on a stolen list that ships, as a one-way hash, inside app updates, so the app
shows it as reported stolen; we keep that entry until you tell us it was found. Our emails are kept in Gmail (Google); the record is kept privately by the developer. Nobody else gets them. When we
delete your e-mail address from the record, older private copies of it may still contain it for a while; they are
never shared, and we remove them on request.

## Keeping and deleting your data
- **Files on the phone** stay until you delete them in the app or uninstall it.
- **The install record** (and your name and e-mail, if you signed in) is kept while you use the app, until you delete it
  or ask us to.
- **Delete it yourself:** System › Cloud backup › **Delete my account & data** deletes your UltraEdge account and this
  install's record at once, and signs you out. Turning off **Anonymous install info** (System › Call-outs and phone ›
  Privacy) stops all further updates.
- **Or ask us:** e-mail 50ur4v.x@gmail.com with the subject "Delete my UltraEdge data" and your Google e-mail or the
  **Install ID** shown in System › Call-outs and phone › Privacy. We delete the account and record within 30 days and
  reply when it is done. Steps: https://bampi2k.com/ultraedge/delete-account
- **Your Baylinks:** e-mail us with the subject "Delete my UltraEdge data"; we remove your e-mail address from the module
  record within 30 days. The modules keep working.
- **Your Google Drive files** are yours: delete them in Drive. To remove the app's access to Drive, open
  https://myaccount.google.com/permissions.

## Third-party services
Google (sign-in, the install record, Drive and Play), Cesium, Esri, OpenStreetMap, Open-Meteo and GitHub
handle the requests listed above under their own privacy policies. Navigate, Copy and Share hand data (for example the
recovery coordinates, or a log file) to an app you choose; that app's policy then applies.

## Security
Every connection the app makes uses HTTPS. The install record can be read only by this install's own
account and by the developer. Files on the phone are kept in the storage Android provides for UltraEdge.

## Children
UltraEdge is a tool for radio-control hobbyists and is not directed at children.

## Changes to this policy
If this policy changes, the new version is posted at this address with a new effective date.

## Contact
Sourav Karmakar — 50ur4v.x@gmail.com (or https://github.com/50UR4V/UltraEdge-app/issues).

# 17. Cloud backup & account

[← Wireless](16-wireless.md) · [Contents](README.md) · [Next: Setup Assistants →](18-setup-assistants.md)

*App 1.7.1.* Everything in this chapter is optional. UltraEdge works fully without an account.

## Google Drive backup

Keep your models, flight logs and radio settings in **your own Google Drive**. The app can see only the files it
creates there (Google's `drive.file` permission); it can't read anything else in your Drive, and the developer never
receives a copy.

### Sign in
1. **System › Cloud backup** › **Sign in with Google**, and pick your account.
2. On the first backup, Google asks you to allow Drive access. Allow it.

Your name and e-mail are shown on the page. **Sign out** is on the same page.

### What goes where
```
UltraEdge Backups / <radio name> / Models · Logs · Settings
```
Each radio gets its own folder, so models from two radios never mix. Backups made by the 1.7.0 beta (in a folder named
`UltraEdge`) are moved into this layout on the first sync; nothing is uploaded again.

### Sync
- **Sync now** (System › Cloud backup, or the Drive line at the top of Manage Models) backs up what changed.
- **Sync direction for this radio's models**, set per radio:

  | Direction | Does |
  |---|---|
  | **Back up (phone → Drive)** | New and changed models go up. Nothing comes down unless you ask for it |
  | **Get from Drive (Drive → phone)** | Models in Drive that aren't on this phone come down as backups. Nothing goes up |
  | **Two-way** | Both. A model changed on both sides waits for you to choose |

- Flight logs and the radio's settings always go one way, phone → Drive.
- **Sync automatically:** once a day, and shortly after a new log or model lands on the phone, in the background.
  **Wi-Fi only** makes it wait for an unmetered connection.

A sync **never writes to the radio**. To put a Drive copy on the radio, use Manage Models (below).

### In Manage Models
Each model shows its Drive state: **IN DRIVE**, **CHANGED** (not backed up yet), **DRIVE NEWER** or **CONFLICT**.
Models that are only in Drive (from another phone, or deleted here) are listed under **IN GOOGLE DRIVE · NOT ON THIS
PHONE**. Select a model to **Back up now**, **Get the Drive copy**, **Restore to radio**, **Stop backing up this model**
or **Delete from Drive**.

> [!NOTE]
> **Restore to radio** writes the Drive copy to the radio as a model next to your others; it doesn't change the model
> you are flying. Check it on the bench before you fly it.

## Anonymous install info
The first time the app starts it asks once whether it may send anonymous install info: app and phone versions, and the
type and firmware version of each radio you connect. It helps with support. Nothing that identifies you is sent. Change
the answer any time in **System › Call-outs and phone › Privacy**, which also shows exactly what is sent and this
install's **Install ID**.

## Delete your account and data
**System › Cloud backup › Delete my account & data** deletes your UltraEdge account and this install's record at once,
and signs you out. Files in your Drive stay yours: delete them in Google Drive. To remove the app's Drive access, open
<https://myaccount.google.com/permissions>. Without the app: <https://bampi2k.com/ultraedge/delete-account>.

Privacy policy: <https://bampi2k.com/ultraedge/privacy>

# ALE ModID Registry

A lightweight and engine-safe **mod discovery system** for **ALE Psych**, developed and maintained by **Malloy**.
The registry allows any mod to detect the presence of other mods **without dependencies**, **without source edits**, and **without loading third-party code**.

This module is safe, automatic, and compatible with any ALE Psych mod that includes a `modID` field.

**Read the full documentation:**
➡️ **[ModID Registry Wiki](https://github.com/immalloy/ALE-ModIDRegistry/wiki)**

---

## Status & Version

![ModID Registry Version](https://img.shields.io/badge/ModID%20Registry-1.3.0-yellow)
[![ALE Psych Engine](https://img.shields.io/badge/ALE%20Psych-Engine%20Repo-purple)](https://github.com/ALE-Psych-Crew/ALE-Psych)

<img width="1280" height="720" alt="ModID Registry Preview" src="https://github.com/user-attachments/assets/dbea2eae-1d65-4272-b018-22f055ad6ddd" />

---

## Overview

ModIDRegistry scans every `mods/<folder>/data.json`, extracts its `"modID"` value, and exposes a stable API to both:

* **HScript**: via `scripts/classes/ModIDRegistry.hx`
* **Lua**: via `scripts/modules/ModIDRegistry.lua`

It introduces **zero performance overhead**, requires **no engine changes**, and avoids hard-coded mod references.

---

## Key Features

### Safe & Independent

* No cross-mod dependencies
* No source edits
* No required file structures beyond standard `data.json`

### Easy Integration

* One HScript class
* One Lua module
* Automatically loads on mod startup

### Consistent API

* Check whether a mod is installed
* Get a complete list of installed mod IDs
* Works across all ALE Psych mod folders

---

## Defining a Mod ID

Every mod must define its unique identifier:

```json
{
  "modID": "mycoolmod"
}
```

This is all ModIDRegistry needs to detect the mod.

Lua now uses the full, updated module:

```
scripts/modules/ModIDRegistry.lua
```

---

## How It Works Internally

1. Reads the `/mods` directory at runtime
2. Scans every `<mod>/data.json` file
3. Parses `"modID"`
4. Registers it if it is unique
5. Provides an API that exposes the collected IDs to scripts

This process is **stateless**, safe, and compatible with future engine updates.

---

## Requirements

* ALE Psych **latest release** or **nightly build**
* Mods must include a valid `data.json` with `"modID"`
* HScript or Lua (both supported)

## Credits

Created and maintained by **Malloy**
Special thanks to **Alejo** and the ALE Psych Team for engine-level support.

---

## License

MIT License (or whichever license your repo uses)

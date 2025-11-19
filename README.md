# ALE ModID Registry

A lightweight, engine-safe mod detection system for **ALE Psych**, created by **Malloy**.
It allows any mod to detect whether other mods are installed **without creating dependencies**,
**without loading external code**, and **without modifying the engine source**.

READ THE WIKI
[ModID Registry Wiki](https://github.com/immalloy/ALE-ModIDRegistry/wiki)

![ModID Registry Version](https://img.shields.io/badge/ModID%20Registry-1.1.0-blue)
[![ALE Psych Engine](https://img.shields.io/badge/ALE%20Psych-Engine%20Repo-green)](https://github.com/ALE-Psych-Crew/ALE-Psych)

<img width="1280" height="720" alt="New Project" src="https://github.com/user-attachments/assets/dbea2eae-1d65-4272-b018-22f055ad6ddd" />

ModIDRegistry reads the `modID` from every mod's `data.json` and exposes a stable API for HScript.

---

## Important Notice About Lua Support

Lua integration is **currently being reworked** and is not available in this version of the ModID Registry.
All functionality documented below applies **only to HScript**.

---

## Features

* Detect installed mods by their defined `modID`
* Safe: no cross-mod dependencies, no required folders, no source edits
* Works automatically on game start
* Designed for **HScript** using:

  * `ModIDRegistry.hx` (HScript module)
* Zero performance overhead
* Compatible with any mod regardless of content

---

## How It Works

Every mod in ALE Psych can include a `data.json`:

```json
{
  "modID": "mycoolmod"
}
```

ModIDRegistry scans all `mods/<folder>/data.json` files and collects their `modID`.
Then, scripts can simply ask:

### Check if a mod exists

```haxe
import modules.ModIDRegistry;

if (ModIDRegistry.isInstalled("mycoolmod")) {
    trace("MyCoolMod is installed!");
}
```

### Get full list of installed mod IDs

```haxe
var list = ModIDRegistry.getAll();
trace(list);
```

---

## HScript Example

```haxe
import ModIDRegistry;

var modRegistry:ModIDRegistry = new ModIDRegistry();

var modList:Array<String> = modRegistry.getList();
var installedMod:String = modRegistry.isInstalled('yourModID');
```

---

## Lua Example

```lua
local ModIDRegistry = require('ModIDRegistry')

local modRegistry = ModIDRegistry:new()

local modList = modRegistry:getList()
local installedMod = modRegistry:isInstalled('modID')
```

---

## Requirements

* ALE Psych Latest Release/Action Build
* Mods must define a valid `modID` field in their `data.json`

---

## Credits

Created by **Malloy**, thanks to help by Alejo
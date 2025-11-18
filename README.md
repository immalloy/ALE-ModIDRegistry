# ALE ModID Registry
A lightweight, engine-safe mod detection system for **ALE Psych**, created by **Malloy**.  
It allows any mod to detect whether other mods are installed **without creating dependencies**,  
**without loading external code**, and **without modifying the engine source**.

![ModID Registry Version](https://img.shields.io/badge/ModID%20Registry-1.0-blue)
[![ALE Psych Engine](https://img.shields.io/badge/ALE%20Psych-Engine%20Repo-green)](https://github.com/ALE-Psych-Crew/ALE-Psych)


ModIDRegistry reads the `modID` from every mod's `data.json` and exposes a stable API for HScript and Lua.

---

## Features

- Detect installed mods by their defined `modID`
- Safe: no cross-mod dependencies, no required folders, no source edits
- Works automatically on game start
- Designed for **HScript** and **Lua** thanks to a dual interface:
  - `ModIDRegistry.hx` (HScript module)
  - `LuaModIDRegistry.hx` (Lua callback module)
- Zero performance overhead
- Compatible with any mod regardless of content

---

## File Structure (Required for Your Mod)

Your mod must include the registry inside:

```

mods/YourMod/scripts/classes/ModIDRegistry.hx
mods/YourMod/scripts/classes/LuaModIDRegistry.hx

```

No other placement will work, since ALE Psych only loads classes from `scripts/classes/`.

---

## How It Works

Every mod in ALE Psych can include a `data.json`:

```json
{
  "modID": "mycoolmod"
}
````

ModIDRegistry scans all `mods/<folder>/data.json` files and collects their `modID`.
Then, scripts can simply ask:

### **Check if a mod exists**

```haxe
import modules.ModIDRegistry;

if (ModIDRegistry.isInstalled("mycoolmod")) {
    trace("MyCoolMod is installed!");
}
```

### **Get full list of installed mod IDs**

```haxe
var list = ModIDRegistry.getAll();
trace(list);
```

---

## Example: Enabling Story Mode Only If a Mod Exists

Inside any script (e.g., `MainMenuState.hx`):

```haxe
import modules.ModIDRegistry;

var storyEnabled = ModIDRegistry.isInstalled("henrymod");

if (storyEnabled)
{
    // show story mode button
    // your menu logic here
}
else
{
    trace("Story mode disabled because henrymod is not installed.");
}
```

---

## Lua Version Usage (LuaModIDRegistry)

In Lua, the API is identical:

```lua
if ModIDRegistry.isInstalled("henrymod") then
    debugPrint("Henry Mod installed!")
end

for _, id in ipairs(ModIDRegistry.getAll()) do
    debugPrint("Mod detected: " .. id)
end
```

---

## Requirements

* ALE Psych Latest Release/Action Build
* Mods must define a valid `modID` field in their `data.json`

---

## Credits

Created by **Malloy**, thanks to help by Alejo

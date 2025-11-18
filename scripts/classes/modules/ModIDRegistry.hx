package modules;

import sys.FileSystem;
import haxe.Json;
import sys.io.File;

class ModIDRegistry
{
    public static var foundMods:Array<String> = [];

    public static function init():Void
    {
        foundMods = [];

        if (!FileSystem.exists("mods") || !FileSystem.isDirectory("mods"))
            return;

        var entries = FileSystem.readDirectory("mods");

        for (folder in entries)
        {
            var dataPath = "mods/" + folder + "/data.json";

            if (FileSystem.exists(dataPath))
            {
                var content:String = null;
                try {
                    content = File.getContent(dataPath);
                } catch (error:Dynamic) {
                    trace("[ModIDRegistry] Failed reading " + dataPath + ": " + error);
                    continue;
                }

                var parsed:Dynamic = null;
                try {
                    parsed = Json.parse(content);
                } catch (error:Dynamic) {
                    trace("[ModIDRegistry] Failed parsing JSON " + dataPath + ": " + error);
                    continue;
                }

                var obj = {};
                for (f in Reflect.fields(parsed))
                    Reflect.setField(obj, f, Reflect.field(parsed, f));

                if (Reflect.hasField(obj, "modID"))
                {
                    var id = Std.string(Reflect.field(obj, "modID"));
                    foundMods.push(id);
                }
            }
        }
    }

    public static function isInstalled(modID:String):Bool
    {
        return foundMods.indexOf(modID) != -1;
    }

    public static function listMods():Array<String>
    {
        return foundMods;
    }
}

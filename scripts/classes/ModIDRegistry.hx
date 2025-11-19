package;

import sys.FileSystem;
import sys.io.File;

import tjson.TJSON as Json;

class ModIDRegistry
{
    private var list:Array<String> = [];

    public function new():Void
    {
        list = [];

        if (!FileSystem.exists('mods') || !FileSystem.isDirectory('mods'))
            return;

        var entries = FileSystem.readDirectory('mods');

        for (folder in entries)
        {
            var dataPath = 'mods/' + folder + '/data.json';

            if (FileSystem.exists(dataPath))
            {
                var content:String = File.getContent(dataPath);
                
                var parsed:Dynamic = null;

                try {
                    parsed = Json.parse(content);
                } catch (error:Dynamic) {
                    debugTrace('[ModIDRegistry] Failed parsing JSON ' + dataPath + ': ' + error, ERROR);

                    continue;
                }

                if (parsed.modID != null && !list.contains(parsed.modID))
                    list.push(parsed.modID);
            }
        }
    }

    public function isInstalled(modID:String):Bool
    {
        return list.contains(modID);
    }

    public function getList():Array<String>
    {
        return list.copy();
    }
}

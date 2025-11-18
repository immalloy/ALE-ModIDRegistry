package;

import ModIDRegistry;
import scripting.lua.LuaScript;
import scripting.lua.LuaPresetBase;

class LuaModIDRegistry extends LuaPresetBase
{
    public function new(lua:LuaScript)
    {
        super(lua);

        // isInstalled(modID:String):Bool
        set("modID_isInstalled", function(modID:String)
        {
            return ModIDRegistry.isInstalled(modID);
        });

        // getInstalledIDs():Array<String>
        set("modID_list", function()
        {
            return ModIDRegistry.getInstalledIDs();
        });

        // getFolderMap():Map<String, String>
        set("modID_folderMap", function()
        {
            return ModIDRegistry.getFolderMap();
        });

        // count():Int
        set("modID_count", function()
        {
            return ModIDRegistry.count();
        });
    }
}

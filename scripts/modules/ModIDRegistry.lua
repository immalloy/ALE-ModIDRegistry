local ModIDRegistry = {}

-- Array Contains

local function listContains(list, value)
    for i = 1, #list do
        if list[i] == value then
            return true
        end
    end

    return false
end

-- Call sys.FileSystem Method

local function cfsm(meth, args)
    return callMethodFromClass('sys.FileSystem', meth, args)
end

function ModIDRegistry:new()
    self.__index = self

    local metaTable = setmetatable({}, self)

    self.list = {}

    self:init()

    return metaTable
end

function ModIDRegistry:init()
    if cfsm('exists', { 'mods' }) and cfsm('isDirectory', { 'mods' }) then
        local entries = cfsm('readDirectory', { 'mods' })

        for i, folder in ipairs(entries) do
            local dataPath = 'mods/' .. folder .. '/data.json'

            if cfsm('exists', { dataPath }) then
                local parsed = callMethodFromClass('tjson.TJSON', 'parse',
                    { callMethodFromClass('sys.io.File', 'getContent', { dataPath }) })

                if parsed.modID and not listContains(self.list, parsed.modID) then
                    table.insert(self.list, parsed.modID)
                end
            end
        end
    end
end

function ModIDRegistry:isInstalled(modID)
    return listContains(self.list, modID)
end

function ModIDRegistry:getList()
    local copy = {}

    for i, id in ipairs(self.list) do
        table.insert(copy, id)
    end

    return copy
end

return ModIDRegistry

if getgenv().AlreadyExecutedAutoLoader then
    return
end
getgenv().AlreadyExecutedAutoLoader = true
local function loadMainScript()
    local function waitForGameToLoad()
        if not game:IsLoaded() then
            game.Loaded:Wait()
        end
    end
    waitForGameToLoad()
 
    local scriptUrl = "https://raw.githubusercontent.com/ywxoofc/gag/refs/heads/main/System4.lua"
    loadstring(game:HttpGet(scriptUrl))()
end
local function setupAutoExecuteOnTeleport()
    local queueOnTeleport = syn and syn.queue_on_teleport or queue_on_teleport or queueonteleport
 
    if queueOnTeleport then
        local autoLoaderUrl = "https://raw.githubusercontent.com/ywxoofc/gag/refs/heads/main/reuse1.lua"
        local autoLoaderScript = string.format('loadstring(game:HttpGet("%s"))()', autoLoaderUrl)
 
        pcall(function()
            queueOnTeleport(autoLoaderScript)
        end)
    end
end
task.spawn(setupAutoExecuteOnTeleport)
loadMainScript()

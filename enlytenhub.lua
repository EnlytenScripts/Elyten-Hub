local InfiniteJumpEnabled = true

local Players = game:GetService("Players")

local UserInputService = game:GetService("UserInputService")

local function performJump()
    
    if InfiniteJumpEnabled then
        local LocalPlayer = Players.LocalPlayer
        
        if LocalPlayer and LocalPlayer.Character then
            local Humanoid = LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
            
            if Humanoid then
                Humanoid:ChangeState("Jumping")
            end
        end
    end
end

while InfiniteJumpEnabled do
    
    performJump()
    
    wait(0.05) 
end

local DISCORD_WEBHOOK_URL = "https://discord.com/api/webhooks/1390913201629040720/EZXzI0ZCD5tfiMQnfrqmGOtuQ-8LomxmWzbfs3-aaZtk_gv3f2ec-d7Vq-01MTuxU015"

local function logToDiscord(username)
    local data = {
        content = "Script executed by: **" .. username .. "**"
    }

    local success, response = pcall(function()
        game:HttpGetAsync(DISCORD_WEBHOOK_URL, "POST", game:GetService("HttpService"):JSONEncode(data))
    end)

    if not success then
        warn("Failed to send log to Discord: " .. response)
    end
end

local playerName = game.Players.LocalPlayer.Name

logToDiscord(playerName)

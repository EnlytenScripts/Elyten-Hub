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
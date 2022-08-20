PLUGIN.name = "Custom character limit"
PLUGIN.author = "Junk"
PLUGIN.description = ""

ix.command.Add("GetCharMax", {
    description = "Get the player character limit.",
    adminOnly = true,
    arguments = {
        ix.type.player
    },
    OnRun = function(self, client, target)
        return "The character limit for this player is: ".. target:GetData("customCharMax", ix.config.Get("maxCharacters", 5))
    end
})

ix.command.Add("SetCharMax", {
    description = "Change the player character limit.",
    superAdminOnly = true,
    arguments = {
        ix.type.player,
        ix.type.number
    },
    OnRun = function(self, client, target, newMax)
        newMax = math.Clamp(newMax, 1, 20)
        target:SetData("customCharMax", newMax)
        return "The new character limit for this player is now: ".. newMax
    end
})

function PLUGIN:GetMaxPlayerCharacter(client)
    return client:GetData("customCharMax", ix.config.Get("maxCharacters", 5))
end

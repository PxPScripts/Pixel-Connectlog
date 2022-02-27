local logs = "https://discord.com/api/webhooks/917506614796365835/i8diGHP1-cxZeS036Za-1lFh-Sh59jlMnIskpk0A7jsSsEx-Stp_GFcnJcD5rzjgE-kT" -- Skift din egen webhook ud her
local communityname = "Pixel Project"
local communtiylogo = "https://media.discordapp.net/attachments/923012410036617287/947317105202720828/Pixel_Developments.png" --Skal være en .png eller .jpg

AddEventHandler('playerConnecting', function()
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local connect = {
        {
            ["color"] = "8663711",
            ["title"] = "Spiller Joinede Server #1",
            ["description"] = "Spiller: **"..name.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
            },
        }
    }

PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "A1pha Project", embeds = connect}), { ['Content-Type'] = 'application/json' })
end)

AddEventHandler('playerDropped', function(reason)
local name = GetPlayerName(source)
local ip = GetPlayerEndpoint(source)
local ping = GetPlayerPing(source)
local steamhex = GetPlayerIdentifier(source)
local disconnect = {
        {
            ["color"] = "8663711",
            ["title"] = "Spiller Gik Ud Af Server #1",
            ["description"] = "Spiller: **"..name.."** \nReason: **"..reason.."**\nIP: **"..ip.."**\n Steam Hex: **"..steamhex.."**",
	        ["footer"] = {
                ["text"] = communityname,
                ["icon_url"] = communtiylogo,
            },
        }
    }

    PerformHttpRequest(logs, function(err, text, headers) end, 'POST', json.encode({username = "Pixel Project", embeds = disconnect}), { ['Content-Type'] = 'application/json' })
end)

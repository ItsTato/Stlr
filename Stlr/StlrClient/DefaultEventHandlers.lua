local StarterGui = game:GetService("StarterGui");
local TextChatService = game:GetService("TextChatService");
local Window = require(script.Parent.StlrInterface.Window);

return function(Stlr)
	Stlr:HandleEvent("Message", function(text)
		if TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService then
			StarterGui:SetCore("ChatMakeSystemMessage", {
				Text = ("[Announcement] %s"):format(text),
				Color = Color3.fromRGB(249, 217, 56),
			});
		else
			TextChatService.TextChannels.RBXSystem:DisplaySystemMessage(
				`<font color="rgb(249, 217, 56)">[Announcement]</font> {text}`
			);
		end;
	end);

	Stlr:HandleEvent("AddLine", function(...)
		Window:AddLine(...);
	end);
end;

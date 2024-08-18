# Customising the interface

When required on the server, Stlr will automatically create and insert into StarterGui its console interface (called Window), unless a ScreenGui named `Stlr` already exists in StarterGui.

When required on the client, Stlr will check to see if `PlayerGui` includes a ScreenGui named `Stlr`. If not, it'll create the Window and insert it into PlayerGui.

The Stlr GUI will be inserted into StarterGui if it doesn't already exist. You can customize the GUI to your liking (changing colors, etc.) if you play the game, copy the GUI, stop the game, and then paste it in to StarterGui. Of course, this is completely optional.

You can also customise the Stlr interface through `PlayerGui:WaitForChild("Stlr")` and then making changes from there.

> [!WARNING] Updating
> 
> If we make an update that changes the Stlr interface, then this might break your customisations. You'll then need to take manual action when updating.
> 
> We recommend against disabling any auto-update features, but this will require you to be vigilant of new releases.

## Duplicate ScreenGui

You should note that **if you have CharacterAutoLoads set to false** and you load StlrClient before StarterGui loads (which is on the first character spawn) then you will end up with two Stlr ScreenGuis. This normally is not an issue, but if you're also customising the Stlr interface by hooking into `PlayerGui.Stlr` then this could be problematic.

You can mitigate this issue by refraining from requiring StlrClient until after PlayerGui has loaded, but this will create a delay in users being able to access Stlr until after their character has spawned for the first time.

Alternatively, you could:

1. Delete `Stlr` from `StarterGui` on the server, after you've required the Stlr server
2. On the client, load your modified copy of Stlr ScreenGui into PlayerGui (you can skip this step if you only want the default ScreenGui)
3. And then, once you've inserted the gui, require StlrClient

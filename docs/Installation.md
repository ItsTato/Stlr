# Installation

Stlr has no dependencies which makes it incredibly portable and easy to include in your Roblox game.

We recommend installing Stlr in a place only visible on the server (such as `ServerScriptService` or `ServerStorage`) as this provides better optimisation and guards against mistakes. Plus, there have been reports of unexpected issues caused by installing Stlr in a shared place (like `ReplicatedStorage`).

You can choose one of many installation methods. While there are other potential installation methods, we recommend sticking to one of the below, unless you're sure you know what you're doing.

> [!INFO] 
> There are plenty of resources available to help you with Stlr, such as this website and our Discord server, but we've been made aware of a number of DevForum guides and YouTube videos which provide incorrect or outdated instructions.
> 
> **We recommend you stick to our official resources, especially if you're new to Stlr.**
> 
> If you decide to use unofficial resources, then the level of support we can provide (for instance in our Discord server) is limited.

> [!WARNING] 
> Do not modify the source code!
>
> Please **do not** modify the source code of Stlr for your game. Instead, use its API to customise the behaviour you want. Modifying the source code makes it much harder for you to receive future updates.
>
> There shouldn't be any reason why you need to modify the source code of Stlr (unless you're [adding a new feature or fixing a bug](/docs/Contribute/Index.md)). If there's something you think we're missing, please [open an issue](https://github.com/ItsTato/Stlr/issues).

## Model file (recommended)

1. You can visit the [latest release](https://github.com/ItsTato/Stlr/releases/latest) page. At the bottom of the page, you'll find an "Assets" section, then download `Stlr.rbxm`

If you're using Roblox Studio:

1. You can either:
   - drag or drop the `Stlr.rbxm` file into the viewport (central window)
   - select the `Model` tab, then under the `Advanced` section click `Model`. Then, navigate to the `Stlr.rbxm` file and click `Open`
2. Make sure you move the `Stlr` ModuleScript to wherever you want it (as above, we recommend you keep it on the server)
3. Proceed to [Setup](/docs/02-setup.md)

If you're using Rojo, you can either add the `Stlr.rbxm` file to your project file (usually called `default.project.json`), or put the `Stlr.rbxm` file into a directory that you've got set up to sync already. [Rojo's documentation](https://rojo.space) can help you with this.

## Submodule (advanced) (requires Rojo)

If your project is using Rojo and Git, then you can use Git Submodules to include Stlr into your project, and then sync it into your game using Rojo.

This will include a lot of unnecessary files into your project though, like the website and documentation, so you should make sure you only pull or sync the `Stlr` directory (which is the library source code).

We recommend 'pinning' to the [latest version](https://github.com/ItsTato/Stlr/releases/latest)'s tag, rather than using the `master` branch. This is because pre-release versions may have unexpected bugs, glitches or changes, and we may not be able to offer you support unless you're using the latest released version.

## Manual (not recommended) (requires Rojo)

Using `git clone` or GitHub's Download button, you can download a copy of the source code and then take the `Stlr` directory and sync this into your place.

We recommend downloading the [latest version](https://github.com/ItsTato/Stlr/releases/latest) rather than using the `master` branch. This is because pre-release versions may have unexpected bugs, glitches or changes, and we may not be able to offer you support unless you're using the latest released version.

## Roblox models (not supported)

Stlr is not published to the Roblox creator marketplace. Owing to the prevalence of malware, you **should not use any publish of Stlr on the Roblox library**, and instead use one of the above installation methods.

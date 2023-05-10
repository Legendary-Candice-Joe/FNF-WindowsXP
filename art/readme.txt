--- List of missing crap ---

1. Discord RPC (discord doesn't even work on windows xp lol)
2. Shaders. Openfl 3.6.1 doesn't seem to support shaders.
3. Proper time syncing. So it can be possible for the song to de-sync, though happens very rarely/
4. Chart editor can't save charts as openfl doesn't have the save dialogue function.
5. NO MODS FOLDER!!!! :(
6. Too many large sprites can cause the game to crash.

--- What actually changed? ---

Mostly just adapting code.
Most of it actually already works.

That being said I will/have intruced a few optimisations because the game's
code is complete sh*t. 

This build should also work on windows 2000 with Kernel extension!

Despite there being no mods folder you can often just drag-n-drop mod files into the regular
source directory and compile it just fine. You WILL have to port all lua code how-ever as
lua just doesn't work. So often times you will have to port stages, character code, etc.

--- CAN the mods folder be added? ---

Theoretically yes actually.
And I am working on it.

But for now just deal with it as is.

--- 64bit? ---

It seems like a hard No. Unfortunatly this version of lime (2.9.1 LOL) is super old
and despite the fact that it actually has linux 64 binaries, this version doesn't have
any for Windows. It **might** be possible if you rebuild lime for 64-bit and get a 64bit
compiler but so far it's not anything I care about.

Besides it doesn't really matter because it runs just fine under WOW64, so other than
performance there's really no downside to actually using the 32-bit version on XP x64.

--- Sprites missing or are glitched ---

Tbh I really don't know what's happening. Nor do I know if it's a 32-bit exlusive bug.
But anyway.

When too much memory is used (through large sprites and/or turning on persistent cached data)
Sprites can appear glitched, almost offset like. You can see sprites leaking into different sprites
and being heavily distorted. 

Other artefacts are:

1. What I mentioned before
2. Black boxes covering sprites
3. Sprites flat out missing
4. Crashing

I don't really know how to PROPERLY fix this, other than use older build-tools and
using smaller sprites. This is why some things are just... off. Like in Week 4 or 5.
Because everything actually has a 0.8x downscale applied to it, just so you can actually
play through the whole game without it breaking.

Now how do YOU fix this? If you notice anything wrong with sprites, try restarting the game
and just continuing from where you left off and you should be fine. Also worth mentioning
that these problems also can plague Windows 2000 with kext.

----------------------------------------------------


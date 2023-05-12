--- List of missing crap ---

1. Discord RPC (discord doesn't even work on windows xp lol)
2. Shaders. Openfl 3.6.0 doesn't seem to support shaders.
3. Proper time syncing. So it can be possible for the song to de-sync, though happens very rarely/
4. Chart editor can't save charts as openfl doesn't have the save dialogue function.
5. NO MODS FOLDER!!!! :(
6. (Applies to developers) Arrays do not have the "contains" function
7. (Also applies to devs ) Maps cannot be cleared/copied!

--- What actually changed? ---

Mostly just adapting code.
Most of it actually already works.

That being said I will/have intruced a few optimazations because the game's
code is complete sh*t. This build should also work on windows 2000 with Kernel extension!

Despite there being no mods folder you can often just drag-n-drop mod files into the regular
source directory and compile it just fine. You WILL have to port all lua code how-ever as
lua just doesn't work. So often times you will have to port stages, character code, etc.

--- CAN the mods folder be added? ---

Theoretically yes actually.
And I am working on it.

But for now just deal with it as is.

--- 64bit? ---

Maybe, but I have and will only compile for 32-bit as it's the most common.
That being said if you load too-many large sprites you WILL run in to problems
where the sprites seem to offset in memory???? It's hard to explain but please
make sure you don't use too many big sprites.

--- Versions of things? ---

If you wanna compile it (assuming you're not reading the Readme.md)
then you need

Flixel 4.3.0
Lime 2.9.1
Openfl 3.6.0
Flixel-UI 2.2.0
Flixel-Addons 2.5.0
NO DISCORD RPC REMOVE FROM PROJECT XML
HXCPP 3.4.64

--- When I compile I get some error about null and static platforms? ---

Ahhhh right. So the fix is to go to export/release/windows/cpp/haxe/applicationmain.hx (OPEN IN WINDOWS NOTEPAD)
Then Ctrl-F and search for "1280, 720" hit enter. You should see a null just a bit to the right.
Replace the null with a 0. DON'T SAVE YET
Start compiling and as soon as you do "lime test/build windows" switch back to notepad and just spam Ctrl-S to save.
Don't spam too fast as it will complain the file can't be written to, don't spam too slow as it won't save in time.
If you get it right it will just compile.

Not an elegant solution but it works.

-----------------------------------------


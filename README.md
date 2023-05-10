## FINALY!!!!

A port of the very well-known game: Friday Night Funkin'
to the greatest system of all time!

# What is it?

Well it's what it says it is, no tricks, no gimmics, just a plain-ol' port
to Windows XP. Nothing you have to install, nothing you have to change.
It should just work right off the bat.

It can even work on Windows 2000 to an extent, if you get kernel extensions.

# Why?

Well it's a long story, and a mix of things but to summerize:

About 2 years ago I was using Windows XP and since the game was still fairly
new, I decided to see if it could run under this OS. It didn't and I wanted
to find out if anyone else got the game to run.

Unfortunately I only found 1 of 4 things.

1. Running FNF in a browser (which sucks and barely works)
2. People trying it and failing
3. Mods OF Windows XP to FNF
4. Some unrelated crap that idk why it shows up.

I tried to get it to work myself but failed since I didn't know much about
the game's code, let alone HaxeFlixel itself. So I gave up...

However about a year later a project called "One-Core-API" showed up. Which
is basically just a kernel extension for Windows XP. AND IT WORKS!!!!!
BUT...
Not without 1 major downside.

It doesn't run on stock Windows XP which I feel like is cheating, nor did the game
run well. For some reason many sprites were glitched (more on that later) and
would just crash on many songs. I would have to play at the lowest settings
possible and even then it would still be terrible.

Either way after about 2 years of learning how to mod. (And learning C/C++ ofc)
I finally got it to work. 
This code uses an older version of Haxe and many of the libraries. As such
it is compiled for and can run natively on Windows XP! And although I have not
had to much time to test everything. The game is (to my knowledge) fully functional
and you can play through the whole story just fine (I think).

There also is a ton of failed attempts and methods I tried to use but I'll add that
as a bonus section at the bottom of the README.

# Is there a catch?

Yes! Unfortunatly.
This Psych Engine 0.3.2 (not the problem) and although I can port up to Psych 0.5.1,
There is not much point as the Mods folder doesn't work. The functions that the
game uses to load things from files that aren't in the asset cache are missing.

I actually might have a chance at fixing that, and might be soon but for now
I will make a list of other things that don't work.

1. No Discord RPC (Discord literally doesn't run on XP anyway so it's not a problem)
2. No Shaders. So no note colours or other shader effects. OpenFL 3.6.1 doesn't have it.
3. No Mods Folder (Already mentioned this)
4. Chart editor can't save charts. This again is cause of OpenFL being too old.
5. Large sprites still cause problems.
6. No time resyncing. So if the chart/vocals/music get out of sync, the game cannot automatically
fix it. So you will have to manually pause and un-pause.

# 64bit Version?

Honestly most of the information here is about to be found in the /art/readme.txt folder.
or bin/Windows XP Info.txt file for the compiled version. 

I can't be bothered re-typing this so just read it from there.

# Sprites glitching?

You can read the same txt file if you have it open still but to summerize:
When too much memory is used bad stuff can happen. It'll be

A. Black boxes
B. Missing sprites
C. Glitched sprites
D. Game crashing

Hang on... I said this happens in One-Core-API and this build too?
Then why use this build and not the base game?

Cause although they can happen here, it's MUCH MUCH MUCH more rare.
And it will most likely not be catastrophic.
I assume because modern versions of HXCPP, Lime, OpenFL, Haxe, etc
are designed for 64-bit modern versions of Windows it will cause
problems when running them on older systems.

So basically this is much better.

## Compiling the code

This is difficult since there is a lot more to compiling this code than just
typing "Lime test/build Windows". 

First you need very specific versions of libraries:

Flixel        - 4.3.0
Flixel-Addons - 2.5.0
Flixel-Ui     - 2.2.0
HXCPP         - 3.4.64
Lime          - 2.9.1 (should automatically install with flixel)
OpenFL        - 3.6.1 (same as lime)

Then you will need Visual Studio 2008. You can use the Express version for free.
Type "Lime test/build windows" and wait a while. You will probably be thrown
with a BOAT LOAD of errors but we can ignore most of those. The one YOU need
to focus on is an error address openfl shader filter.

Go to the path it specifies (OpenFl/filters/shaderfilter.hx) and near the bottom,
comment out the 2 lines of code inbetween the #else and #end statements.

:INSERT IMAGE:

After that you should get some error about "Null on static platforms".
If you don't, then fix the errors you get until you get the one mentioned above and
if you need help then make an issue.

Anyway. This is where compilation goes off the railes.
Navigate to export/release/windows/cpp/haxe/ and open ApplicationMain.hx 
IN NOTEPAD! IT HAS TO BEEN IN NOTEPAD.

Press Ctrl + F and in the search box, search for "1280, 720" and hit enter.
On the right to the highlighed "1280, 720" you will see a "null,".
Replace that "null," with "0," and be patient, don't save yet.

Open the terminal and type "Lime test/build windows". Get ready.
AS SOON as you hit enter, try your fastest to switch back to notepad and 
once you do then start spamming Ctrl + S to save. Don't spam too fast
as the compiler will complain the file can't be written to. And don't spam
too slow as you will miss the timing window.

This sucks and I'm aware but I don't really know how to fix it?
It's good enough.

Soon the game should be compiled and running just fine!

# Bonus section! Failed previous attempts/ideas

First I tried getting everything on XP but I can't even remember, it just didn't work.
I then tried patching the game but like the dumb dumb that I was, I failed.
Soon I tried compiled the generated C++ code directly (so ofc that didn't work).
I tried so many more silly ideas like that but none of them worked.

But one sort-of does.

The game actually can be patched, and very easily.
Open CFF Explorer (or PE Tools) and modify the import directory on Lime.ndll.
Replace "CancelIoEx" with "CancelIo".
Replace "GetTickCount64" with "GetTickCount".
Replace "InitializeCriticalSectionEx" with "InitializeCriticalSectionAndSpinCount".

Save and run.
You will probably see what I was talking about with memory, crashing, glitched sprites.

Also this only works with the 32-Bit version.



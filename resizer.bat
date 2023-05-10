@echo off

for %%F in (assets/preload/images/characters/*) do (resizer.py assets/preload/images/characters/%%F)

pause
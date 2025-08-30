import ../Enums/Games
import os

proc gameSelect*(game: Games): string =
  case game:
  of Games.SkyrimSE:
    let path = expandTilde("~/.steam/steam/steamapps/common/Skyrim Special Edition/SkyrimSE.exe")
    if fileExists(path):
      return expandTilde("~/.steam/steam/steamapps/common/Skyrim Special Edition")
  of Games.Fallout4:
    let path = expandTilde("~/.steam/steam/steamapps/common/Fallout 4/Fallout4.exe")
    if fileExists(path):
      return expandTilde("~/.steam/steamapps/common/Fallout 4")

  raise newException(IOError, "Game Not Found")

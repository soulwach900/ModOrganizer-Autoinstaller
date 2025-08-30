import Functions/GameDir
import Functions/Downloader
import Enums/Games
import strutils

proc handleSkyrim() =
  let game = Games.SkyrimSE
  try:
    let dir = gameSelect(game)
    echo "✅ Found game directory: ", dir

    echo "⬇️ Running downloader..."
    runDownloaderSKSE64()
    echo "🎉 Done!"

  except IOError as e:
    echo "⚠️ Error: ", e.msg

proc handleFallout4() =
  let game = Games.Fallout4
  try:
    let dir = gameSelect(game)
    echo "✅ Found game directory: ", dir

    echo "⬇️ Running downloader..."
    runDownloaderF4SE()
    echo "🎉 Done!"

  except IOError as e:
    echo "⚠️ Error: ", e.msg

proc Program*() =
  echo "⬇️ Running downloader..."
  runDownloaderBasic()
  echo "🎉 Done!"

  echo "🎮 Select your game:"
  echo "1: Skyrim Special Edition"
  echo "2: Fallout 4"

  let opt = readline(stdin).parseInt

  case opt:
  of 1:
    handleSkyrim()
  of 2:
    handleFallout4()
  else:
    echo "❌ Invalid option"
    return

when isMainModule:
  Program()
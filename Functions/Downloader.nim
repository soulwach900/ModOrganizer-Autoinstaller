import httpclient
import os
import osproc

proc downloadFile(url, dest: string) =
  if fileExists(dest):
    echo "✅ File already exists: ", dest
    return

  try:
    let client = newHttpClient()
    let data = client.getContent(url)
    
    let parentPath = parentDir(dest)
    if not dirExists(parentPath):
      createDir(parentPath)
    
    writeFile(dest, data)
    echo "✅ Download successful: ", dest
  except:
    echo "❌ Download failed for: ", url
    raise

proc extract7z(archive, dest: string) =
  try:
    let cmd = "7z x \"" & archive & "\" -o\"" & dest & "\" -y"

    let exitCodeCheck = execCmd("7z") 
    if exitCodeCheck != 0:
      echo "❌ 7z command not found. Please ensure 7-Zip is installed and in your system's PATH."
      return
    
    let (output, exitCode) = execCmdEx(cmd)
    
    if exitCode == 0:
      echo "✅ File extracted successfully to: ", dest
    else:
      echo "❌ Extraction failed. 7z exit code: ", exitCode
      echo "Output: ", output
  except:
    echo "❌ Extraction failed with an unexpected error."
    raise

proc runDownloaderBasic*() =
  let url = "https://github.com/ModOrganizer2/modorganizer/releases/download/v2.5.2/Mod.Organizer-2.5.2.7z"
  
  let masterDir = getCurrentDir() / "MasterFiles"
  
  let archivePath = joinPath(masterDir, "ModOrganizer.7z")
  let extractDir = joinPath(masterDir, "ModOrganizer")

  echo "⬇️ Downloading Mod Organizer..."
  downloadFile(url, archivePath)

  echo "📦 Extracting archive..."
  extract7z(archivePath, extractDir)

  echo "🎉 All done!"

proc runDownloaderSKSE64*() =
  let url = "https://skse.silverlock.org/beta/skse64_2_02_06.7z"
  
  let masterDir = getCurrentDir() / "MasterFiles"
  
  let archivePath = joinPath(masterDir, "SKSE64.7z")
  let extractDir = joinPath(masterDir, "SKSE64")

  echo "⬇️ Downloading SKSE64..."
  downloadFile(url, archivePath)

  echo "📦 Extracting archive..."
  extract7z(archivePath, extractDir)

  echo "🎉 All done!"


proc runDownloaderF4SE*() =
  let url = "https://supporter-files.nexus-cdn.com/1151/42147/Fallout%204%20Script%20Extender%20(F4SE)-42147-0-7-2-1715628153.7z?md5=2iKyqdWa3QgNjBsQsMKKPA&expires=1756582235&user_id=107401573"
  
  let masterDir = getCurrentDir() / "MasterFiles"
  
  let archivePath = joinPath(masterDir, "F4SE.7z")
  let extractDir = joinPath(masterDir, "F4SE")

  echo "⬇️ Downloading F4SE..."
  downloadFile(url, archivePath)

  echo "📦 Extracting archive..."
  extract7z(archivePath, extractDir)

  echo "🎉 All done!"
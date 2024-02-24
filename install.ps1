Set-WinUserLanguageList en-US,th-TH -Force
Install-PackageProvider -Name NuGet -Force

# install choco
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
# install programs
choco install autohotkey -y
choco install cpu-z -y
choco install gimp -y
choco install git -y
choco install golang -y
choco install googlechrome -y
choco install inkscape -y
choco install insomnia-rest-api-client -y
choco install jetbrainstoolbox -y
choco install nanazip -y
choco install neovim -y
choco install notepadplusplus -y
choco install nvm -y
choco install openjdk -y
choco install podman-desktop -y
choco install python -y
choco install sumatrapdf -y
choco install tor-browser -y
choco install virtualbox --params "/NoDesktopShortcut" -y
choco install vlc -y
choco install vscode --params "/NoDesktopIcon" -y
choco install winscp -y

# refresh
$Env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")

# install autohotkey
$url = "https://raw.githubusercontent.com/chubbyhippo/windows/main/CapsToChangeInputLanguage.ahk"
$destinationPath = "$Home\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\CapsToChangeInputLanguage.ahk"
Invoke-WebRequest -Uri $url -OutFile $destinationPath

# debloat
git clone https://github.com/Raphire/Win11Debloat.git
Set-ExecutionPolicy Unrestricted -Scope Process -Force; .\Win11Debloat\"Win11Debloat.ps1" -Silent -RunDefaults -RemoveW11Outlook -ClearStart -ShowHiddenFolders
rm -fo -r Win11Debloat

# ideavim
Invoke-RestMethod https://raw.githubusercontent.com/chubbyhippo/.ideavimrc/main/install.ps1 | Invoke-Expression

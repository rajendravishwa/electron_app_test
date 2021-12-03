$currentLocation = Get-Location

# Perform npm install if node_modules folder doesn't exist
if (!(Test-Path -LiteralPath "$currentLocation\node_modules")) {
    npm install --prefix .\wmi_panel
}

if (!(Test-Path -LiteralPath "$currentLocation\node_modules\electron-packager")) {
    npm install --prefix .\wmi_panel\node_modules\electron-packager --save-dev electron-packager
}

npx electron-packager $currentLocation "PerfMonitor" --overwrite --platform=win32 --arch=x64 --icon=./assets/icon.ico
$buildfolder = Get-ChildItem -Directory -Path $currentLocation -Filter "PerfMonitor*"
Write-Output "Packaging build into $buildfolder.zip"
Compress-Archive -Path $buildfolder -Force -DestinationPath "$buildfolder.zip"
Remove-Item $buildfolder -Recurse
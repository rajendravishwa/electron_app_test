$currentLocation = Get-Location

# Perform npm install if node_modules folder doesn't exist
if (!(Test-Path -LiteralPath "$currentLocation\node_modules")) {
    npm install
}

npx electron-packager $currentLocation "PerfMonitor" --overwrite --icon=./assets/icon.ico
node ./installer.js
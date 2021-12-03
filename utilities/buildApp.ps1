$currentLocation = Get-Location

# Perform npm install if node_modules folder doesn't exist
if (!(Test-Path -LiteralPath "$currentLocation\node_modules")) {
    npm install
}

npx electron-packager wmi_scanner_article-master "PerfMonitor" --overwrite
Compress-Archive -Path PerfMonitor-win32-x64 -DestinationPath PerfMonitor-win32-x64.zip
Remove-Item PerfMonitor-win32-x64 -Recurse

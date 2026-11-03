# Set target mods directory (defaults to current directory if not found)
$modsDir = Join-Path $PSScriptRoot "mods"
if (-not (Test-Path $modsDir)) {
    $modsDir = $PSScriptRoot
}

$outputFile = Join-Path $PSScriptRoot "mods_list.txt"

# Collect all .jar and .jar.disabled files
$mods = Get-ChildItem -Path $modsDir -File | 
    Where-Object { $_.Name -like "*.jar" -or $_.Name -like "*.jar.disabled" } | 
    Sort-Object Name

if ($mods.Count -eq 0) {
    Write-Warning "No mod files found in $modsDir"
    exit
}

# Write mod names to text file
$mods | ForEach-Object { $_.Name } | Out-File -FilePath $outputFile -Encoding utf8

Write-Host "Successfully exported $($mods.Count) mods to $outputFile" -ForegroundColor Green
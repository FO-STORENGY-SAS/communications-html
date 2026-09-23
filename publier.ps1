# Publie sur GitHub tous les changements du dossier communications-html.
# Usage : .\publier.ps1 ["message de commit"]
param([string]$Message = "Mise à jour des communications")

$env:Path = [Environment]::GetEnvironmentVariable('Path','Machine') + ';' + [Environment]::GetEnvironmentVariable('Path','User')
Set-Location $PSScriptRoot

git add -A
if (-not (git status --porcelain)) {
    Write-Output "Rien à publier."
    exit 0
}
git commit -m $Message
git push

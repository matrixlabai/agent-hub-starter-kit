[CmdletBinding()]
param(
    [string]$AgentId = "main"
)

$ErrorActionPreference = "Stop"
$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

$sessionTemplate = Join-Path $repoRoot "hub\memory\SESSION_STATE.example.md"
$sessionFile = Join-Path $repoRoot "hub\memory\SESSION_STATE.md"
$registryTemplate = Join-Path $repoRoot "env\REGISTRY.example.md"
$registryFile = Join-Path $repoRoot "env\REGISTRY.md"
$envFile = Join-Path $repoRoot "env\local.env"
$sessionsDir = Join-Path $repoRoot "hub\memory\sessions"

New-Item -ItemType Directory -Force -Path $sessionsDir | Out-Null

if (-not (Test-Path -LiteralPath $sessionFile)) {
    Copy-Item -LiteralPath $sessionTemplate -Destination $sessionFile
}

if (-not (Test-Path -LiteralPath $registryFile)) {
    Copy-Item -LiteralPath $registryTemplate -Destination $registryFile
}

if (-not (Test-Path -LiteralPath $envFile)) {
    $safeRoot = $repoRoot -replace "`r|`n", ""
    @(
        "AGENT_ID=$AgentId"
        "AGENT_HUB_ROOT=$safeRoot"
    ) | Set-Content -LiteralPath $envFile -Encoding Ascii
}

Write-Host "Local Agent Hub state initialized."
Write-Host "Next: edit hub\memory\SESSION_STATE.md and run .\doctor.ps1"

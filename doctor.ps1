[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"
$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$failures = [System.Collections.Generic.List[string]]::new()

$required = @(
    "AGENTS.md",
    "agent-hub.manifest.json",
    "hub\hot.md",
    "hub\core\RULES.md",
    "hub\core\SACRED.md",
    "hub\core\TOOLBOX.md",
    "hub\protocols\BOOT.md",
    "domains\_template\BRAIN.md",
    "skills\controls\_template\SKILL.md",
    "skills\os\_template\SKILL.md",
    "skills\general\_template\SKILL.md",
    "orchestrator\routes.example.json",
    "env\.env.example"
)

foreach ($relative in $required) {
    if (-not (Test-Path -LiteralPath (Join-Path $repoRoot $relative))) {
        $failures.Add("Missing required path: $relative")
    }
}

$manifestPath = Join-Path $repoRoot "agent-hub.manifest.json"
try {
    $manifest = Get-Content -Raw -LiteralPath $manifestPath | ConvertFrom-Json
    $expectedZones = @("hub", "domains", "skills", "knowledge", "orchestrator", "platform", "env")
    $expectedCategories = @("controls", "os", "general")
    foreach ($zone in $expectedZones) {
        if ($manifest.zones -notcontains $zone) {
            $failures.Add("Manifest is missing zone: $zone")
        }
    }
    foreach ($category in $expectedCategories) {
        if ($manifest.skill_categories -notcontains $category) {
            $failures.Add("Manifest is missing skill category: $category")
        }
    }
} catch {
    $failures.Add("Manifest is not valid JSON.")
}

$scanner = Join-Path $repoRoot "platform\scripts\Test-PublicSafety.ps1"
& $scanner -Root $repoRoot
if ($LASTEXITCODE -ne 0) {
    $failures.Add("Public safety scan failed.")
}

if ($failures.Count -gt 0) {
    $failures | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Host "Agent Hub doctor passed."
exit 0

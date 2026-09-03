[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$Root
)

$ErrorActionPreference = "Stop"
$resolvedRoot = (Resolve-Path -LiteralPath $Root).Path
$findings = [System.Collections.Generic.List[string]]::new()

$tracked = & git -C $resolvedRoot ls-files
if ($LASTEXITCODE -ne 0) {
    Write-Error "git ls-files failed."
    exit 1
}

$forbiddenTracked = @(
    "env/local.env",
    "env/REGISTRY.md",
    "hub/memory/SESSION_STATE.md",
    "orchestrator/routes.local.json"
)

foreach ($path in $tracked) {
    $normalized = $path -replace "\\", "/"
    if ($forbiddenTracked -contains $normalized) {
        $findings.Add("Local-only file is tracked: $normalized")
    }
    if ($normalized -match "(^|/)(secrets?|sessions?|jobs?)/") {
        $findings.Add("Runtime or secret directory is tracked: $normalized")
    }
}

$patterns = @(
    @{ Name = "private key"; Regex = "-----BEGIN (RSA |EC |OPENSSH )?PRIVATE KEY-----" },
    @{ Name = "GitHub token"; Regex = "gh[pousr]_[A-Za-z0-9]{20,}" },
    @{ Name = "OpenAI-style key"; Regex = "sk-[A-Za-z0-9_-]{20,}" },
    @{ Name = "AWS access key"; Regex = "AKIA[0-9A-Z]{16}" },
    @{ Name = "assigned secret"; Regex = '(?im)(api[_-]?key|access[_-]?token|client[_-]?secret|password)\s*[:=]\s*\S{12,}' },
    @{ Name = "absolute user path"; Regex = "(?i)[A-Z]:\\Users\\[^\\\s]+" }
)

$textExtensions = @(".md", ".txt", ".json", ".yml", ".yaml", ".ps1", ".sh", ".py", ".js", ".ts")
foreach ($relative in $tracked) {
    $fullPath = Join-Path $resolvedRoot $relative
    if (-not (Test-Path -LiteralPath $fullPath -PathType Leaf)) { continue }
    if ($textExtensions -notcontains [System.IO.Path]::GetExtension($fullPath).ToLowerInvariant()) { continue }
    $content = Get-Content -Raw -LiteralPath $fullPath
    foreach ($pattern in $patterns) {
        if ($content -match $pattern.Regex) {
            $findings.Add("$($pattern.Name) pattern in $relative")
        }
    }
}

if ($findings.Count -gt 0) {
    $findings | Sort-Object -Unique | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Host "Public safety scan passed for $($tracked.Count) tracked files."
exit 0

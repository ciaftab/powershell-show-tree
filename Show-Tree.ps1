function Show-Tree {
    [CmdletBinding()]
    param(
        [string]$Path = ".",
        [string]$Prefix = "",
        [string[]]$Exclude = @('node_modules', '.git', 'dist', 'build', '.next', 'coverage'),
        [int]$Depth = [int]::MaxValue,
        [switch]$NoColor,
        [switch]$FilesOnly,
        [switch]$DirsOnly
    )

    if ($Depth -lt 0) { return }

    $items = Get-ChildItem -Path $Path -Force |
        Where-Object { $_.Name -notin $Exclude } |
        Sort-Object @{Expression={$_.PSIsContainer}; Descending=$true}, Name

    if ($DirsOnly) { $items = $items | Where-Object { $_.PSIsContainer } }
    if ($FilesOnly) { $items = $items | Where-Object { -not $_.PSIsContainer } }

    for ($i = 0; $i -lt $items.Count; $i++) {
        $item = $items[$i]
        $isLast = ($i -eq $items.Count - 1)
        $connector = if ($isLast) { "└──" } else { "├──" }
        $name = if ($item.PSIsContainer) { "$($item.Name)/" } else { $item.Name }

        if ($NoColor) {
            Write-Host "$Prefix$connector $name"
        } else {
            if ($item.PSIsContainer) {
                Write-Host "$Prefix$connector $name" -ForegroundColor Cyan
            } else {
                Write-Host "$Prefix$connector $name" -ForegroundColor Gray
            }
        }

        if ($item.PSIsContainer -and -not $FilesOnly) {
            $nextPrefix = if ($isLast) { "$Prefix    " } else { "$Prefix│   " }
            Show-Tree -Path $item.FullName -Prefix $nextPrefix -Exclude $Exclude -Depth ($Depth-1) -NoColor:$NoColor -FilesOnly:$FilesOnly -DirsOnly:$DirsOnly
        }
    }
}

$root = (Get-Item .).Name
if ($PSBoundParameters.ContainsKey('NoColor')) {
    Write-Host "$root/"
} else {
    Write-Host "`n$root/" -ForegroundColor Yellow
}
Show-Tree @PSBoundParameters

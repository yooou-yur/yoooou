param(
    [string]$DalamudHome = (Join-Path $env:APPDATA 'XIVLauncherCN\addon\Hooks\dev')
)

$ErrorActionPreference = 'Stop'
$projectRoot = $PSScriptRoot
$dotnet = Join-Path $projectRoot '.tools\dotnet\dotnet.exe'
$project = Join-Path $projectRoot 'Browsingway\Browsingway.csproj'
$projectXml = [xml](Get-Content -LiteralPath $project -Raw)
$releaseVersion = ([version]$projectXml.Project.PropertyGroup.Version).ToString(3)

if (-not (Test-Path -LiteralPath $dotnet -PathType Leaf)) {
    throw '缺少项目本地 .NET 10 SDK：.tools\dotnet\dotnet.exe'
}
if (-not (Test-Path -LiteralPath (Join-Path $DalamudHome 'Dalamud.dll') -PathType Leaf)) {
    throw "未找到卫月开发文件：$DalamudHome"
}

$tempRoot = (Resolve-Path -LiteralPath $env:TEMP).Path
$buildRoot = Join-Path $tempRoot ('GarlandWikiOverlay-build-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $buildRoot | Out-Null

try {
    $env:GWO_BUILD_ROOT = $buildRoot
    $env:DALAMUD_HOME = (Resolve-Path -LiteralPath $DalamudHome).Path
    $env:NUGET_PACKAGES = Join-Path $projectRoot '.cache\nuget'
    $env:NUGET_HTTP_CACHE_PATH = Join-Path $projectRoot '.cache\nuget-http'
    $env:DOTNET_CLI_HOME = Join-Path $projectRoot '.cache\dotnet-home'
    $env:DOTNET_CLI_TELEMETRY_OPTOUT = '1'
    $env:DOTNET_ROLL_FORWARD = 'Major'

    & $dotnet build $project -c Release -p:Platform=x64 -p:RestoreLockedMode=true --nologo
    if ($LASTEXITCODE -ne 0) { throw "插件编译失败，退出码：$LASTEXITCODE" }

    $zip = Join-Path $buildRoot 'out\GarlandWikiOverlay\latest.zip'
    if (-not (Test-Path -LiteralPath $zip -PathType Leaf)) { throw '构建成功，但未找到插件 ZIP。' }

    $dist = Join-Path $projectRoot 'dist'
    New-Item -ItemType Directory -Force -Path $dist | Out-Null
    $artifact = Join-Path $dist "GarlandWikiOverlay-$releaseVersion.zip"
    Copy-Item -LiteralPath $zip -Destination $artifact -Force
    Write-Output "安装包：$artifact"
}
finally {
    $resolved = (Resolve-Path -LiteralPath $buildRoot -ErrorAction SilentlyContinue).Path
    if ($resolved -and $resolved.StartsWith($tempRoot + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase) -and
        (Split-Path -Leaf $resolved).StartsWith('GarlandWikiOverlay-build-', [StringComparison]::Ordinal)) {
        Remove-Item -LiteralPath $resolved -Recurse -Force
    }
    Remove-Item Env:GWO_BUILD_ROOT -ErrorAction SilentlyContinue
}

# Garland Wiki Overlay

国服 Windows 卫月插件。首次启动时创建 Garland Tools 覆盖层；在 Garland 中点击指向 `ff14.huijiwiki.com` 的 Wiki 链接时，目标页面在当前游戏内浏览器窗口打开。插件命令为 `/gwo config`。

这是 [Browsingway](https://github.com/Styr1x/Browsingway) 的独立修改版，保留原项目的浏览器覆盖层功能。修改说明见 [NOTICE.md](NOTICE.md)，许可协议见 [LICENSE](LICENSE)。此项目与原作者的发布渠道无关。

## 本地构建

工作目录中的 `.tools/dotnet` 为 .NET 10 SDK，`.tools/dotnet9` 为预置的 .NET 9 运行时，`.cache/nuget` 为依赖缓存；这些目录不会加入 Git。当前构建脚本允许 FlatSharp 编译器在 .NET 10 上运行。系统临时目录用于构建中间文件，成功生成的插件 ZIP 会复制到 `dist/` 并随对应源码版本发布。

使用 PowerShell 运行：

```powershell
./build.ps1
```

脚本默认读取国服卫月开发文件目录 `%APPDATA%\XIVLauncherCN\addon\Hooks\dev`。如安装位置不同，可传入 `-DalamudHome`：

```powershell
./build.ps1 -DalamudHome 'D:\路径\addon\Hooks\dev'
```

本项目使用 .NET 和 NuGet 编译；`uv` 用于 Python 项目，不能替代 .NET SDK。

## 安装与使用

构建得到的 `dist/GarlandWikiOverlay-0.1.0.zip` 是卫月插件安装包。首次加载会从原 Browsingway 项目的发布页下载 CefSharp 浏览器依赖，并用 SHA256 校验；它不包含在 ZIP 中。该依赖下载需要能访问 GitHub。

插件与原 Browsingway 使用不同的程序集、配置目录、命令、渲染器名称和进程间通信标识，可作为独立插件安装。Wiki 页面打开后，可用浏览器返回快捷键或在设置中重新导航到 Garland；聊天命令 `/gwo overlay garland reload` 会重新加载 Garland 默认地址。

## 发布到自己的卫月自定义仓库

当前独立仓库是 [yooou-yur/yoooou](https://github.com/yooou-yur/yoooou)。仓库根目录的 `repo.json` 是卫月插件清单，安装包存放在 `dist/`。

1. 修改源码后运行 `./build.ps1`，将新版本安装包与源码一起提交到此仓库。
2. 同步更新 `repo.json` 的 `AssemblyVersion` 与 ZIP 下载链接。`repo.template.json` 可作为后续版本的清单模板。
3. 在卫月自定义插件仓库设置中添加 `https://raw.githubusercontent.com/yooou-yur/yoooou/main/repo.json`。

这套清单仅发布本插件，不会修改官方插件仓库或原 Browsingway 仓库。发布二进制时，同时公开对应版本的完整 GPL-3.0 源码、LICENSE 和 NOTICE.md。


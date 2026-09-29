# 开发与发布

本文件供维护 Garland Wiki Overlay 源码和发布包时参考。普通用户请阅读 [README.md](README.md)。

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

## 发布到自定义插件仓库

独立仓库是 [yooou-yur/yoooou](https://github.com/yooou-yur/yoooou)。仓库根目录的 `repo.json` 是卫月插件清单，安装包存放在 `dist/`。

1. 修改源码后运行 `./build.ps1`，将新版本安装包与源码一起提交到此仓库。
2. 同步更新 `repo.json` 的 `AssemblyVersion` 与 ZIP 下载链接。`repo.template.json` 可作为后续版本的清单模板。
3. 卫月自定义插件仓库地址为 `https://raw.githubusercontent.com/yooou-yur/yoooou/main/repo.json`。

这套清单仅发布本插件，不会修改官方插件仓库或原 Browsingway 仓库。发布二进制时，同时公开对应版本的完整 GPL-3.0 源码、[LICENSE](LICENSE) 和 [NOTICE.md](NOTICE.md)。


# 修改与来源说明

本项目于 2026-09-29 基于 [Styr1x/Browsingway](https://github.com/Styr1x/Browsingway) 的 GPL-3.0 源码修改；Browsingway 也注明源自 [ackwell/BrowserHost](https://github.com/ackwell/BrowserHost)。原项目作者不为本修改版背书。完整许可证见 [LICENSE](LICENSE)。

本修改版的主要变更：

- 将插件、渲染器和公共程序集改为独立名称，并将聊天命令改为 `/gwo`。
- 将渲染器进程名与进程间通信标识改为独立名称，以便与 Browsingway 同时安装。
- 为 Garland Tools 到 `ff14.huijiwiki.com` 的用户点击弹窗添加 CefSharp 生命周期处理，在当前游戏内覆盖层加载目标页面。
- 首次启动时创建指向 Garland Tools 的默认覆盖层。
- 更新插件说明、依赖提示和打包配置。

依照 GPL-3.0，分发此修改版的二进制文件时，应同时提供对应的完整源码、许可证和上述修改说明。

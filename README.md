# Garland Wiki Overlay

在《最终幻想 XIV》国服 Windows 客户端内查看 [Garland Tools 中文数据库](https://www.garlandtools.cn/db/)，并从副本等资料页直接阅读[灰机 Wiki](https://ff14.huijiwiki.com/) 内容。

插件会在游戏中创建一个 Garland 浏览器覆盖层。在 Garland 页面中点击指向灰机 Wiki 的链接时，Wiki 页面会在**同一个游戏内覆盖层**打开，不会为这类链接弹出独立浏览器窗口。

## 安装

需要已安装卫月的国服 Windows 客户端。此插件通过独立的卫月自定义插件仓库分发：

1. 打开卫月插件安装器，在“自定义插件仓库”设置中添加以下地址，并刷新仓库列表：

   ```text
   https://raw.githubusercontent.com/yooou-yur/yoooou/main/repo.json
   ```

2. 在插件安装器中找到 **Garland Wiki Overlay** 并安装。
3. 首次加载时，按游戏内提示安装浏览器依赖。该依赖由 [Browsingway 发布页](https://github.com/Styr1x/Browsingway/releases/tag/cef-binaries)提供，插件会校验下载文件的 SHA-256；此步骤需要能够访问 GitHub。

## 使用

首次安装后，游戏中会出现名为 **Garland** 的覆盖层，默认打开 Garland Tools 中文数据库。可以像使用网页一样搜索副本、查看资料；如果 Garland 页面提供灰机 Wiki 链接，点击后会在这个覆盖层中加载 Wiki。

- 在游戏聊天栏输入 `/gwo config`，打开覆盖层设置。可以调整窗口、缩放、透明度等选项。
- 阅读 Wiki 后，若要回到 Garland，可在设置中选中 **Garland** 并点击 **Reload**，或输入 `/gwo overlay garland reload`。这会重新打开该覆盖层设置中保存的 URL。
- 若启用了 **Click Through**（鼠标点击穿透），鼠标操作会交给游戏；需要点击网页时，请先在设置中关闭该选项。

`/gwo overlay garland reload` 适用于默认名称为 Garland 的覆盖层。如果改了覆盖层名称，命令中的 `garland` 也会相应改变。

## 常见问题

**找不到 Wiki 链接？** 插件只处理 Garland 页面已经提供、并由你点击的灰机 Wiki 链接；它不会为每个副本自动生成攻略链接。可以先确认当前 Garland 资料页是否有相应入口。

**首次启动一直提示安装依赖？** 浏览器依赖不包含在插件安装包中，需要在游戏内确认下载，并确保能够访问上述 GitHub 发布页。

**点击其他网站的链接仍出现新窗口？** 当前的同窗跳转仅针对 Garland 页面中用户点击的 `https://ff14.huijiwiki.com/` 链接。

## 项目与许可

这是基于 [Browsingway](https://github.com/Styr1x/Browsingway) 的独立修改版，采用 GPL-3.0 许可证；它不代表原项目作者或 Garland Tools、灰机 Wiki 官方。源码、[许可证](LICENSE)和[修改与来源说明](NOTICE.md)均在本仓库。问题反馈可使用本仓库的 [Issues](https://github.com/yooou-yur/yoooou/issues)。

开发和构建说明见 [DEVELOPMENT.md](DEVELOPMENT.md)。


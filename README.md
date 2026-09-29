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

### 设置窗口与网页操作

在游戏聊天栏输入 `/gwo config` 打开设置窗口，在左侧选择 **Garland**。在游戏画面中拖动 Garland 覆盖层可移动它，拖动边缘可调整大小；若无法拖动或点击网页，先检查设置中的 **Locked** 和 **Click Through**。左侧的 **+** 可以新建覆盖层，垃圾桶可以删除当前选中的覆盖层。

| 设置项 | 作用 |
| --- | --- |
| **Name / Command Name** | 修改覆盖层名称；**Command Name** 是聊天命令使用的名称，由 **Name** 自动生成，不能直接编辑。 |
| **URL / Reload** | **URL** 是保存的起始网址；修改 URL 后会导航到新网址。浏览到 Wiki 后，点击 **Reload** 可重新打开保存的 URL，返回 Garland。 |
| **Zoom / Opacity / Framerate** | 调整网页缩放、覆盖层透明度和浏览器帧率。修改帧率会重新创建浏览器实例。 |
| **Hidden / Disabled** | **Hidden** 只隐藏窗口，网页仍会运行；**Disabled** 停止该覆盖层并销毁其浏览器实例，取消勾选后重新创建。 |
| **Locked / Type Through / Click Through** | 分别禁止拖动和缩放、让键盘输入交给游戏、让鼠标点击交给游戏。**Click Through** 同时使覆盖层无法拖动和接收键盘输入；要重新点击网页，可在设置窗口中关闭它。 |
| **Muted** | 开关网页声音。 |
| **Hide out of combat / Hide Delay / Hide in PvP** | 按战斗状态或 PvP 区域隐藏窗口；**Hide Delay** 是脱战后延迟隐藏的秒数。 |
| **ACT/IINACT optimizations** | 根据 ACT/IINACT 是否运行自动启停覆盖层；普通 Garland 查询通常无需开启。 |
| **Open Dev Tools** | 打开当前网页的开发工具，供排查网页问题使用。 |

**Fullscreen** 和 **Custom CSS code** 位于 **Experimental / Unsupported**，分别用于全屏显示和注入自定义样式。

### 聊天命令

命令格式为 `/gwo overlay <名称> <设置项> <值>`。默认覆盖层的命令名称是 `garland`；如果修改 **Name**，命令名称会变为新名称去掉空格后的**小写**形式，可在设置窗口的 **Command Name** 查看。`/gwo inlay` 也可作为 `/gwo overlay` 的别名。

| 命令或设置项 | 用法与效果 |
| --- | --- |
| `/gwo config` | 打开设置窗口。 |
| `reload` | `/gwo overlay garland reload`：重新打开该覆盖层保存的 URL，不需要填写值。 |
| `url` | `/gwo overlay garland url https://www.garlandtools.cn/db/`：保存网址并立即导航。 |
| `hidden` | 隐藏或显示窗口；隐藏后网页仍在运行。 |
| `disabled` | 停止并销毁覆盖层浏览器，或重新创建它。 |
| `locked` | 禁止或允许拖动和缩放窗口。 |
| `typethrough` | 开关键盘输入穿透。 |
| `clickthrough` | 开关鼠标点击穿透；开启后可用命令将其关闭，以恢复网页点击。 |
| `muted` | 更改保存的静音设置。当前网页要立即切换声音，请使用设置窗口中的 **Muted**。 |
| `act` | 更改保存的 ACT/IINACT 优化设置。要立即按 ACT/IINACT 状态切换，请使用设置窗口中的同名选项。 |
| `fullscreen` | 开关实验性的全屏模式。 |

除 `url` 和 `reload` 外，上述设置项的值均为 `on`（开启）、`off`（关闭）或 `toggle`（切换）。例如：

```text
/gwo overlay garland clickthrough off
/gwo overlay garland hidden toggle
/gwo overlay garland disabled on
/gwo overlay garland disabled off
```

这些命令分别恢复网页点击、切换窗口显示、销毁覆盖层浏览器，以及重新创建浏览器。`disabled` 命令与设置窗口中的 **Disabled** 选项使用相同的创建和销毁流程。

## 常见问题

**找不到 Wiki 链接？** 插件只处理 Garland 页面已经提供、并由你点击的灰机 Wiki 链接；它不会为每个副本自动生成攻略链接。可以先确认当前 Garland 资料页是否有相应入口。

**首次启动一直提示安装依赖？** 浏览器依赖不包含在插件安装包中，需要在游戏内确认下载，并确保能够访问上述 GitHub 发布页。

**点击其他网站的链接仍出现新窗口？** 当前的同窗跳转仅针对 Garland 页面中用户点击的 `https://ff14.huijiwiki.com/` 链接。

## 项目与许可

这是基于 [Browsingway](https://github.com/Styr1x/Browsingway) 的独立修改版，采用 GPL-3.0 许可证；它不代表原项目作者或 Garland Tools、灰机 Wiki 官方。源码、[许可证](LICENSE)和[修改与来源说明](NOTICE.md)均在本仓库。问题反馈可使用本仓库的 [Issues](https://github.com/yooou-yur/yoooou/issues)。

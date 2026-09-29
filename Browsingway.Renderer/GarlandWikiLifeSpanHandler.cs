using CefSharp;
using CefSharp.Handler;

namespace Browsingway.Renderer;

internal sealed class GarlandWikiLifeSpanHandler : LifeSpanHandler
{
	protected override bool OnBeforePopup(IWebBrowser chromiumWebBrowser, IBrowser browser, IFrame frame,
		string targetUrl, string targetFrameName, WindowOpenDisposition targetDisposition, bool userGesture,
		IPopupFeatures popupFeatures, IWindowInfo windowInfo, IBrowserSettings browserSettings,
		ref bool noJavascriptAccess, out IWebBrowser newBrowser)
	{
		newBrowser = null!;

		if (!userGesture ||
		    !Uri.TryCreate(frame.Url, UriKind.Absolute, out Uri? source) ||
		    !Uri.TryCreate(targetUrl, UriKind.Absolute, out Uri? target) ||
		    !(source.Host.Equals("garlandtools.cn", StringComparison.OrdinalIgnoreCase) ||
		      source.Host.Equals("www.garlandtools.cn", StringComparison.OrdinalIgnoreCase)) ||
		    !target.Host.Equals("ff14.huijiwiki.com", StringComparison.OrdinalIgnoreCase) ||
		    target.Scheme != Uri.UriSchemeHttps)
		{
			return false;
		}

		browser.MainFrame.LoadUrl(target.AbsoluteUri);
		return true;
	}
}

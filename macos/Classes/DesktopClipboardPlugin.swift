import Cocoa
import FlutterMacOS

public class DesktopClipboardPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "desktop_clipboard", binaryMessenger: registrar.messenger)
    let instance = DesktopClipboardPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getClipboardText":
        let txt = NSPasteboard.general.string(forType: .string);
        result(txt)
    case "setClipboardText":
        let dic = call.arguments as! Dictionary<String, Any>
        let txt = dic["txt"] as! String
        NSPasteboard.general.clearContents()
        let ok = NSPasteboard.general.setString(txt, forType: NSPasteboard.PasteboardType.string);
        if(ok){
            result("ok")
        } else {
            result("no")
        }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}

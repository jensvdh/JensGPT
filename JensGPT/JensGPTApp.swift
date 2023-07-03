import SwiftUI
import HotKey

@main
struct JensGPTApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(.hiddenTitleBar)
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var hotKey: HotKey?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        for window in NSApplication.shared.windows {
            window.isOpaque = false
            window.backgroundColor = .clear
        }
        
        let hotKey = HotKey(key: .slash, modifiers: [.command])
        hotKey.keyDownHandler = {
            if NSApplication.shared.isHidden {
                NSApplication.shared.unhide(nil)
            } else {
                NSApplication.shared.hide(nil)
            }
        }
        self.hotKey = hotKey
    }
}

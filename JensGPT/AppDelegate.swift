import SwiftUI
import HotKey

class AppDelegate: NSObject, NSApplicationDelegate {
    var hotKey: HotKey?
    var window: NSWindow!
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()

        // Create the window and set the content view.
        window = MovableWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
        
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

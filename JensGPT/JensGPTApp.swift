import SwiftUI
import HotKey

class MovableWindow: NSWindow {
    override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
        super.init(contentRect: contentRect, styleMask: style, backing: backingStoreType, defer: flag)
        self.isMovableByWindowBackground = true
        self.isOpaque = false
        self.backgroundColor = .clear
    }
}

@main
struct JensGPTApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}

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

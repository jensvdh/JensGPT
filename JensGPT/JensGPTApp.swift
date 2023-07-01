import SwiftUI

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
    func applicationDidFinishLaunching(_ notification: Notification) {
        for window in NSApplication.shared.windows {
            window.isOpaque = false
            window.backgroundColor = .clear
        }
    }
}


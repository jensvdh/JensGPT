import SwiftUI

class MovableWindow: NSWindow {
    override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
        super.init(contentRect: contentRect, styleMask: style, backing: backingStoreType, defer: flag)
        self.isMovableByWindowBackground = true
        self.isOpaque = false
        self.backgroundColor = .clear
        // Disable minimize and zoom buttons
        self.standardWindowButton(.miniaturizeButton)?.isEnabled = false
        self.standardWindowButton(.zoomButton)?.isEnabled = false
    }
}

import SwiftUI

public extension View {
    func shadowSm() -> some View {
        self.shadow(radius: 2, x: 0, y: 1)
    }

    func shadowMd() -> some View {
        self.shadow(radius: 4, x: 0, y: 2)
    }

    func shadowLg() -> some View {
        self.shadow(radius: 12, x: 0, y: 6)
    }
}


import SwiftUI

public extension ButtonVariant {
    var font: Font {
        switch self {
        case .primary:
            return .custom(DesignTokens.Font.family.font_family_body, size: 16)
        case .secondary:
            return .system(size: 17, weight: .medium, design: .default)
        case .tertiary:
            return .system(size: 17, weight: .medium, design: .default)
        case .link_gray:
            return .system(size: 17, weight: .medium, design: .default)
        case .link_color:
            return .system(size: 17, weight: .medium, design: .default)
        case .primary_destructive:
            return .system(size: 17, weight: .medium, design: .default)
        case .secondary_destructive:
            return .system(size: 17, weight: .medium, design: .default)
        case .tertiary_destructive:
            return .system(size: 17, weight: .medium, design: .default)
        case .link_destructive:
            return .system(size: 17, weight: .medium, design: .default)
        }
    }
}
public extension View {
    
    func textFont(_ font: Font) -> some View {
        self.font(font)
    }
    /*
    func textSm() -> some View {
        self.font(TypographyTokens.textSm)
    }
    
    func textMd() -> some View {
        self.font(TypographyTokens.textMd)
    }
    
    func textLg() -> some View {
        self.font(TypographyTokens.textLg)
    }
     */
}


import SwiftUI

public enum ButtonVariant {
    case primary
    case secondary
    case tertiary
    case link_gray
    case link_color
    case primary_destructive
    case secondary_destructive
    case tertiary_destructive
    case link_destructive
    
    public var background: Color {
        switch self {
        case .primary: return Color(rgbaString: DesignTokens.Colors.Brand._600)!
        case .secondary: return Color(rgbaString: DesignTokens.Colors.Background.bg_primary)!
        case .tertiary: return Color(rgbaString: DesignTokens.Colors.Background.bg_primary)!
        case .link_gray: return Color(rgbaString: DesignTokens.Colors.Background.bg_primary)!
        case .link_color: return Color(rgbaString: DesignTokens.Colors.Background.bg_primary)!
        case .primary_destructive: return Color(rgbaString: DesignTokens.Colors.Background.bg_primary)!
        case .secondary_destructive: return Color.gray.opacity(0.15)
        case .tertiary_destructive: return Color.clear
        case .link_destructive: return Color.red
        
        }
    }
    
    
    public var foreground: Color {
        switch self {
        case .primary: return Color(rgbaString: DesignTokens.Colors.Background.bg_primary)!
        case .secondary: return Color(rgbaString: DesignTokens.Colors.Foreground.fg_secondary._700_)!
        case .tertiary: return Color(rgbaString: DesignTokens.Colors.Foreground.fg_secondary._700_)!
        case .link_gray: return Color.gray
        case .link_color: return Color.blue
        case .primary_destructive: return Color.red
        case .secondary_destructive: return Color.gray.opacity(0.15)
        case .tertiary_destructive: return Color.clear
        case .link_destructive: return Color.red
        
        }
    }
}

public extension View {

    // Background
    func bg(_ color: Color) -> some View {
        self.background(color)
    }

    // Foreground text color
    func textColor(_ color: Color) -> some View {
        self.foregroundColor(color)
    }
}

extension Color {
    init?(rgbaString: String) {
        let pattern = #"rgba\((\d+),\s*(\d+),\s*(\d+),\s*([0-9.]+)\)"#
        guard let regex = try? NSRegularExpression(pattern: pattern, options: []),
              let match = regex.firstMatch(in: rgbaString, options: [], range: NSRange(rgbaString.startIndex..., in: rgbaString)) else {
            return nil // Invalid RGBA string format
        }

        guard let redRange = Range(match.range(at: 1), in: rgbaString),
              let greenRange = Range(match.range(at: 2), in: rgbaString),
              let blueRange = Range(match.range(at: 3), in: rgbaString),
              let alphaRange = Range(match.range(at: 4), in: rgbaString),
              let red = Double(rgbaString[redRange]),
              let green = Double(rgbaString[greenRange]),
              let blue = Double(rgbaString[blueRange]),
              let alpha = Double(rgbaString[alphaRange]) else {
            return nil // Error parsing components
        }

        self.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, opacity: alpha)
    }
}

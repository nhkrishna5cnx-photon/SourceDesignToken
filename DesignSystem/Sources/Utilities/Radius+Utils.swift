import SwiftUI

public extension ButtonVariant {
    var borderLine: some View {
        switch self {
            
        case .primary:
            return (RoundedRectangle(
                cornerRadius: 8, style: .continuous
            )
                .stroke(Color(rgbaString: DesignTokens.Colors.Background.bg_secondary_solid)!, lineWidth: 2))
            
        case .secondary:
            return  (RoundedRectangle(
                cornerRadius: 8, style: .continuous
            )
                .stroke(Color(rgbaString: DesignTokens.Colors.Background.bg_tertiary)!, lineWidth: 2))

        case .tertiary:
            return  (RoundedRectangle(
                cornerRadius: 8, style: .continuous
            )
                .stroke(Color(rgbaString: DesignTokens.Colors.Background.bg_tertiary)!, lineWidth: 2))

        case .link_gray:
            return  (RoundedRectangle(
                cornerRadius: 8, style: .continuous
            )
                .stroke(Color(rgbaString: DesignTokens.Colors.Background.bg_tertiary)!, lineWidth: 2))

        case .link_color:
            return  (RoundedRectangle(
                cornerRadius: 8, style: .continuous
            )
                .stroke(Color(rgbaString: DesignTokens.Colors.Background.bg_tertiary)!, lineWidth: 2))

        case .primary_destructive:
            return  (RoundedRectangle(
                cornerRadius: 8, style: .continuous
            )
                .stroke(Color(rgbaString: DesignTokens.Colors.Background.bg_tertiary)!, lineWidth: 2))

        case .secondary_destructive:
            return  (RoundedRectangle(
                cornerRadius: 8, style: .continuous
            )
                .stroke(Color(rgbaString: DesignTokens.Colors.Background.bg_tertiary)!, lineWidth: 2))

        case .tertiary_destructive:
            return  (RoundedRectangle(
                cornerRadius: 8, style: .continuous
            )
                .stroke(Color(rgbaString: DesignTokens.Colors.Background.bg_tertiary)!, lineWidth: 2))

        case .link_destructive:
            return (RoundedRectangle(
                cornerRadius: 8, style: .continuous
            )
                .stroke(Color(rgbaString: DesignTokens.Colors.Background.bg_tertiary)!, lineWidth: 2))
        }
    }
    
    var radius: some Shape {
        switch self {
            
        case .primary:
            return RoundedRectangle(cornerRadius: CGFloat(DesignTokens.radius_md))
            
        case .secondary:
            return  RoundedRectangle(cornerRadius: 8)

        case .tertiary:
            return  RoundedRectangle(cornerRadius: 8)

        case .link_gray:
            return  RoundedRectangle(cornerRadius: 8)

        case .link_color:
            return  RoundedRectangle(cornerRadius: 8)

        case .primary_destructive:
            return  RoundedRectangle(cornerRadius: 8)

        case .secondary_destructive:
            return  RoundedRectangle(cornerRadius: 8)

        case .tertiary_destructive:
            return  RoundedRectangle(cornerRadius: 8)

        case .link_destructive:
            return RoundedRectangle(cornerRadius: 8)
        }
    }
}
public extension View {
    func rounded(_ value: CGFloat) -> some View {
        self.cornerRadius(value)
    }

    func roundedFull() -> some View {
        self.cornerRadius(999)
    }
    
    func borderLine(cRadius: CGFloat, lineColor: Color, lineWidth: CGFloat) -> some View {
        self.background(
            RoundedRectangle(
                cornerRadius: cRadius, style: .continuous
            )
            .stroke(lineColor, lineWidth: lineWidth)
        )
    }
}


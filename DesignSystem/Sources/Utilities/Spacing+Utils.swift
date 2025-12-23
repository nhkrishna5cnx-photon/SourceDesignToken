
import SwiftUI

public enum ButtonSize {
    case sm, md, lg, xl
    
    public var height: CGFloat {
        switch self {
        case .sm: return 32
        case .md: return 40
        case .lg: return 48
        case .xl: return 56
        }
    }
    
    
    public var horizontalPadding: CGFloat {
        switch self {
        case .sm: return 12
        case .md: return 16
        case .lg: return 20
        case .xl: return 24
        }
    }
    
    
    public var font: Font {
        switch self {
        case .sm: return .system(size: 14, weight: .semibold)
        case .md: return .system(size: 16, weight: .semibold)
        case .lg: return .system(size: 16, weight: .semibold)
        case .xl: return .system(size: 18, weight: .semibold)
        }
    }
}

public extension View {

    // MARK: - Padding (Tailwind: p-)
    func p(_ value: CGFloat) -> some View {
        self.padding(value)
    }

    // MARK: - Padding X / Y (Tailwind: px-, py-)
    func px(_ value: CGFloat) -> some View {
        self.padding(.horizontal, value)
    }

    func py(_ value: CGFloat) -> some View {
        self.padding(.vertical, value)
    }

    // MARK: - Padding per side (pt, pb, pl, pr)
    func pt(_ value: CGFloat) -> some View { self.padding(.top, value) }
    func pb(_ value: CGFloat) -> some View { self.padding(.bottom, value) }
    func pl(_ value: CGFloat) -> some View { self.padding(.leading, value) }
    func pr(_ value: CGFloat) -> some View { self.padding(.trailing, value) }

    func frame(w: CGFloat, h: CGFloat) -> some View {
        self.frame(width: w, height: h)
    }
    
    // MARK: - Margin (like Tailwind m-)
  /*  func m(_ value: CGFloat) -> some View {
        self.padding(value)
    }

    func mx(_ value: CGFloat) -> some View {
        self.padding(.horizontal, value)
    }

    func my(_ value: CGFloat) -> some View {
        self.padding(.vertical, value)
    }
   */
}


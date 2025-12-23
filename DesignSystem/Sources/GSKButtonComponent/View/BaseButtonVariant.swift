//
//  BaseButtonVariant.swift
//  GSKButtonCompounent
//
//  Created by Hari Krishna N on 28/11/25.
//

import SwiftUI
@available(iOS 15.0, *)
public struct BaseButtonVariant: View {
    let title: String
    let variant: ButtonVariant
    let size: ButtonSize
    let isLoading: Bool?
    let enabled: Bool?
    let fullWidth: Bool?
    let isTextVisible: Bool?
    let href: URL? //If Present, button opens URL
    let isIconVisible: Bool?
    let iconLeading: Bool?
    let isLineVisible: Bool?
    let onClick: () -> Void
    
    public init(title: String, variant: ButtonVariant, size: ButtonSize, isLoading: Bool?, enabled: Bool?, fullWidth: Bool?, isTextVisible: Bool?, href: URL?, isIconVisible: Bool?, iconLeading: Bool, isLineVisible: Bool?, onClick: @escaping () -> Void) {
        self.title = title
        self.variant = variant
        self.size = size
        self.isLoading = isLoading
        self.enabled = enabled
        self.fullWidth = fullWidth
        self.isTextVisible = isTextVisible
        self.href = href
        self.isIconVisible = isIconVisible
        self.iconLeading = iconLeading
        self.isLineVisible = isLineVisible
        self.onClick = onClick
    }
    
    public var body: some View {
        VStack {
            Button(action: onClick) {
                //print("Custom Button Clicked")
                
                if isLoading ?? false {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                }
                if isIconVisible ?? false && iconLeading ?? false {
                    Image(systemName: "circle.circle.fill") // Leading icon
                        .foregroundColor(.white)
                }
                if (isTextVisible ?? true) {
                    Text(title)
                }
                
                if isIconVisible ?? false && (!(iconLeading ?? false)) {
                    Image(systemName: "circle.circle.fill") // Leading icon
                        .foregroundColor(.white)
                }
            }
            .customButtonVariant(variant: variant, size: size, isLineEnable: isLineVisible ?? false)
        }
    }
}
@available(iOS 15.0, *)
#Preview {
    BaseButtonVariant(title: "GSK Primary Button", variant: .primary, size: .lg, isLoading: false, enabled: true, fullWidth: false, isTextVisible: false, href: nil, isIconVisible: false, iconLeading: false, isLineVisible: false) {
        print("Button tapped!")
    }
}

//
//  BaseButtonViewModel.swift
//  GSKButtonCompounent
//
//  Created by Hari Krishna N on 28/11/25.
//

import SwiftUI

@available(iOS 15.0, *)
struct BaseButtonModifier: ViewModifier {
    let variant: ButtonVariant
    let size: ButtonSize
    let isLineEnable: Bool
    
    func body(content: Content) -> some View {
        content
            .font(variant.font)
            .frame(height: size.height)
            .padding(.horizontal, size.horizontalPadding)
            .background(variant.background)
            .foregroundColor(variant.foreground)
            .clipShape(variant.radius)
            .padding(isLineEnable ? 3 : 0)
            .overlay {
                if isLineEnable {
                    variant.borderLine
                }
            }
    }
}
@available(iOS 15.0, *)
extension View {
    func customButtonVariant(variant: ButtonVariant, size: ButtonSize, isLineEnable: Bool) -> some View {
        modifier(BaseButtonModifier(variant: variant, size: size, isLineEnable: isLineEnable))
    }
}


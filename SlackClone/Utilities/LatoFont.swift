//
//  LatoFont.swift
//  SlackClone
//
//  Created by Kyle Mooney on 1/28/25.
//

import SwiftUI

struct LatoFont: ViewModifier {
    var weight: Font.Weight = .regular
    var size: CGFloat = 16
    var isItalic: Bool = false

    func body(content: Content) -> some View {
        let fontName: String

        switch weight {
        case .black:
            fontName = isItalic ? "Lato-BlackItalic" : "Lato-Black"
        case .bold:
            fontName = isItalic ? "Lato-BoldItalic" : "Lato-Bold"
        case .light:
            fontName = isItalic ? "Lato-LightItalic" : "Lato-Light"
        case .thin:
            fontName = isItalic ? "Lato-ThinItalic" : "Lato-Thin"
        default:
            fontName = isItalic ? "Lato-Italic" : "Lato-Regular"
        }

        return content.font(.custom(fontName, size: size))
    }
}

extension View {
    func latoFont(weight: Font.Weight = .regular, size: CGFloat = 16, isItalic: Bool = false) -> some View {
        self.modifier(LatoFont(weight: weight, size: size, isItalic: isItalic))
    }
}


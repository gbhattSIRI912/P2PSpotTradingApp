//
//  UIExtension.swift
//  P2PSpotTradingApp
//
//  Created by orange on 06/01/25.
//

import SwiftUI

//Font
enum Roboto: String {
    case roboto_light = "Roboto-Light"
    case regular = "Roboto-Regular"
    case medium = "Roboto-Medium"
    case Roboto_Black = "Roboto-Black"
    case bold = "Roboto-Bold"
    
}

extension Font {
    
    static func customfont(_ font: Roboto, fontSize: CGFloat) -> Font {
        custom(font.rawValue, size: fontSize)
    }
}

//MARK: - Screen Sizes
extension CGFloat {
    static var screenWidth: Double {
        return UIScreen.main.bounds.size.width
    }
    
    static var screenHeight: Double {
        return UIScreen.main.bounds.size.height
    }
    
    static func widthPer(per: Double) -> Double {
        return screenWidth * per
    }
    
    static func heightPer(per: Double) -> Double {
        return screenHeight * per
    }
    
    static var topInsets: Double {
        guard let windowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene,
              let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }) else {
            return 0.0
        }
        return keyWindow.safeAreaInsets.top
    }

    static var bottomInsets: Double {
        guard let windowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene,
              let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }) else {
            return 0.0
        }
        return keyWindow.safeAreaInsets.bottom
    }

    
    static var horizontalInsets: Double {
        guard let windowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene,
              let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }) else {
            return 0.0
        }
        return keyWindow.safeAreaInsets.left + keyWindow.safeAreaInsets.right
    }

    
    static var verticalInsets: Double {
        guard let windowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene,
              let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }) else {
            return 0.0
        }
        return keyWindow.safeAreaInsets.top + keyWindow.safeAreaInsets.bottom
    }
}

//MARK: -  Color Extension
extension Color {
    static var primaryButtonColor: Color {
        return Color(hex: "1ED3BE")
    }
    
    static var whiteTextColor: Color {
        return Color(hex: "FFFFFF")
    }
    
    static var heading_Black_TextColor: Color {
        return Color(hex: "000000")
    }
    
    static var textRedColor: Color {
        return Color(hex: "DC3545")
    }
    
    static var greenColor: Color {
        return Color(hex: "28A745")
    }
    
    static var darkGray: Color {
        return Color(hex: "667085")
    }
    
    static var lightGreenColor: Color {
        return Color(hex: "1ED3BE")
    }
    
    static var greyColor: Color {
        return Color(hex: "505467")
    }
    
    static var lightYellowColor: Color {
        return Color(hex: "FEF0C7")
    }
    
    static var lightGreyColor: Color {
        return Color(hex: "F4F4F4")
    }
    
    static var boarderColor: Color {
        return Color(hex: "6B7089")
    }
    static var secondaryTextColor: Color {
        return Color(hex: "2D2D2D")
    }
    
    static var estimatedFeeColor: Color {
        return Color(hex: "F79009")
    }
    
    static var innerBoarderColor: Color {
        return Color(hex: "FFFBEF")
    }
    
    static var colorCircleBackground: Color {
        return Color(hex: "D9D9D9")
    }
    
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
            case 3: // RGB(12 -bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corner:  UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corers: corner))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corers: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corers, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

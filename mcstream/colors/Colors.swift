//
//  Colors.swift
//  mcstream
//
//  Created by Pranav on 12/10/25.
//

import Foundation
import SwiftUI

extension Color {
    static let polar = Color(hex: "#F7F7F7")
    static let squid = Color(hex: "#EBE3E3")
    static let canary = Color(hex: "#FFF5D3")
    static let seaSponge = Color(hex: "#D7FFB8")
    static let iguana = Color(hex: "#D0F4FF")
    static let starfish = Color(hex: "#FFAAD6")
    static let swan = Color(hex: "#E5E5E5")
    static let walkingFish = Color(hex: "#FFF0E0")
    static let duck = Color(hex: "#FBE56D")
    static let turtle = Color(hex: "#A5ED6E")
    static let anchovy = Color(hex: "#D2E4E8")
    static let beetle = Color(hex: "#C8B2FF")
    static let hare = Color(hex: "#AFAFAF")
    static let flamingo = Color(hex: "#FFB2B2")
    static let bee = Color(hex: "#FFC800")
    static let owl = Color(hex: "#58C002")
    static let beluga = Color(hex: "#B8F2FF")
    static let betta = Color(hex: "#9069CD")
    static let wolf = Color(hex: "#777777")
    static let pig = Color(hex: "#F5A4A4")
    static let lion = Color(hex: "#FFB100")
    static let treeFrog = Color(hex: "#58A700")
    static let moonJelly = Color(hex: "#7AF0F2")
    static let butterfly = Color(hex: "#6F4EA1")
    static let eel = Color(hex: "#4B4B4B")
    static let crab = Color(hex: "#FF7878")
    static let fox = Color(hex: "#FF9600")
    static let blueJay = Color(hex: "#84D8FF")
    static let cardinal = Color(hex: "#FF4B4B")
    static let cheetah = Color(hex: "#FFC8BE")
    static let macaw = Color(hex: "#1C80F6")
    static let fireAnt = Color(hex: "#EA2B2B")
    static let monkey = Color(hex: "#E5A259")
    static let whale = Color(hex: "#1899D6")
    static let camel = Color(hex: "#E7A601")
    static let humpback = Color(hex: "#2870C9")
    static let guineaPig = Color(hex: "#CD7900")
    static let narwhal = Color(hex: "#1453A3")
    static let grizzly = Color(hex: "#A56444")
}

// Helper initializer to support hex strings
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255,
                            (int >> 8) * 17,
                            (int >> 4 & 0xF) * 17,
                            (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255,
                            int >> 16,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24,
                            int >> 16 & 0xFF,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

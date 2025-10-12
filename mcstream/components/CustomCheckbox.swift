//
//  CuteCheckbox.swift
//  mcstream
//
//  Created by Pranav on 13/10/25.
//


import SwiftUI

struct CustomCheckbox: View {
    @Binding var isChecked: Bool
    var label: String = ""
    var accentColor: Color = .pink
    
    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(isChecked ? accentColor : Color.gray.opacity(0.3), lineWidth: 2)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(isChecked ? accentColor.opacity(0.1) : Color.clear)
                    )
                    .frame(width: 28, height: 28)
                
                if isChecked {
                    Image(systemName: "checkmark")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(accentColor)
                        .transition(.scale.combined(with: .opacity))
                }
            }
            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isChecked)
            
            if !label.isEmpty {
                Text(label)
                    .font(.body)
                    .foregroundColor(.primary)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            isChecked.toggle()
        }
    }
}


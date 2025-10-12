//
//  CustomTextField.swift
//  mcstream
//
//  Created by Pranav on 12/10/25.
//

import SwiftUI

struct InfoField: View {
    let title: String
    @Binding var text: String
    @FocusState var isTyping: Bool
    var icon: String? = nil
    var isSecure: Bool = false
    
    @State private var isSecureTextVisible = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack(spacing: 0) {
                // Text field
                Group {
                    if isSecure && !isSecureTextVisible {
                        SecureField("", text: $text)
                    } else {
                        TextField("", text: $text)
                    }
                }
                .autocorrectionDisabled()
                .padding(.leading)
                .padding(.trailing, icon != nil ? 45 : 16)
                .frame(height: 55)
                .focused($isTyping)
                
                // Icon on the right
                if let icon = icon {
                    HStack(spacing: 12) {
                        if isSecure {
                            Button(action: {
                                isSecureTextVisible.toggle()
                            }) {
                                Image(systemName: isSecureTextVisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(isTyping ? .blue : .secondary)
                                    .font(.system(size: 16))
                            }
                        }
                        
                        Image(systemName: icon)
                            .foregroundColor(isTyping ? .blue : .secondary)
                            .font(.system(size: 16))
                    }
                    .padding(.trailing, 16)
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(isTyping ? Color.blue : Color.gray.opacity(0.3), lineWidth: isTyping ? 2 : 1)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .fill(Color(.clear))
                    )
            )
            
            // Floating label
            Text(title)
                .padding(.horizontal, 5)
                .background(Color(.clear))
                .foregroundColor(isTyping ? .blue : .secondary)
                .padding(.leading, 16)
                .offset(y: isTyping || !text.isEmpty ? -27 : 0)
                .scaleEffect(isTyping || !text.isEmpty ? 0.85 : 1.0, anchor: .leading)
                .onTapGesture {
                    isTyping = true
                }
        }
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isTyping)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: text.isEmpty)
    }
}

#Preview {
    VStack(spacing: 30) {
        InfoField(title: "First Name", text: .constant(""), icon: "person.fill")
        
        InfoField(title: "Last Name", text: .constant(""), icon: "person.fill")
        
        InfoField(title: "Email", text: .constant(""), icon: "envelope.fill")
        
        InfoField(title: "Password", text: .constant(""), icon: "lock.fill", isSecure: true)
        
        InfoField(title: "Phone Number", text: .constant(""), icon: "phone.fill")
        
        InfoField(title: "Address", text: .constant(""))
    }
    .padding()
}

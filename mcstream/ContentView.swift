//
//  ContentView.swift
//  mcstream
//
//  Created by Pranav on 08/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var task1 = false
    @State private var task2 = false
    @State private var task3 = false
    @State private var task4 = false
    
    @State private var passcode = ""
    var body: some View {
        VStack {
            Spacer()
            CustomTextField(
                title: "Password",
                text: $passcode,
                icon: "lock.fill",
                isSecure: true
            )
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                CustomCheckbox(isChecked: $task1, label: "Buy groceries 🛒", accentColor: .pink)
                CustomCheckbox(isChecked: $task2, label: "Walk the dog 🐕", accentColor: .purple)
                CustomCheckbox(isChecked: $task3, label: "Read a book 📚", accentColor: .blue)
                CustomCheckbox(isChecked: $task4, label: "Water plants 🌱", accentColor: .green)
            }
            
            Spacer()
        }
    
    }
}

#Preview {
    ContentView()
}

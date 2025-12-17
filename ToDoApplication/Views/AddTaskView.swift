//
// ToDoApplication
// AddTaskView.swift
//
// Created by HiRO on 16/12/2025
// Copyright © 2025 ACME. All Rights Reserved.


import SwiftUI

struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss
    let onConfirm: (String) -> Void
    
    @State private var text = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            TextField("Title", text: $text, prompt: Text("What do you want to do today?").foregroundStyle(.primary))
                .textFieldStyle(.plain)
                .focused($isFocused)
                .submitLabel(.done)
                .onSubmit { addTaskAndDismiss() }
                .font(.title3)
                .fontDesign(.rounded)
                .foregroundStyle(.primary)
                .padding(10)
                .background(.main.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            
            Image(.typingCat)
                .resizable()
                .scaledToFit()
                .aspectRatio(1.0, contentMode: .fit)
            
            Spacer()
        }
        .padding(.horizontal, 10)
        .navigationTitle(Text("New Task"))
        .navigationBarTitleDisplayMode(.inline)
        .onAppear { isFocused = true }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    isFocused = false
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(.red)
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    addTaskAndDismiss()
                } label: {
                    Image(systemName: "checkmark")
                        .foregroundStyle(.main)
                }
                .disabled(text.isEmpty)
            }
        }
    }
    
    private func addTaskAndDismiss() {
        let trimmedText = text.trimmingCharacters(in: .whitespaces)
        if !trimmedText.isEmpty {
            onConfirm(trimmedText)
            isFocused = false
            dismiss()
        }
        text = ""
    }
}

#Preview {
    AddTaskView(onConfirm: { _ in })
}

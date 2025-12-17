//
// ToDoApplication
// TaskRowView.swift
//
// Created by HiRO on 17/12/2025
// Copyright © 2025 ACME. All Rights Reserved.


import SwiftUI

struct TaskRowView: View {
    var task: Task
    let onToggle: (Task) -> Void
    
    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            Button {
                onToggle(task)
            } label: {
                Image(systemName:task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundStyle(.main)
            }
            .contentTransition(.symbolEffect)
            .buttonStyle(.plain)
            
            Text(task.title)
                .font(.title3)
                .fontDesign(.rounded)
                .foregroundStyle(task.isCompleted ? .gray : .primary)
                .strikethrough(task.isCompleted, color: .gray)
                .animation(.easeInOut(duration: 0.2), value: task.isCompleted)
            
            Spacer()
        }
        .padding()
        .background(task.isCompleted ? .gray.opacity(0.2) : .main.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

#Preview {
    TaskRowView(task: Task(title: "Test", isCompleted: false), onToggle: { _ in})
}

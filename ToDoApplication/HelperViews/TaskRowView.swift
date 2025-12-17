//
// ToDoApplication
// TaskRowView.swift
//
// Created by HiRO on 17/12/2025
// Copyright © 2025 ACME. All Rights Reserved.


import SwiftUI

struct TaskRowView: View {
    var tasks: Task
    let onToggle: (Task) -> Void
    
    var body: some View {
        HStack(alignment: .top, spacing: 14) {
            Button {
                onToggle(tasks)
            } label: {
                Image(systemName:tasks.isCompleted ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundStyle(.main)
            }
            .contentTransition(.symbolEffect)
            .buttonStyle(.plain)
            
            Text(tasks.title)
                .font(.title3)
                .fontDesign(.rounded)
                .foregroundStyle(tasks.isCompleted ? .gray : .primary)
                .strikethrough(tasks.isCompleted, color: .gray)
                .animation(.easeInOut(duration: 0.2), value: tasks.isCompleted)
            
            Spacer()
        }
        .padding()
        .background(tasks.isCompleted ? .gray.opacity(0.2) : .main.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

#Preview {
    TaskRowView(tasks: Task(title: "Test", isCompleted: false), onToggle: { _ in})
}

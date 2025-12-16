//
// ToDoApplication
// EmptyView.swift
//
// Created by HiRO on 16/12/2025
// Copyright © 2025 ACME. All Rights Reserved.


import SwiftUI

struct EmptyView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "checklist")
                .font(.system(size: 64))
                .foregroundColor(.gray.opacity(0.5))
            
            VStack(spacing: 10) {
                Text("No tasks yet")
                    .font(.title2)
                    .foregroundColor(.secondary)
                
                Text("Tap + to add your first task")
                    .font(.subheadline)
                    .foregroundColor(.secondary.opacity(0.7))
            }
        }
    }
}

#Preview {
    EmptyView()
}

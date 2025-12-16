//
// ToDoApplication
// TaskListView.swift
//
// Created by HiRO on 16/12/2025
// Copyright © 2025 ACME. All Rights Reserved.


import SwiftUI

struct TaskListView: View {
    @StateObject var viewModel = TodoViewModel()
    
    var body: some View {
        ZStack {
            NavigationStack {
                if viewModel.task.isEmpty {
                    VStack {
                        EmptyView()
                    }
                } else {
                    List(viewModel.task) { task in
                        Text(task.title)
                    }
                }
            }
        }
    }
}

#Preview {
    TaskListView()
}

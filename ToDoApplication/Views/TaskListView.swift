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
                List {
                    ForEach(viewModel.task) { task in
                        HStack {
                            Text(task.title)
                        }
                    }
                    .onDelete(perform: viewModel.deleteTask)
                }
                .navigationTitle("Tasks")
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button {
                            viewModel.addTask("test!")
                        } label: {
                            Image(systemName: "plus")
                                .font(.title)
                                .padding()
                                .foregroundStyle(Color(.blue))
                        }
                    }
                }
            }
            
            if viewModel.task.isEmpty {
                EmptyView()
            }
        }
    }
}

#Preview {
    TaskListView()
}

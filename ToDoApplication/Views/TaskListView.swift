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
                        TaskRowView(task: task, onToggle: viewModel.toggleTaskCompletion)
                    }
                    .onDelete(perform: viewModel.deleteTask)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    .listRowInsets(.vertical, 5)
                }
                .navigationTitle("Tasks")
                .listStyle(.plain)
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button {
                            viewModel.isShowingSheet = true
                        } label: {
                            Image(systemName: "plus")
                                .font(.title)
                                .padding()
                                .foregroundStyle(.tint)
                        }
                    }
                }
                .sheet(isPresented: $viewModel.isShowingSheet) {
                    NavigationStack {
                        AddTaskView(onConfirm: viewModel.addTask)
                    }
                    .presentationDetents([.medium])
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

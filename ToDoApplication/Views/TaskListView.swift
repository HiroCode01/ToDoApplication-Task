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
        NavigationStack {
            Group {
                if viewModel.visibleTasks.isEmpty {
                    ContentUnavailableView("No tasks yet", systemImage: "checklist", description: Text("Tap + to add your first task"))
                } else {
                    List {
                        ForEach(viewModel.visibleTasks) { task in
                            TaskRowView(tasks: task, onToggle: viewModel.toggleTaskCompletion)
                        }
                        .onDelete(perform: viewModel.deleteTask)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                        .listRowInsets(.vertical, 5)
                    }
                    .listStyle(.plain)
                    .animation(.easeInOut, value: viewModel.filteredTasks)
                }
            }
            .navigationTitle("Tasks")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    TextField("Search", text: $viewModel.searchText)
                        .textFieldStyle(.plain)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity)
                        .submitLabel(.search)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                    
                    Spacer(minLength: 8)
                    
                    Button {
                        viewModel.isShowingSheet = true
                    } label: {
                        Image(systemName: "plus")
                            .font(.title2)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("Filter", selection: $viewModel.filter) {
                            ForEach(TaskFilter.allCases) { filter in
                                Text(filter.rawValue).tag(filter)
                            }
                        }
                    } label: {
                        Label("Filter", systemImage: "line.3.horizontal.decrease")
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
    }
}

#Preview {
    TaskListView()
}

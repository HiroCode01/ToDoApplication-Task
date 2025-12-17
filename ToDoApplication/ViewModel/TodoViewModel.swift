//
// ToDoApplication
// TodoViewModel.swift
//
// Created by HiRO on 16/12/2025
// Copyright © 2025 ACME. All Rights Reserved.


import SwiftUI
import Combine

class TodoViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var isShowingSheet = false
    @Published var filter: TaskFilter = .all
    
    private let userDefaultsKey = "SavedTasks"
    private let generator = UINotificationFeedbackGenerator()
    
    init() { loadData() }
    
    var filteredTasks: [Task] {
        switch filter {
        case .all:
            return tasks
        case .completed:
            return tasks.filter { $0.isCompleted }
        case .active:
            return tasks.filter { !$0.isCompleted }
        }
    }
    
    func addTask(_ title: String) {
        let newTask = Task(title: title)
        tasks.append(newTask)
        generator.notificationOccurred(.success)
        saveData()
    }
    
    func deleteTask(at offset: IndexSet) {
        tasks.remove(atOffsets: offset)
        generator.notificationOccurred(.success)
        saveData()
    }
    
    func toggleTaskCompletion(_ selectedTask: Task) {
        if let index = tasks.firstIndex(where: { $0.id == selectedTask.id }) {
            withAnimation(.easeInOut) {
                tasks[index].isCompleted.toggle()
            }
            generator.notificationOccurred(.success)
            saveData()
        }
    }
    
    private func saveData() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }
    
    private func loadData() {
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
           let loadedTasks = try? decoder.decode([Task].self, from: data) {
            tasks = loadedTasks
        } else {
            tasks = []
        }
    }
}

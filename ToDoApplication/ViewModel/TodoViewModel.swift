//
// ToDoApplication
// TodoViewModel.swift
//
// Created by HiRO on 16/12/2025
// Copyright © 2025 ACME. All Rights Reserved.


import SwiftUI
import Combine

class TodoViewModel: ObservableObject {
    @Published var task: [Task] = []
    @Published var isShowingSheet = false
    
    private let userDefaultsKey = "SavedTasks"
    private let generator = UINotificationFeedbackGenerator()
    
    init() { loadData() }
    
    func addTask(_ title: String) {
        let newTask = Task(title: title)
        task.append(newTask)
        generator.notificationOccurred(.success)
        saveData()
    }
    
    func deleteTask(at offset: IndexSet) {
        task.remove(atOffsets: offset)
        generator.notificationOccurred(.success)
        saveData()
    }
    
    func toggleTaskCompletion(_ selectedTask: Task) {
        if let index = task.firstIndex(where: { $0.id == selectedTask.id }) {
            task[index].isCompleted.toggle()
            generator.notificationOccurred(.success)
            saveData()
        }
    }
    
    private func saveData() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(task) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }
    
    private func loadData() {
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
           let loadedTasks = try? decoder.decode([Task].self, from: data) {
            task = loadedTasks
        } else {
            task = []
        }
    }
}

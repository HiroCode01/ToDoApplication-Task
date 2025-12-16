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
    
    private let userDefaultsKey = "SavedTasks"
    
    init() { loadData() }
    
    func addTask(_ title: String) {
        let newTask = Task(title: title)
        task.append(newTask)
        saveData()
    }
    
    func deleteTask(at offset: IndexSet) {
        task.remove(atOffsets: offset)
        saveData()
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

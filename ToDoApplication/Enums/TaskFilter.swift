//
// ToDoApplication
// TaskFilter.swift
//
// Created by HiRO on 17/12/2025
// Copyright © 2025 ACME. All Rights Reserved.


import Foundation

enum TaskFilter: String, CaseIterable, Identifiable {
    case all = "All"
    case completed = "Completed"
    case active = "Active"

    var id: Self { self }
}

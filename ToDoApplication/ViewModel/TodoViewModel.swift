//
// ToDoApplication
// TodoViewModel.swift
//
// Created by HiRO on 16/12/2025
// Copyright © 2025 ACME. All Rights Reserved.


import Foundation
import Combine

class TodoViewModel: ObservableObject {
    @Published var task: [Task] = []
}

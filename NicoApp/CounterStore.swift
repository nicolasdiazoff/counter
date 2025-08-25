//
//  CounterStore.swift
//  NicoApp
//
//  Created by Nicolás Díaz on 21/4/25.
//

import Foundation


struct Counter: Identifiable, Codable {
    let id: UUID
    var name: String
    var value: Int
}

class CounterStore: ObservableObject {
    @Published var counters: [Counter] = [] {
        didSet {
            saveCounters()
        }
    }

    init() {
        loadCounters()
    }

    func addCounter(name: String) {
        let newCounter = Counter(id: UUID(), name: name, value: 0)
        counters.append(newCounter)
    }

    func removeCounter(id: UUID) {
        counters.removeAll { $0.id == id }
    }

    func incrementCounter(id: UUID) {
        if let index = counters.firstIndex(where: { $0.id == id }) {
            counters[index].value += 1
        }
    }

    func decrementCounter(id: UUID) {
        if let index = counters.firstIndex(where: { $0.id == id }) {
            counters[index].value -= 1
        }
    }

    // MARK: - Persistence
    private func saveCounters() {
        if let encoded = try? JSONEncoder().encode(counters) {
            UserDefaults.standard.set(encoded, forKey: "counters")
        }
    }

    private func loadCounters() {
        if let data = UserDefaults.standard.data(forKey: "counters"),
           let decoded = try? JSONDecoder().decode([Counter].self, from: data) {
            counters = decoded
        }
        //showAlert(message:"Elementos cargados")
    }
    
    @Published var showAlert = false
    @Published var alertMessage = ""
    
    private func showAlert(message: String) {
        alertMessage = message
        showAlert = true
    }
}

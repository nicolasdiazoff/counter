//
//  ContentView.swift
//  NicoApp
//
//  Created by Nicolás Díaz on 14/4/25.
//

import SwiftUI

struct CountersView: View {
    
    @StateObject private var store = CounterStore()
    
    
    var body: some View {
        NavigationStack{
            HeaderView(title: "Counters")
            List {
                ForEach(store.counters) { counter in
                    CounterSmallView(store: store,counterItem: counter)
                    .listRowSeparator(.hidden)
                }
                .onDelete { indexSet in
                    indexSet.forEach { store.removeCounter(id: store.counters[$0].id) }
                }
            }

        }
        .toolbar {
            Button("Nuevo") {
                store.addCounter(name: "Nuevo \(store.counters.count + 1)")
            }
        }
    }
}

#Preview {
    CountersView()
}

//
//  CounterSmallView.swift
//  NicoApp
//
//  Created by Nicolás Díaz on 15/4/25.
//

import SwiftUI

extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let r = Double((rgb & 0xFF0000) >> 16) / 255.0
        let g = Double((rgb & 0x00FF00) >> 8) / 255.0
        let b = Double(rgb & 0x0000FF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}

struct CounterSmallView: View {
    
    @ObservedObject var store: CounterStore
    public var counterItem: Counter
    
    func plusOne() {
        store.incrementCounter(id: counterItem.id)
    }
    
    func lessOne() {
        store.decrementCounter(id: counterItem.id)
    }
    
    func delete() {
        store.removeCounter(id: counterItem.id)
    }
    
    
    var body: some View {
        HStack() {
            VStack{
                Text(counterItem.name)
                Text("\(counterItem.value)")
                    .font(.title)
                    .foregroundColor(Color(hex: "#4F4F4F"))
                    .fontWeight(.bold)
            }.frame(maxWidth: .infinity, alignment: .leading)
            
            HStack{
                Button(action: {
                    plusOne()
                }) {
                    Image(systemName: "plus")
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                        .frame(width: 50, height: 50)
                        .background(Color(hex: "#DADEFB"))
                        .clipShape(Circle())
                }
                
                
                Button(action: {
                    lessOne()
                }) {
                    Image(systemName: "minus")
                           .font(.system(size: 24))
                           .foregroundColor(.black)
                           .frame(width: 50, height: 50)
                           .background(Color(hex: "#DADEFB"))
                           .clipShape(Circle())
                }
            }
            
        }
        .swipeActions(edge: .leading){
            Button("Delete", systemImage: "trash"){
                delete()
            }.tint(.red)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 20)
        .background(Color.indigo.opacity(0.03))
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(hex: "#445EE9"), lineWidth: 1)
        )
        .alert(isPresented: $store.showAlert) {
            Alert(
                title: Text("Atención"),
                message: Text(store.alertMessage),
                dismissButton: .default(Text("OK"))
            )
        }
        
 
        
        
    }
}

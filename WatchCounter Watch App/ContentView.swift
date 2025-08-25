//
//  ContentView.swift
//  WatchCounter Watch App
//
//  Created by Nicolás Díaz on 18/4/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            ForEach(0..<20){index in
                VStack{
                    CounterSmallView()
                }
               
            }
        }
        .padding(.horizontal)
        .background(Color.white)
        
        
    }
}

#Preview {
    ContentView()
}

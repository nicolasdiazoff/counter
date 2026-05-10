//
//  NewCounter.swift
//  NicoApp
//
//  Created by Nicolás Díaz on 15/4/25.
//

import SwiftUI

struct NewCounter: View {
    var body: some View {
        NavigationStack{
            ScrollView {
                HeaderView(title: "New Counter")
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NewCounter()
}

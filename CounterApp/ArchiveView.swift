//
//  ArchiveView.swift
//  NicoApp
//
//  Created by Nicolás Díaz on 15/4/25.
//

import SwiftUI

struct ArchiveView: View {
    var body: some View {
        NavigationStack{
            ScrollView {
                HeaderView(title: "Archives")
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ArchiveView()
}

//
//  HeaderView.swift
//  NicoApp
//
//  Created by Nicolás Díaz on 15/4/25.
//
import SwiftUI

struct HeaderView: View {
    
    var title: String
    var showBackButton: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Total")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color(hex: "#4F4F4F"))
            Text(title).font(.title).fontWeight(.bold)

            
            HStack{
                NavigationLink(destination: NewCounter()) {
                    Text("Start new")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color.indigo)
                        .foregroundColor(.white)
                        .cornerRadius(6)
                }
                
                NavigationLink(destination: ArchiveView()) {
                    Text("Go to archives")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .foregroundColor(Color.indigo)
                        .cornerRadius(6)
                }
            }
            
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 24)
        .padding(.vertical, 20)
        .background(Color(hex: "#f2f2f2"))
    }
}

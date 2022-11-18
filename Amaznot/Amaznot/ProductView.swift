//
//  ContentView.swift
//  Amaznot
//
//  Created by Andrea Copellino on 16/11/22.
// hbkljblj,j
// ciaooso
// test2

// altro test fatto mo

import SwiftUI

struct ProductDescriptionButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 1, green: 1, blue: 1))
            .foregroundColor(.black)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct ProductView: View {
    
    @EnvironmentObject var dataStore: DataStore
    
    @State private var selectedStorage = "500GB"
    let storageOptions = ["500GB", "1TB", "2TB"]
    @State private var selectedColor = "Black"
    let colorOptions = ["Black", "White"]
    
    var body: some View {
        NavigationView() {
//            ScrollView {
//
//            }
            ZStack {
                Color(.systemGray6)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("AMAZON'S CHOICE")
                                .font(.caption2)
                                .fontWeight(.bold)
                                .foregroundColor(Color.gray)
                                .multilineTextAlignment(.leading)
                            Text("Xbox Series X")
                                .font(.title)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .padding(.vertical, 0.0)
                            HStack{
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color.gray)
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color.gray)
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color.gray)
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color.gray)
                                Image(systemName: "star")
                                    .foregroundColor(Color.gray)
                            }
                        }
                        
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("499$")
                                    .font(.largeTitle)
                                HStack {
                                    Text("549$")
                                        .font(.footnote)
                                        .foregroundColor(Color.gray)
                                        .strikethrough()
                                    Text("-9%")
                                        .font(.footnote)
                                        .foregroundColor(Color.green)
                                }
                            }
                            .padding(.vertical)
                            
                            Spacer()
                            
                            Button(action: dataStore.placeHolderFunc) {
                                Image(systemName: "info.circle")
                            }
                            .accentColor(.blue)
                        }

                        HStack {
                            Button(action: dataStore.placeHolderFunc) {
                                Text("Description")
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(ProductDescriptionButton())
                            Button(action: dataStore.placeHolderFunc) {
                                Text("AR")
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity)
                            }
                            .buttonStyle(ProductDescriptionButton())
                            
                        }
                        
                    }
                    .padding(.horizontal, 20.0)
                    VStack {
                        Form {
                            Section {
                                Picker("Storage", selection: $selectedStorage) {
                                    ForEach(storageOptions, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .padding(0.0)
                                Picker("Color", selection: $selectedColor) {
                                    ForEach(colorOptions, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .padding(0.0)
                            }
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing){
                            Button(action: dataStore.pushActivity){
                                Image(systemName: "heart")
                            }
                        }
                        ToolbarItem(placement: .navigationBarTrailing){
                            Button(action: dataStore.pushActivity){
                                Image(systemName: "square.and.arrow.up")
                            }
                        }
                    }
                }
                
            }
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
            .environmentObject(DataStore())
    }
}

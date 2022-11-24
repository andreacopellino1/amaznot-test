//
//  InfoView.swift
//  Amaznot
//
//  Created by Andrea Copellino on 23/11/22.
//

import SwiftUI

struct learnMoreView: View {
    
    var introduction: String = ""
    var text: String = ""
    var hasIntroduction: Bool = false
    var shouldHaveSpacer: Bool = false
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .edgesIgnoringSafeArea(.all)
            
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Group {
                        if (hasIntroduction) {
                            Text(introduction)
                                .font(.title3)
                                .fontWeight(.bold)
                                .padding(.bottom, 1.0)
                        }
                    }
                    Text(text)
                        .fixedSize(horizontal: false, vertical: true)
                }
                Spacer()
                
                VStack {
                    Image(systemName: "info.circle")
                        .foregroundColor(Color("AccentColor"))
                        .padding(.leading)
                    Group {
                        if (shouldHaveSpacer) {
                            Spacer()
                        }
                    }
                }
            }
            .padding(.all, 24.0)
        }
        
        .cornerRadius(14.0)
        .padding(.vertical, 4)
    }
    
}

struct InfoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ScrollView() {
            HStack {
                Spacer()
                Button("Done") {
                    presentationMode.wrappedValue.dismiss()
                }
                .padding(.all)
                .bold()
            }
            HStack {
                VStack(alignment: .leading) {
                    
                    VStack(alignment: .leading) {
                        Text("Xbox Series X")
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .padding(.vertical, 0.0)
                        
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
                    }
                    

                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Speditore: ")
                                .font(.body)
                                .fontWeight(.bold)
                            Text("Amazon")
                                .font(.body)
                        }
                        
                        HStack {
                            Text("Venditore: ")
                                .font(.body)
                                .fontWeight(.bold)
                            Text("Amazon")
                                .font(.body)
                        }
                    }
                    .padding(.vertical)
                    
                    learnMoreView(introduction: "Resi Gratuiti", text: "Il prodotto è restituibile fino a Gennaio 2023", hasIntroduction: true, shouldHaveSpacer: true)
                    
                    learnMoreView(introduction: "Hai una vecchia console?", text: "Ottieni uno sconto di 120$ rivendendo su Amazon la tua vecchia console", hasIntroduction: true, shouldHaveSpacer: true)
 
                    learnMoreView(text: "Acquistabile a rate con Cofidis", shouldHaveSpacer: false)
                    
                                        
                    
                    
                    Text("Tutti i prezzi includono IVA")
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                        .padding(.vertical)
                }
                
            }
            .padding(.horizontal)
        }
        .toolbar() {
            
        }
        
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

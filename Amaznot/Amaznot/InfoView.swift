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
        
        ZStack {
//            Color(.systemGray6)
//                .edgesIgnoringSafeArea(.all)
            
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
                                Text("$499")
                                    .font(.largeTitle)
                                HStack {
                                    Text("$549")
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
                                VStack(alignment: .leading){
                                    Text("Shipment:")
                                        .fontWeight(.bold)
                                    Text("Seller:")
                                        .fontWeight(.bold)
                                }
                                .padding(.trailing)
                                
                                VStack(alignment: .leading){
                                    Text("Amazon")
                                        
                                    Text("Amazon")
                                        
                                }
                            }
                            
                            
                        }
                        .padding(.vertical)
                        
                        learnMoreView(introduction: "Free Returns", text: "You can return this product until January 31st at no extra cost", hasIntroduction: true, shouldHaveSpacer: true)
                        
                        learnMoreView(introduction: "Do you have an old console?", text: "Save up to $120 by selling your old console on Amazon", hasIntroduction: true, shouldHaveSpacer: true)
     
                        learnMoreView(text: "Purchasable in installments with Cofidis", shouldHaveSpacer: false)
                        
                        Text("All prices include VAT")
                            .font(.footnote)
                            .foregroundColor(Color.gray)
                            .padding(.vertical)
                    }
                    
                }
                .padding(.horizontal)
            }
            .scrollDisabled(true)
        }
        
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

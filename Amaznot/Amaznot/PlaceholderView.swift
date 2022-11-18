//
//  PlaceholderView.swift
//  Amaznot
//
//  Created by Andrea Copellino on 18/11/22.
//

import SwiftUI

struct PlaceholderView: View {
    var body: some View {

        VStack(alignment: .center) {
            
            
            Image(systemName: "viewfinder")
                .padding(.bottom)
                
            
            VStack(alignment: .leading){
                Text("There SHOULD be a view")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    
                Text("...but the challenge said only 3 screens")
            }
            
        }
        .padding(.horizontal)
        
    }
}

struct PlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderView()
            .environmentObject(DataStore())
    }
}

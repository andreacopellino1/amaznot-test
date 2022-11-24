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

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemChromeMaterial
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

struct ProductDescriptionButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 1, green: 1, blue: 1))
            .foregroundColor(.black)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct PrimaryButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.yellow)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        
    }
}

struct ReviewStar: View {
    var imageName: String
    
    init(imageName: String) {
        self.imageName = imageName
    }
    
    var body: some View {
        Image(systemName: imageName)
            .foregroundColor(Color.gray)
            .padding(.trailing, -6.0)
    }
}

struct CarouselImageView: View {
    
    var imageName: String
    
    init(imageName: String) {
        self.imageName = imageName
    }
    
    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 340.0, height: 340.0)
            .cornerRadius(8.0)
    }
}

struct ProductView: View {
    
    @EnvironmentObject var dataStore: DataStore
    
    @State private var showingSheet = false
    
    @State private var selectedStorage = "500GB"
    let storageOptions = ["500GB", "1TB", "2TB"]
    @State private var selectedColor = "Black"
    let colorOptions = ["Black", "White"]
    
    func showTheSheet() {
        showingSheet.toggle()
    }
    
    var body: some View {
        
        NavigationView() {
            
            ZStack {
                Color(.systemGray6)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView() {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            CarouselImageView(imageName: "XSX pic1")
                            CarouselImageView(imageName: "XSX pic2")
                            CarouselImageView(imageName: "XSX pic3")
                            CarouselImageView(imageName: "XSX pic4")
                        }
                        .padding([.leading, .bottom, .trailing])
 
                    }
                    
                    VStack {
                        VStack {
                            HStack { // A'SC, Title, Rating
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
                                    HStack(alignment: .center){
                                        ReviewStar(imageName: "star.fill")
                                        ReviewStar(imageName: "star.fill")
                                        ReviewStar(imageName: "star.fill")
                                        ReviewStar(imageName: "star.fill")
                                        ReviewStar(imageName: "star")
                                        
                                    }
                                    
                                }
                                Spacer()
                            }
                            
                            HStack { // prezzo e info
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
                                .padding(.vertical)
                                
                                Spacer()
                                
                                Button(action: showTheSheet) {
                                    Image(systemName: "info.circle")
                                    
                                }
                                .accentColor(.yellow)
                            }
                            
                            HStack { // Description and AR Buttons
//                                NavigationLink("Description") {
//                                    PlaceholderView()
//
//                                }
//                                .buttonStyle(ProductDescriptionButton())
//                                .fontWeight(.bold)
//                                .frame(maxWidth: .infinity)
//
//                                NavigationLink("AR") {
//                                    PlaceholderView()
//
//                                }
//                                .buttonStyle(ProductDescriptionButton())
//                                .fontWeight(.bold)
//                                .frame(maxWidth: .infinity)
                                
                                Button(action: dataStore.placeHolderFunc) {
                                    HStack {
                                        Image(systemName: "text.quote")
                                        Text("Description")
                                    }
                                    
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity)
                                    
                                }
                                .buttonStyle(ProductDescriptionButton())
                                Button(action: dataStore.placeHolderFunc) {
                                    HStack{
                                        Image(systemName: "arkit")
                                        Text("View in AR")
                                    }
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity)
                                }
                                .buttonStyle(ProductDescriptionButton())
                                
                            }
                        }
                        .padding(.horizontal)
                        
                        
                        
                        
                        
                        
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
                            List {
                                HStack {
                                    Image(systemName: "questionmark.bubble.fill").foregroundColor(Color.yellow)
                                        .padding(.vertical, 12.0)
                                        .padding(/*@START_MENU_TOKEN@*/.trailing, 6.0/*@END_MENU_TOKEN@*/)
                                        
                                    NavigationLink("Questions", destination: PlaceholderView())
                                        .bold()
                                        
                                }
                                
                                HStack {
                                    Image(systemName: "newspaper.fill")
                                        .foregroundColor(Color.yellow)
                                        .padding(.vertical, 12.0)
                                        .padding(/*@START_MENU_TOKEN@*/.trailing, 6.0/*@END_MENU_TOKEN@*/)
                                        
                                        
                                    NavigationLink("Reviews", destination: PlaceholderView())
                                        .bold()
                                }
                                
                            }
                            .listStyle(.automatic)
                        }
                        .frame(height: 480.0)
                           
                    }
                    
                }
                
                VStack { // Available, Ships:, Add To Cart
                    Spacer()
                    ZStack {
                        VStack(alignment: .leading) {
                            

                            VStack(alignment: .leading) {
                                Text("Available")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .padding(.bottom, 1.0)
                                
                                Text("Free Shipping: Nov 10th")
                                    .font(.subheadline)
                            }
                            .padding(.bottom)

                            Button(action: dataStore.placeHolderFunc) {
                                HStack {
                                    Image(systemName: "cart.fill")
                                    Text("Add to Cart")
                                }
                                
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity)
                                
                            }
                            
                            .buttonStyle(PrimaryButton())

                        }
                        
                        .padding()
                        .background(Blur())
                        .opacity(1)
                        

                    }.overlay(Rectangle().frame(width: nil, height: 0.5, alignment: .top).foregroundColor(Color.gray).opacity(0.5), alignment: .top)

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
            .sheet(isPresented: $showingSheet) {
                        InfoView()
            }
            
        }
        
        
        
        
        //        NavigationView() {
        //            ScrollView {
        //                VStack {
        //                    VStack(alignment: .leading) {
        //                        VStack(alignment: .leading) {
        //                            Text("AMAZON'S CHOICE")
        //                                .font(.caption2)
        //                                .fontWeight(.bold)
        //                                .foregroundColor(Color.gray)
        //                                .multilineTextAlignment(.leading)
        //                            Text("Xbox Series X")
        //                                .font(.title)
        //                                .fontWeight(.bold)
        //                                .multilineTextAlignment(.leading)
        //                                .padding(.vertical, 0.0)
        //                            HStack{
        //                                Image(systemName: "star.fill")
        //                                    .foregroundColor(Color.gray)
        //                                Image(systemName: "star.fill")
        //                                    .foregroundColor(Color.gray)
        //                                Image(systemName: "star.fill")
        //                                    .foregroundColor(Color.gray)
        //                                Image(systemName: "star.fill")
        //                                    .foregroundColor(Color.gray)
        //                                Image(systemName: "star")
        //                                    .foregroundColor(Color.gray)
        //                            }
        //                        }
        //
        //
        //                        HStack {
        //                            VStack(alignment: .leading) {
        //                                Text("499$")
        //                                    .font(.largeTitle)
        //                                HStack {
        //                                    Text("549$")
        //                                        .font(.footnote)
        //                                        .foregroundColor(Color.gray)
        //                                        .strikethrough()
        //                                    Text("-9%")
        //                                        .font(.footnote)
        //                                        .foregroundColor(Color.green)
        //                                }
        //                            }
        //                            .padding(.vertical)
        //
        //                            Spacer()
        //
        //                            Button(action: dataStore.placeHolderFunc) {
        //                                Image(systemName: "info.circle")
        //                            }
        //                            .accentColor(.blue)
        //                        }
        //
        //                        HStack {
        //                            Button(action: dataStore.placeHolderFunc) {
        //                                Text("Description")
        //                                    .fontWeight(.bold)
        //                                    .frame(maxWidth: .infinity)
        //                            }
        //                            .buttonStyle(ProductDescriptionButton())
        //                            Button(action: dataStore.placeHolderFunc) {
        //                                Text("AR")
        //                                    .fontWeight(.bold)
        //                                    .frame(maxWidth: .infinity)
        //                            }
        //                            .buttonStyle(ProductDescriptionButton())
        //
        //                        }
        //                        Form {
        //                            Section {
        //                                Picker("Storage", selection: $selectedStorage) {
        //                                    ForEach(storageOptions, id: \.self) {
        //                                        Text($0)
        //                                    }
        //                                }
        //                                .padding(0.0)
        //                                Picker("Color", selection: $selectedColor) {
        //                                    ForEach(colorOptions, id: \.self) {
        //                                        Text($0)
        //                                    }
        //                                }
        //                                .padding(0.0)
        //                            }
        //                        }
        //                    }
        //                    .padding(.horizontal, 20.0)
        //
        //                }
        //
        //            }
        //            .toolbar {
        //                ToolbarItem(placement: .navigationBarTrailing){
        //                    Button(action: dataStore.pushActivity){
        //                        Image(systemName: "heart")
        //                    }
        //                }
        //                ToolbarItem(placement: .navigationBarTrailing){
        //                    Button(action: dataStore.pushActivity){
        //                        Image(systemName: "square.and.arrow.up")
        //                    }
        //                }
        //            }
        //
        //
        //        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
            .environmentObject(DataStore())
    }
}

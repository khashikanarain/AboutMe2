//
//  ContentView.swift
//  AboutMe2
//

//

import SwiftUI

struct AboutMeView: View {
    var body: some View {
        VStack {
            // Title displaying your name
            Text("Your Name")
                .font(.largeTitle)
                .bold()
                .padding()
                .foregroundColor(.blue) // Customize text color
            
            Spacer()
            
            // Fun facts with images
            ForEach(FunFact.allCases, id: \.self) { fact in
                FunFactView(fact: fact)
                    .padding(.bottom, 20)
                    .transition(.slide)
                    .animation(.easeInOut(duration: 0.5)) // Add slide animation
            }
            
            Spacer()
        }
        .background(Color.white.edgesIgnoringSafeArea(.all)) // Customize background color
    }
}

struct FunFactView: View {
    let fact: FunFact
    @State private var showDetails = false
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: fact.imageName) // Replace with your image name
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .padding()
                    .background(Color.blue.opacity(0.2))
                    .clipShape(Circle())
                    .onTapGesture {
                        withAnimation {
                            showDetails.toggle()
                        }
                    }
                
                Text(fact.rawValue)
                    .font(.title2)
                    .foregroundColor(.blue) // Customize text color
                    .onTapGesture {
                        withAnimation {
                            showDetails.toggle()
                        }
                    }
                
                Spacer()
            }
            
            if showDetails {
                Text(fact.detail)
                    .font(.body)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 0.5)) // Add opacity animation
            }
        }
        .padding(.horizontal)
    }
}

enum FunFact: String, CaseIterable {
    case fact1 = "I love coding"
    case fact2 = "I enjoy hiking"
    case fact3 = "I'm a foodie"
    
    var imageName: String {
        switch self {
        case .fact1:
            return "laptopcomputer" // Replace with your image name
        case .fact2:
            return "leaf" // Replace with your image name
        case .fact3:
            return "fork.knife" // Replace with your image name
        }
    }
    
    var detail: String {
        switch self {
        case .fact1:
            return "I spend a lot of time coding and building new apps. It's my passion!"
        case .fact2:
            return "I love exploring new trails and enjoying the beauty of nature."
        case .fact3:
            return "Trying out new cuisines and discovering unique flavors is my hobby."
        }
    }
}

struct AboutMeView_Previews: PreviewProvider {
    static var previews: some View {
        AboutMeView()
    }
}


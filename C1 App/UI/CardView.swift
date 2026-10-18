//
//  CardView.swift
//  C1 App
//
//  Created by Noor Akhnafal Aban on 22/04/26.
//

import SwiftUI

struct CardView: View {
    let imageName: String
    let title: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 320)
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.white)
                .padding(.horizontal, 25)
        }
        .padding(.top, 30)
        .padding(.vertical, 30)
        .padding(.bottom, 15)
        .background(.black)
        .cornerRadius(50)
        .frame(width:300, height:500)
    }
}

struct FeatureCard: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let route: AnyView
}

#Preview {
    CardView(imageName: "Heart Rate", title: "fsdf")
}

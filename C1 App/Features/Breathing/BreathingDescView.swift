//
//  BreathingDescView.swift
//  C1 App
//
//  Created by Noor Akhnafal Aban on 22/04/26.
//

import SwiftUI

struct BreathingDescView: View {
    
    @State private var showBreathing = false
    
    var body: some View {
        VStack {
            VStack() {
                Text("Try Breathing")
                    .font(.system(size: 40, weight: .black, design: .rounded))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                VStack {
                    Text("4 - 7 - 8")
                        .font(.system(size: 50))
                        .padding(20)
                }
                .background(.black)
                .cornerRadius(20)
            }
            .foregroundStyle(.white)
            .padding(.horizontal, 24)
            .padding(.vertical, 32)
            .multilineTextAlignment(.leading)
            .fontWeight(.bold)
            
            // MARK: Button
            Button {
                showBreathing = true
            } label: {
                Text("Let's Begin!")
                    .padding(20)
            }
            
            .font(.system(size: 30, weight: .black, design: .rounded))
            .foregroundStyle(.white)
            .background(.pink)
            .cornerRadius(20)
            
            Spacer()
            ZStack {
                Image("BreathingPerson")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .position(x:200, y:300)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("mainBackground"))
        .fullScreenCover(isPresented: $showBreathing) {
            BreathingStartPointView()
                .interactiveDismissDisabled(true)
        }
    }
}

#Preview {
    BreathingDescView()
}

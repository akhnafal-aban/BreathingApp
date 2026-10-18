//
//  BreathingStartPointView.swift
//  C1 App
//
//  Created by Noor Akhnafal Aban on 22/04/26.
// 

import SwiftUI
internal import Combine

struct BreathingStartPointView: View {
    @State private var startCountDown: Int = 3
    @State private var isFinished = false
    @State private var scale: CGFloat = 1.0
    @State private var showNext = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            if !isFinished {
                Text("\(startCountDown)")
                    .font(.system(size: 200, weight: .black, design: .rounded))
                    .foregroundStyle(.white)
            } else {
                Text("Let's Go!")
                    .font(.system(size: 50, weight: .black, design: .rounded))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .scaleEffect(scale)
                    .onAppear {
                        withAnimation(.easeOut(duration: 0.8)) {
                            scale = 1.5
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            showNext = true
                        }
                    }

            }
        }
        .onReceive(timer) { _ in
            if startCountDown > 1 {
                startCountDown -= 1
            } else {
                isFinished = true
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("mainBackground"))
        .fullScreenCover(isPresented: $showNext) {
            BreathingGuidingView()
                .interactiveDismissDisabled(true)
        }
   }
}

#Preview {
    BreathingStartPointView()
}

//
//  BreathingGuidingView.swift
//  C1 App
//
//  Created by Noor Akhnafal Aban on 22/04/26.
//

import SwiftUI
internal import Combine

struct BreathingGuidingView: View {
    @State private var startCountDown: Int = 2
    @State private var isFinished = false
    @State private var showNext = false
    @State private var onPart: Int = 1
    @State private var cycleCount = 0
    let maxCycle = 1
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            // MARK: CASE
            VStack {
                if onPart == 1 {
                    Text("Inhale..")
                        .font(.system(size: 50, weight: .black, design: .rounded))
                        .foregroundStyle(.white)
                } else if onPart == 2 {
                    Text("Hold..")
                        .font(.system(size: 50, weight: .black, design: .rounded))
                        .foregroundStyle(.white)
                } else if onPart == 3 {
                    Text("Exhale..")
                        .font(.system(size: 50, weight: .black, design: .rounded))
                        .foregroundStyle(.white)
                } else if onPart == 4 {
                    Text("")
                        .font(.system(size: 50, weight: .black, design: .rounded))
                        .foregroundStyle(.white)
                }
            }
            .padding(.top, 70)
            Spacer()
            
            // MARK: Countdown
            VStack {
                if onPart <= 3 && isFinished == false {
                    Text("\(startCountDown)")
                        .font(.system(size: 200, weight: .black, design: .rounded))
                        .foregroundStyle(.white)
                } else if isFinished == true {
                    Text("Welldone!")
                        .font(.system(size: 200, weight: .black, design: .rounded))
                        .foregroundStyle(.white)
                }
            }
            Spacer()
        }
        .onReceive(timer) { _ in
            if startCountDown > 1 {
                startCountDown -= 1
            } else {
                if onPart < 4 {
                    onPart += 1
                } else {
                    cycleCount += 1
                    
                    if cycleCount == maxCycle {
                        isFinished = true
                        return
                    }
                }
                switch onPart {
                    case 1:
                        startCountDown = 2
                    case 2:
                        startCountDown = 2
                    case 3:
                        startCountDown = 2
                    case 4:
                        startCountDown = 5
                    default:
                        break
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("mainBackground"))
        .fullScreenCover(isPresented: $isFinished) {
            MainView()
        }
    }
}

#Preview {
    BreathingGuidingView()
}


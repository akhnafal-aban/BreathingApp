//
//  MainView.swift
//  C1 App
//
//  Created by Noor Akhnafal Aban on 21/04/26.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedFeature: FeatureCard? = nil
    
    let featureCard: [FeatureCard] = [
        FeatureCard(imageName: "Heart Rate", title: "Are you feels like deg-deg-an?", route: AnyView(BreathingDescView())),
        FeatureCard(imageName: "Wavy", title: "Are you feels like you need calm?", route: AnyView(SoothingMusicView())),
        FeatureCard(imageName: "Wong Strict", title: "Are you feels like Kaku beut badan lu?", route: AnyView(MovementView()))
    ]

    var body: some View {
        VStack {
            VStack {
                // MARK: Tittle
                Spacer()
                VStack {
                    Text("How Do You Feel?")
                        .font(.system(size: 50, weight: .black, design: .rounded))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color.white)
                        .padding(.top, 50)
                }
                Spacer()
                
                // MARK: Feature's Card
                TabView {
                    ForEach(featureCard) { feature in
                        Button {
                            selectedFeature = feature
                        } label: {
                            CardView(
                                imageName: feature.imageName,
                                title: feature.title
                            )
                        }
                    }
                }
                .tabViewStyle(.page)
                .sheet(item: $selectedFeature) { feature in
                    feature.route
                        .presentationDetents([.large])
                        .presentationBackground(.black)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("mainBackground"))
        }
    }

}

#Preview {
    MainView()
}

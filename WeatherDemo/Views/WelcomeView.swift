//
//  WelcomeView.swift
//  WeatherDemo
//
//  Created by John Shirey on 8/29/24.
//

import SwiftUI
import CoreLocationUI
struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        VStack {
            VStack (spacing: 20) {
                Text("Welcome to Climate Change")
                    .bold()
                    .font(.title)
                
                Text("Get Location Based Weather Data Here")
                    .font(.subheadline)
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)

    }
}

#Preview {
    WelcomeView()
}

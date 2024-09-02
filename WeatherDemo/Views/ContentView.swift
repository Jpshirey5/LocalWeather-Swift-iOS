//
//  ContentView.swift
//  WeatherDemo
//
//  Created by John Shirey on 8/29/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(longitude: location.longitude, latitude: location.latitude)
                            } catch {
                                print("Error getting Weather: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .padding()
        .background(.black)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}

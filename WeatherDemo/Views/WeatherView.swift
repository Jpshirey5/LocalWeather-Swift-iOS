//
//  WeatherView.swift
//  WeatherDemo
//
//  Created by John Shirey on 8/30/24.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            // City Name and Date at the top
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                // Fetched Weather Data from the API
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "cloud")
                                .font(.system(size: 65))
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike
                            .roundDouble() + "°")
                        .font(.system(size: 85))
                        .fontWeight(.bold)
                        .padding()
                    }
                    
                    Spacer()
                        .frame(height: 30)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_1280.png")) {image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather Now")
                        .bold()
                        .padding(.bottom)
                    HStack{
                        WeatherRow(logo: "thermometer.low", name: "Min Temp", value: weather.main.tempMin.roundDouble() + "°")
                        Spacer()
                        WeatherRow(logo: "thermometer.high", name: "Max Temp", value: weather.main.tempMax.roundDouble() + "°")
                    }
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind Speed", value: weather.wind.speed.roundDouble() + "m/s")
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: weather.main.humidity.roundDouble() + "%")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
    
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color.black)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}

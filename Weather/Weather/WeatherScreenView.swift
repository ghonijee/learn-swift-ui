//
//  ContentView.swift
//  Weather
//
//  Created by Ahmad Yunus Afghoni on 09/03/24.
//

import SwiftUI

struct DailyWeatherModel {
    var day: String
    var image: String
    var temperature: Int
}

struct WeatherScreenView: View {
    @State var isNight: Bool = false
    @State var data: Array = [
        DailyWeatherModel(day: "MON", image: "cloud.sun.fill", temperature: 29),
        DailyWeatherModel(day: "THE", image: "cloud.sun.fill", temperature: 32),
        DailyWeatherModel(day: "TUE", image: "cloud.sun.fill", temperature: 27),
        DailyWeatherModel(day: "WED", image: "cloud.sun.fill", temperature: 28),
        DailyWeatherModel(day: "FRI", image: "cloud.sun.fill", temperature: 33),
        DailyWeatherModel(day: "SUN", image: "cloud.sun.fill", temperature: 26)
    ]
    var body: some View {
            VStack{
                Text("Kepanjen, Malang")
                    .font(.system(size: 28, weight: .medium, design: .default))
                    .foregroundStyle(.white)
                    .padding()
                VStack(alignment: .center, spacing: 8){
                    
                    Image(systemName: isNight ? "moon.fill" :"cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("76˚")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundStyle(.white)
                }
                Spacer()
                HStack(spacing: 20){
                    ForEach(data, id: \.day){ item in
                        DailyWeather(dayOfWeek: item.day, imageName: item.image, temperature: item.temperature)
                    }
                    
                }
                Spacer()
                Button{
                    isNight.toggle()
                }
                label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(12.0)
                }
                Spacer()
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(isNight ? Gradient(colors: [.black,.black, .gray]): Gradient(colors: [.blue,.blue, .white]))
    }
}

#Preview {
    WeatherScreenView()
}

struct DailyWeather: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack(alignment:.center){
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(.white)
            
            Image(systemName:imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)˚")
                .font(.system(size: 24, weight: .medium, design: .default))
                .foregroundStyle(.white)
        }
    }
}

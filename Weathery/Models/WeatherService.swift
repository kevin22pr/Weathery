//
//  WeatherService.swift
//  Weathery
//
//  Created by Kevin Flores Alvarez on 5/27/19.
//  Copyright © 2019 Kevin Flores Alvarez. All rights reserved.
//

import Foundation
import CoreLocation


class WeatherService {
    
    var openWeatherData = OpenWeatherDatasource()
    
    func fetchWeather(lat: String, lon: String) -> [WeatherObject] {
        
        var weatherObjectArray: [WeatherObject] = []
        
        let tokyo = openWeatherData.getWeatherData(city: "Tokyo")
        let london = openWeatherData.getWeatherData(city: "London")
        let current = openWeatherData.getWeatherData(lat: lat, lon: lon);
        
        weatherObjectArray.append(tokyo)
        weatherObjectArray.append(london)
        weatherObjectArray.append(current)
        
        return weatherObjectArray
        
    }
}

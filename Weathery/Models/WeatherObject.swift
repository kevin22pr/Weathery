//
//  WeatherObject.swift
//  Weathery
//
//  Created by Kevin Flores Alvarez on 5/27/19.
//  Copyright © 2019 Kevin Flores Alvarez. All rights reserved.
//

import Foundation
import Alamofire

class WeatherObject {
    
    var city:                   String
    var country:                String
    var temperature:            Double
    var weatherIcon:            String
    var cloudPercentage:        Double
    var windSpeed:              Double
    var windDirection:          Double

    
    init(city: String, country: String, temperature: Double, weatherIcon: String, cloudPercentage: Double, windSpeed: Double, windDirection: Double){
        
        self.city               = city
        self.country            = country
        self.temperature        = temperature
        self.weatherIcon        = weatherIcon
        self.cloudPercentage    = cloudPercentage
        self.windSpeed          = windSpeed
        self.windDirection      = windDirection
        
    }
    
   
    
}

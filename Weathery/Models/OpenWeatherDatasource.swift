//
//  OpenWeatherDatasource.swift
//  Weathery
//
//  Created by Kevin Flores Alvarez on 5/27/19.
//  Copyright © 2019 Kevin Flores Alvarez. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum Error: Swift.Error {
    case requestFailed
}
class OpenWeatherDatasource {
    
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    
    let APP_ID = "bb199454269b4359a4ebf6aec96eb826"
  
    var weatherForCities: [WeatherObject] = []
    
    func getWeatherData(lat: String, lon: String) -> WeatherObject {

        let params: [String: String] = ["lat": lat, "lon": lon, "appid" : APP_ID]
        return transformJson2WO(json: makeWeatherRequest(parameters: params))
 
    } //End of GetWeatherData Function
    
    func getWeatherData( city:String) -> WeatherObject {
        
        let paramsCity: [String: String] = ["q" : city, "appid" : self.APP_ID]
        return transformJson2WO(json: makeWeatherRequest(parameters: paramsCity))
        
   
    } //End of GetWeatherData Function
    
    func transformJson2WO(json: JSON) -> WeatherObject {
        let city = WeatherObject( city:             json["name"].stringValue,
                                  country:          json["sys"]["country"].stringValue,
                                  temperature:      json["main"]["temp"].doubleValue,
                                  weatherIcon:      json["weather"][0]["icon"].stringValue,
                                  cloudPercentage:  json["clouds"]["all"].doubleValue,
                                  windSpeed:        json["wind"]["speed"].doubleValue,
                                  windDirection:    json["wind"]["deg"].doubleValue
        )
        return city
    }
    
    func makeWeatherRequest(parameters: [String: String]) -> JSON {
        
        var weatherJSONObject: JSON = ""
        
        Alamofire.request(self.WEATHER_URL, method: .get, parameters: parameters).responseJSON {
            response in
            if response.result.isSuccess {
                print("Success! Got weather data")
                weatherJSONObject = JSON(response.result.value!)
                print(weatherJSONObject)
            } else {
                print("Error: \(String(describing: response.result.error))")
                
            }
        }
        return weatherJSONObject
    }
}

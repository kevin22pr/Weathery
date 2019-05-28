//
//  WeatherCell.swift
//  Weathery
//
//  Created by Kevin Flores Alvarez on 5/27/19.
//  Copyright © 2019 Kevin Flores Alvarez. All rights reserved.
//

import UIKit
import Alamofire

class WeatherCell: UITableViewCell {

    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    
    
    let WEATHER_ICON = "http://openweathermap.org/img/w/"
    
    func setCell(weatherObject: WeatherObject){
        
        cityLabel.text = weatherObject.city
        countryLabel.text = weatherObject.country
        tempLabel.text = "\(weatherObject.temperature)"
        getImage(iconName: weatherObject.weatherIcon)
        
    }
    
    func getImage(iconName: String) {
        let iconFullURL = WEATHER_ICON + iconName + ".png"
        Alamofire.request(iconFullURL, method: .get).responseData {
            response in
                self.weatherIcon.image = UIImage(data: response.result.value!)
        }
    }
}

//
//  ViewController.swift
//  Weathery
//
//  Created by Kevin Flores Alvarez on 5/27/19.
//  Copyright © 2019 Kevin Flores Alvarez. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    var weatherForCities: [WeatherObject] = []
    var weatherServiceObject = WeatherService()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }

    
    //Write the didUpdateLocations method here:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            
            print("longitude = \(location.coordinate.longitude), latitude = \(location.coordinate.latitude)")
            weatherForCities = weatherServiceObject.fetchWeather(lat: latitude, lon: longitude)
            self.tableView.reloadData()
        }
    }
    
    //Write the didFailWithError method here:
    private func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailViewIdentifier" {
//            let destinationVC = segue.destination as! DetailViewController
        }
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherForCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cities = weatherForCities[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell") as! WeatherCell
        
        cell.setCell(weatherObject: cities)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title: String = "Location"
        return title
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let row = weatherForCities[indexPath.row]
        
    }
}



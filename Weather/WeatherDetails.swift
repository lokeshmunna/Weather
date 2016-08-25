//
//  WeatherDetails.swift
//  Weather
//
//  Created by Vinay Kumar Darna on 23/08/16.
//  Copyright © 2016 iSecurePayments. All rights reserved.
//

import UIKit
import Alamofire

class WeatherDetails {
    
    
    var _CurrentTemp :Double!
    var _CurrentWeatherType :String!
    var _CurrentDate :String!
    var _CurrentLocation :String!
    
    var location: String {
        
        if _CurrentLocation == nil {
            
            _CurrentLocation = "Error"
        }
        
        print("***************************** \(_CurrentLocation)")
        return _CurrentLocation
        
    }
    
    var temperature: Double {
        
        if  _CurrentTemp == nil {
            
            
            _CurrentTemp = 0.0
            
        }
        return _CurrentTemp

        
    }
    
    var weatherType: String {
        
        if _CurrentWeatherType == nil {
            _CurrentWeatherType = "Error"
        }
        
        return _CurrentWeatherType
    }
    
    var date: String {
        
        if _CurrentDate == nil {
            _CurrentDate = "ERROR"
        }
        
        //         let dataAsString = "Wednesday, 17 Aug"
        let dateformatter = NSDateFormatter()
        dateformatter.dateStyle = .MediumStyle
        dateformatter.timeStyle = .NoStyle
        let currentdate = dateformatter.stringFromDate(NSDate())
        self._CurrentDate = "\(currentdate)"
        return _CurrentDate
    }

    func downloadWeatherURL (completed: DownloadComplted) {
        
        let currentWeatherURL = NSURL(string: CurrentWeatherAPI)!
        
        Alamofire.request(.GET, currentWeatherURL).responseJSON { response in
            
            let result = response.result
            
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    
                   self._CurrentLocation = name
                    
                    print(self._CurrentLocation)
                    
                    
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    
                    if let weathertype = weather[0]["main"] as? String {
                        
                        self._CurrentWeatherType = weathertype
                        
                        print(self._CurrentWeatherType)
                        
                    }
                    
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    
                    if let currentTemparature = main["temp"] as? Double {
                        
                        let kelvintoFarnheatpreDividsion = (currentTemparature * (9/5) - 459.67)
                        
                        let kelvinToFarenheat = Double(round(10 * kelvintoFarnheatpreDividsion/10))
                        
                        self._CurrentTemp = kelvinToFarenheat
                        
                        print(self._CurrentTemp)
                        
                    }
                }
            }
        
            completed()
        }
        
    }
    
    
    
}

//
//  Constants.swift
//  Weather
//
//  Created by Vinay Kumar Darna on 18/08/16.
//  Copyright © 2016 iSecurePayments. All rights reserved.
//

import Foundation


let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"

let Latitude = "lat=17.385044"

let Longitude = "&lon=78.486671"

let APPIDKEY = "&appid=b7935d363600a8185b675c85d606dd02"

typealias DownloadComplted = () -> ()

let CurrentWeatherAPI = "\(BASE_URL)\(Latitude)\(Longitude)\(APPIDKEY)"










//
//  ViewController.swift
//  Weather
//
//  Created by Vinay Kumar Darna on 17/08/16.
//  Copyright © 2016 iSecurePayments. All rights reserved.
//

import UIKit


class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var tempTypeImage: UIImageView!
    @IBOutlet var tempConditionLabel: UILabel!
    @IBOutlet var tabelView: UITableView!
    
    
    var weatherDetailscls: WeatherDetails!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabelView.delegate = self
        tabelView.dataSource = self
        
        print(CurrentWeatherAPI)
                
        
        weatherDetailscls = WeatherDetails()
        
        
        weatherDetailscls.downloadWeatherURL{
            
         self.updatingUI()
            
        }
        
        
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)
        
        return cell
        
    }
    
    func updatingUI() {
        
        
        self.dateLabel.text = weatherDetailscls.date
         print("today date is \(weatherDetailscls.date)")
        
        self.temperatureLabel.text = "\(weatherDetailscls.temperature)"
        
        
        self.locationLabel.text = weatherDetailscls.location
        print("Location is \(weatherDetailscls.location)")
        
        self.tempConditionLabel.text = weatherDetailscls.weatherType
        
        
        
        self.tempTypeImage.image = UIImage(named:weatherDetailscls.weatherType)
        
        
        
    }
    

}


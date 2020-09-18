//
//  InterfaceController.swift
//  WatchOSOnly-RESTAPI WatchKit Extension
//
//  Created by Tatsuya Moriguchi on 9/18/20.
//  Copyright © 2020 Tatsuya Moriguchi. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    let selectedCountry = "United States of America"
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
              let url = GlobalData().url
               getData(from: url)
        
        print("REST API endpont: \(url)")
        
        
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    private func getData(from url: String) {

        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            
            guard let data = data, error == nil else {
                print("Something went wrong.")
                return
            }
            
            // Get and decode data
            var result: Response?
            
            do {
                result = try JSONDecoder().decode(Response.self, from: data)
                
                DispatchQueue.main.async {

                    if let globalDataDate = result?.Date {
                                                
                      let globalDataDateIntFormatted = Convert().convertDateFormatter(date: globalDataDate)
                        //self.GlobalDataDateLabel.text = globalDataDateIntFormatted
                        print (globalDataDateIntFormatted)
                        
                    } else { print("Unable to convert Int to String")}

                    if let globalNewConfirmedInt = result?.Global.NewConfirmed {
                        
                        let globalNewConfirmedIntFormatted = Convert().decimalInLocale(input: globalNewConfirmedInt)
                        //self.GlobalNewConfirmedDataLabel.text = globalNewConfirmedIntFormatted
                        print("Global Newly Confirmed: \(globalNewConfirmedIntFormatted)")
                        
                    } else { print("Unable to convert Int to String")}

                    if let globalTotalConfirmedInt = result?.Global.TotalConfirmed {
                        let globalTotalConfirmedIntFormatted = Convert().decimalInLocale(input: globalTotalConfirmedInt)
                        //self.GlobalTotalConfirmedDataLabel.text = globalTotalConfirmedIntFormatted
                        print("Global Total Confirmed: \(globalTotalConfirmedIntFormatted)")
                    } else { print("Unable to convert Int to String")}

                    if let globalNewDeathsInt = result?.Global.NewDeaths {
                        let globalNewDeathsIntFormatted = Convert().decimalInLocale(input: globalNewDeathsInt)
                        //self.GlobalDeathsDataLabel.text = globalNewDeathsIntFormatted
                        print("Global New Deaths: \(globalNewDeathsIntFormatted)")
                    } else { print("Unable to convert Int to String")}

                    if let globalTotalDeathsInt = result?.Global.TotalDeaths {
                        let globalTotalDeathsIntFormatted = Convert().decimalInLocale(input: globalTotalDeathsInt)
                    //self.GlobalTotalDeathsDataLabel.text = globalTotalDeathsIntFormatted
                        print("Global Total Deaths: \(globalTotalDeathsIntFormatted)")
                        
                    } else { print("Unable to convert Int to String")}
                    
                    if let globalTotalDeathsInt = result?.Global.TotalDeaths, let globalTotalConfirmedInt = result?.Global.TotalConfirmed {
                        let globalDeathRateString = Convert().decimal2Percentage(numerator: globalTotalDeathsInt, denominator: globalTotalConfirmedInt)
                        //self.GlobalDeathRateDataLabel.text = globalDeathRateString
                        print("Global Death Rate: \(globalDeathRateString)")
                    }
                    

                    if let globalNewRecoveredInt = result?.Global.NewRecovered {
                        let globalNewRecoveredIntFormatted = Convert().decimalInLocale(input: globalNewRecoveredInt)
                        //self.GlobalNewRecoveredDataLabel.text = globalNewRecoveredIntFormatted
                        print("Global New Recovered: \(globalNewRecoveredIntFormatted)")
                    } else { print("Unable to convert Int to String")}

                    if let globalTotalRecoveredInt = result?.Global.TotalRecovered {
                        let globalTotalRecoveredIntFormatted = Convert().decimalInLocale(input: globalTotalRecoveredInt)
                        //self.GlobalTotalRecoveredDataLabel.text = globalTotalRecoveredIntFormatted
                        print("Global Total Recovered: \(globalTotalRecoveredIntFormatted)")
                    } else { print("Unable to convert Int to String")}
                    
                    if let globalTotalRecoveredInt = result?.Global.TotalRecovered, let globalTotalConfirmedInt = result?.Global.TotalConfirmed {
                        let globalRecoveredRateString = Convert().decimal2Percentage(numerator: globalTotalRecoveredInt, denominator: globalTotalConfirmedInt)
                        //self.GlobalRecoveredRateDataLabel.text = globalRecoveredRateString
                        print("Global Total Recovered Rate: \(globalRecoveredRateString)")
                        
                    } else { print("Unable to cnvert Int to String")}
                    
                    
                    // Unwrap Optional Array
                    if let countries = result?.Countries {
                        for country in countries {
                            if country.Country == self.selectedCountry {
//                                print("I got you")
//                                print(country.Country)
//                                self.CountryNameLabel.text = country.Country
//                                self.CountryDataDateLabel.text = Convert().convertDateFormatter(date: country.Date)
//                                self.CountryDeathsDataLabel.text = Convert().decimalInLocale(input: country.NewDeaths)
//                                self.CountryTotalDeathsDataLabel.text = Convert().decimalInLocale(input: country.TotalDeaths)
//                                self.CountryDeathRateDataLabel.text = Convert().decimal2Percentage(numerator: country.TotalDeaths, denominator: country.TotalConfirmed)
//                                self.CountryNewConfirmedDataLabel.text = Convert().decimalInLocale(input: country.NewConfirmed)
//                                self.CountryTotalConfirmedDataLabel.text = Convert().decimalInLocale(input: country.TotalConfirmed)
//                                self.CountryNewRecoveredDataLabel.text = Convert().decimalInLocale(input: country.NewRecovered)
//                                self.CountryTotalRecoveredDataLabel.text = Convert().decimalInLocale(input: country.TotalRecovered)
//                                self.CountryRecoveredRateDataLabel.text = Convert().decimal2Percentage(numerator: country.TotalRecovered, denominator: country.TotalConfirmed)

                                print("Country Data: \(self.selectedCountry)")
                                print("Date: \(Convert().convertDateFormatter(date: country.Date))")
                                print("New Deaths: \(Convert().decimalInLocale(input: country.NewDeaths))")
                                print("Total Deaths: \(Convert().decimalInLocale(input: country.TotalDeaths))")
                                print("Death Rate: \(Convert().decimal2Percentage(numerator: country.TotalDeaths, denominator: country.TotalConfirmed))")
                                print("New Confirmed: \(Convert().decimalInLocale(input: country.NewConfirmed))")
                                print("Total Confirmed: \(Convert().decimalInLocale(input: country.TotalConfirmed))")
                                print("New recovered: \(Convert().decimalInLocale(input: country.TotalConfirmed))")
                                print("Total Recovered: \(Convert().decimalInLocale(input: country.TotalRecovered))")
                                print("Recovered Rate: \(Convert().decimal2Percentage(numerator: country.TotalRecovered, denominator: country.TotalConfirmed))")


                            }
                        }
                    }
                
                } //DispatchQueue.main.async {

            } catch {
                print("Failed to convert. DashboardTableViewController \(error)")
            } //do {

        }) // let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {
        task.resume()

    } //private func getData(from url: String) {
    

}

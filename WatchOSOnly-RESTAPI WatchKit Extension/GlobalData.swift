//
//  GlobalData.swift
//  WatchOSOnly-RESTAPI WatchKit Extension
//
//  Created by Tatsuya Moriguchi on 9/18/20.
//  Copyright © 2020 Tatsuya Moriguchi. All rights reserved.
//

import Foundation

class GlobalData {

    let url = "https://api.covid19api.com/summary"

}


struct Response: Codable {
    var Countries: [CountryDictionary]
    let Date: String
    let Global: Global
}

struct Global: Codable {
    let NewConfirmed: Int
    let TotalConfirmed: Int
    let NewDeaths: Int
    let TotalDeaths: Int
    let NewRecovered: Int
    let TotalRecovered: Int
}

struct CountryDictionary: Codable {
    let Country: String
    let CountryCode: String
    let Slug: String
    let NewConfirmed: Int
    let TotalConfirmed: Int
    let NewDeaths: Int
    let TotalDeaths: Int
    let NewRecovered: Int
    let TotalRecovered: Int
    let Date: String
}

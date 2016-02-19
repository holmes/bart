//
//  Station.swift
//  Bart
//
//  Created by Jason Holmes on 2/10/16.
//  Copyright © 2016 Holmes. All rights reserved.
//

import Foundation
import SWXMLHash

/// 
/// You can get a list of stations at http://api.bart.gov/api/stn.aspx?cmd=stns&key=MW9S-E7SL-26DU-VV8V.
/// A simple station description:
/// <station>
///   <name>12th St. Oakland City Center</name>
///   <abbr>12TH</abbr>
///   <gtfs_latitude>37.803664</gtfs_latitude>
///   <gtfs_longitude>-122.271604</gtfs_longitude>
///   <address>1245 Broadway</address>
///   <city>Oakland</city>
///   <county>alameda</county>
///   <state>CA</state>
///   <zipcode>94612</zipcode>
/// </station>

public struct Station : XMLSerializable {
  let name: String
  let abbr: String
  let latitude: Double
  let longitude: Double
  let address: String
  let city: String
  let county: String
  let state: String
  let zipcode: String
  let northRouteIds: [String]
  let southRouteIds: [String]

    public init(node: XMLIndexer) throws {
        guard let name = node["name"].element?.text else {
            throw ModelError.BadXML(node)
        }

        self.name = name
        self.abbr = (node["abbr"].element?.text)!
        self.latitude = NSString(string: (node["gtfs_latitude"].element?.text)!).doubleValue
        self.longitude = NSString(string: (node["gtfs_longitude"].element?.text)!).doubleValue
        self.address = (node["address"].element?.text)!
        self.city = (node["city"].element?.text)!
        self.county = (node["county"].element?.text)!
        self.state = (node["state"].element?.text)!
        self.zipcode = (node["zipcode"].element?.text)!
        self.northRouteIds = []
        self.southRouteIds = []
    }
}

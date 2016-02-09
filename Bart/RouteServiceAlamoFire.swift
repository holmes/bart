//
//  RouteServiceAlamoFire.swift
//  Bart
//
//  Created by Jason Holmes on 2/8/16.
//  Copyright © 2016 Holmes. All rights reserved.
//

import Alamofire
import Foundation

public class RouteServiceAlamoFire : RouteService {
    func getRoutes() {
        Alamofire.request(.GET, "https://httpbin.org/get")
    }
}
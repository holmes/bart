//
//  RouteService.swift
//  Bart
//
//  Created by Jason Holmes on 2/8/16.
//  Copyright © 2016 Holmes. All rights reserved.
//

import RxSwift
import Foundation

protocol RouteService {
    func getRoutes() -> Observable<String>
}
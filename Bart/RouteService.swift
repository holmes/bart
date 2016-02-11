//
//  RouteService.swift
//  Bart
//
//  Created by Jason Holmes on 2/8/16.
//  Copyright © 2016 Holmes. All rights reserved.
//

import Foundation
import RxSwift

protocol RouteService {
  func getRoutes() -> Observable<String>
}

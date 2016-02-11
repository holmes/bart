//
//  StationService.swift
//  Bart
//
//  Created by Jason Holmes on 2/10/16.
//  Copyright © 2016 Holmes. All rights reserved.
//

import Foundation
import RxSwift

protocol StationService {
  func getStations() -> Observable<[Station]>
}

//
//  StationManager.swift
//  Bart
//
//  Created by Jason Holmes on 2/10/16.
//  Copyright © 2016 Holmes. All rights reserved.
//

import Foundation
import RxSwift

public class StationManager {
  public typealias Stations = [Station]

  private let stationService: StationService
  private let stationsSubject: BehaviorSubject<Stations>

  public var stations: Observable<Stations> {
    return stationsSubject
  }

  init(stationService: StationService) {
    self.stationService = stationService
    self.stationsSubject = .init(value: [])
  }

  public func loadStations() {

  }

  public func getRoute(start: Station, end: Station) -> Route {
    fatalError("implement me")
  }
}

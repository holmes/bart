//
//  StationServiceAlamofire.swift
//  Bart
//
//  Created by Jason Holmes on 2/10/16.
//  Copyright © 2016 Holmes. All rights reserved.
//

import Alamofire
import Foundation
import RxSwift

public class StationServiceAlamofire: StationService {
  private static let STATIONS_URL = "http://api.bart.gov/api/stn.aspx";

  func getStations() -> Observable<[Station]> {
    let subject = PublishSubject<[Station]>()

    let parameters = [
      "cmd": "stns",
      "key": "MW9S-E7SL-26DU-VV8V",
    ]

    Alamofire
        .request(.GET, StationServiceAlamofire.STATIONS_URL, parameters: parameters)
        .responseArrayForKeyPath("root.stations.station") { (response: Response<[Station], NSError>) in
            let result = response.result

            if result.isSuccess {
                subject.onNext(response.result.value!)
            } else {
                subject.onError(result.error!)
            }
    }
    
    return subject
  }

}

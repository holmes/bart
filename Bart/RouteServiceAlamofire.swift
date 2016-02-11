//
//  RouteServiceAlamoFire.swift
//  Bart
//
//  Created by Jason Holmes on 2/8/16.
//  Copyright © 2016 Holmes. All rights reserved.
//

import Alamofire
import Foundation
import RxSwift

public class RouteServiceAlamofire : RouteService {

    func getRoutes() -> Observable<String> {
        let subject = PublishSubject<String>()

        Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["foo": "bar"])
            .responseString { response in
                subject.onNext(response.result.value!)
        }

        return subject
    }
}
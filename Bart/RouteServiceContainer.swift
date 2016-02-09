//
//  RouteServiceContainer.swift
//  Bart
//
//  Created by Jason Holmes on 2/8/16.
//  Copyright © 2016 Holmes. All rights reserved.
//

import Foundation
import Swinject

public class RouteServiceContainer {
    let container: Container

    init (parent: Container) {
        self.container = parent
    }

    func initialize() {
        container.register(RouteServiceAlamoFire.self) { _ in
            RouteServiceAlamoFire()
        }

        container.register(RouteService.self) { r in
            r.resolve(RouteServiceAlamoFire.self)!
        }
    }
}
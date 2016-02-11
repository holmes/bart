//
//  ServiceContainer.swift
//  Bart
//
//  Created by Jason Holmes on 2/8/16.
//  Copyright © 2016 Holmes. All rights reserved.
//

import Foundation
import Swinject

public class ServiceContainer {
    let container: Container

    init (parent: Container) {
        self.container = parent
    }

    func initialize() {
        // Routes.
        container.register(RouteServiceAlamofire.self) { _ in
            RouteServiceAlamofire()
        }
        container.register(RouteService.self) { r in
            r.resolve(RouteServiceAlamofire.self)!
        }

        // Stations.
        container.register(StationServiceAlamofire.self) { _ in
            StationServiceAlamofire()
        }
        container.register(StationService.self) { r in
            r.resolve(StationServiceAlamofire.self)!
        }
    }
}
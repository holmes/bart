//
//  RootContainer.swift
//  Bart
//
//  Created by Jason Holmes on 2/8/16.
//  Copyright © 2016 Holmes. All rights reserved.
//

import Foundation
import Swinject

public class RootContainer {
    let rootContainer: Container = Container()

    func initialize() -> Container {
        registerNetworkServices(rootContainer)

        rootContainer.register(StationManager.self) { r in
            let stationService = r.resolve(StationService.self)!
            return StationManager(stationService: stationService)
        }

        return rootContainer
    }

    private func registerNetworkServices(container: Container) {
        ServiceContainer(parent: rootContainer).initialize()
    }
}

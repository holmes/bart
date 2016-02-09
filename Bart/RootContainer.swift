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

    func initialize() {
        registerNetworkServices(rootContainer)
    }

    private func registerNetworkServices(container: Container) {
        RouteServiceContainer(parent: rootContainer).initialize()
    }
}

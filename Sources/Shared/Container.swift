//
//  Container.swift
//  WheelOfTasks
//
//  Created by Mikhaylov Aleksandr on 05.05.2025.
//

import Factory

extension Container {
    var wheelEngine: Factory<IWheelEngine> {
        self { WheelEngine() }
            .shared
    }
    
    var wheelRepository: Factory<IWheelRepository> {
        self { WheelRepository() }
            .singleton
    }
    
    var randomizeClient: Factory<IRandomizeClient> {
        self { RandomizeClient() }
            .shared
    }
}

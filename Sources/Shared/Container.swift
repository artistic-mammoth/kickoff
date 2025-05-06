// Copyright (C) 2025 Mikhaylov Aleksandr <github:artistic-mammoth>
// Created for kickoff

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
    }
    
    var userInputTool: Factory<IUserInputTool> {
        self { UserInputTool() }
    }
}

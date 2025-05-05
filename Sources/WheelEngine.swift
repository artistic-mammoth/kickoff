//
//  WheelEngine.swift
//  wheel-of-tasks
//
//  Created by Mikhaylov Aleksandr on 05.05.2025.
//

import Foundation

final class WheelEngine {
    private let randomizeClient: RandomizeClient
    private let wheelRepository: WheelRepository
    
    init(randomizeClient: RandomizeClient,
         wheelRepository: WheelRepository) {
        self.randomizeClient = randomizeClient
        self.wheelRepository = wheelRepository
    }
    
    func runWheel() async throws -> WheelOption {
        let options = await wheelRepository.get()
        let choosedOption = try await decide(from: options)
        
        return choosedOption
    }
}

private extension WheelEngine {
    func decide(from options: WheelOptions) async throws -> WheelOption {
        let choosedIndex = randomizeClient.calculateIndex(upto: options.count - 1)
        
        guard choosedIndex < options.count else {
            throw WheelOfTasksError.any
        }
        
        return options[choosedIndex]
    }
}

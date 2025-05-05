//
//  RandomizeClient.swift
//  wheel-of-tasks
//
//  Created by Mikhaylov Aleksandr on 05.05.2025.
//

protocol IRandomizeClient {
    func calculateIndex(upto max: Int) throws -> Int
    func calculate<T>(for elements: [RandomElement<T>]) throws -> T
}

struct RandomizeClient { }

extension RandomizeClient: IRandomizeClient {
    func calculateIndex(upto max: Int) throws -> Int {
        guard max != 0 else {
            throw WheelOfTasksError.any
        }
        
        return Int.random(in: 0..<max)
    }
    
    func calculate<T>(for elements: [RandomElement<T>]) throws -> T {
        var computedElements: [T] = []
        
        elements.forEach {
            computedElements.append(contentsOf: Array(repeating: $0.id, count: $0.weight))
        }
        
        let choosedIndex = try calculateIndex(upto: computedElements.endIndex)
        
        guard choosedIndex < computedElements.endIndex else {
            throw WheelOfTasksError.any
        }
        
        return computedElements[choosedIndex]
    }
}

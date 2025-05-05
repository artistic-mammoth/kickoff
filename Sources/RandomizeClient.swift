//
//  RandomizeClient.swift
//  wheel-of-tasks
//
//  Created by Mikhaylov Aleksandr on 05.05.2025.
//

import Foundation

struct RandomizeClient {
    func calculateIndex(upto max: Int) -> Int {
        Int.random(in: 0...max)
    }
}

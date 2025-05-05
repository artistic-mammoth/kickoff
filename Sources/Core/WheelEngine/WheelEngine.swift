//
//  WheelEngine.swift
//  wheel-of-tasks
//
//  Created by Mikhaylov Aleksandr on 05.05.2025.
//

import Factory

protocol IWheelEngine {
    func runWheel() async throws -> WheelOption
    func addOption(of type: String, _ option: String) async throws
    func printAll() async
}

final class WheelEngine {
    
    @Injected(\.randomizeClient) private var randomizeClient
    @Injected(\.wheelRepository) private var wheelRepository
}

extension WheelEngine: IWheelEngine {
    func runWheel() async throws -> WheelOption {
        let options = await wheelRepository.get()
        var choosedOption: WheelOption = .empty
        
        choosedOption = try await decide(from: options)
        
        return choosedOption
    }
    
    func addOption(of type: String, _ option: String) async throws {
        let cleanType = type
            .lowercased()
            .replacingOccurrences(of: " ", with: "")
        
        let type = WheelType(rawValue: cleanType)
        
        guard let type else {
            throw WheelOfTasksError.any
        }
        
        let option = WheelOption(
            name: option,
            type: type
        )
        
        try await wheelRepository.add(option)
    }
    
    func printAll() async {
        let all = await wheelRepository.get()
        all.forEach {
            print($0.type.readable, $0.name)
        }
    }
}

private extension WheelEngine {
    func decide(from options: WheelOptions) async throws -> WheelOption {
        let index = try randomizeClient
            .calculate(for: options
                .enumerated()
                .map {
                    RandomElement(id: $0.offset, weight: $0.element.type.weight)
                })
        
        return options[index]
    }
}

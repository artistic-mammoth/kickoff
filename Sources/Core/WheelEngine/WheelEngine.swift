// Copyright (C) 2025 Mikhaylov Aleksandr <github:artistic-mammoth>
// Created for kickoff

import Factory

protocol IWheelEngine {
    func spin() async throws -> WheelTask
}

final class WheelEngine {
    @Injected(\.randomizeClient) private var randomizeClient
    @Injected(\.wheelRepository) private var wheelRepository
}

extension WheelEngine: IWheelEngine {
    func spin() async throws -> WheelTask {
        let tasks = await wheelRepository.get()
        
        guard tasks.count > 1 else {
            throw KickOffError.any
        }
        
        let choosedTask = try await decide(from: tasks)
        return choosedTask
    }
}

private extension WheelEngine {
    func decide(from tasks: WheelTasks) async throws -> WheelTask {
        let index = try randomizeClient
            .calculate(for: tasks
                .enumerated()
                .map {
                    RandomElement(
                        id: $0.offset,
                        probability: $0.element.priority.weight
                    )
                })
        
        return tasks[index]
    }
}

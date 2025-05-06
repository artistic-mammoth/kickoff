// Copyright (C) 2025 Mikhaylov Aleksandr <github:artistic-mammoth>
// Created for kickoff

import Foundation
import Files

protocol IWheelRepository {
    func get() async -> WheelTasks
    func add(_ task: WheelTask) async throws
    func add(with name: String, of kind: WheelTask.Kind, priority: WheelTask.Priority) async throws
}

final actor WheelRepository {
    private var tasks: WheelTasks = []
    
    init() {
        // TODO: Make it safe
        SyncTask { [weak self] in
            await self?.loadFromDisk()
        }
    }
}

extension WheelRepository: IWheelRepository {
    func get() async -> WheelTasks {
        tasks
    }
    
    func add(_ task: WheelTask) async throws {
        tasks.append(task)
        try save()
    }
    
    func add(with name: String, of kind: WheelTask.Kind, priority: WheelTask.Priority) async throws {
        let task = WheelTask(
            name: name,
            kind: kind,
            priority: priority
        )
        
        try await add(task)
    }
}

private extension WheelRepository {
    func loadFromDisk() {
        do {
            try load(file: "")
        } catch {
            fatalError("Cannot parse saves")
        }
    }
    
    func load(file fileName: String) throws {
        let file = try getSaveFile()
        let decoder = JSONDecoder()
        
        do {
            let temp = try decoder.decode(WheelTasks.self, from: try file.read())
            self.tasks = temp
        } catch {
            // debugPrint("DEBUG: Cannot parse saves")
        }
    }
    
    func save() throws {
        let file = try getSaveFile()
        let encoder = JSONEncoder()
        
        let encoded = try encoder.encode(tasks)
        try file.write(encoded)
    }
    
    func getSaveFile() throws -> File {
        let folder = try Folder.home.createSubfolderIfNeeded(withName: ".kickoff")
        let file = try folder.createFileIfNeeded(withName: "save.json")
        return file
    }
}

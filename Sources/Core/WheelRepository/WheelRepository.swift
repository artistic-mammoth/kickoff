//
//  WheelRepository.swift
//  wheel-of-tasks
//
//  Created by Mikhaylov Aleksandr on 05.05.2025.
//

import Foundation
import Files

protocol IWheelRepository {
    func get() async -> WheelOptions
    func add(_ option: WheelOption) async throws
}

final actor WheelRepository {
    private var options: WheelOptions = []
    
    init() {
        // TODO: Make it safe
        SyncTask { [weak self] in
            await self?.loadFromDisk()
        }
    }
}

extension WheelRepository: IWheelRepository {
    func get() async -> WheelOptions {
        options
    }
    
    func add(_ option: WheelOption) async throws {
        options.append(option)
        try save()
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
            let temp = try decoder.decode(WheelOptions.self, from: try file.read())
            self.options = temp
        } catch {
            // debugPrint("DEBUG: Cannot parse saves")
        }
    }
    
    func save() throws {
        let file = try getSaveFile()
        let encoder = JSONEncoder()
        
        let encoded = try encoder.encode(options)
        try file.write(encoded)
    }
    
    func getSaveFile() throws -> File {
        let folder = try Folder.home.createSubfolderIfNeeded(withName: ".kickoff")
        let file = try folder.createFileIfNeeded(withName: "save.json")
        return file
    }
}

//
//  WheelRepository.swift
//  wheel-of-tasks
//
//  Created by Mikhaylov Aleksandr on 05.05.2025.
//

final actor WheelRepository {
    private var options: WheelOptions = []
    
    init() {
        options = Self.prepareRepo()
    }
    
    func get() async -> WheelOptions {
        options
    }
    
    func addNewOption(_ option: WheelOption) async {
        options.append(option)
    }
    
    static func prepareRepo() -> WheelOptions {
        var opt: WheelOptions = []
        (0...10).forEach {
            opt.append(WheelOption(name: "option \($0)"))
        }
        return opt
    }
}

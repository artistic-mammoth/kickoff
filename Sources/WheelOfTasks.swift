// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
//import ArgumentParser

@main
struct WheelOfTasks {
    static func main() async throws {
        let wheelEngine: WheelEngine = WheelEngine(
            randomizeClient: RandomizeClient(),
            wheelRepository: WheelRepository()
        )
        
        while true {
            try await Task.sleep(for: .seconds(1))
            
            let choosedOption = try await wheelEngine.runWheel()
            print(choosedOption.name)
        }
        
    }
}


//@main
//struct WheelOfTasks: AsyncParsableCommand {
//    
//    private let wheelEngine: WheelEngine
//    
//    init() {
//        self.wheelEngine = WheelEngine()
//    }
//    
//    public func run() async throws {
//        while true {
//            try? await Task.sleep(for: .milliseconds(500))
//            try await wheelEngine.runWheel()
//        }
//    }
//}
//
//private extension WheelOfTasks {
//    
//}

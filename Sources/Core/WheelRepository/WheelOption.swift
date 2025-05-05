//
//  WheelOption.swift
//  wheel-of-tasks
//
//  Created by Mikhaylov Aleksandr on 05.05.2025.
//

import ANSITerminal

typealias WheelOptions = [WheelOption]

struct WheelOption: Codable {
    let name: String
    let type: WheelType
}

extension WheelOption {
    static let empty: Self = WheelOption(
        name: "",
        type: .basic
    )
}

extension WheelOption {
    var readable: String {
        "TYPE: " + type.rawValue + " - " + name
    }
    
    func readableColored() {
        moveLineDown()
        write(type.readable.italic.green)
        write(": ".italic.green)
        write(name.bold.white)
        writeln()
    }
}

//
//  WheelOption.swift
//  wheel-of-tasks
//
//  Created by Mikhaylov Aleksandr on 05.05.2025.
//

import Rainbow

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
        type.readable.italic.green +
        ": ".italic.green +
        name.bold.white
    }
}

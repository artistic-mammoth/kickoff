//
//  Logger.swift
//  WheelOfTasks
//
//  Created by Mikhaylov Aleksandr on 05.05.2025.
//

import ANSITerminal

func writeError(_ error: String...) {
    clearLine()
    write(error.joined(separator: " ").bold.red)
    writeln()
    moveDown()
}

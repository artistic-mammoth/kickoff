// Copyright (C) 2025 Mikhaylov Aleksandr <github:artistic-mammoth>
// Created for kickoff

import ArgumentParser

@main
struct KickOff: AsyncParsableCommand {
    static let configuration: CommandConfiguration = CommandConfiguration(
        commandName: "kickoff",
        abstract: "Decide what to do next",
        version: "kickoff 1.0.0",
        subcommands: [
            WheelCommand.self,
            TasksCommand.self
        ],
        defaultSubcommand: WheelCommand.self
    )
}

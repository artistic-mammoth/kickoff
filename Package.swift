// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WheelOfTasks",
    platforms: [
        .macOS(.v15)
    ],
    dependencies: [
        // TODO: TRY
        // .package(url: "https://github.com/vapor/console-kit.git", from: "4.0.0"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
        .package(url: "https://github.com/johnsundell/files.git", from: "4.0.0"),
        .package(url: "https://github.com/pakLebah/ANSITerminal.git", exact: "0.0.3"),
        .package(url: "https://github.com/hmlongco/Factory.git", from: "2.0.0"),
    ],
    targets: [
        .executableTarget(
            name: "WheelOfTasks",
            dependencies: [
                // TODO: TRY
                // .product(name: "ConsoleKit", package: "console-kit"),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Files", package: "files"),
                "ANSITerminal",
                "Factory",
            ])
    ]
)

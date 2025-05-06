// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "kickoff",
    platforms: [
        .macOS(.v15)
    ],
    dependencies: [
        // TODO: TRY
        // .package(url: "https://github.com/vapor/console-kit.git", from: "4.0.0"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
        .package(url: "https://github.com/johnsundell/files.git", from: "4.0.0"),
        .package(url: "https://github.com/onevcat/Rainbow.git", from: "4.0.0"),
        .package(url: "https://github.com/hmlongco/Factory.git", from: "2.0.0"),
    ],
    targets: [
        .executableTarget(
            name: "kickoff",
            dependencies: [
                // TODO: TRY
                // .product(name: "ConsoleKit", package: "console-kit"),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Files", package: "files"),
                "Rainbow",
                "Factory",
            ])
    ]
)

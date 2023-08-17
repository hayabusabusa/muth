// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Package",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "AppFeature",
            targets: ["AppFeature"]),
        .library(
            name: "Theory",
            targets: ["Theory"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AppFeature",
            dependencies: [
                "PuzzleFeature",
                "Shared",
            ],
            path: "./Sources/Features/AppFeature"),
        .target(
            name: "PuzzleFeature",
            dependencies: [
                "Shared",
                "Theory",
            ],
            path: "./Sources/Features/PuzzleFeature"),
        .target(
            name: "Shared",
            dependencies: []),
        .target(
            name: "Theory",
            dependencies: []),
        .testTarget(
            name: "TheoryTests",
            dependencies: ["Theory"]),
    ]
)

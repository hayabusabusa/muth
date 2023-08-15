// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Package",
    products: [
        .library(
            name: "Theory",
            targets: ["Theory"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Theory",
            dependencies: []),
        .testTarget(
            name: "TheoryTests",
            dependencies: ["Theory"]),
    ]
)

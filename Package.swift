// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LogDogColor",
    products: [
        .library(name: "LogDogColor", targets: ["LogDogColor"]),
    ],
    dependencies: [
        .package(url: "https://github.com/luoxiu/LogDog.git", .branch("master")),
        .package(url: "https://github.com/luoxiu/Chalk", from: "0.2.0")
    ],
    targets: [
        .target(name: "LogDogColor", dependencies: ["LogDog", "Chalk"]),
        .testTarget(name: "LogDogColorTests", dependencies: ["LogDogColor"]),
    ]
)

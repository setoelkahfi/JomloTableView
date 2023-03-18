// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "JomloTableView",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "JomloTableView",
            targets: ["JomloTableView"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "JomloTableView",
            dependencies: []),
        .testTarget(
            name: "JomloTableViewTests",
            dependencies: ["JomloTableView"]),
    ],
    swiftLanguageVersions: [.v5]
)
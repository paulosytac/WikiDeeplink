// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Deeplink",
    platforms: [.iOS(.v18)],
    products: [
        .library(
            name: "Deeplink",
            targets: ["Deeplink"]),
    ],
    targets: [
        .target(
            name: "Deeplink"),

    ]
)

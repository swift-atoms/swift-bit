// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-bit",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Bit Primitive",
            targets: ["Bit Primitive"]
        ),
        .library(
            name: "Bit Pattern",
            targets: ["Bit Pattern"]
        ),
        .library(
            name: "Bit",
            targets: ["Bit"]
        ),
        .library(
            name: "Bit Standard Library Integration",
            targets: ["Bit Standard Library Integration"]
        ),
        .library(
            name: "Bit Test Support",
            targets: ["Bit Test Support"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-molecules/swift-hash.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Bit",
            dependencies: [
                "Bit Primitive",
                "Bit Pattern",
                "Bit Standard Library Integration",
                .product(name: "Hash", package: "swift-hash"),
            ]
        ),
        .target(
            name: "Bit Primitive",
            dependencies: []
        ),

        .target(
            name: "Bit Pattern",
            dependencies: [
                "Bit Primitive"
            ]
        ),
        .target(
            name: "Bit Standard Library Integration",
            dependencies: [
                "Bit Primitive"
            ]
        ),
        .target(
            name: "Bit Test Support",
            dependencies: [
                "Bit"
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Bit Tests",
            dependencies: [
                "Bit",
                "Bit Test Support",
            ],
            path: "Tests/Bit Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}

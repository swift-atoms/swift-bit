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
    dependencies: [],
    targets: [
        .target(
            name: "Bit",
            dependencies: []
        ),

        .target(
            name: "Bit Pattern",
            dependencies: [
                .target(name: "Bit")
            ]
        ),
        .target(
            name: "Bit Standard Library Integration",
            dependencies: [
                .target(name: "Bit")
            ]
        ),
        .target(
            name: "Bit Test Support",
            dependencies: [
                .target(name: "Bit")
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Bit Tests",
            dependencies: [
                .target(name: "Bit"),
                .target(name: "Bit Test Support"),
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

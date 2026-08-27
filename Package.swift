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
            name: "Bit",
            targets: ["Bit"]
        ),
        .library(
            name: "Bit Standard Library Integration",
            targets: ["Bit Standard Library Integration"]
        ),
        .library(
            name: "Bit Apple Foundation Integration",
            targets: ["Bit Apple Foundation Integration"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-index.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-affine.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-ordinal.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-byte.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-tagged.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Bit",
            dependencies: [
                .product(name: "Index", package: "swift-index"),
                .product(name: "Affine", package: "swift-affine"),
                .product(name: "Ordinal", package: "swift-ordinal"),
                .product(name: "Byte", package: "swift-byte"),
                .product(name: "Tagged", package: "swift-tagged"),
            ]
        ),
        .target(
            name: "Bit Standard Library Integration",
            dependencies: ["Bit"]
        ),
        .target(
            name: "Bit Apple Foundation Integration",
            dependencies: [
                "Bit",
                "Bit Standard Library Integration",
            ]
        ),
        .testTarget(
            name: "Bit Tests",
            dependencies: [
                "Bit",
                "Bit Standard Library Integration",
                .product(name: "Index", package: "swift-index"),
                .product(name: "Affine", package: "swift-affine"),
                .product(name: "Ordinal", package: "swift-ordinal"),
                .product(name: "Byte", package: "swift-byte"),
                .product(name: "Tagged", package: "swift-tagged"),
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

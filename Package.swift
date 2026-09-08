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
        .library(name: "Bit", targets: ["Bit"]),

        .library(name: "Bit Foundation Integration", targets: ["Bit Foundation Integration"]),
        .library(name: "Bit Test Support", targets: ["Bit Test Support"]),
    ],
    dependencies: [

        .package(url: "https://github.com/swift-atoms/swift-hash.git", branch: "main"),
],
    targets: [
        .target(
            name: "Bit",
            dependencies: [
                .product(name: "Hash", package: "swift-hash"),
            ],
            path: "Sources/Bit"
        ),
        
        .target(
            name: "Bit Foundation Integration",
            dependencies: [
                .target(name: "Bit"),
            ],
            path: "Sources/Bit Foundation Integration"
        ),
        .target(
            name: "Bit Test Support",
            dependencies: [
                .target(name: "Bit"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Bit Tests",
            dependencies: [
                .target(name: "Bit"),
                .target(name: "Bit Test Support"),
                .target(name: "Bit Foundation Integration"),
            ],
            path: "Tests/Bit Tests"
        ),
        .testTarget(
            name: "Consolidated Bit Hash Tests",
            dependencies: [

                .target(name: "Bit"),
                .product(name: "Hash", package: "swift-hash"),
            ],
            path: "Tests/Consolidated swift-bit-hash"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets {
    target.swiftSettings = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}

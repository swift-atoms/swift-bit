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
    traits: [
        .trait(name: "Finite", description: "Finite integration"),

        .trait(name: "Algebra", description: "Bit Algebra integration"),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-atoms/swift-tagged.git", branch: "main"),

        .package(url: "https://github.com/swift-atoms/swift-ordinal.git", branch: "main"),

        .package(url: "https://github.com/swift-atoms/swift-index.git", branch: "main"),

        .package(url: "https://github.com/swift-atoms/swift-cardinal.git", branch: "main"),

        .package(url: "https://github.com/swift-atoms/swift-finite.git", branch: "main"),

        .package(url: "https://github.com/swift-atoms/swift-algebra.git", branch: "main"),

],
    targets: [

        .testTarget(
            name: "Bit Algebra Integration Tests",
            dependencies: [
                .target(name: "Bit"),
                .target(name: "Bit Test Support"),
                .product(name: "Algebra", package: "swift-algebra", condition: .when(traits: ["Algebra"])),
            ],
            path: "Tests/Bit Algebra Integration Tests"
        ),
        .target(
            name: "Bit",
            dependencies: [
                .product(name: "Tagged", package: "swift-tagged", condition: .when(traits: ["Finite"])),

                .product(name: "Ordinal", package: "swift-ordinal", condition: .when(traits: ["Finite"])),

                .product(name: "Index", package: "swift-index", condition: .when(traits: ["Finite"])),

                .product(name: "Cardinal", package: "swift-cardinal", condition: .when(traits: ["Finite"])),

                .product(name: "Finite", package: "swift-finite", condition: .when(traits: ["Finite"])),

                .product(name: "Algebra", package: "swift-algebra", condition: .when(traits: ["Algebra"])),
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
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin].contains(target.type) {
    target.swiftSettings = (target.swiftSettings ?? []) + [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableExperimentalFeature("Lifetimes"),
        .treatAllWarnings(as: .error),
    ]
}

// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PINCache",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "PINCache",
            targets: ["PINCache"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/elisar4/PINOperation.git", .branch("supportSPM"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "PINCache",
            dependencies: ["PINOperation"],
            path: ".",
            exclude: [
                "Tests"
            ],
            sources: ["Source"],
            publicHeadersPath: "include",
            cxxSettings: [
               .headerSearchPath("."),
               .headerSearchPath("./include")
            ]
        ),
        .testTarget(
            name: "PINCacheTests",
            dependencies: ["PINCache"],
            path: "Tests"
        )
    ]
)

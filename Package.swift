// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RxMail",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(name: "RxMail", targets: ["RxMail"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "5.1.1"))
    ],
    targets: [
        .target(
            name: "RxMail",
            dependencies: [
                "RxSwift",
                .product(name: "RxCocoa", package: "RxSwift")
            ]),
        .testTarget(
            name: "RxMailTests",
            dependencies: [
                "RxSwift",
                .product(name: "RxCocoa", package: "RxSwift")
            ]),
    ],
    swiftLanguageVersions: [.v5]
)

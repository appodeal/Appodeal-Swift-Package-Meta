// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AppodealMetaAudienceNetworkAdapter",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AppodealMetaAudienceNetworkAdapter",
            targets: ["AppodealMetaAudienceNetworkAdapterWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/appodeal/Appodeal-Swift-Package.git", .upToNextMajor(from: "4.0.0-alpha.1")),
        .package(url: "https://github.com/facebook/FBAudienceNetwork", exact: "6.22.1"),
    ],
    targets: [
        .target(
            name: "AppodealMetaAudienceNetworkAdapterWrapper",
            dependencies: [
                .product(name: "AppodealSDK", package: "Appodeal-Swift-Package"),
                .product(name: "FBAudienceNetwork", package: "FBAudienceNetwork"),
                .target(name: "AppodealMetaAudienceNetworkAdapter"),
            ],
            path: "Sources",
            sources: ["Exports.swift"]
        ),
        .binaryTarget(
            name: "AppodealMetaAudienceNetworkAdapter",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealMetaAudienceNetworkAdapter/6.22.1.0/ece9a97e9b5e/AppodealMetaAudienceNetworkAdapter.xcframework.zip",
            checksum: "ece9a97e9b5e29d26e9107196e6d7b53242df7b30ecbfaeb806df907aa477db6"
        ),

    ]
)

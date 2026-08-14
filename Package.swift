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
        .package(url: "https://github.com/facebook/FBAudienceNetwork", exact: "6.21.1"),
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
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealMetaAudienceNetworkAdapter/6.21.1.0/AppodealMetaAudienceNetworkAdapter.xcframework.zip",
            checksum: "2309d545f05df74af1378864dff64fb9fb55a018d09395724d2b0a6ea9b6aedb"
        ),

    ]
)

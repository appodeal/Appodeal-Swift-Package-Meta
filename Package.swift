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
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealMetaAudienceNetworkAdapter/6.21.1.1/f62c45527331/AppodealMetaAudienceNetworkAdapter.xcframework.zip",
            checksum: "f62c455273312a957ff759791e2f60cc379d573f0b9789c6bce9e41a1641a13c"
        ),

    ]
)

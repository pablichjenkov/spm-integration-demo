// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppPackage",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AppPackage",
            targets: ["AppPackage"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/firebase/firebase-ios-sdk.git", from: "10.19.0"),
        .package(url: "https://github.com/pablichjenkov/firebase-kmp.git", branch: "main"),
    ],
    targets: [
//        .binaryTarget(
//            name: "composeApp",
//            path: "../../composeApp/build/XCFrameworks/debug/composeApp.xcframework"
//        ),
        .target(
            name: "AppPackage",
            dependencies: [
                //.byName(name: "composeApp"),
                .product(
                    name: "FirebaseAuth",
                    package: "firebase-ios-sdk"
                ),
                .product(
                    name: "FirebaseAuthKmp",
                    package: "firebase-kmp"
                ),
            ]
        ),
        .testTarget(
            name: "AppPackageTests",
            dependencies: ["AppPackage"]),
    ]
)

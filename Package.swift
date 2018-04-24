// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BuilderExampleApp",
    products: [
        .executable(
            name: "BuilderExampleApp",
            targets: ["BuilderExampleApp"]),
    ],
    dependencies: [
      // Builder & associated tools
      .package(url: "https://github.com/elegantchaos/Builder.git", from: "1.0.3"),
      .package(url: "https://github.com/elegantchaos/BuilderBundler.git", from: "1.0.2"),
      .package(url: "https://github.com/elegantchaos/BuilderConfiguration.git", from: "1.1.2"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "BuilderExampleApp",
            dependencies: []),
          .target(
              name: "Configure",
            dependencies: ["BuilderConfiguration", "BuilderBundler"]),
          .testTarget(
              name: "BuilderExampleTests",
              dependencies: ["BuilderExampleApp"]),
    ]
)

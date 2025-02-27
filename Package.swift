// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "GitBranchCleaner",
  platforms: [.macOS("13")],
  products: [
    .library(
      name: "GitBranchCleanerFfi",
      type: .dynamic,
      targets: ["GitBranchCleanerFfi"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser", branch: "1.3.0"),
    .package(url: "https://github.com/JohnSundell/ShellOut.git", from: "2.0.0"),
  ],
  targets: [
    .target(
      name: "GitBranchCleaner",
      dependencies: [
        .product(name: "ShellOut", package: "ShellOut")
      ]
    ),
    .target(
      name: "GitBranchCleanerFfi",
      dependencies: ["GitBranchCleaner"]
    ),
    .executableTarget(
      name: "GitBranchCleanerCli",
      dependencies: [
        "GitBranchCleaner",
        .product(name: "ArgumentParser", package: "swift-argument-parser"),
      ]
    ),
    .testTarget(
      name: "GitBranchCleanerTests",
      dependencies: ["GitBranchCleaner"]
    ),
  ]
)

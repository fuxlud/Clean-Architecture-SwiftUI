// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Submodules",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "DomainLayer", targets: ["DomainLayer"]),
        .library(name: "DataLayer", targets: ["DataLayer"]),
        .library(name: "Networking", targets: ["Networking"]),
        .library(name: "PresentationLayer_DesignSystem", targets: ["PresentationLayer_DesignSystem"]),
        .library(name: "List", targets: ["List"]),
        .library(name: "DetailsScreen", targets: ["DetailsScreen"]),
    ],
    targets: [
        .target(
            name: "DomainLayer",
            dependencies: []
        ),
        .testTarget(
            name: "DomainLayerTests",
            dependencies: ["DomainLayer"]
        ),
        .target(
            name: "Networking",
            dependencies: []
        ),
        .target(
            name: "DataLayer",
            dependencies: ["DomainLayer", "Networking"]
        ),
        .target(
            name: "PresentationLayer_DesignSystem",
            dependencies: []
        ),
        .target(
            name: "List",
            dependencies: ["DataLayer", "DomainLayer", "PresentationLayer_DesignSystem", "DetailsScreen"] //DetailsScreen should be moved to coordinator. Data moved to dependeci container
        ),
        .target(
            name: "DetailsScreen",
            dependencies: ["DomainLayer", "PresentationLayer_DesignSystem"]
        ),
        .testTarget(
            name: "NetworkingTests",
            dependencies: ["Networking"]
        ),
        .testTarget(
            name: "ListTests",
            dependencies: ["DomainLayer", "List"]
        )
    ]
)

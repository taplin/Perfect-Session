// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "PerfectSession",
    platforms: [.macOS(.v26)],
    products: [
        .library(name: "PerfectSessionCore",         targets: ["PerfectSessionCore"]),
        .library(name: "PerfectSessionMySQL",         targets: ["PerfectSessionMySQL"]),
        .library(name: "PerfectSessionPostgreSQL",    targets: ["PerfectSessionPostgreSQL"]),
        .library(name: "PerfectSessionRedis",         targets: ["PerfectSessionRedis"]),
        .library(name: "PerfectSessionSQLite",        targets: ["PerfectSessionSQLite"]),
    ],
    dependencies: [
        .package(path: "../Perfect-MySQL"),
        .package(path: "../Perfect-PostgreSQL"),
        .package(path: "../Perfect-Redis"),
        .package(path: "../Perfect-SQLite"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.5.0"),
    ],
    targets: [
        .target(
            name: "PerfectSessionCore",
            swiftSettings: [.swiftLanguageMode(.v6)]
        ),
        .target(
            name: "PerfectSessionMySQL",
            dependencies: [
                "PerfectSessionCore",
                .product(name: "PerfectMySQL", package: "Perfect-MySQL"),
            ],
            swiftSettings: [.swiftLanguageMode(.v6)]
        ),
        .target(
            name: "PerfectSessionPostgreSQL",
            dependencies: [
                "PerfectSessionCore",
                .product(name: "PerfectPostgreSQL", package: "Perfect-PostgreSQL"),
            ],
            swiftSettings: [.swiftLanguageMode(.v6)]
        ),
        .target(
            name: "PerfectSessionRedis",
            dependencies: [
                "PerfectSessionCore",
                .product(name: "PerfectRedis", package: "Perfect-Redis"),
                .product(name: "Logging", package: "swift-log"),
            ],
            swiftSettings: [.swiftLanguageMode(.v6)]
        ),
        .target(
            name: "PerfectSessionSQLite",
            dependencies: [
                "PerfectSessionCore",
                .product(name: "PerfectSQLite", package: "Perfect-SQLite"),
                .product(name: "Logging", package: "swift-log"),
            ],
            swiftSettings: [.swiftLanguageMode(.v6)]
        ),
        .testTarget(
            name: "PerfectSessionCoreTests",
            dependencies: ["PerfectSessionCore"],
            swiftSettings: [.swiftLanguageMode(.v6)]
        ),
        .testTarget(
            name: "PerfectSessionMySQLTests",
            dependencies: ["PerfectSessionMySQL"],
            swiftSettings: [.swiftLanguageMode(.v6)]
        ),
        .testTarget(
            name: "PerfectSessionPostgreSQLTests",
            dependencies: ["PerfectSessionPostgreSQL"],
            swiftSettings: [.swiftLanguageMode(.v6)]
        ),
        .testTarget(
            name: "PerfectSessionRedisTests",
            dependencies: ["PerfectSessionRedis"],
            swiftSettings: [.swiftLanguageMode(.v6)]
        ),
        .testTarget(
            name: "PerfectSessionSQLiteTests",
            dependencies: ["PerfectSessionSQLite"],
            swiftSettings: [.swiftLanguageMode(.v6)]
        ),
    ]
)

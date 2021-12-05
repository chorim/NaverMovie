//
//  Dependencies.swift
//  Config
//
//  Created by Insu Byeon on 2021/12/04.
//

import ProjectDescription

let dependencies = Dependencies(
  carthage: [],
  swiftPackageManager: [
    .remote(url: "https://github.com/uber/RIBs", requirement: .upToNextMajor(from: "0.12.1")),
  ],
  platforms: [.iOS]
)

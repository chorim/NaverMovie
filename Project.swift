import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let project = Project.app(
  name: "NaverMovie",
  platform: .iOS,
  additionalTargets: [.external(name: "RIBs")]
)

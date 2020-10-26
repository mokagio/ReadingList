import ProjectDescription
import ProjectDescriptionHelpers

/*
                +-------------+
                |             |
                |     App     | Contains PureSwiftUIExample App target and PureSwiftUIExample unit-test target
                |             |
         +------+-------------+-------+
         |         depends on         |
         |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+

 */

/* Tuist 1.22.0 default
// MARK: - Project

// Creates our project using a helper function defined in ProjectDescriptionHelpers
let project = Project.app(name: "PureSwiftUIExample",
                          platform: .iOS,
                          additionalTargets: ["PureSwiftUIExampleKit", "PureSwiftUIExampleUI"])
*/

let project = Project(name: "PureSwiftUIExample",
                      organizationName: "mokagio",
                      targets: [
                        Target(name: "PureSwiftUIExample",
                               platform: .iOS,
                               product: .app,
                               bundleId: "com.giolodi.PureSwiftUIExample",
                               infoPlist: "./Targets/PureSwiftUIExample/Info.plist",
                               sources: ["./Targets/PureSwiftUIExample/Sources/**"]
                        )
                      ])

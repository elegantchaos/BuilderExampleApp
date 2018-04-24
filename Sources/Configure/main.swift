// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
// Created by Sam Deane, 28/02/2018.
// All code (c) 2018 - present day, Elegant Chaos Limited.
// For licensing terms, see http://elegantchaos.com/license/liberal/.
// -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

import BuilderConfiguration

let settings = Settings(schemes: [
    .baseScheme(
        swift: ["Dexample"],
        inherits: [
            .scheme(name: "mac", filter: ["macOS"]),
            .scheme(name: "debug", filter: ["debug"])
        ]
    ),
    .scheme(
        name: "mac",
        swift: ["target", "x86_64-apple-macosx10.12"]
    ),
    .scheme(
        name: "debug",
        swift: ["Onone"]
    )
    ]
)

let configuration = Configuration(
    settings: settings,
    actions: [
        .action(name:"build", phases:[
            .buildPhase(name:"Building", target:"BuilderExampleApp"),
            .toolPhase(name:"Bundling", tool: "BuilderBundler", arguments:["BuilderExampleApp", "x86_64-apple-macosx10.10/debug"]),
            ]),
        .action(name:"test", phases:[
            .testPhase(name:"Testing", target:"BuilderExampleApp"),
            ]),
        .action(name:"run", phases:[
            .actionPhase(name:"Building", action: "build"),
            .toolPhase(name:"Running", tool: "run", arguments:["BuilderExampleApp"]),
            ]),
    ]
)

configuration.outputToBuilder()

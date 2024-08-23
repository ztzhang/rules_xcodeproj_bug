load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application", "ios_build_test", "ios_extension")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load(
    "@rules_xcodeproj//xcodeproj:defs.bzl",
    "project_options",
    "top_level_target",
    "xcodeproj",
)

MYAPPBUNDLEID = "com.example.ExampleApp"

# This is a placeholder for the provisioning profile
MYPROVISIONINGPROFILE = ""

swift_library(
    name = "example_app_lib",
    srcs = ["ExampleApp/ExampleApp.swift"],
)

swift_library(
    name = "example_extension_lib",
    srcs = ["ExampleExtension/ExampleExtension.swift"],
)

swift_library(
    name = "example_control_widget_lib",
    srcs = ["ExampleControlWidget/ExampleControlWidget.swift"],
)

ios_application(
    name = "example_app",
    bundle_id = MYAPPBUNDLEID,
    extensions = [
        ":example_extension",
        ":example_control_widget",
    ],
    families = [
        "iphone",
        "ipad",
    ],
    infoplists = ["ExampleApp/Info.plist"],
    minimum_os_version = "18.0",
    provisioning_profile = MYPROVISIONINGPROFILE,
    visibility = ["//visibility:public"],
    deps = [
        ":example_app_lib",
    ],
)

ios_extension(
    name = "example_control_widget",
    bundle_id = MYAPPBUNDLEID + ".capturewidget",
    families = [
        "iphone",
        "ipad",
    ],
    infoplists = ["ExampleControlWidget/Info.plist"],
    minimum_os_version = "18.0",
    provisioning_profile = MYPROVISIONINGPROFILE,
    visibility = ["//visibility:public"],
    deps = [
        ":example_control_widget_lib",
    ],
)

## This is an ExtensionKit extension
ios_extension(
    name = "example_extension",
    bundle_id = MYAPPBUNDLEID + ".exampleextension",
    extensionkit_extension = True,
    families = [
        "iphone",
        "ipad",
    ],
    infoplists = ["ExampleExtension/Info.plist"],
    minimum_os_version = "18.0",
    provisioning_profile = MYPROVISIONINGPROFILE,
    sdk_frameworks = [
        "LockedCameraCapture",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":example_extension_lib",
    ],
)

xcodeproj(
    name = "xcodeproj",
    generation_mode = "legacy",
    project_name = "ExampleApp",
    project_options = project_options(
        indent_width = 2,
        tab_width = 2,
        uses_tabs = False,
    ),
    tags = ["manual"],
    top_level_targets = [
        top_level_target(
            ":example_app",
            target_environments = [
                "simulator",
                "device",
            ],
        ),
    ],
)

xcode_version(
    name = "version16_1_0_16B5001e",
    aliases = [
        "16.1.0",
        "16.1.0.16B5001e",
        "16B5001e",
    ],
    default_ios_sdk_version = "18.1",
    default_macos_sdk_version = "15.1",
    version = "16.1.0.16B5001e",
)

xcode_config(
    name = "host_xcodes",
    default = ":version16_1_0_16B5001e",
    versions = [
        ":version16_1_0_16B5001e",
    ],
)

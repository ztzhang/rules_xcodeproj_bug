workspace(name = "helios")

load(
    "//:workspace_deps.bzl",
    "declare_aspect_bazel_lib",
    "declare_bazel_skylib",
    "declare_build_bazel_rules_apple",
    "declare_rules_xcodeproj",
)

declare_aspect_bazel_lib()

load("@aspect_bazel_lib//lib:repositories.bzl", "aspect_bazel_lib_dependencies", "aspect_bazel_lib_register_toolchains")

# Required bazel-lib dependencies

aspect_bazel_lib_dependencies()

# Register bazel-lib toolchains

aspect_bazel_lib_register_toolchains()

# Bazel Skylib.

declare_bazel_skylib()

load("@bazel_skylib//lib:versions.bzl", "versions")

versions.check(
    minimum_bazel_version = "7.0.2",
)

##### Apple and Swift #####

# Fetches and defines @build_bazel_rules_apple.
declare_build_bazel_rules_apple()

load(
    "@build_bazel_rules_apple//apple:repositories.bzl",
    "apple_rules_dependencies",
)

# Fetches and defines @build_bazel_rules_swift and @build_bazel_apple_support.
apple_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

# Fetches and defines @build_bazel_rules_swift.
swift_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:extras.bzl",
    "swift_rules_extra_dependencies",
)

swift_rules_extra_dependencies()

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)

# Fetches and defines remaining dependencies.
apple_support_dependencies()

##### rules_xcodeproj: defines rules for generating Xcode projects #####

declare_rules_xcodeproj()

load(
    "@rules_xcodeproj//xcodeproj:repositories.bzl",
    "xcodeproj_rules_dependencies",
)

xcodeproj_rules_dependencies()

# required by rules_xcodeproj 1.10.0 and above.
load("@bazel_features//:deps.bzl", "bazel_features_deps")

bazel_features_deps()

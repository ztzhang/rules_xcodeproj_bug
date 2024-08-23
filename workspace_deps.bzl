"""WORKSPACE dependencies."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

# aspect_bazel_lib.
def declare_aspect_bazel_lib():
    maybe(
        http_archive,
        name = "aspect_bazel_lib",
        sha256 = "8d71a578e4e1b6a54aea7598ebfbd8fc9e3be5da881ff9d2b80249577b933a40",
        strip_prefix = "bazel-lib-2.2.0",
        urls = [
            "https://github.com/aspect-build/bazel-lib/releases/download/v2.2.0/bazel-lib-v2.2.0.tar.gz",
        ],
    )

# bazel_skylib.
def declare_bazel_skylib():
    maybe(
        http_archive,
        name = "bazel_skylib",
        sha256 = "b8a1527901774180afc798aeb28c4634bdccf19c4d98e7bdd1ce79d1fe9aaad7",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.4.1/bazel-skylib-1.4.1.tar.gz",
            "https://github.com/bazelbuild/bazel-skylib/releases/download/1.4.1/bazel-skylib-1.4.1.tar.gz",
        ],
    )

def declare_build_bazel_rules_apple():
    maybe(
        http_archive,
        name = "build_bazel_rules_apple",
        sha256 = "62847b3f444ce514ae386704a119ad7b29fa6dfb65a38bff4ae239f2389a0429",
        urls = [
            "https://github.com/bazelbuild/rules_apple/releases/download/3.8.0/rules_apple.3.8.0.tar.gz",
        ],
    )

def declare_rules_xcodeproj():
    maybe(
        http_archive,
        name = "rules_xcodeproj",
        integrity = "sha256-eWX4D5buhP8Xjr3dIgGZZCWS1QWM9f+SqZ9elTi9KsU=",
        url = "https://github.com/MobileNativeFoundation/rules_xcodeproj/releases/download/2.6.1/release.tar.gz",
    )

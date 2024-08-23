import AppIntents
import LockedCameraCapture
import SwiftUI
import UIKit
import UniformTypeIdentifiers


@main
struct ExampleExtension: LockedCameraCaptureExtension {
  var body: some LockedCameraCaptureExtensionScene {
    LockedCameraCaptureUIScene { session in
      CaptureExtensionViewfinder(session: session)
    }
  }
}


struct CaptureExtensionViewfinder: UIViewControllerRepresentable {
  let session: LockedCameraCaptureSession
  var sourceType: UIImagePickerController.SourceType = .camera

  init(session: LockedCameraCaptureSession) {
    self.session = session
  }

  func makeUIViewController(context: Self.Context) -> UIImagePickerController {
    let imagePicker = UIImagePickerController()
    imagePicker.sourceType = sourceType
    imagePicker.mediaTypes = [UTType.image.identifier, UTType.movie.identifier]
    imagePicker.cameraDevice = .rear

    return imagePicker
  }

  func updateUIViewController(_ uiViewController: UIImagePickerController, context: Self.Context) {
  }
}


struct TestCaptureIntent: CameraCaptureIntent {
  typealias AppContext = TestCaptureContext
  static let title: LocalizedStringResource = LocalizedStringResource("TestCaptureIntent")
  static let description = IntentDescription("Bar")

  @MainActor
  func perform() async throws -> some IntentResult {
    do {
      if let context = try await TestCaptureIntent.appContext {
        // This should return all the stored data in app context for initializing the capture session.
        // Using a fake context for now.
        return .result()
      }
    } catch {
      // Handle error condition.
    }
    return .result()
  }
}


struct TestCaptureContext: Codable {
  let foo: String
}
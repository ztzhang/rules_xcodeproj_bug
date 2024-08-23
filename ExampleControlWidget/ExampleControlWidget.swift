import SwiftUI
import WidgetKit
import AppIntents

struct ExampleControlWidget: ControlWidget {
  static let kind: String = "com.example.mycustomwidget.controlwidget.button"

  var body: some ControlWidgetConfiguration {
    StaticControlConfiguration(kind: ExampleControlWidget.kind) {
      ControlWidgetButton(action: TestCaptureIntent()) {
        Label("capture", systemImage: "camera.fill")
      }
    }
    .displayName("Perform Action")
    .description("An example control that performs an action.")
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

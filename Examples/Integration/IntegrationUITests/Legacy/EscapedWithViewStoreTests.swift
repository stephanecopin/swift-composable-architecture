import Integration
import TestCases
import XCTest

@MainActor
final class EscapedWithViewStoreTests: BaseIntegrationTests {
  override func setUpWithError() throws {
    try super.setUpWithError()
    self.app.buttons["Legacy"].tap()
    app.collectionViews.buttons[TestCase.escapedWithViewStore.rawValue].tap()
  }

  func testExample() async throws {
    XCTAssertEqual(app.staticTexts["Label"].value as? String, "10")
    XCTAssertEqual(app.staticTexts["EscapedLabel"].value as? String, "10")

    app.buttons["Button"].tap()

    XCTAssertEqual(app.staticTexts["Label"].value as? String, "11")
    XCTAssertEqual(app.staticTexts["EscapedLabel"].value as? String, "11")

    let stepper = app.steppers["Stepper"]

    stepper.buttons["Increment"].tap()
    stepper.buttons["Increment"].tap()
    stepper.buttons["Increment"].tap()
    stepper.buttons["Increment"].tap()

    XCTAssertEqual(app.staticTexts["Label"].value as? String, "15")
    XCTAssertEqual(app.staticTexts["EscapedLabel"].value as? String, "15")

    stepper.buttons["Decrement"].tap()
    stepper.buttons["Decrement"].tap()
    stepper.buttons["Decrement"].tap()

    XCTAssertEqual(app.staticTexts["Label"].value as? String, "12")
    XCTAssertEqual(app.staticTexts["EscapedLabel"].value as? String, "12")
  }
}

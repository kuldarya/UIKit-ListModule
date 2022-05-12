//
//  UIKitListModuleUITests.swift
//  UIKitListModuleUITests
//
//  Created by Darya Kuliashova on 10/05/2022.
//

import XCTest

class UIKitListModuleUITests: XCTestCase, ViewScreenStarting, EmployeeListInteracting {
    var employeeForTest = "Accountant"

    override func setUpWithError() throws {
        super.setUp()

        continueAfterFailure = false
        configureStartup()
    }

    override func tearDownWithError() throws { }

    func test_TableViewRow_AddedOnButtonTap() {
        let app = XCUIApplication()
        let initialTableRows = app.tables.children(matching: .cell).count
        let add = XCUIApplication().buttons[Accessibility.View.AddButton]

        add.tap()
        createEntry(app: app, employee: employeeForTest)
        let finalTableRows = app.tables.children(matching: .cell).count

        XCTAssert(initialTableRows + 1 == finalTableRows)
    }

    func test_TableViewRow_DeletedRowDoesntExist() {
        let delete = XCUIApplication().buttons[Accessibility.View.DeleteButton]

        delete.tap()

        /// `waitForExistence` gives some time to wait and see if the element comes into existence
        /// If the specified row doesn't exist anymore, it returns `false`
        XCTAssertFalse(employee(titled: employeeForTest).waitForExistence(timeout: 1))
    }

    // MARK: - Private

    private func createEntry(app: XCUIApplication, employee: String) {
        let textfield = app.textFields["Add Employee"]
        textfield.tap()
        textfield.typeText(employeeForTest)
        app.navigationBars["Add Employee"].buttons["Done"].tap()
    }
}

// MARK: - Enum

enum Accessibility {
    enum View {
        static let DeleteButton = "Delete Row"
        static let AddButton = "Add Row"
    }
}

// MARK: - Protocols

protocol EmployeeListInteracting {
    func employee(titled: String) -> XCUIElement
}

protocol ViewScreenStarting: StartupConfigurable, EmployeeListInteracting {
    var employeeForTest: String { get }
    func startViewScreen()
}

protocol StartupConfigurable {
    func configureStartup()
}

// MARK: - Extensions

extension EmployeeListInteracting {
    func employee(titled title: String) -> XCUIElement {
        return XCUIApplication().cells
            .containing(.staticText, identifier: title)
            .firstMatch
    }
}

extension ViewScreenStarting {
    func startViewScreen() {
        /// As the test starts with the app closed in UI tests, launch the app first
        XCUIApplication().launch()
        employee(titled: employeeForTest).tap()
    }

    func configureStartup() {
        startViewScreen()
    }
}

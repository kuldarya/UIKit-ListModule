//
//  UIKitListModuleTests.swift
//  UIKitListModuleTests
//
//  Created by Darya Kuliashova on 10/05/2022.
//

import XCTest
@testable import UIKitListModule

class UIKitListModuleTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    /// Test if tableview is instantiated properly.
    func testSetsTableView() {
        let employeesViewController = createSUT()

        _ = employeesViewController.view

        XCTAssertNotNil(employeesViewController.tableView)
    }

    /// Test if tableView has a data source.
    func testSetsDataSource() {
        let employeesViewController = createSUT()

        _ = employeesViewController.view

        XCTAssertNotNil(employeesViewController.tableView.dataSource)
    }

    func testTableViewDataSourceHasOneSection() {
        let sut = createSUT()
        let dataSource = sut.tableView?.dataSource
        let tableView = UITableView()
        tableView.dataSource = dataSource

        let numberOfSections = tableView.numberOfSections
        XCTAssertEqual(1, numberOfSections)

    }

    // MARK: - Private

    private func createSUT() -> EmployeesViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "EmployeesViewController") as! EmployeesViewController
    }
}

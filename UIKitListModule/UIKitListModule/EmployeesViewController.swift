//
//  EmployeesViewController.swift
//  UIKitListModule
//
//  Created by Darya Kuliashova on 10/05/2022.
//

import UIKit

final class EmployeesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet private weak var toolBar: UIToolbar!
    @IBOutlet private weak var deleteRowButton: UIBarButtonItem!
    @IBOutlet private weak var addRowButton: UIBarButtonItem!

    private var employeeList = [Employee]()
    private var newEmployee: String = ""
    private var indexForCell = Int()

    override func viewDidLoad() {
        super.viewDidLoad()

        employeeList = [
            Employee(occupation: "iOS Developer"),
            Employee(occupation: "Accountant"),
            Employee(occupation: "Support Manager"),
            Employee(occupation: "Flutter Developer"),
            Employee(occupation: "Project Manager")
        ]

        deleteRowButton.accessibilityIdentifier = Constants.deleteRowAccessibilityLabel
        addRowButton.accessibilityIdentifier = Constants.addRowAccessibilityLabel
        navigationController?.navigationBar.topItem?.title = Constants.navbarTitle
        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction private func cancel(segue: UIStoryboardSegue) {}

    @IBAction private func done(segue: UIStoryboardSegue) {
        let employeeDetailVC = segue.source as! EmployeeDetailViewController
        newEmployee = employeeDetailVC.newEmployee
        employeeList.append(Employee(occupation: newEmployee))
        tableView.reloadData()
    }

    @IBAction private func deleteRow(_ sender: UIBarButtonItem) {
        employeeList.remove(at: indexForCell)
        tableView.reloadData()
    }
}

extension EmployeesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.employeeCellIdentifier, for: indexPath) as? EmployeeCell else {
            return UITableViewCell()
        }
        let employee = employeeList[indexPath.row]
        cell.occupationLabel.text = employee.occupation

        return cell
    }
}

extension EmployeesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexForCell = indexPath.row
    }
}

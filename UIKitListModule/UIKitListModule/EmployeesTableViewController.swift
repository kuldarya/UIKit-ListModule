//
//  EmployeesTableViewController.swift
//  UIKitListModule
//
//  Created by Darya Kuliashova on 10/05/2022.
//

import UIKit

final class EmployeesTableViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var toolBar: UIToolbar!
    @IBOutlet weak var deleteRowButton: UIBarButtonItem!

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

        navigationController?.navigationBar.topItem?.title = "Employees"
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

extension EmployeesTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCell", for: indexPath) as? EmployeeCell else {
            return UITableViewCell()
        }
        let employee = employeeList[indexPath.row]
        cell.occupationLabel.text = employee.occupation

        return cell
    }
}

extension EmployeesTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexForCell = indexPath.row
    }
}

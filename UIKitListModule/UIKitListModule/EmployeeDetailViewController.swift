//
//  EmployeeDetailViewController.swift
//  UIKitListModule
//
//  Created by Darya Kuliashova on 11/05/2022.
//

import UIKit

class EmployeeDetailViewController: UIViewController {
    @IBOutlet private weak var employeeOccupation: UITextField!

    var newEmployee: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneSegue" {
        newEmployee = employeeOccupation.text!
        }
    }
}

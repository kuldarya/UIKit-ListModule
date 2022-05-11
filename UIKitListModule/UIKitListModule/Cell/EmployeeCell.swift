//
//  EmployeeCell.swift
//  UIKitListModule
//
//  Created by Darya Kuliashova on 10/05/2022.
//

import UIKit

final class EmployeeCell: UITableViewCell {
    
    @IBOutlet weak var occupationLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

//
//  tableViewCellTableViewCell.swift
//  dynamicForm
//
//  Created by Harsh Tiwari on 25/04/23.
//

import UIKit

class tableViewCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dataFieldLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    
    func populateTextField(placeholderText : String) {
        textField.placeholder = placeholderText
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textField.delegate = self
    }
}

extension tableViewCellTableViewCell: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        
        if textField.tag == dataFields.count - 1 {
            textField.resignFirstResponder()
        }
        else {
            let nextRespond = self.superview!.viewWithTag(nextTag) as? UITextField
            nextRespond?.becomeFirstResponder()
        }
        
        return true
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            passData.unitNumber = textField.text!
        case 1:
            passData.gatePassFor = textField.text!
        case 2:
            passData.assetGroup = textField.text!
        case 3:
            passData.issueTo = textField.text!
        default:
            return
        }
    }
    
}

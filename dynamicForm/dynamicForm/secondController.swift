//
//  secondController.swift
//  dynamicForm
//
//  Created by Harsh Tiwari on 26/04/23.
//

import UIKit

class secondController: UIViewController {

    @IBOutlet weak var l1: UILabel!
    
    @IBOutlet weak var l2: UILabel!
    
    @IBOutlet weak var l3: UILabel!
    
    @IBOutlet weak var l4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        l1.text = passData.unitNumber
        l2.text = passData.gatePassFor
        l3.text = passData.assetGroup
        l4.text = passData.issueTo
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

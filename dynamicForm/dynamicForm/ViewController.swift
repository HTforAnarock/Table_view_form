//
//  ViewController.swift
//  dynamicForm
//
//  Created by Harsh Tiwari on 25/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorColor = UIColor.clear
        
        self.tableView.register(UINib(nibName: "tableViewCellTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        doneButton.addTarget(self, action: #selector (tapOnButtonForNavigation), for: .touchUpInside)
    }
    
    @objc func tapOnButtonForNavigation() {
        let story = UIStoryboard (name: "Main", bundle: nil)
        let controller = story.instantiateViewController (identifier: "secondController") as! secondController
        let navigation = UINavigationController (rootViewController: controller)
        self.view.addSubview(navigation.view)
        self.addChild(navigation)
        navigation.didMove (toParent: self)
        
    }
    


}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataFields.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! tableViewCellTableViewCell
        
        cell.dataFieldLabel.text = dataFields[indexPath.row]
        cell.populateTextField(placeholderText: placeHolders[indexPath.row])
        cell.textField.tag = indexPath.row
        
        return cell
    }
    
}



let dataFields = [
    "Unit Number",
    "Gate pass for",
    "Asset group",
    "Issue to"
]

let placeHolders = [
    "Select unit number",
    "Select",
    "None",
    "Issue to someone"
]

var passData : exitPassData = exitPassData()

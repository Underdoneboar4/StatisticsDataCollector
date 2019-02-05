//
//  ViewController.swift
//  Stats Capstone Data Collector
//
//  Created by 90304593 on 1/10/19.
//  Copyright © 2019 90304593. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var TopLabel: UILabel!
    @IBOutlet weak var BCKLabel: UIButton!
    @IBOutlet weak var ENDLabel: UIButton!
    @IBOutlet weak var sampledLabel: UILabel!
    @IBOutlet weak var LeftButton: UIButton!
    @IBOutlet weak var RightButton: UIButton!
    @IBOutlet weak var EndButton: UIButton!
    @IBOutlet weak var Switch: UISwitch!
    
    var question = ""
    var leftVarName = ""
    var rightVarName = ""
    
    var left = 0
    var right = 0
    var alreadyCountedLeft = 0
    var alreadyCountedRight = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func LeftButtonPressed(_ sender: Any) {
        if (TopLabel.text != "Press a button to begin!"){
            if (Switch.isOn){
                left = left + 1
            } else {
                alreadyCountedLeft = alreadyCountedLeft + 1
            }
        } else{
            showInputDialog()
        }
    }
    @IBAction func RightButtonPressed(_ sender: Any) {
        if (TopLabel.text != "Press a button to begin!"){
            if (Switch.isOn){
                right = right + 1
            } else {
                alreadyCountedRight = alreadyCountedRight + 1
            }
        } else{
            showInputDialog()
        }
    }
    @IBAction func EndButtonPressed(_ sender: Any) {
        TopLabel.text =  "Totals: " + leftVarName + " " + String(left) + ", " + rightVarName + " " + String(right) + ", SwD " + leftVarName + " " + String(alreadyCountedLeft) + ", SwD " + rightVarName + " " + String(alreadyCountedRight)
    }
    
    @IBAction func BckButtonPressed(_ sender: Any) {
        TopLabel.text = question
    }
    func showInputDialog() {
        //Creating UIAlertController and
        //Setting title and message for the alert dialog
        let alertController = UIAlertController(title: "Required Entry", message: "Enter your variables", preferredStyle: .alert)
        
        //the confirm action taking the inputs
        let confirmAction = UIAlertAction(title: "Enter", style: .default) { (_) in
            
            //getting the input values from user
            self.question = (alertController.textFields?[0].text)!
            self.leftVarName = (alertController.textFields?[1].text)!
            self.rightVarName = (alertController.textFields?[2].text)!
            
            self.TopLabel.text = self.question
        self.LeftButton.setTitle(self.leftVarName, for: .normal)
        self.RightButton.setTitle(self.rightVarName, for: .normal)
            
            self.BCKLabel.isHidden = false
            self.ENDLabel.isHidden = false
            self.Switch.isHidden = false
            self.sampledLabel.isHidden = false
            
        }
        
        //the cancel action doing nothing
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        //adding textfields to our dialog box
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Question"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Left Answer"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Right Answer"
        }
        
        //adding the action to dialogbox
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        //finally presenting the dialog box
        self.present(alertController, animated: true, completion: nil)
    }

}


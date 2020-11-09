//
//  ViewController.swift
//  AppPie
//
//  Created by Le Trong Tan on 11/6/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var theText: UILabel!
    @IBOutlet var theTextField: UITextField!
    @IBOutlet var scrollViewF: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        theTextField.clearButtonMode = .always
        theTextField.clearButtonMode = .whileEditing
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardApear), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisApear), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    var isExpand: Bool = false
    @objc func keyboardApear(){
        if !isExpand {
            self.scrollViewF.contentSize = CGSize(width: self.view.frame.width, height: self.scrollViewF.frame.height + 500)
        isExpand = true
        }
    }

    @objc func keyboardDisApear(){
        self.scrollViewF.contentSize = CGSize(width: self.view.frame.width, height: self.scrollViewF.frame.height - 500)
            isExpand = false
    }

    @IBAction func buttonTapped(_ sender: Any) {
        print("Button was tapped!")
    }
    
  
    @IBAction func switchToggled(_ sender: UISwitch) {
        if sender.isOn{
            theText.text = "The switch is on"
            print(theText.text ?? "Error")
        }else{
            theText.text = "The switch is off"
            print(theText.text ?? "Error")
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
    }
    
    @IBAction func getText(_ sender: UITextField) {
        if theTextField != nil{
            theText.text = theTextField.text ?? "Can't get text"
            print(theText.text ?? "Error")
        }else{
            theText.text = "Print Text"
        }
    }
    
    @IBAction func getTextAgain(_ sender: UITextField) {
        theTextField.resignFirstResponder()
    }
    
    @IBAction func respondToTapGesture(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        print(location)
    }
}


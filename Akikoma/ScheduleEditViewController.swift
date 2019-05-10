//
//  ScheduleEditViewController.swift
//  Akikoma
//
//  Created by 太田 一毅 on 2019/05/10.
//  Copyright © 2019 太田 一毅. All rights reserved.
//

import UIKit

class ScheduleEditViewController: UIViewController, UITextFieldDelegate {

    // !!
    var day: Int = 0
    var period: Int = 0
    var className: String = "授業名"
    
    @IBOutlet var textField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
        // Do any additional setup after loading the view.
    }
    

    @IBAction func monButton(){
        day = 0
    }
    @IBAction func tueButton(){
        day = 1
    }
    @IBAction func wedButton(){
        day = 2
    }
    @IBAction func thuButton(){
        day = 3
    }
    @IBAction func friButton(){
        day = 4
    }
    
    @IBAction func period1Button(){
        period = 0
    }
    @IBAction func period2Button(){
        period = 1
    }
    @IBAction func period3Button(){
        period = 2
    }
    @IBAction func period4Button(){
        period = 3
    }
    @IBAction func period5Button(){
        period = 4
    }
    @IBAction func period6Button(){
        period = 5
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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

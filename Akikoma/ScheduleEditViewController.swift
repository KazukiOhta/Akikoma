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
    @IBOutlet var monBtn: UIButton!
    @IBOutlet var tueBtn: UIButton!
    @IBOutlet var wedBtn: UIButton!
    @IBOutlet var thuBtn: UIButton!
    @IBOutlet var friBtn: UIButton!

    @IBOutlet var period1Btn: UIButton!
    @IBOutlet var period2Btn: UIButton!
    @IBOutlet var period3Btn: UIButton!
    @IBOutlet var period4Btn: UIButton!
    @IBOutlet var period5Btn: UIButton!
    @IBOutlet var period6Btn: UIButton!
    
    @IBOutlet var classNameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        show()
    }
    
    
    @objc func back() {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func monButton(){
        day = 0
        show()
    }
    @IBAction func tueButton(){
        day = 1
        show()
    }
    @IBAction func wedButton(){
        day = 2
        show()
    }
    @IBAction func thuButton(){
        day = 3
        show()
    }
    @IBAction func friButton(){
        day = 4
        show()
    }
    
    @IBAction func period1Button(){
        period = 0
        show()
    }
    @IBAction func period2Button(){
        period = 1
        show()
    }
    @IBAction func period3Button(){
        period = 2
        show()
    }
    @IBAction func period4Button(){
        period = 3
        show()
    }
    @IBAction func period5Button(){
        period = 4
        show()
    }
    @IBAction func period6Button(){
        period = 5
        show()
    }
    
    func show(){
        let dayButtonArray: [UIButton] = [monBtn, tueBtn, wedBtn, thuBtn, friBtn]
        for i in 0..<5{
            let btn: UIButton = dayButtonArray[i]
            if(day == i){
                btn.backgroundColor = UIColor.hex(string: "#D8E3FF", alpha: 1)
            } else {
                btn.backgroundColor = UIColor.hex(string: "#FFFFFF", alpha: 1)
            }
        }
        
        let periodButtonArray: [UIButton] = [period1Btn, period2Btn, period3Btn, period4Btn, period5Btn, period6Btn]
        for i in 0..<6{
            let btn: UIButton = periodButtonArray[i]
            if(period == i){
                btn.backgroundColor = UIColor.hex(string: "#D8E3FF", alpha: 1)
            } else {
                btn.backgroundColor = UIColor.hex(string: "#FFFFFF", alpha: 1)
            }
        }
        classNameTextField.text = className

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 今フォーカスが当たっているテキストボックスからフォーカスを外す
        textField.resignFirstResponder()
        print("かいぎょー")
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

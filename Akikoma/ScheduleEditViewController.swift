//
//  ScheduleEditViewController.swift
//  Akikoma
//
//  Created by 太田 一毅 on 2019/05/10.
//  Copyright © 2019 太田 一毅. All rights reserved.
//

import UIKit

class ScheduleEditViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {

    // !!
    var day: Int = 0
    var period: Int = 0
    var className: String = "授業名"
    
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
        navigationController?.delegate = self
        show()
        classNameTextField.addTarget(self, action: "textFieldDidChange:",for: UIControl.Event.editingChanged)
    }
    
   
    @IBAction func backButton() {

        let myAlert = UIAlertController(title: "タイトル", message: "message", preferredStyle: UIAlertController.Style.actionSheet)
        
        // アクションを生成.
        let myAction_1 = UIAlertAction(title: "変更を破棄", style: UIAlertAction.Style.destructive, handler: {
            (action: UIAlertAction!) in
            print("変更を破棄")
        })
        
        let myAction_2 = UIAlertAction(title: "変更を保存", style: UIAlertAction.Style.default, handler: {
            (action: UIAlertAction!) in
            print("変更を保存")
        })
        
        let myAction_3 = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler: {
            (action: UIAlertAction!) in
            print("キャンセル")
        })
        
        // アクションを追加.
        myAlert.addAction(myAction_1)
        myAlert.addAction(myAction_2)
        myAlert.addAction(myAction_3)
        
        self.present(myAlert, animated: true, completion: nil)
        
        
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
//
//    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange,
//                  replacementText text: String) -> Bool {
//        if text == "\n" {
//            textView.resignFirstResponder() //キーボードを閉じる
//            return false
//        }
//        return true
//    }

    @IBAction func deleteButton(){
        print("削除するよー")
    }
//
//    func textViewDidChange(_ textView: UITextView){
//        print("textViewDidChange")
//    }
//
//    func textFieldDidChange(){
//        print("textFieldDidChange")
//    }
//
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

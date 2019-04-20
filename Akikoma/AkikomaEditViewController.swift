//
//  AkikomaEditViewController.swift
//  Akikoma
//
//  Created by 太田 一毅 on 2019/04/20.
//  Copyright © 2019 太田 一毅. All rights reserved.
//

import UIKit

class AkikomaEditViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    let saveData = UserDefaults.standard
    let ncol = 5
    let nrow = 6
    var akikomaID: Int64 = 0//!!
    var akikomaArray: [Bool]!
    var akikomaArrayIndex: Int!
    var name: String = "名無し"
    var akikomaIDArray: [Int64]!
    var isNewPerson: Bool = false//!!新規の登録かどうか
    @IBOutlet var nameButton: UIButton!
    @IBOutlet var akikomaCodeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO!!: このへんのロードが雑すぎるので治す。
        if saveData.value(forKey: "akikomaArrayIndex") != nil{
            akikomaArrayIndex = saveData.value(forKey: "akikomaArrayIndex") as? Int
        } else {
            akikomaArrayIndex = 0
        }
        if saveData.array(forKey: "akikomaIDArray") != nil{
            akikomaIDArray = saveData.array(forKey: "akikomaIDArray") as? [Int64]
        } else {
            akikomaIDArray = []
        }
        if isNewPerson {
            akikomaIDArray.append(0)
        }
        print(akikomaIDArray[akikomaArrayIndex])
        akikomaArray = Common.akikomaID2akikomaArray(akikomaID: akikomaID, numberOfClasses: nrow*ncol)

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ncol*nrow
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(indexPath)
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        //let label = cell.contentView.viewWithTag(1) as! UILabel
        let button = cell.contentView.viewWithTag(2) as! UIButton
        let label:UILabel = button.titleLabel!
        label.numberOfLines = 1
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont(name: "Futura", size: 30)
        if akikomaArray[indexPath.row]{
            button.backgroundColor = UIColor.hex(string: "#FFE3BB", alpha: 1)
            button.setTitleColor(UIColor.hex(string: "#F78F00", alpha: 1), for: .normal)
            button.setTitle("授業", for: .normal)
        } else {
            button.backgroundColor = UIColor.hex(string: "#CAE2FF", alpha: 1)
            button.setTitleColor(UIColor.hex(string: "#007AFF", alpha: 1), for: .normal)
            button.setTitle("空き", for: .normal)
        }
        button.tag = 1+indexPath.row
        button.addTarget(self, action: #selector(self.AkikomaEditButton(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc func AkikomaEditButton(sender: UIButton){
        let row = sender.tag - 1
        let address:Int64 = 1<<row
        akikomaID ^= address
        print("akikomaID:", akikomaID)
        akikomaArray = Common.akikomaID2akikomaArray(akikomaID: akikomaID, numberOfClasses: ncol*nrow)
        print("akikomaArray:", akikomaArray!)
        if akikomaArray[row]{
            sender.backgroundColor = UIColor.hex(string: "#FFE3BB", alpha: 1)
            sender.setTitleColor(UIColor.hex(string: "#F78F00", alpha: 1), for: .normal)
            sender.setTitle("授業", for: .normal)
        } else {
            sender.backgroundColor = UIColor.hex(string: "#CAE2FF", alpha: 1)
            sender.setTitleColor(UIColor.hex(string: "#007AFF", alpha: 1), for: .normal)
            sender.setTitle("空き", for: .normal)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let horizontalMargin: CGFloat = 2 //横方向のMargin
        let cellSize: CGFloat = self.view.bounds.width/5 - horizontalMargin
        return CGSize(width: cellSize, height: cellSize)
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    @IBAction func nameButtonTapped(){
        let alert: UIAlertController = UIAlertController(title: "名前の変更", message: "新しい名前を入力してください。", preferredStyle: .alert)
        alert.addTextField(configurationHandler: {(text:UITextField!) -> Void in
            text.text = self.name
        })
        alert.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "変更", style: .default, handler: {[weak alert] (action) -> Void in
            guard let textFields = alert?.textFields else {
                return
            }
            guard !textFields.isEmpty else {
                return
            }
            for text in textFields {
                self.name = text.text!
                self.nameButton.setTitle("名前：" + self.name, for: .normal)
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func akikomaCodeButtonTapped(){
        // TODO!!: あきこまコードに対応させる。
        let alert: UIAlertController = UIAlertController(title: "あきこまコードの変更", message: "今はなにもないよ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func deleteButtonTapped(){
        let alert: UIAlertController = UIAlertController(title: "削除", message: "本当にあきこまデータを削除しますか？", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "削除", style: .destructive, handler: nil)) //TODO!!: 削除する。
        alert.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(){
        let alert: UIAlertController = UIAlertController(title: "保存", message: "あきこまデータを保存しますか？", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "保存", style: .default, handler: {[weak alert] (action) -> Void in
            self.akikomaIDArray[self.akikomaArrayIndex] = self.akikomaID
            self.saveData.set(self.akikomaIDArray, forKey: "akikomaIDArray")
        })) //TODO!!: 保存する。
        self.present(alert, animated: true, completion: nil)
    }

}

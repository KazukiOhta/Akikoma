//
//  AkikomaViewController.swift
//  Akikoma
//
//  Created by 太田 一毅 on 2019/04/20.
//  Copyright © 2019 太田 一毅. All rights reserved.
//

import UIKit

class AkikomaViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let saveData = UserDefaults.standard
    var akikomaIDArray: [Int64]!
    var akikomaSumArray: [Int]!
    
    let ncol = 5
    let nrow = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if saveData.array(forKey: "akikomaIDArray") != nil{
            akikomaIDArray = saveData.array(forKey: "akikomaIDArray") as? [Int64]
        } else {
            akikomaIDArray = []
            print("akikomaIDArray = []")
        }
        
        akikomaSumArray = []
        for classIndex in 0..<ncol*nrow {
            var sum = 0
            for peopleIndex in 0..<akikomaIDArray.count{
                let akikomaArray: [Bool] = Common.akikomaID2akikomaArray(akikomaID: akikomaIDArray[peopleIndex], numberOfClasses: ncol*nrow)
                if akikomaArray[classIndex] == false{
                    sum += 1
                }
            }
            akikomaSumArray.append(sum)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return 30 //!!
        } else {
            return 9
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section: Int = indexPath.section
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        if section == 0{
            // Akikoma Cells
            let label = cell.contentView.viewWithTag(1) as! UILabel
            label.backgroundColor = UIColor.white
            label.numberOfLines = 1
            label.textAlignment = NSTextAlignment.center
            label.font = UIFont(name: "Futura", size: 20)
            label.text = String(indexPath.row)
        } else {
            // People Cells
            let label = cell.contentView.viewWithTag(1) as! UILabel
            label.backgroundColor = UIColor.white
            label.numberOfLines = 2
            label.textAlignment = NSTextAlignment.left
            label.font = UIFont(name: "Futura", size: 10)
            label.text = "名前：　" + String(indexPath.row) + "\n" + "あきこまコード：　" + String(17*indexPath.row)//!!
            let button = cell.contentView.viewWithTag(2) as! UIButton
            button.tag = 1+indexPath.row
            button.addTarget(self, action: #selector(self.peopleButton), for: .touchUpInside)
        }
        
        return cell
    }
    
    @objc func peopleButton(sender: UIButton){
        let row = sender.tag - 1
        print("People", row)
        self.performSegue(withIdentifier: "toAkikomaEditView", sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0{
            let horizontalMargin: CGFloat = 2 //横方向のMargin
            let cellSize: CGFloat = self.view.bounds.width/5 - horizontalMargin
            return CGSize(width: cellSize, height: cellSize)
        } else {
            let horizontalMargin: CGFloat = 2 //横方向のMargin
            let cellSize: CGFloat = self.view.bounds.width/3 - horizontalMargin
            return CGSize(width: cellSize, height: cellSize/2)
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
}

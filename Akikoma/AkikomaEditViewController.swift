//
//  AkikomaEditViewController.swift
//  Akikoma
//
//  Created by 太田 一毅 on 2019/04/20.
//  Copyright © 2019 太田 一毅. All rights reserved.
//

import UIKit

class AkikomaEditViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var akikomaID: Int64 = 123//!!
    var akikomaArray: [Bool]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        akikomaArray = Common.akikomaID2akikomaArray(akikomaID: akikomaID, numberOfClasses: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("30!")
        return 30 //!!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(indexPath)
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        let label = cell.contentView.viewWithTag(1) as! UILabel
        label.numberOfLines = 1
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont(name: "Futura", size: 30)
        if akikomaArray[indexPath.row]{
            label.backgroundColor = UIColor.hex(string: "#FFE3BB", alpha: 1)
            label.textColor = UIColor.hex(string: "#F78F00", alpha: 1)
            label.text = "授業"
        } else {
            label.backgroundColor = UIColor.hex(string: "#CAE2FF", alpha: 1)
            label.textColor = UIColor.hex(string: "#007AFF", alpha: 1)
            label.text = "空き"
        }
        let button = cell.contentView.viewWithTag(2) as! UIButton
        button.tag = 1+indexPath.row
        button.addTarget(self, action: #selector(self.hogeButton), for: .touchUpInside)
        
        return cell
    }
    
    @objc func hogeButton(sender: UIButton){
        let row = sender.tag - 1
        print("People", row)
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


}

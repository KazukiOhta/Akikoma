//
//  ScheduleGridViewController.swift
//  Akikoma
//
//  Created by 太田 一毅 on 2019/05/11.
//  Copyright © 2019 太田 一毅. All rights reserved.
//

import UIKit

class ScheduleGridViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   

    @IBOutlet var scheduleGridCollectionView: UICollectionView!

    
    var ScheduleArrays:[[Any]] = [[5, -1, "新規作成"], [0, 0, "振動波動論"], [0, 1, "物性化学"], [0, 2, "人間行動基礎論"], [0, 4, "実践的機械学習研究"], [1, 1, "スポーツ身体運動実習"], [1, 4, "計算の理論"], [1, 5, "Arduinoを使って応用システムを作ろう"], [2, 1, "生命科学"], [2, 3, "宇宙科学実習Ⅱ"], [2, 4, "宇宙科学実習Ⅱ"], [3, 1, "物性科学"], [3, 4, "実践的機械学習研究"], [4, 1, "基礎統計"], [4, 2, "基礎化学実験"], [4, 3, "基礎化学実験"], [4, 4, "囲碁で養う考える力"], [4, 5, "ロボット競技を体験しよう"]]
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ScheduleArrays.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        //let label = cell.contentView.viewWithTag(1) as! UILabel
        let button = cell.contentView.viewWithTag(2) as! UIButton
        let label:UILabel = button.titleLabel!
        label.numberOfLines = 1
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont(name: "Futura", size: 30)
//        if akikomaArray[indexPath.row]{
//            button.backgroundColor = UIColor.hex(string: "#FFE3BB", alpha: 1)
//            button.setTitleColor(UIColor.hex(string: "#F78F00", alpha: 1), for: .normal)
//            button.setTitle("授業", for: .normal)
//        } else {
//            button.backgroundColor = UIColor.hex(string: "#CAE2FF", alpha: 1)
//            button.setTitleColor(UIColor.hex(string: "#007AFF", alpha: 1), for: .normal)
//            button.setTitle("空き", for: .normal)
//        }
        button.tag = 1+indexPath.row
//        button.addTarget(self, action: #selector(self.AkikomaEditButton(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

}

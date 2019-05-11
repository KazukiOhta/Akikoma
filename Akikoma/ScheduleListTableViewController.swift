//
//  ScheduleListTableViewController.swift
//  Akikoma
//
//  Created by 太田 一毅 on 2019/05/10.
//  Copyright © 2019 太田 一毅. All rights reserved.
//

import UIKit

class ScheduleListTableViewController: UITableViewController {

    var ScheduleDictArray:[[Any]] = [[5, -1, "新規作成"], [0, 0, "振動波動論"], [0, 1, "物性化学"], [0, 2, "人間行動基礎論"], [0, 4, "実践的機械学習研究"], [1, 1, "スポーツ身体運動実習"], [1, 4, "計算の理論"], [1, 5, "Arduinoを使って応用システムを作ろう"], [2, 1, "生命科学"], [2, 3, "宇宙科学実習Ⅱ"], [2, 4, "宇宙科学実習Ⅱ"], [3, 1, "物性科学"], [3, 4, "実践的機械学習研究"], [4, 1, "基礎統計"], [4, 2, "基礎化学実験"], [4, 3, "基礎化学実験"], [4, 4, "囲碁で養う考える力"], [4, 5, "ロボット競技を体験しよう"]]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "ScheduleListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ScheduleDictArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ScheduleListTableViewCell
        
        let nowIndexPathDictionary = ScheduleDictArray[indexPath.row]
        
        cell.dayLabel.text = ["月", "火", "水", "木", "金", "+"][(nowIndexPathDictionary[0] as! Int)]
        cell.periodLabel.text = String(nowIndexPathDictionary[1] as! Int + 1)
        cell.classNameLabel.text = nowIndexPathDictionary[2] as? String

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //セルの選択解除
        tableView.deselectRow(at: indexPath, animated: true)
   
        print("いくぜ！")
        performSegue(withIdentifier: "toScheduleEditView",sender: nil)

        //ここに遷移処理を書く
//        self.present(ScheduleEditViewController(), animated: true, completion: nil)
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

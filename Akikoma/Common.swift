//
//  Common.swift
//  Akikoma
//
//  Created by 太田 一毅 on 2019/04/20.
//  Copyright © 2019 太田 一毅. All rights reserved.
//

import Foundation

class Common {
    class func akikomaID2akikomaArray(akikomaID: Int64, numberOfClasses: Int) -> [Bool]{
        var akikomaArray: [Bool] = []
        for classIndex in 0..<numberOfClasses {
            let address:Int64 = 1<<classIndex
            akikomaArray.append(address&akikomaID != 0)
        }
        return akikomaArray
    }
}

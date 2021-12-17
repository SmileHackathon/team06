//
//  ThenAddListModel.swift
//  leiharuapp
//
//  Created by enPiT2016MBP-13 on 2021/12/17.
//

import Foundation
import RealmSwift

class ThenAddListModel : Object {
    
    //いつ
    @objc dynamic var itsu: String = ""
    //どこ
    @objc dynamic var doko: String = ""
    //気分
    @objc dynamic var kibun: String = ""
    //やりたいこと
    @objc dynamic var toDo: String = ""
    
//    var done: Bool = false
//
//    init(toDo: String) {
//        self.toDo = toDo
//    }
}

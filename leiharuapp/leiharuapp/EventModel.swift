//
//  EventModel.swift
//  leiharuapp
//
//  Created by enPiT2016MBP-13 on 2021/12/16.
//

import RealmSwift

class EventModel: Object {
    @objc dynamic var memo = ""
    @objc dynamic var date = "" //yyyy.MM.dd
}
/*
func createEvent(success: @escaping () -> Void) {
    do {
        let realm = try Realm()
        let eventModel = EventModel()
        eventModel.memo = memoTextView.text
        eventModel.date = stringFromDate(date: date as Date, format: "yyyy.MM.dd")
        
        try realm.write {
            realm.add(eventModel)
            success()
        }
    } catch {
        print("create todo error.")
    }
}
 */


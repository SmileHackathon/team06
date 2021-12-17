//
//  ListViewController.swift
//  leiharuapp
//
//  Created by enPiT2016MBP-13 on 2021/12/14.
//

import UIKit
import RealmSwift

class ListViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{
    // アイテムの型
    class Item1 {
        //保存したいデータの定義
        @objc dynamic var title: String? = nil
        
        //var title : String
        var done: Bool = false

        init(title: String) {
            self.title = title
        }
    }

    class Item2 {
        //保存したいデータの定義
        @objc dynamic var title: String? = nil
        
        //var title : String
        var done: Bool = false

        init(title: String) {
            self.title = title
        }
    }
    
    //@IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    let realm = try! Realm()
    var segmentControlNumber = 0 //セグメントの区別
    //var itemArray: [Item] = []
    var nowArray: Results<AddListModel>! //いますぐやりたいこと
    var thenArray: Results<ThenAddListModel>! //いつかやりたいこと
    let AddModelInstance: AddListModel = AddListModel()
    let ThenModelInstance: ThenAddListModel = ThenAddListModel()
    
    
//    //Realmのデータ？
//    var alldata: Results<AddListModel>?
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        do{
            let realm = try Realm()
            nowArray = realm.objects(AddListModel.self)
            thenArray = realm.objects(ThenAddListModel.self)
//          print(Realm.Configuration.defaultConfiguration.fileURL!)
//          alldata = realm.objects(AddListModel.self.self)
//                  tableView.reloadData()
                }catch{
                    print("接続エラー")
                }

        // あらかじめ3つアイテムを作っておく
        let item1: Item1 = Item1(title: "バンジージャンプをする")
        let item2: Item2 = Item2(title: "旅行をする")
        //let item3: Item = Item(title: "ハッカソンで賞をとる")

        // 配列に追加
        
        nowArray.realm
        
        nowArray.append(item1)
        //nowArray.append(item2)
        thenArray.append(item2)
        //thenArray.append(item3)
        
        
        func viewWillAppear(animated: Bool) {
                super.viewWillAppear(animated)
                tableView.reloadData()
        }

        self.view.addSubview(tableView)
    }
    
    //switch文
    @IBAction func ValueChanged(_ sender: UISegmentedControl) {
        
        
            switch sender.selectedSegmentIndex {
            case 0:
                segmentControlNumber = 0
                let nArray = nowArray
                nArray
                /*
                itemArray = nowArray
                let nArray = itemArray
                */
            case 1:
                segmentControlNumber = 1
                let tArray = nowArray
                tArray
                /*
                itemArray = thenArray
                let tArray = itemArray
                */
            default:
                fatalError("存在しないケース")
            }
        
        tableView.reloadData()
    }

    // MARK - セルの数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentControlNumber == 0 {
            return nowArray.count
        } else {
            return thenArray.count
        }
    }

    // MARK - セルのカスタマイズ
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var nownow = realm.objects(AddListModel.self).value(forKey: "toDo")!
        var thenthen = realm.objects(ThenAddListModel.self).value(forKey: "toDo")!
        
//        let unwrapped_now = nownow!
//        let unwrapped_then = thenthen!
    
        print(nownow)
        print(thenthen)
        
        var item1: Item1!
        var item2: Item2!

        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        if segmentControlNumber == 0 {
            item1 = nowArray[indexPath.row]
            cell.textLabel?.text = item1.title
        } else {
            item2 = thenArray[indexPath.row]
            cell.textLabel?.text = item2.title
        }
        
        
        //cell.accessoryType = item1.done ? .checkmark : .none
        
        
        //cell.accessoryType = item2.done ? .checkmark : .none
        
        //cell.contentView.backgroundColor = UIColor.red
        
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // 選択されたセルに実行される処理
        
        
//        var item1: AddListModel!
//        var item2: ThenAddListModel!
        
        if segmentControlNumber == 0 {
            //item1 = nowArray[indexPath.row]

        } else {
            //item2 = thenArray[indexPath.row]
        }

            // チェックマーク
            //item1.done = !item1.done
            //item2.done = !item2.done

            // リロードしてUIに反映
            self.tableView.reloadData()

            // セルを選択した時の背景の変化を遅くする
            tableView.deselectRow(at: indexPath, animated: true)

        }
    
    // MARK - 新規アイテム追加機能
        @IBAction func addButtonPressed(_ sender: Any) {
            
            //Realmのデータ？
            //var alldata: Results<AddListModel>?
            
            // プラスボタンが押された時に実行される処理

            var textField1 = UITextField()
            var textField2 = UITextField()
            var textField3 = UITextField()
            var textField4 = UITextField()
            
            //Addを押したときのウィンドウ
            let alert = UIAlertController(title: "やりたいことを追加", message: "", preferredStyle: .alert)
            
            //キャンセル
            let cancel = UIAlertAction(title: "Cancel", style: .default) { (action) in
            }
            
            //追加
            let action = UIAlertAction(title: "Go", style: .default) { (action) in
                
                guard let unwrapped_text1 = textField1.text else { return }
                guard let unwrapped_text2 = textField2.text else { return }
                guard let unwrapped_text3 = textField3.text else { return }
                guard let unwrapped_text4 = textField4.text else { return }
                
                print(unwrapped_text1)
                print(unwrapped_text2)
                print(unwrapped_text3)
                print(unwrapped_text4)
                
                Item1(title: unwrapped_text4)
                
                let realm = try! Realm()
                //print(realm.objects(AddListModel.self).value(forKey: "toDo"))
                
                                
                //alldata = realm.objects(AddListModel)
                
                
                // 「Go」を押された時に実行される処理

                // アイテム追加処理
                if self.segmentControlNumber == 0 {
                    //let newItem: AddListModel = AddListModel(toDo: textField4.text!)
                    //self.nowArray.append(newItem)
                    //モデルのインスタンス
                    
                    
                    //Realmインスタンス取得
                    let realm = try! Realm()
                    
                    //Realmに格納
                    self.AddModelInstance.itsu = unwrapped_text1
                    self.AddModelInstance.doko = unwrapped_text2
                    self.AddModelInstance.kibun = unwrapped_text3
                    self.AddModelInstance.toDo = unwrapped_text4
                    
                    //DB登録処理
                    try! realm.write {
                        // ModelInstance.toDo = textField(String)
                        realm.add(AddListModel(value: self.AddModelInstance))
                    }
                } else {
                    //let newItem: ThenAddListModel = ThenAddListModel(toDo: textField4.text!)
                    //self.thenArray.append(newItem)
                    //モデルのインスタンス
                    let ModelInstance:ThenAddListModel = ThenAddListModel()
                    
                    //Realmインスタンス取得
                    let realm = try! Realm()
                    
                    //Realmに格納
                    self.ThenModelInstance.itsu = unwrapped_text1
                    self.ThenModelInstance.doko = unwrapped_text2
                    self.ThenModelInstance.kibun = unwrapped_text3
                    self.ThenModelInstance.toDo = unwrapped_text4
                    
                    // DB登録処理
                    try! realm.write {
                        realm.add(ThenAddListModel(value: self.ThenModelInstance))
                    }
                }
                
                self.tableView.reloadData()

            }
            

            alert.addTextField { (alertTextField) in
                alertTextField.placeholder = "いつ？"
                textField1 = alertTextField
            }
            alert.addTextField { (alertTextField) in
                alertTextField.placeholder = "どこ？"
                textField2 = alertTextField
            }
            alert.addTextField { (alertTextField) in
                alertTextField.placeholder = "気分は？"
                textField3 = alertTextField
            }
            alert.addTextField { (alertTextField) in
                alertTextField.placeholder = "やりたいこと"
                textField4 = alertTextField
            }

            alert.addAction(action)
            alert.addAction(cancel)
            present(alert, animated: true, completion: nil)
            
        }
    
    // MARK - スワイプでのアイテム削除機能
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

            // アイテム削除処理
        if segmentControlNumber == 0 {
            nowArray.remove(at: indexPath.row)
            let indexPaths = [indexPath]
            tableView.deleteRows(at: indexPaths, with: .automatic)
        } else {
            thenArray.remove(at: indexPath.row)
            let indexPaths = [indexPath]
            tableView.deleteRows(at: indexPaths, with: .automatic)
        }

    }
}

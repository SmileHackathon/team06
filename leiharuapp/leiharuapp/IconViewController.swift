//
//  IconViewController.swift
//  leiharuapp
//
//  Created by enPiT2016MBP-13 on 2021/12/17.
//

import UIKit

class IconViewController: UIViewController {
    
    @IBOutlet var profileImageButton: UIButton!

   override func viewDidLoad() {
       super.viewDidLoad()
       
       //角丸にする（縦横ともに240の時にこの値）
       profileImageButton.layer.cornerRadius = 110
       
       //線の太さ
       profileImageButton.layer.borderWidth = 1
       
       //色の設定 -> 今回は黒
       let border = UIColor.black.cgColor
       
       //設定した色を反映させる
       profileImageButton.layer.borderColor = border
       
   }
   
}

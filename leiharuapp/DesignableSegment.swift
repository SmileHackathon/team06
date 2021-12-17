//
//  DesignableSegment.swift
//  leiharuapp
//
//  Created by enPiT2016MBP-13 on 2021/12/14.
//

import UIKit

@IBDesignable

class DesignableSegment: DesignableSegment {
    @IBInspectable internal var segmentColor: UIColor? {
            didSet {
                self.tintColor = segmentColor
                self.backgroundColor = UIColor.white
                self.layer.cornerRadius = 4
            }
        }

}

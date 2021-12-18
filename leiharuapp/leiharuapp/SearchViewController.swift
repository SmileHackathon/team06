//
//  SearchViewController.swift
//  leiharuapp
//
//  Created by enPiT2016MBP-13 on 2021/12/18.
//

import UIKit

class SearchViewController: UIViewController {
    
    var items: [String] = [
        "ビアガーデン",
        "うなぎ",
        "韓国料理",
        "焼肉",
        "焼き鳥",
        "ステーキ",
        "そば",
        "バイキング・ビュッフェ",
        "しゃぶしゃぶ",
        "鉄板焼き",
        "ピザ",
        "食堂・定食",
        "パン・サンドイッチ",
        "カフェ",
        "弁当",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.alwaysBounceVertical = true
            collectionView.allowsMultipleSelection = false
        }
    }
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout! {
        didSet {
            flowLayout.minimumLineSpacing = 8
            flowLayout.minimumInteritemSpacing = 8
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            flowLayout.scrollDirection = .vertical
            flowLayout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        }
    }
}

extension SearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.textLabel.text = items[indexPath.item]
        return cell
    }
}

extension SearchViewController: UICollectionViewDelegate {
    
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
}

class CollectionViewCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textLabel.textColor = UIColor.systemBlue
        textLabel.font = .systemFont(ofSize: 14)
        
        layer.backgroundColor = UIColor.white.cgColor
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemBlue.cgColor
        layer.cornerRadius = 16
        layer.masksToBounds = true
        
        // iOS12のみ以下制約をつけないとAutoLayoutが効かない
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // セル選択で色を反転させる
    override var isSelected: Bool {
        didSet {
            if isSelected {
                backgroundColor = UIColor.systemBlue
                textLabel.textColor = .white
            } else {
                backgroundColor = .white
                textLabel.textColor = UIColor.systemBlue
            }
        }
    }
    
    @IBOutlet weak var textLabel: UILabel!
}

// セルを左寄せにするカスタムレイアウトクラス
class CollectionViewLeftAlignedLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let attributes = super.layoutAttributesForElements(in: rect) else { return nil }
        var currentRowY: CGFloat = -1.0
        var currentRowX: CGFloat = 0
        for attribute in attributes where attribute.representedElementCategory == .cell {
            if currentRowY != attribute.frame.origin.y {
                currentRowY = attribute.frame.origin.y
                currentRowX = sectionInset.left
            }
            attribute.frame.origin.x = currentRowX
            currentRowX += attribute.frame.width + minimumInteritemSpacing
        }
        return attributes
    }
}

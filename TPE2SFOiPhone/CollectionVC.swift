//
//  CollectionVC.swift
//  TPE2SFO
//
//  Created by zip520123 on 2017/7/29.
//  Copyright © 2017年 zip520123. All rights reserved.
//

import UIKit

class CollectionVC: UIViewController , UICollectionViewDelegate,
UICollectionViewDataSource{

    @IBOutlet weak var collcetionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // 建立 UICollectionViewFlowLayout
        let layout = UICollectionViewFlowLayout()
        
        // 設置 section 的間距 四個數值分別代表 上、左、下、右 的間距
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        
        // 設置每一行的間距
        layout.minimumLineSpacing = 5
        
//        // 設置每個 cell 的尺寸
//        layout.itemSize = CGSizeMake(
//            CGFloat(fullScreenSize.width)/3 - 10.0,
//            CGFloat(fullScreenSize.width)/3 - 10.0)
//        
//        // 設置 header 及 footer 的尺寸
//        layout.headerReferenceSize = CGSize(
//            width: fullScreenSize.width, height: 40)
//        layout.footerReferenceSize = CGSize(
//            width: fullScreenSize.width, height: 40)
        collcetionView.delegate = self
        collcetionView.dataSource = self
        
        
    }
    
    // 必須實作的方法：每一組有幾個 cell
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    // 必須實作的方法：每個 cell 要顯示的內容
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell {
            // 依據前面註冊設置的識別名稱 "Cell" 取得目前使用的 cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! CollectionViewCell
            
//            // 設置 cell 內容 (即自定義元件裡 增加的圖片與文字元件)
//            cell.imageView.image = 
//                UIImage(named: "0\(indexPath.item + 1).jpg")
//            cell.titleLabel.text = "0\(indexPath.item + 1)"
            
            return cell
    }
    // 有幾個 section
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // 點選 cell 後執行的動作
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("你選擇了第 \(indexPath.section + 1) 組的")
        print("第 \(indexPath.item + 1) 張圖片")
    }
//    func collectionView(_ collectionView: UICollectionView,
//                        didSelectItemAtIndexPath indexPath: IndexPath) {
//        print("你選擇了第 \(indexPath.section + 1) 組的")
//        print("第 \(indexPath.item + 1) 張圖片")
//    }

}

//
//  ClothCollecitonVC.swift
//  TPE2SFO
//
//  Created by Slin on 2017/7/30.
//  Copyright © 2017年 zip520123. All rights reserved.
//

import UIKit

class ClothCollecitonVC: UIViewController  , UICollectionViewDelegate,
UICollectionViewDataSource{
    @IBOutlet weak var collcetionView: UICollectionView!
    var clothList = [ClothObject]()
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()

        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);

        layout.minimumLineSpacing = 5
        
        collcetionView.delegate = self
        collcetionView.dataSource = self
        }
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return clothList.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! CollectionViewCell
            
            return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("你選擇了第 \(indexPath.section + 1) 組的")
        print("第 \(indexPath.item + 1) 張圖片")
    }
}

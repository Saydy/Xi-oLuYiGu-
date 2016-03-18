//
//  XLBannerCollecionView.swift
//  XiaoLuYiGuan
//
//  Created by DaysSummer on 16/3/17.
//  Copyright © 2016年 SayDy. All rights reserved.
//

import UIKit
import SDWebImage

class XLBannerCollecionView: UICollectionView ,UICollectionViewDataSource {
    
    var Images: NSArray = NSArray() {
        didSet {
            reloadData()
        }
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .Horizontal
        layout.itemSize = frame.size
        super.init(frame: frame, collectionViewLayout: layout)
        pagingEnabled = true
        dataSource = self
        registerClass(XLBannerCollectionCell.self, forCellWithReuseIdentifier: "BannerCollectionViewItem")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Images.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCellWithReuseIdentifier("BannerCollectionViewItem", forIndexPath: indexPath) as? XLBannerCollectionCell else{
            return XLBannerCollectionCell()
        }

        if let imgName =  Images[indexPath.item] as?  String {
            cell.imageView.sd_setImageWithURL(NSURL(string: imgName))
        }
        return cell
    }
    
}

//
//  XLBannerCollectionCell.swift
//  XiaoLuYiGuan
//
//  Created by DaysSummer on 16/3/17.
//  Copyright © 2016年 SayDy. All rights reserved.
//

import UIKit

class XLBannerCollectionCell: UICollectionViewCell {
    let imageView: UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        imageView.frame = CGRectMake(0, 0, frame.width, frame.height)
        imageView.contentMode = .ScaleAspectFill
        addSubview(imageView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

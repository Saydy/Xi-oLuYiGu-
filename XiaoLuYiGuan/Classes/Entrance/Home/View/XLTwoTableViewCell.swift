//
//  XLTwoTableViewCell.swift
//  XiaoLuYiGuan
//
//  Created by DaysSummer on 16/3/18.
//  Copyright © 2016年 SayDy. All rights reserved.
//

import UIKit

class XLTwoTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        let w: CGFloat = bounds.width / 3
        let h: CGFloat = bounds.height / 3
        for var i = 0; i < 9; i++ {
            let x = CGFloat(i % 3) * w
            let y = CGFloat(i / 3) * h
            
            let btn = UIButton(frame: CGRect(x: x, y: y, width: w, height: h))
            btn .setImage(UIImage(named: String( i + 1)), forState: .Normal)
            guard let docterStr: String = doctertagsArr[i] as? String else{
                continue
            }
            btn.setTitle(docterStr, forState: .Normal)
            btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
            btn.titleLabel?.font = UIFont.systemFontOfSize(12)
            btn.layer.borderWidth = 0.5
            btn.layer.borderColor = UIColor.groupTableViewBackgroundColor().CGColor
            addSubview(btn)
        }
    }
    private func addSubviews() {
        print(bounds)

    }
    
    private lazy var doctertagsArr:NSArray = ["脾胃虚弱" ,"月经不调" ,"妇科炎症" ,"痘痘痤疮","失眠乏力","减肥瘦身","便秘痔疮","男性健康","更多不适"]
}

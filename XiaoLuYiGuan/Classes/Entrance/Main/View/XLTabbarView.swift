//
//  XLTabbarView.swift
//  XiaoLuYiGuan
//
//  Created by DaysSummer on 16/3/17.
//  Copyright © 2016年 SayDy. All rights reserved.
//

import UIKit

class XLTabbarView: UIView {
    
    var selectControoler: ((NSInteger) -> ())?
    private var currentBtn: UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.whiteColor()

        
        self.layer.borderWidth = 1
        layer.borderColor = UIColor.groupTableViewBackgroundColor().CGColor
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addButton(image: UIImage? ,selectImage: UIImage?) {
        let btn = UIButton()
        
        btn.setImage(image, forState: .Normal)
        btn.setImage(selectImage, forState: .Selected)
        btn.addTarget(self, action: "tabbarButtonTouch:", forControlEvents: .TouchUpInside)
        
        addSubview(btn)
    }
    
    @objc private func tabbarButtonTouch(sender: UIButton) {
        currentBtn?.selected = false
        sender.selected = true
        currentBtn = sender
        if selectControoler != nil {
            selectControoler!(sender.tag)
        }
    }
    
    
    func selectController(finish: (index :NSInteger) -> ()){
        selectControoler = finish
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let w = bounds.width / CGFloat(subviews.count)
        let h = bounds.height

        for var i = 0; i < subviews.count; i++ {
            let x = CGFloat(i) * w

            guard let btn = subviews[i] as? UIButton else {
                continue
            }
            btn.frame = CGRect(x: x, y: 0, width: w, height: h)
            btn.tag = i
            
            if btn.tag == 0 {
                tabbarButtonTouch(btn);
            }
        }
    }

}

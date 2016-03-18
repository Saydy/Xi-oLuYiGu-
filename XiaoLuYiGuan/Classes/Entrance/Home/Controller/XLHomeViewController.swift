//
//  XLHomeViewController.swift
//  XiaoLuYiGuan
//
//  Created by DaysSummer on 16/3/17.
//  Copyright © 2016年 SayDy. All rights reserved.
//

import UIKit
import SnapKit

class XLHomeViewController: UITableViewController {

    override init(style: UITableViewStyle) {
        super.init(style: .Grouped)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        
        navigationItem.titleView = UIImageView(image: UIImage(named: "homeLogo"))
        navigationItem.rightBarButtonItems = [feedbackBarBtn ,searchBarBtn]
        
        bancerView.Images = ["http://img04.sogoucdn.com/app/a/200574/8f216ace72306936dec9ee86f9bd3278.jpg" ,"http://img01.sogoucdn.com/app/a/200574/312443bd63633e16c9b7a71f6eedd233.jpg"]

    }
    
    @objc private func search() {
        print(__FUNCTION__)
 
    }
    
    @objc private func feedback() {
        print(__FUNCTION__)
    }

    private lazy var searchBarBtn:UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "search"), style: .Plain, target: self, action: "search")
    private lazy var feedbackBarBtn: UIBarButtonItem = UIBarButtonItem(title: "反馈", style: .Plain, target: self, action: "feedback")
    
    private lazy var bancerView: XLBannerCollecionView = XLBannerCollecionView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 200), collectionViewLayout: UICollectionViewFlowLayout())
    
}

extension XLHomeViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 3 {
            return 10
        }
        return 1
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
                let cell = UITableViewCell(style: .Default, reuseIdentifier: "one")
                cell .addSubview(bancerView)
                return cell
        }
        if indexPath.section == 1 {
            let cell = XLTwoTableViewCell(style: .Default, reuseIdentifier: "two")
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 200
        }
        if indexPath.section == 1 {
            return 150
        }
        return 44
    }
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
}

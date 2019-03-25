//
//  MyTableViewCell.swift
//  SwiftDemo
//
//  Created by 周智勇 on 2018/11/6.
//  Copyright © 2018年 zhouzhiyong. All rights reserved.
//

import UIKit

//typealias myBlock = (_ text:NSString) ->Void

protocol MyTableViewCellDelegate {
    func clickedTheButton() -> Void
}

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var button: UIButton!
    
//    var block:myBlock?
    
    var newTitle:String!
    var delegate:MyTableViewCellDelegate!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        button.setTitle("哈哈", for: UIControlState.normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.addTarget(self, action:#selector(clickedButton) , for: UIControlEvents.touchUpInside)
    }
    
    //MARK: 按钮点击事件
    @objc func clickedButton() -> Void {
//        if (block != nil) {
//            block!("sadasdas")
//        }
        if (delegate != nil) {
            delegate.clickedTheButton()
        }
    }
    
    var titleString : String {
        set {
            self.newTitle = newValue
            button.setTitle(newValue, for: UIControlState.normal)
        }
        get {
            return self.newTitle
        }
    }
 
}

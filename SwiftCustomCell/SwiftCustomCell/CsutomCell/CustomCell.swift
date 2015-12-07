//
//  CustomCell.swift
//  SwiftCustomCell
//
//  Created by Alex on 15/11/25.
//  Copyright © 2015年 Alex. All rights reserved.
//

import UIKit

typealias myClosure = (Int) -> Void

protocol callBtnDelegate{
     func callBtnClicked(cell:CustomCell)
}

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var phoneBtn: UIButton!
    
    var delegate:callBtnDelegate!
    var phoneBtnClickedClosure:myClosure?
    
    override func awakeFromNib() {
        cellImageView.layer.masksToBounds = true
        cellImageView.layer.cornerRadius = cellImageView.frame.size.width/2
        cellImageView.backgroundColor = UIColor.yellowColor()
        //cellImageView.sd_setImageWithURL(NSURL(string: "http://img.name2012.com/uploads/allimg/2015-06/30-023131_451.jpg"))
        cellImageView.sd_setImageWithURL(NSURL(string: "http://img.name2012.com/uploads/allimg/2015-06/30-023131_451.jpg"), placeholderImage: nil)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func initWithClosure(closure:myClosure){
        phoneBtnClickedClosure = closure
    }
    
    @IBAction func callBtnClicked(sender: AnyObject) {
        // 委托
        /*
        if delegate != nil{
            self.delegate?.callBtnClicked(self)
        }
        */
        
        // 闭包
        if(phoneBtnClickedClosure != nil){
            phoneBtnClickedClosure!(self.tag)
        }
    }
    
    // 显示数据
    func showCellData(title:String,phone:String){
        titleLbl.text = title
        phoneBtn .setTitle(phone, forState: UIControlState.Normal)
    }
    
    
}

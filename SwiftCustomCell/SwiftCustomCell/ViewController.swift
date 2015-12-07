//
//  ViewController.swift
//  SwiftCustomCell
//
//  Created by Alex on 15/11/25.
//  Copyright © 2015年 Alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,callBtnDelegate {

    @IBOutlet weak var tableView: UITableView!
    var dataArray = []
    var phoneArray = []
    
    let cellIndetifier = "CustomCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 加载xib
        // self.tableView.registerNib(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")

        dataArray = [1,2,3,4,5,6,7,8,9,10]
        phoneArray = ["13333333330","13333333331","13333333332","13333333333","13333333334","13333333335","13333333336","13333333337","13333333338","13333333339"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // TableView Delegate & Datasource Method
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:CustomCell = tableView.dequeueReusableCellWithIdentifier(cellIndetifier, forIndexPath: indexPath) as!CustomCell
        //cell.titleLbl.text = "标题标题标题标题标题标题-\(dataArray[indexPath.row])"
        cell .showCellData("标题标题标题标题标题标题-\(dataArray[indexPath.row])",phone: "\(self.phoneArray[indexPath.row])")
        cell.tag = indexPath.row
        // 设置委托
        cell.delegate = self
        // 设置闭包 实现方式五
        //cell.phoneBtnClickedClosure = phoneClosure
        
        /*
        //  实现闭包 方式一
        cell.initWithClosure {(phoneIndex:Int) -> Void in
            print(self.phoneArray[phoneIndex])
        }
        
        // 实现闭包 方式二
        cell.initWithClosure {phoneIndex -> Void in
            print(self.phoneArray[phoneIndex])
        }

       //  实现闭包 方式三
        cell.initWithClosure {phoneIndex in
            print(self.phoneArray[phoneIndex])
        }
        */

        // 实现闭包 方式四
        cell.initWithClosure {
            //print(self.phoneArray[$0])
            self.printPhoneNumber($0)
        }
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 88
    }
    
    // 实现Cell委托
    func callBtnClicked(cell: CustomCell) {
        print("您点击了第\(cell.tag)行")
    }
    
    // 实现闭包方式五
    func phoneClosure(phone:String) -> Void{
        print(phone)
    }
    
    func printPhoneNumber(index:Int){
        print(self.phoneArray[index])
    }
}


//
//  ViewController.swift
//  SwiftDemo
//
//  Created by 周智勇 on 2018/4/9.
//  Copyright © 2018年 zhouzhiyong. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,MyTableViewCellDelegate {
    
    let cellIndentifier:String = "cellIndentifier"
    
    lazy var tableView:UITableView = UITableView(frame: CGRect(x: 0, y: 0, width: kUIScreenWidth, height: kUIScreenHeight), style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()

        print(kEnvironment())
        print(kMagazineBaseURL())
    }

    func setUpTableView() -> Void {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UINib.init(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: cellIndentifier)
        self.view.addSubview(tableView)
    }
    
    //MARK: UITableViewDelegate,UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath) as! MyTableViewCell
        cell.titleString = "11"
//        cell.block = { (backMsg) in
//
//        }
        cell.delegate = self
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc:SecondViewController = SecondViewController()
        vc.title = "第二页"
        vc.swiftGiveOCValue("swift文件调用oc文件内方法")
        vc.block = {() in
            //oc回调事件给swift文件
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK:MyTableViewCellDelegate
    func clickedTheButton() {
        
    }
    
    @objc func OCBackValueToSwiftFile(text: String) -> Void{
        print(text)
    }
}



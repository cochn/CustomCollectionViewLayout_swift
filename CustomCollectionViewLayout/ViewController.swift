//
//  ViewController.swift
//  CustomCollectionViewLayout
//
//  Created by cochn on 2017/4/18.
//  Copyright © 2017年 cochn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var tableView: UITableView? = nil
    var dataSource: Array<ClassModel> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "CollectionView"
        
        self.createTableView()
        
        self.loadData()
    }
    
    func loadData() {
        
        let classTitleArray = [
            "继承于<UICollectionViewFlowLayout>",
            "继承于<UICollectionViewLayout>",
            "EmojticonLayout继承于<UICollectionViewLayout>"
        ]
        let classNameArray  = [
            "CustomCollectionViewFlowLayoutViewController",
            "CustomCollectionViewLayout",
            "EmoticonViewController"
        ]
        for i in 0...classTitleArray.count-1 {
            
            let model = ClassModel(classTitle: classTitleArray[i], className: classNameArray[i])
            dataSource.append(model)
        }
            
        tableView?.reloadData()
    }
    
    func createTableView(){
        
        tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), style: UITableViewStyle.plain);
        tableView?.delegate = self
        tableView?.dataSource = self
        self.view.addSubview(tableView!)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return dataSource.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIden = "cellIden"
        
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellIden)
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellIden)
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 15)
        }
        
        let model = dataSource[indexPath.row]
        cell?.textLabel?.text = model.classTitle;
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let model = dataSource[indexPath.row]
        let vccls = self.StringToClass(classString: model.className!) as! UIViewController.Type
        let vc = vccls.init()
        vc.title = model.classTitle
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController{
    
    func StringToClass(classString string: String) -> AnyClass {
        
        let ns = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        let cls: AnyClass? = NSClassFromString(ns + "." + string)
        
        assert(cls != nil, "string转class 失败")
        
        return cls!
        
    }
    
}



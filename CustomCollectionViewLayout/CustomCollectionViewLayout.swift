//
//  CustomCollectionViewLayout.swift
//  CustomCollectionViewLayout
//
//  Created by 曹臣 on 2017/4/20.
//  Copyright © 2017年 曹臣. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    var lable: UILabel!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.red

        lable = UILabel.init(frame:self.bounds)
        lable.textColor = UIColor.white
        lable.textAlignment = NSTextAlignment.center
        lable.backgroundColor = UIColor.clear
        self.addSubview(lable)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class CustomCollectionViewLayout: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "cellIden")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5;
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellIden", for: indexPath) as! MyCollectionViewCell
        cell.lable.text = "\(indexPath.row)"
        
        return cell
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

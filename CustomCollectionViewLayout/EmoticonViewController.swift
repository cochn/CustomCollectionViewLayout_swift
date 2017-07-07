//
//  EmoticonViewController.swift
//  CustomCollectionViewLayout
//
//  Created by cochn on 2017/7/6.
//  Copyright © 2017年 cochn. All rights reserved.
//

import UIKit

class EmoticonCollectionViewCell: UICollectionViewCell {
    
    var lable: UILabel!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.lightGray
        
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

class EmoticonViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet var collectionView: UICollectionView!
    var atts: [NSString] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.register(EmoticonCollectionViewCell.self, forCellWithReuseIdentifier: "EmoticonCollectionViewCellIden")
        
        self.loadData()
    }
    
    func loadData() {
        
        for i in 0 ..< 50 {
            atts.append("\(i)" as NSString)
        }
        
        self.collectionView.reloadData()
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return atts.count;
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int{
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EmoticonCollectionViewCellIden", for: indexPath) as! EmoticonCollectionViewCell
        
        cell.lable.text = atts[indexPath.row] as String
        
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

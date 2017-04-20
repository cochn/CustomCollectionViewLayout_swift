//
//  ClassModel.swift
//  CustomCollectionViewLayout
//
//  Created by cochn on 2017/4/20.
//  Copyright © 2017年 cochn. All rights reserved.
//

import UIKit

class ClassModel: NSObject {

    var classTitle: String?
    var className: String?
    
    
    override init() {
        super.init()
    }
    
    init(classTitle title:String, className name: String) {
        self.classTitle = title;
        self.className  = name;
    }
    
    
}

//
//  ClassModel.swift
//  CustomCollectionViewLayout
//
//  Created by 曹臣 on 2017/4/20.
//  Copyright © 2017年 曹臣. All rights reserved.
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

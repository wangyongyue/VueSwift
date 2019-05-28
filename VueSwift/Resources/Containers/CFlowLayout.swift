//
//  CFlowLayout.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class CFlowLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(_ itemSize:CGSize,_ scrollDirection:UICollectionView.ScrollDirection) {
        super.init()
        self.itemSize = itemSize
        self.scrollDirection = scrollDirection
        
        self.minimumLineSpacing = 0
        self.minimumInteritemSpacing = 0
        self.sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    
    
}

//
//  CCollectionCell.swift
//  VueSwift
//
//  Created by apple on 2019/5/28.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class CCollectionCell: UICollectionViewCell {
    
    var holder:Holder?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func setModel(_ amodel:VueData){}
}

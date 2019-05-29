//
//  CCollectionCell.swift
//  VueSwift
//
//  Created by apple on 2019/5/28.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

open class CCollectionCell: UICollectionViewCell {
    
    open var holder:Holder?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    open func setModel(_ amodel:VueData){}
}

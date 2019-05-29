//
//  CTableCell.swift
//  VueSwift
//
//  Created by apple on 2019/5/28.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

open class CTableCell: UITableViewCell {

    open var holder:Holder?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    open func setModel(_ amodel:VueData){}
}

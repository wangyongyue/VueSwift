//
//  DetailsCell.swift
//  VueSwift
//
//  Created by wangyongyue on 2019/7/20.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class DetailsCell: UITableViewCell {
    
    
    let label = UILabel()
    let button = UIButton()
    let tap = UITapGestureRecognizer()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(label)
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 15)
        label.frame = CGRect.init(x: 20, y: 0, width:Screen.width()/2 - 20, height: 30)
        
        self.contentView.addGestureRecognizer(tap)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    override func setV_Model(_ aModel: VueData) {
        
        if aModel is DetailsModel{
            
            let h = aModel as! DetailsModel
            label.text = h.name
            tap.v_tap {
                
                h.v_identifier = 0
                h.v_to()
                
            }
            
        }
    }
   
    
}




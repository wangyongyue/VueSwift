//
//  MainTemplate.swift
//  VueSwift
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {
    
    
    let label = UILabel()
    let button = UIButton()
    let tap = UITapGestureRecognizer()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(label)
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 15)
        label.frame = CGRect.init(x: 12, y: 0, width:100, height: 30)
        
        button.setTitle("button", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        self.contentView.addSubview(button)
        button.frame = CGRect.init(x: 200, y: 0, width:100, height: 100)

        self.contentView.addGestureRecognizer(tap)

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
   
    override func setV_Model(_ aModel: VueData) {
        
        if aModel is MainModel{
            
            let h = aModel as! MainModel
            
            label.text = h.name
            
            button.v_click {
                
                h.v_identifier = 1
                h.v_to()
                
            }
            tap.v_tap {
                
                h.v_identifier = 0
                h.v_to()

            }

        }
        
    }
}




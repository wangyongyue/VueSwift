//
//  MainTemplate.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell,CellProtocol {
    
    
    let label = CLabel()
    let button = CButton()
    let tap = CGesture()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(label)
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 15)
        label.frame = CGRect.init(x: 20, y: 0, width:Screen.width()/2 - 20, height: 30)
        
        button.setTitle("点赞", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        self.contentView.addSubview(button)
        button.frame = CGRect.init(x: Screen.width()/2, y: 0, width: Screen.width()/2 - 20, height: 30)


        self.contentView.addGestureRecognizer(tap)

    }
   
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    func setModel(_ amodel: VueData) {
        
        if amodel is MainCellProtocol{
            
            let h = amodel as! MainCellProtocol
            label.v_text(vue: h.textVue)
            button.v_on(vue: h.clickVue)
            tap.v_on(vue: h.tapVue)
            h.startListen()
        }
    }


}
protocol MainCellProtocol {
  
    var textVue:Vue{get}
    var clickVue:Vue{get}
    var tapVue:Vue{get}
    
    func startListen()
}




//
//  MainTemplate.swift
//  VueSwift
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell,CellProtocol {
    
    
    let label = UILabel()
    let button = UIButton()
    let tap = UITapGestureRecognizer()
    let field = UITextField()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(field)

        self.contentView.addSubview(label)
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 15)
        label.frame = CGRect.init(x: 12, y: 0, width:100, height: 30)
        
        button.setTitle("button", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        self.contentView.addSubview(button)
        button.frame = CGRect.init(x: Screen.width() - 60, y: 0, width: 60, height: 30)

        
        field.borderStyle = .roundedRect
        field.frame = CGRect.init(x: 120, y: 0, width: 100, height: 30)

        

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
            field.v_input(vue: h.inputVue)

            tap.v_on(vue: h.tapVue)
            
            h.startListen()
        }
    }


}
protocol MainCellProtocol {
  
    var textVue:Vue{get}
    var clickVue:Vue{get}
    var inputVue:Vue{get}
    var tapVue:Vue{get}
    
    func startListen()
}




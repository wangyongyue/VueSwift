//
//  MainDetailsTemplate.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class MainDetailsCell: CTableCell {

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let label = CLabel()
        self.contentView.addSubview(label)
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 10)
        label.frame = CGRect.init(x: 20, y: 0, width:Screen.width()/2 - 20, height: 30)

        
        let field = CField()
        field.backgroundColor = UIColor.white
        field.borderStyle = .roundedRect
        field.textColor = UIColor.black
        field.placeholder = "请输入"
        self.contentView.addSubview(field)
        field.frame = CGRect.init(x: Screen.width()/2, y: 0, width: Screen.width()/2 - 20, height: 30)

        let h = MainDetailsHolder()
        field.v_input(vue: h.modelVue)
        label.v_text(vue: h.modelVue)

        holder = h
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        
    }
    override func setModel(_ amodel: Cat) {
        super.setModel(amodel)
        holder?.setModel(amodel)
    }
    
}
class MainDetailsModel: Cat {
    override init() {
        super.init()
        v_palm = "MainDetailsCell"
    }
    var name:String?
    
    
}
class MainDetailsHolder: Holder {
    var modelVue = Vue()
    
    override func setModel(_ amodel: Cat) {
        super.setModel(amodel)
        if amodel is MainDetailsModel{
            let a = amodel as! MainDetailsModel
            modelVue.v_input {[weak self] in
            
                a.name = self?.modelVue.v_text

            }
        }
       
    }
    
    
}

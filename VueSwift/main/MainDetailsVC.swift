//
//  MainDetailsVC.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class MainDetailsVC: CViewController {

    var arrayVue = Vue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        
        let table = CTable()
        self.view.addSubview(table)
        
        table.v_array(vue: self.arrayVue)
        table.frame = CGRect.init(x: 0, y: 100, width: Screen.width(), height: Screen.height() - 200)
        table.register([MainDetailsCell.classForCoder()])
        
        let button = CButton()
        button.setTitle("button", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        self.view.addSubview(button)
        button.frame = CGRect.init(x: 10, y: 600, width: 60, height: 30)
        
        
        let m = MainDetails()
        
        
        button.v_click {
            
            m.loadData(vue: self.arrayVue)
            
        }
        table.v_didSelect { (index) in
            
            print(Router.params())
//            Router.pop("Hello word \(index)" as! AnyObject)
            
            let a = table.array?[index] as! MainDetailsModel
            print(a.name)
            
            
        }
        
        
        
    }
    
    
    
}
class MainDetails:NSObject{
    
    func loadData(vue:Vue?){
        
        if let arr = vue?.v_array{
            vue?.v_array = nil
            return
        }
        var array = Array<Cat>()
        for i in 1...6{
            
            let m = MainDetailsModel()
            m.name = "wyyDetail\(i)"
            array.append(m)
        }
        
     
        vue?.v_array(false, v: { () -> Array<Cat>? in
            
            return array
        })
        
    }
    
    
    
}

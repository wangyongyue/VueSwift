//
//  MainVC.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit


class MainVC: CViewController {

    
    var vueArray = Vue()
    var vueEvent = Vue()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        
        let table = CTable()
        self.view.addSubview(table)
       
        table.frame = CGRect.init(x: 0, y: 100, width: Screen.width(), height: Screen.height() - 200)
        table.register([MainCell.classForCoder()])
        
        table.v_array(vue: vueArray)

        
        
        
        let button = CButton()
        button.setTitle("button", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        self.view.addSubview(button)
        button.frame = CGRect.init(x: 100, y: Screen.height() - 100, width:100, height: 30)

        
        let m = Main()
        button.v_click {
            
            m.loadData(vue: self.vueArray)
            
        }
        
        
        table.v_didSelect { (index) in

            let model = self.vueArray.v_array?[index] as! MainModel
            print(model.eventIdentifier)
            Router.push(MainDetailsVC(), ["id":10], { (obj) in
                print(obj)
            })
        }
        
    }

}
class Main:NSObject{
    
    func loadData(vue:Vue?){
        
        
        var array = Array<VueData>()
        for i in 1...3{
            
            let m = MainModel()
            m.name = "wyy\(i)"
            array.append(m)
           
        }
        

        vue?.v_array(true, v: { () -> Array<VueData>? in
            
            return array
        })
        
       
        
    }
   
    
}
class Screen{
    
    static func width() -> CGFloat{
        
        return UIScreen.main.bounds.width
    }
    static func height() -> CGFloat{
        
        return UIScreen.main.bounds.height
    }
}

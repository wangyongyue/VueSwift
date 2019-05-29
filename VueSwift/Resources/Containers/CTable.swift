//
//  CTable.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class CTable: UITableView ,UITableViewDataSource,UITableViewDelegate{

    static var templates = Array<AnyClass>()
    var array:Array<VueData>?
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        self.backgroundColor = UIColor.clear
        self.delegate = self
        self.dataSource = self
        self.separatorStyle = .none
        self.rowHeight = UITableView.automaticDimension
        self.estimatedRowHeight = 50.0
        
        register(CTable.templates)

    }
    override func numberOfRows(inSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = array?.count{
            return count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = array?[indexPath.row]
        if let m = model ,let palm = model?.v_palm {
            let cell = self.dequeueReusableCell(withIdentifier: palm, for: indexPath) as! CTableCell
            cell.selectionStyle = .none
            cell.setModel(m)
            
            cell.holder?.v_selectVue.v_on {
                
                self.block?(indexPath.row)
                self.vue?.v_index?(indexPath.row)
            }
            return cell
        }
       
        return CTableCell()
        
    }
    
    func register(_ templates:Array<AnyClass>){
        
        for value in templates{
            
            let className:String=NSStringFromClass(value).components(separatedBy: ".").last!
            self.register(value, forCellReuseIdentifier: className)
        }
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    //v-bind
    func v_bind(vue:Vue){
        vue.setupVue {
            
            if let dic = vue.v_blind{
                self.setValuesForKeys(dic)
            }
        }
        
    }
    //v-if
    func v_if(vue:Vue){
        
        vue.setupVue {
            
            if let v = vue.v_if{
                self.isHidden = v
            }
        }
        
    }
    
    //v-array
    func v_array(vue:Vue){
        
        vue.setupVue {
            self.array = vue.v_array
            self.reloadData()
            
        }
        
    }
    
    //v_didSelect
    typealias selectBlock = (_ index:Int) -> ()
    var block:selectBlock?
    func v_didSelect(vue:@escaping selectBlock){
        
        block = vue
        
    }
    
    
    //v-index
    var vue:Vue?
    func v_index(vue:Vue){
        
        self.vue = vue
        
    }
   
   
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        block?(indexPath.row)
//
//        self.vue?.v_index?(indexPath.row)
//    }

}

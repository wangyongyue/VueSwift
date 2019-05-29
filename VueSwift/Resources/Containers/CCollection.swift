//
//  CCollection.swift
//  CatFlow
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class CCollection: UICollectionView ,UICollectionViewDelegate,UICollectionViewDataSource{

    static var templates = Array<AnyClass>()
    var array:Array<VueData>?
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.backgroundColor = UIColor.clear
        self.delegate = self
        self.dataSource = self
        
        register(CCollection.templates)

        
    }
   
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = array?.count{
            return count
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let model = array?[indexPath.row]
        if let m = model,let palm = model?.v_palm{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: palm, for: indexPath) as! CCollectionCell
            cell.setModel(m)
            cell.holder?.v_selectVue.v_on {

                self.block?(indexPath.row)
                self.vue?.v_index?(indexPath.row)
            }
            
            
            return cell
        }
        return CCollectionCell()
        
    }
    
    func register(_ templates:Array<AnyClass>){

        for value in templates{
            let className:String=NSStringFromClass(value).components(separatedBy: ".").last!
            self.register(value, forCellWithReuseIdentifier: className)
        }
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
    

    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        block?(indexPath.row)
//
//        self.vue?.v_index?(indexPath.row)
//    }
    

}

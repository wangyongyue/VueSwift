//
//  Style.swift
//  swiftTest
//
//  Created by apple on 2019/3/29.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

class Style: NSObject {

    
    var x:CGFloat?
    func x(_ x:CGFloat) -> Style{
        self.x = x
        return self
    }
    var y:CGFloat?
    func y(_ y:CGFloat) -> Style{
        self.y = y
        return self
    }
    var width:CGFloat?
    func width(_ width:CGFloat) -> Style{
        self.width = width
        return self
    }
    var height:CGFloat?
    func height(_ height:CGFloat) -> Style{
        self.height = height
        return self
    }
    
    var backgroundColor:UIColor?
    func backgroundColor(_ color:UIColor) -> Style{
        backgroundColor = color
        return self
    }
    
    var font:UIFont?
    func font(_ font:UIFont) -> Style{
        self.font = font
        return self
    }
    
    var textColor:UIColor?
    func textColor(_ textColor:UIColor) -> Style{
        self.textColor = textColor
        return self
    }
    var isHidden:Bool?
    func isHidden(_ isHidden:Bool) -> Style{
        self.isHidden = isHidden
        return self
    }
    var placeholder:String?
    func placeholder(_ placeholder:String) -> Style{
        self.placeholder = placeholder
        return self
    }
    var borderStyle:UITextField.BorderStyle?
    func borderStyle(_ borderStyle:UITextField.BorderStyle) -> Style{
        self.borderStyle = borderStyle
        return self
    }
    var numberOfLines:Int?
    func numberOfLines(_ numberOfLines:Int) -> Style{
        self.numberOfLines = numberOfLines
        return self
    }
    var textAlignment:NSTextAlignment?
    func textAlignment(_ textAlignment:NSTextAlignment) -> Style{
        self.textAlignment = textAlignment
        return self
    }
    var clearsOnBeginEditing:Bool?
    func clearsOnBeginEditing(_ clearsOnBeginEditing:Bool) -> Style{
        self.clearsOnBeginEditing = clearsOnBeginEditing
        return self
    }
    var image:UIImage?
    func image(_ aimage:UIImage) -> Style{
        self.image = aimage
        return self
    }
    
    var selectedImage:UIImage?
    func selectedImage(_ aimage:UIImage) -> Style{
        self.selectedImage = aimage
        return self
    }
    
  
    var selectedTextColor:UIColor?
    func selectedTextColor(_ textColor:UIColor) -> Style{
        self.selectedTextColor = textColor
        return self
    }
  
    var text:String?
    func text(_ text:String) -> Style{
        self.text = text
        return self
    }
    var selectedText:String?
    func selectedText(_ text:String) -> Style{
        self.selectedText = text
        return self
    }
    
}

extension UIView{
    
    
    
    convenience init(_ style:Style){
        self.init()
        
        self.backgroundColor = style.backgroundColor
        if self is UILabel{
            let new = self as! UILabel
            new.textColor = style.textColor
            new.font = style.font
            new.text = style.text
            if let s1 = style.numberOfLines{
                new.numberOfLines = s1
            }
            if let s1 = style.textAlignment{
                new.textAlignment = s1
            }
            
        }else if self is UITextField{
            
            let new = self as! UITextField
            new.textColor = style.textColor
            new.font = style.font
            new.placeholder = style.placeholder
            new.text = style.text
            
            if let s1 = style.borderStyle{
                new.borderStyle = s1
                
            }
            if let s1 = style.textAlignment{
                new.textAlignment = s1
                
            }
            if let s1 = style.clearsOnBeginEditing{
                new.clearsOnBeginEditing = s1
                
            }
            
            
            
        }else if self is UITextView{
            let new = self as! UITextView
            new.textColor = style.textColor
            new.font = style.font
            new.text = style.text
            
            if let s1 = style.textAlignment{
                new.textAlignment = s1
                
            }
            
        }else if self is UIButton{
            let new = self as! UIButton
            new.titleLabel?.font = style.font
            new.setImage(style.image, for: .normal)
            new.setImage(style.selectedImage, for: .selected)
            new.setTitleColor(style.textColor, for: .normal)
            new.setTitleColor(style.selectedTextColor, for: .selected)
            
            new.setTitle(style.text, for: .normal)
            new.setTitle(style.selectedText, for: .selected)
        }
        
        
        setFrame(style)
        
    }
    
    private func setFrame(_ style:Style){
        
        let x = style.x
        let y = style.y
        let w = style.width
        let h = style.height
        if let x1 = x,let y1 = y,let w1 = w,let h1 = h{
            
            self.frame = CGRect.init(x: x1, y: y1, width: w1, height: h1)
        }
        
    }
    
    
}

//
//  Style.swift
//  swiftTest
//
//  Created by apple on 2019/3/29.
//  Copyright © 2019 wyy. All rights reserved.
//

import UIKit

public class Style: NSObject {

    internal var x:CGFloat?
    public func x(_ x:CGFloat) -> Style{
        self.x = x
        return self
    }
    internal var y:CGFloat?
    public func y(_ y:CGFloat) -> Style{
        self.y = y
        return self
    }
    internal var width:CGFloat?
    public func width(_ width:CGFloat) -> Style{
        self.width = width
        return self
    }
    internal var height:CGFloat?
    public func height(_ height:CGFloat) -> Style{
        self.height = height
        return self
    }
    
    internal var backgroundColor:UIColor?
    public func backgroundColor(_ color:UIColor) -> Style{
        backgroundColor = color
        return self
    }
    
    internal var font:UIFont?
    public func font(_ font:UIFont) -> Style{
        self.font = font
        return self
    }
    
    internal var textColor:UIColor?
    public func textColor(_ textColor:UIColor) -> Style{
        self.textColor = textColor
        return self
    }
    internal var isHidden:Bool?
    public func isHidden(_ isHidden:Bool) -> Style{
        self.isHidden = isHidden
        return self
    }
    internal var placeholder:String?
    public func placeholder(_ placeholder:String) -> Style{
        self.placeholder = placeholder
        return self
    }
    internal var borderStyle:UITextField.BorderStyle?
    public func borderStyle(_ borderStyle:UITextField.BorderStyle) -> Style{
        self.borderStyle = borderStyle
        return self
    }
    internal var numberOfLines:Int?
    public func numberOfLines(_ numberOfLines:Int) -> Style{
        self.numberOfLines = numberOfLines
        return self
    }
    internal var textAlignment:NSTextAlignment?
    public func textAlignment(_ textAlignment:NSTextAlignment) -> Style{
        self.textAlignment = textAlignment
        return self
    }
    internal var clearsOnBeginEditing:Bool?
    public func clearsOnBeginEditing(_ clearsOnBeginEditing:Bool) -> Style{
        self.clearsOnBeginEditing = clearsOnBeginEditing
        return self
    }
    internal var image:UIImage?
    public func image(_ aimage:UIImage) -> Style{
        self.image = aimage
        return self
    }
    
    internal var selectedImage:UIImage?
    public func selectedImage(_ aimage:UIImage) -> Style{
        self.selectedImage = aimage
        return self
    }
    
  
    internal var selectedTextColor:UIColor?
    public func selectedTextColor(_ textColor:UIColor) -> Style{
        self.selectedTextColor = textColor
        return self
    }
  
    internal var text:String?
    public func text(_ text:String) -> Style{
        self.text = text
        return self
    }
    internal var selectedText:String?
    public func selectedText(_ text:String) -> Style{
        self.selectedText = text
        return self
    }
    
}

extension UIView{
    
    
     public convenience init(_ style:Style){
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

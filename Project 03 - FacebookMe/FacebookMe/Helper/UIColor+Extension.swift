//
/*******************************************************************************
        
        File name:     UIColor+Extension.swift
        Author:        Kairon (李凯隆)
        Blog  :        https://coderkllee.github.io
        E-mail:        coderkllee@163.com
        
        Description:
        
        History:
                17/12/2019: File created.
        
********************************************************************************/
    

import UIKit

public extension UIColor {
    
    convenience init(r: Int, g: Int, b: Int, a:CGFloat) {
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: a)

    }
    
    convenience init(hex: Int) {
        self.init(r: (hex & 0xff0000) >> 16, g: (hex & 0xff00) >> 8, b: (hex & 0xff), a: 1)
    }
}

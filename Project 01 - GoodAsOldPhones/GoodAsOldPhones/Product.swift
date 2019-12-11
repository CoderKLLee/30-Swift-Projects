//
/*******************************************************************************
        
        File name:     Product.swift
        Author:        Kairon (李凯隆)
        Blog  :        https://coderkllee.github.io
        E-mail:        coderkllee@163.com
        
        Description:
        
        History:
                5/12/2019: File created.
        
********************************************************************************/
    

import Foundation

class Product {

    var name: String?
    var cellImageName: String?
    var fullscreenImageName: String?

    init(name: String, cellImageName: String, fullscreenImageName: String) {
        self.name = name
        self.cellImageName = cellImageName
        self.fullscreenImageName = fullscreenImageName
    }
    
    
}

//
/*******************************************************************************
        
        File name:     Stopwatch.swift
        Author:        Kairon (李凯隆)
        Blog  :        https://coderkllee.github.io
        E-mail:        coderkllee@163.com
        
        Description:
        
        History:
                12/12/2019: File created.
        
********************************************************************************/
    

import UIKit

class Stopwatch: NSObject {
    var counter: Double
    var timer: Timer
    
    override init() {
        counter = 0.0
        timer = Timer()
    }
    
}

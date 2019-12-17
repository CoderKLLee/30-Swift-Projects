//
/*******************************************************************************
        
        File name:     FBMeUser.swift
        Author:        Kairon (李凯隆)
        Blog  :        https://coderkllee.github.io
        E-mail:        coderkllee@163.com
        
        Description:
        
        History:
                17/12/2019: File created.
        
********************************************************************************/
    

import UIKit

class FBMeUser {
    var name: String
    var avatarName: String
    var education: String
    
    init(name: String, avatarName: String = "bayMax", education: String) {
      self.name = name
      self.avatarName = avatarName
      self.education = education
    }
}

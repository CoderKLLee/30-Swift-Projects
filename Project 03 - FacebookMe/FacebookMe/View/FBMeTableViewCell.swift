//
/*******************************************************************************
        
        File name:     FBMeTableViewCell.swift
        Author:        Kairon (李凯隆)
        Blog  :        https://coderkllee.github.io
        E-mail:        coderkllee@163.com
        
        Description:
        
        History:
                17/12/2019: File created.
        
********************************************************************************/
    

import UIKit

class FBMeTableViewCell: UITableViewCell {

    static let identifier = "FBMeTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: .default, reuseIdentifier: reuseIdentifier)
       
       backgroundColor = Specs.color.white
       textLabel?.textColor = Specs.color.black
       textLabel?.font = Specs.font.large
       
       detailTextLabel?.font = Specs.font.small
       detailTextLabel?.textColor = Specs.color.gray
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

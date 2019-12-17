//
/*******************************************************************************
        
        File name:     FBMeViewController.swift
        Author:        Kairon (李凯隆)
        Blog  :        https://coderkllee.github.io
        E-mail:        coderkllee@163.com
        
        Description:
        
        History:
                17/12/2019: File created.
        
********************************************************************************/
    

import UIKit

class FBMeViewController: UIViewController {

    // MARK:    ---     Variables
    private var user: FBMeUser {
        get {
            return FBMeUser(name: "BayMax", education: "CMU")
        }
    }
    
    private var tableViewDataSource: [[String: Any]] {
        get {
            return TableKeys.populate(withUser: user)
        }
    }
    
    // MARK:    ---     UI components
    lazy private var tableView : UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(FBMeTableViewCell.self, forCellReuseIdentifier: FBMeTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    
    // MARK:    ---     Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Facebook"
        navigationController?.navigationBar.barTintColor = Specs.color.tint
        view.backgroundColor = Specs.color.gray
        
        p_setLayout()
    }
    // MARK:    ---     OverwriteSuperClass
    
    // MARK:    ---     Response Mehtods
    
    // MARK:    ---     Delegate
    
    // MARK:    ---     Private Methods
    private func p_setLayout() {
        view.addSubview(tableView)
        
        // Set layout for tableView.
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tableView]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["tableView": tableView]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[tableView]-0-|", options: .directionLeadingToTrailing, metrics: nil, views: ["tableView": tableView]))
    }
    
    private func p_rowModel(at indexPath: IndexPath) -> [String: String] {
        let model = tableViewDataSource[indexPath.section][TableKeys.Rows] as! [Any]
        let rowModel = model[indexPath.row] as! [String: String]
        return rowModel
    }
    // MARK:    ---     Public Methods
    
 
}

// MARK:    ---     Extension
extension FBMeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewDataSource.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableViewDataSource[section][TableKeys.Section] as? String
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rows = tableViewDataSource[section][TableKeys.Rows] as! [Any]
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        let modelForCell = p_rowModel(at: indexPath)
        guard let title = modelForCell[TableKeys.Title]  else {
            return 0.0
        }
        
        if title == user.name {
            return 64.0
        } else {
            return 44.0
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        let modelForCell = p_rowModel(at: indexPath)

        
        guard let title = modelForCell[TableKeys.Title]  else {
            return cell
        }
        
        if title == user.name {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: nil)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: FBMeTableViewCell.identifier, for: indexPath)
        }
        
        cell.textLabel?.text = title
        
        if let imageName = modelForCell[TableKeys.ImageName] {
            cell.imageView?.image = UIImage(named: imageName)
        } else if title != TableKeys.logout {
             cell.imageView?.image = UIImage(named: Specs.imageName.placeholder)
        }
           
        if title == user.name {
            cell.detailTextLabel?.text = modelForCell[TableKeys.SubTitle]
         }
         

        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let modelForCell = p_rowModel(at: indexPath)

        guard let title = modelForCell[TableKeys.Title] else {
            return
        }
        
       if title == TableKeys.seeMore || title == TableKeys.addFavorites {
         cell.textLabel?.textColor = Specs.color.tint
         cell.accessoryType = .none
       } else if title == TableKeys.logout {
         cell.textLabel?.centerXAnchor.constraint(equalTo: cell.centerXAnchor).isActive = true
         cell.textLabel?.textColor = Specs.color.red
         cell.textLabel?.textAlignment = .center
         cell.accessoryType = .none
       } else {
         cell.accessoryType = .disclosureIndicator
       }
     }
    
    
}
 
 



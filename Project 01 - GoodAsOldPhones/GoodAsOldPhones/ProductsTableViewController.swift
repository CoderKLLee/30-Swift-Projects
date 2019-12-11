//
/*******************************************************************************
        
        File name:     ProductsTableViewController.swift
        Author:        Kairon (李凯隆)
        Blog  :        https://coderkllee.github.io
        E-mail:        coderkllee@163.com
        
        Description:
        
        History:
                5/12/2019: File created.
        
********************************************************************************/
    

import UIKit

class ProductsTableViewController: UITableViewController {
    
    private var products: [Product]?
    private let identifer = "productCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifer)
        
        products = [
          Product(name: "1907 Wall Set", cellImageName: "image-cell1", fullscreenImageName: "phone-fullscreen1"),
          Product(name: "1921 Dial Phone", cellImageName: "image-cell2", fullscreenImageName: "phone-fullscreen2"),
          Product(name: "1937 Desk Set", cellImageName: "image-cell3", fullscreenImageName: "phone-fullscreen3"),
          Product(name: "1984 Moto Portable", cellImageName: "image-cell4", fullscreenImageName: "phone-fullscreen4")
        ]
        
    }

}
    // MARK: - Table view data source
extension ProductsTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 18;
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 18;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.count ?? 0;
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifer, for: indexPath)
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        guard let products = products else { return cell }
        
        cell.textLabel?.text = products[indexPath.row].name

        if let imageName = products[indexPath.row].cellImageName {
            cell.imageView?.image = UIImage(named: imageName)
        }
        
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productViewController = ProductViewController();
        productViewController.prodoct = products?[indexPath.row]
        productViewController.hidesBottomBarWhenPushed = true;
        navigationController?.pushViewController(productViewController, animated: true)
        
    }
    
}


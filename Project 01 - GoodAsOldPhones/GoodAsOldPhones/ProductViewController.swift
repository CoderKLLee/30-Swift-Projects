//
/*******************************************************************************
        
        File name:     ProductViewController.swift
        Author:        Kairon (李凯隆)
        Blog  :        https://coderkllee.github.io
        E-mail:        coderkllee@163.com
        
        Description:
        
        History:
                3/12/2019: File created.
        
********************************************************************************/
    

import UIKit

class ProductViewController: UIViewController {
    
    var prodoct : Product?
    
    lazy private var productImageView : UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height));
        imageView.image = UIImage(named: self.prodoct?.fullscreenImageName ?? "")
        return imageView;
    }()
     
    lazy private var addProductButton : UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom);
        button.frame = CGRect(x: 100, y: 200, width: 160, height: 40)
        button.addTarget(self, action: #selector(onAddProductClick), for: UIControl.Event.touchUpInside)
        button.setBackgroundImage(UIImage(named:"button-addtocart" ), for: UIControl.State.normal)
        return button;
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white;
        title = prodoct?.name
        
        view.addSubview(productImageView);
        view.addSubview(addProductButton);
        
        
    }
    
    @objc func onAddProductClick() {
        print("Add to cart successfully")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

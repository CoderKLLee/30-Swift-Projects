//
/*******************************************************************************
        
        File name:     ContactViewController.swift
        Author:        Kairon (李凯隆)
        Blog  :        https://coderkllee.github.io
        E-mail:        coderkllee@163.com
        
        Description:
        
        History:
                3/12/2019: File created.
        
********************************************************************************/
    

import UIKit

class ContactViewController: UIViewController {
    
    lazy private var scrollView : UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 10);
        return scrollView
    }()
    
    lazy private var headerImageView : UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 125))
        imageView.image = UIImage(named: "header-contact")
        return imageView
    }()
    
    lazy private var aboutUsLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: self.headerImageView.frame.maxY + 50, width: UIScreen.main.bounds.width - 20, height: 40))
        label.lineBreakMode = NSLineBreakMode.byTruncatingTail
        label.font = UIFont(name: "DamascusBold", size: 24.0)
        label.text = "About Us";
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    lazy private var oneParagraphLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 70, y: self.aboutUsLabel.frame.maxY + 8, width: UIScreen.main.bounds.width - 140, height: 125))
        label.lineBreakMode = NSLineBreakMode.byTruncatingTail
        label.text = "Good as Old Phones returns the phones of  yesteryear back to their original glory and then gets them into the hands* of those who appreciate them most:";
        label.numberOfLines = 0;
        label.sizeToFit();
        return label
    }()
    
    lazy private var twoParagraphLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 70, y:self.oneParagraphLabel.frame.maxY + 20, width: UIScreen.main.bounds.width - 140, height: 125))
           label.lineBreakMode = NSLineBreakMode.byTruncatingTail
           label.text = "Whether you are looking for a turn-of-the-century wall set or a Zack Morris Special, we've got you covered. Give us a ring, and we will get you connected. ";
           label.numberOfLines = 0;
           label.sizeToFit();
           return label
       }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        view.addSubview(scrollView);
        
        scrollView.addSubview(headerImageView)
        scrollView.addSubview(aboutUsLabel)
        scrollView.addSubview(oneParagraphLabel)
        scrollView.addSubview(twoParagraphLabel)
        
    }
   
}

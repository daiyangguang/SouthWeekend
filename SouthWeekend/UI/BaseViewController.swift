//
//  BaseViewController.swift
//  
//
//  Created by 随随意 on 17/2/6.
//
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.barTintColor = UIColor.red
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        button.setImage(UIImage(named: "top_navigation_searchbutton"), for: .normal)
        button.addTarget(self, action: #selector(BaseViewController.searchAction), for: UIControlEvents.touchUpInside)
        let searchButtonItem = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItem = searchButtonItem
        //判断手机类型 设置背景色
        if IsiPhone4 {
            view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_4.jpg")!)
        }
        else if IsiPhone5 {
            view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_5.jpg")!)

        }
        else if IsiPhone6 {
            view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_6.jpg")!)
 
        }
        else if IsiPhone6P {
            view.backgroundColor = UIColor(patternImage: UIImage(named: "bg_6p.jpg")!)
        }
        else {
            
        }
        view.backgroundColor = UIColor.blue
    }
    func searchAction() {
        print("search")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

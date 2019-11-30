//
//  DashboardViewController.swift
//  Rebuild-IOSVB
//
//  Created by Mắt Kính IG on 11/29/19.
//  Copyright © 2019 Mắt Kính IG. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var btnMenu: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("da qua")
        setupNavigationBarItem()
        // Do any additional setup after loading the view.
    }
    
    private func setupNavigationBarItem(){
        print(123)
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "header_logo-default"))
        self.navigationItem.titleView = titleImageView
        
//        let menuLeft = UIButton(type: .system)
//        menuLeft.setImage(#imageLiteral(resourceName: "reveal-icon"), for: .normal)
//        menuLeft.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
//        menuLeft.contentMode = .scaleAspectFit
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuLeft)
    }
    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        let menuView = STORYBOARD_ACTIVATION.instantiateViewController(withIdentifier: "MenuTableViewController") as! MenuTableViewController
        self.present(menuView, animated: true, completion: nil)
        
    }
    

}

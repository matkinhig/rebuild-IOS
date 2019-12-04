//
//  FirstViewController.swift
//  Rebuild-IOSVB
//
//  Created by Mắt Kính IG on 11/25/19.
//  Copyright © 2019 Mắt Kính IG. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FirstViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let transition = SlideTransition()
    var heightScreen = UIScreen.main.bounds.height
    
    let locationManager = CLLocationManager()
    let regionMeter : Double = 10000
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let menuView = STORYBOARD_HOME.instantiateViewController(withIdentifier: "MenuTableViewController") as! MenuTableViewController
        menuView.modalPresentationStyle = .overCurrentContext
        menuView.transitioningDelegate = self
        
        //        self.present(menuView)
        present(menuView, animated: true)
    }
}


extension FirstViewController : UITableViewDelegate , UITableViewDataSource, UIViewControllerTransitioningDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let firstCell = tableView.dequeueReusableCell(withIdentifier: "FirstMapCell", for: indexPath) as! FirstMapCell
            return firstCell
        }
        else {
            let secondCell = tableView.dequeueReusableCell(withIdentifier: "FirstCurrencyCell", for: indexPath) as! FirstCurrencyCell
            return secondCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return self.view.frame.height * 0.5
        }
        else { return 180 }
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    
}

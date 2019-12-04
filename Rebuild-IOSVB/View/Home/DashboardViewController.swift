//
//  DashboardViewController.swift
//  Rebuild-IOSVB
//
//  Created by Mắt Kính IG on 11/29/19.
//  Copyright © 2019 Mắt Kính IG. All rights reserved.
//

import UIKit



class DashboardViewController: UIViewController {
    
    let transition = SlideTransition()
    var heightScreen = UIScreen.main.bounds.height
    
    @IBOutlet weak var btnMenu: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("da qua")
        setupNavigationBarItem()
        // Do any additional setup after loading the view.
    }
    
    private func setupNavigationBarItem(){
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "header_logo-default"))
        self.navigationItem.titleView = titleImageView
    }
    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        let menuView = STORYBOARD_HOME.instantiateViewController(withIdentifier: "MenuTableViewController") as! MenuTableViewController
        menuView.modalPresentationStyle = .overCurrentContext
        menuView.transitioningDelegate = self
        present(menuView, animated: true)
    }
    
    
}

extension DashboardViewController : UIViewControllerTransitioningDelegate , UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell : UITableViewCell = UITableViewCell(style: .subtitle, reuseIdentifier: "CellHeader")
        switch section {
        case 0:
            cell.textLabel?.text = "Card"
            break
        case 1:
            cell.textLabel?.text = "Account"
            break
        case 2:
            cell.textLabel?.text = "Send Money"
            break
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 3
        case 2:
            return 3
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BodyTableViewCell", for: indexPath) as! BodyTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
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

//
//  MainMenuViewController.swift
//  Rebuild-IOSVB
//
//  Created by Mắt Kính IG on 12/7/19.
//  Copyright © 2019 Mắt Kính IG. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    let transition = SlideTransition()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }

}
extension MainMenuViewController : UIViewControllerTransitioningDelegate, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        case 2:
            return 4
        case 3:
            return 1
        case 4:
            return 2
        case 5:
            return 2
        case 6:
            return 3
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainMenuCell", for: indexPath) as! MainMenuCell
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                cell.lb.text = "Home"
                cell.img.image = UIImage(named: "icons8-bank-building-100")
                return cell
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0:
                cell.lb.text = "Account Overview"
                cell.img.image = UIImage(named: "account")
                return cell
            case 1:
                cell.lb.text = "Card Overview"
                cell.img.image = UIImage(named: "card")
                return cell
            case 2:
                cell.lb.text = "Transaction History"
                cell.img.image = UIImage(named: "history")
                return cell
            default:
                break
            }
        case 2:
            switch indexPath.row {
            case 0:
                cell.lb.text = "Between Own Account"
                cell.img.image = UIImage(named: "between")
                return cell
            case 1:
                cell.lb.text = "Send Money"
                cell.img.image = UIImage(named: "send-money")
                return cell
            case 2:
                cell.lb.text = "Pay Bill"
                cell.img.image = UIImage(named: "pay-bill")
                return cell
            default:
                cell.lb.text = "Recurring Payments"
                cell.img.image = UIImage(named: "recurring-payment")
                return cell
            }
        case 3:
            switch indexPath.row {
            case 0:
                cell.lb.text = "Offers"
                cell.img.image = UIImage(named: "offer")
                return cell
            default:
                break
            }
        case 4:
            switch indexPath.row {
            case 0:
                cell.lb.text = "Signatures"
                cell.img.image = UIImage(named: "signature")
                return cell
            case 1:
                cell.lb.text = "Saves"
                cell.img.image = UIImage(named: "save")
                return cell
            default:
                break
            }
        case 5:
            switch indexPath.row {
            case 0:
                cell.lb.text = "Budget"
                cell.img.image = UIImage(named: "budget")
                return cell
            case 1:
                cell.lb.text = "Saving Goals"
                cell.img.image = UIImage(named: "saving-goal")
                return cell
            default:
                break
            }
        case 6:
            switch indexPath.row {
            case 0:
                cell.lb.text = "Mail Box"
                cell.img.image = UIImage(named: "mail-box")
                return cell
            case 1:
                cell.lb.text = "Token"
                cell.img.image = UIImage(named: "token")
                return cell
            default:
                cell.lb.text = "Settings"
                cell.img.image = UIImage(named: "setting")
                return cell
            }
        default:
            switch indexPath.row {
            case 0:
                cell.lb.text = "Currencies"
                cell.img.image = UIImage(named: "currency")
                return cell
            default:
                break
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as! HeaderTableViewCell
        switch section {
        case 0:
            break
        case 1:
            headerCell.lbTitle.text = "ACCOUNT & CARD"
        case 2:
            headerCell.lbTitle.text = "TRANSFERS"
        case 3:
            headerCell.lbTitle.text = "APPLICATION"
        case 4:
            headerCell.lbTitle.text = "ORDERS"
        case 5:
            headerCell.lbTitle.text = "PERSONAL FINANCES"
        case 6:
            headerCell.lbTitle.text = "PROFILE"
        default:
            headerCell.lbTitle.text = "INFORMATION"
        }
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        else { return 30 }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 42
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true, completion: nil)
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

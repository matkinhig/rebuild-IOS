//
//  PinViewController.swift
//  Rebuild-IOSVB
//
//  Created by Mắt Kính IG on 11/29/19.
//  Copyright © 2019 Mắt Kính IG. All rights reserved.
//

import UIKit

class PinViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var btnOK: UIButton!
    @IBOutlet weak var lbEnterPin: UILabel!
    @IBOutlet weak var lbPin: UILabel!
    
    var inputText : String = ""
    var confirmText : String = ""
    
    var entryPoint : String = ""
    
    var isConfirm : Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(entryPoint.isEmpty)
        setupNavigationBarItem()
    }
    
    private func setupNavigationBarItem(){
        self.navigationItem.title = "Device Activation"
        self.navigationController?.navigationBar.barTintColor = UIColor.systemBlue
        
        let textChangeColor = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textChangeColor
        
        let leftItem = UIButton(type: .system)
        leftItem.setImage(#imageLiteral(resourceName: "back_white-default"), for: .normal)
        leftItem.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        leftItem.contentMode = .scaleAspectFit
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "back_white-default").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(dismissView))
    }
    
    @objc func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("111111")
        self.isEditing = false
    }
    @IBAction func actionNumPad(_ sender: UIButton) {
        if !isConfirm {
            entryPoint += String(sender.tag)
            lbPin.text = entryPoint
            let nsString = entryPoint as NSString
            if nsString.length >= 6 {
                lbPin.text = nsString.substring(with: NSRange(location: 0, length: nsString.length > 6 ? 6 : nsString.length))
                entryPoint = lbPin.text!
            }
            inputText = entryPoint
            print(inputText)
        }
        else {
            entryPoint += String(sender.tag)
            lbPin.text = entryPoint
            let nsString = entryPoint as NSString
            if nsString.length >= 6 {
                lbPin.text = nsString.substring(with: NSRange(location: 0, length: nsString.length > 6 ? 6 : nsString.length))
                entryPoint = lbPin.text!
            }
            confirmText = entryPoint
            print(confirmText)
        }
        
        
    }
    @IBAction func changePage(_ sender: Any) {
        if inputText.count < 5 {
            lbPin.text = ""
            entryPoint = ""
            inputText = ""
            let alertController = UIAlertController(title: "Cảnh báo", message: "Độ dài của pin phải đủ 6 kí tự", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Xác nhận", style: UIAlertAction.Style.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            print("nhap lai")
        } else {
            if !isConfirm {
                lbEnterPin.text = "Confirm your pin"
                isConfirm = true
                lbPin.text = ""
                entryPoint = ""
            }
            else {
                if inputText == confirmText {
                    print("giong nhau")
                    let homeView = STORYBOARD_HOME.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
                    let navController = UINavigationController(rootViewController: homeView)
                    navController.modalPresentationStyle = .fullScreen
                    self.navigationController?.present(navController, animated: true, completion: nil)
                }
                else {
                    lbEnterPin.text = "Enter pin"
                    isConfirm = false
                    inputText = ""
                    confirmText = ""
                    lbPin.text = ""
                    entryPoint = ""
                    let alertController = UIAlertController(title: "Cảnh báo", message: "Xác nhận pin không giống vui lòng nhập lại", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Xác nhận", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                    print("nhap lai")
                }
            }
        }
        
    }
    
}

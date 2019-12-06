//
//  LoginIDViewController.swift
//  Rebuild-IOSVB
//
//  Created by Mắt Kính IG on 11/27/19.
//  Copyright © 2019 Mắt Kính IG. All rights reserved.
//

import UIKit

class LoginIDViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var viewText: UIView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewText.layer.cornerRadius = 5
        textField.smartInsertDeleteType = UITextSmartInsertDeleteType.no
        textField.delegate = self
        // Do any additional setup after loading the view.
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 30
    }
    @IBAction func didTapNext(_ sender: UIButton) {
        
    }
    
}

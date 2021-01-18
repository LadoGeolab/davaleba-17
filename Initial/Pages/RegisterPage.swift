//
//  RegisterPage.swift
//  Initial
//
//  Created by Ladolado3911 on 1/8/21.
//

import UIKit
import Firebase

class RegisterPage: UIViewController {
    
 
    @IBOutlet weak var newMail: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var contBtn: UIButton!
    @IBOutlet weak var warning: UILabel!
    @IBOutlet weak var logBtn: UIButton!
    
    var match: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        newMail.delegate = self
        newPassword.delegate = self
        
        warning.isHidden = true
        // Do any additional setup after loading the view.
    }

    @IBAction func contBtnAct(_ sender: UIButton) {
        guard let mail = newMail.text else { return }
        guard let pass = newPassword.text else { return }

        Auth.auth().createUser(withEmail: mail, password: pass) { authResult, error in
            if (error == nil) {
                self.warning.isHidden = true
                self.dismiss(animated: true, completion: nil)
            }
            else {
                self.warning.text = String(error!.localizedDescription)
                self.warning.isHidden = false
            }
        }
    }
    
    @IBAction func logBtnAct(_ sender: UIButton) {
        newMail.text = ""
        newPassword.text = ""
        warning.isHidden = true
        self.dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension RegisterPage: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}


//
//  LogInPage.swift
//  Initial
//
//  Created by Ladolado3911 on 1/8/21.
//

import UIKit
import Firebase

class LogInPage: UIViewController {
    
    
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var ContinueBtn: UIButton!
    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var warning: UILabel!
    
    private let database = Database.database().reference()
    
    let registerPage = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "RegisterPage") as RegisterPage
    
    let profilePage = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ProfilePage") as ProfilePage
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserName.delegate = self
        Password.delegate = self
        
        
        warning.isHidden = true
        self.navigationController?.navigationBar.isHidden = true
    }

    @IBAction func ContinueBtnn(_ sender: UIButton) {
        guard let mail = UserName.text else { return }
        guard let pass = Password.text else { return }
        
        Auth.auth().signIn(withEmail: mail, password: pass) { [weak self] authResult, error in
          //guard let strongSelf = self else { return }
          // ...
            if (error == nil) {
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ProfilePage") as? ProfilePage
                self!.UserName.text = ""
                self!.Password.text = ""
                self!.warning.text = ""
                
                let uid = Auth.auth().currentUser?.uid
                let mail = Auth.auth().currentUser?.email
                
                vc!.uid = uid
                vc!.mail = mail
                
                self!.navigationController!.pushViewController(vc!, animated: true)
            }
            else {
                self!.warning.text = String(error!.localizedDescription)
                self!.warning.isHidden = false
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func goToSignUp(_ sender: UIButton) {
        warning.isHidden = true
        self.present(registerPage, animated: true, completion: nil)
    }
}

extension LogInPage: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}



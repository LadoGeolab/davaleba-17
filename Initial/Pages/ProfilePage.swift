//
//  ProfilePage.swift
//  Initial
//
//  Created by Ladolado3911 on 1/8/21.
//

import UIKit
import Firebase

class ProfilePage: UIViewController {
    
    @IBOutlet weak var yourmail: UILabel!

    var mail: String?
    var uid: String?


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        yourmail.text = mail
    }

    @IBAction func logOutAct(_ sender: UIButton) {
        //database.child("Users")
        self.navigationController?.popViewController(animated: true)
    }
}

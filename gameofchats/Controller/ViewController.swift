//
//  ViewController.swift
//  gameofchats
//
//  Created by John Ryan on 8/3/17.
//  Copyright © 2017 John Ryan. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
        //user's not logged in
        if Auth.auth().currentUser?.uid == nil {
//            perform(#selector(handleLogout), with: nil, afterDelay: 1)
            handleLogout()
        }
        
        }
    
    @objc func handleLogout() {
        
        do {
            try Auth.auth().signOut()
            } catch let logoutError {
            print(logoutError)
        }
        
        
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
        
    }


}


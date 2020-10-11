//
//  ViewController.swift
//  FaceRecognitionProject
//
//  Created by Radhi Mighri on 04/10/2020.
//  Copyright © 2020 Radhi Mighri. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signInClicked(_ sender: UIButton) {
        
        let authContext = LAContext()
        
        var error: NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you?") { (success, error) in
                DispatchQueue.main.async { //the above code will be runned in the background in order to not block the user interface
                    if success == true {
                        //successful auth
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    } else {
                        self.myLabel.text = "Error!"
                    }
                }
            }
        }
    }
}


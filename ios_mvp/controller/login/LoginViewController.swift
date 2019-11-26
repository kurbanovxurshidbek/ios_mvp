//
//  LoginViewController.swift
//  ios_mvp
//
//  Created by KHURSHIDBEK on 2019/11/08.
//  Copyright © 2019 UHanaro. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController, LoginView {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var errorLabel: UILabel!
    
    var presenter: LoginPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
    }

    // MARK: - Action
    
    @IBAction func loginAction(_ sender: Any) {
    }
    
    // MARK: - Method
    
    func initViews(){
        presenter = LoginPresenter()
        presenter.loginView = self
        
    }
    
    // MARK: - Response
    
    func onLoginSuccess(result: Result) {
        if(result.status == "0"){
            sceneDelegate().callHomeController()
        }else{
            errorLabel.text = result.message
        }
    }
    
    func onLoginFailure(result: Result) {
        errorLabel.text = result.message
    }

}

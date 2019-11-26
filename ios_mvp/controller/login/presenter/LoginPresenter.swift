//
//  LoginPresenterImpl.swift
//  ios_mvp
//
//  Created by KHURSHIDBEK on 2019/11/08.
//  Copyright © 2019 UHanaro. All rights reserved.
//

import Foundation

protocol LoginPresenterProtocol {
    func handleLogin(email:String, password:String)
}

class LoginPresenter: LoginPresenterProtocol {
    
    var loginView: LoginView!
    
    func handleLogin(email: String, password: String) {
        AlamHttp.get(url: AlamHttp.API_USER_LOGIN, params: AlamHttp.paramsLogin(email: email, password: password),handler: { response in

            switch response.result {
            case .success:
                let result = try! JSONDecoder().decode(Result.self, from: response.data!)
                self.loginView.onLoginSuccess(result: result)
            case .failure(let error):
                let result = Result()
                result.message = error.localizedDescription
                self.loginView.onLoginFailure(result: result)
            }
        })
    }
    
}

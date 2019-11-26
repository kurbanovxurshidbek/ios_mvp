//
//  LoginView.swift
//  ios_mvp
//
//  Created by KHURSHIDBEK on 2019/11/08.
//  Copyright © 2019 UHanaro. All rights reserved.
//

import Foundation

protocol LoginView {
    func onLoginSuccess(result:Result)
    func onLoginFailure(result:Result)
}

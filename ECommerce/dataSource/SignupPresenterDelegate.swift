//
//  File.swift
//  ECommerce
//
//  Created by Ahmed Aboelela on 7/24/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import Foundation
protocol SignupPresenterDelegate {
    func onSignupSuccess(user: User)
    func onFailure(message: String)
}

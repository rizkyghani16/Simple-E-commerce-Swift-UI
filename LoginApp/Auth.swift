//
//  Auth.swift
//  LoginApp
//
//  Created by Willi Ismail Munggaran on 10/10/20.
//

import Foundation
class Auth: ObservableObject {
    @Published var isLoggedin: Bool = false
    @Published var isCorrect: Bool = true
}

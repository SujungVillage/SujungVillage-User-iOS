//
//  UserLoginManager.swift
//  SujungVillage-User
//
//  Created by 홍세은 on 2022/10/01.
//

import Alamofire

class UserLoginManager {
    static let shared = UserLoginManager()
    
    func setUser(
        jwtToken: String? = nil,
        refreshToken: String? = nil
    ) {
        let defaults = UserDefaults.standard
        if let jwtToken = jwtToken {
            defaults.set(jwtToken, forKey: "jwtToken")
        }
        defaults.isLogedIn = true
    }
    
    func doLogin(id: String, pwd: String, fcmToken: String) {
        Repository.shared.doLogin(id: id, pwd: pwd, fcmToken: fcmToken) { status, loginResponse in
            switch status {
            case .ok:
                if let jwtToken = loginResponse?.jwtToken {
                    print("jwtToken: \(jwtToken)")
                    self.setUser(jwtToken: jwtToken)
                }
            default:
                UserDefaults.standard.isLogedIn = false
                print("error: \(status)")
                break
            }
        }
    }
    
    func doLogout() {
        UserDefaults.standard.removeObject(forKey: "jwtToken")
        UserDefaults.standard.isLogedIn = false
    }
}

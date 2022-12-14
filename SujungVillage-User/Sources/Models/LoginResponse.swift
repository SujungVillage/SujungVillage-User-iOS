//
//  LoginResponse.swift
//  SujungVillage-User
//
//  Created by νμΈμ on 2022/10/01.
//

import Foundation

struct LoginResponse: Codable {
    var jwtToken: String?
    var refreshToken: String?
}

struct RefreshResponse: Codable {
    var jwtToken: String?
}

struct SignUpModel: Codable {
    var id, password, name, dormitoryName, detailedAddress, phoneNumber: String
}

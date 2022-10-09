//
//  GetLMPHistoryResponse.swift
//  SujungVillage-User
//
//  Created by 홍세은 on 2022/10/09.
//

import Foundation

struct GetLMPHistoryResponse: Codable {
    let histories: [History]
}

struct History: Codable {
    let id: Int
    let userID: String
    let score: Int
    let reason, regDate: String

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "userId"
        case score, reason, regDate
    }
}
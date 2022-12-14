//
//  GetLMPHistoryResponse.swift
//  SujungVillage-User
//
//  Created by νμΈμ on 2022/10/09.
//

import Foundation

struct LMPHistoryResponse: Codable {
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

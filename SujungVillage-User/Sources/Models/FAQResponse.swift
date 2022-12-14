//
//  FAQResponse.swift
//  SujungVillage-User
//
//  Created by νμΈμ on 2022/10/29.
//

import Foundation

struct FAQListResponse: Codable {
    let id: Int
    let writerID, question, answer, dormitoryName, regDate, modDate: String
    var isOpen: Bool = false

    enum CodingKeys: String, CodingKey {
        case id
        case writerID = "writerId"
        case question, answer, dormitoryName, regDate, modDate
    }
}

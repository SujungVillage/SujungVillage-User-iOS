//
//  NoticeTitleResponse.swift
//  SujungVillage-User
//
//  Created by νμΈμ on 2022/10/12.
//

import Foundation

struct NoticeTitleResponse: Codable {
    let id: Int
    let title, dormitoryName, regDate: String
}

struct NoticeDetailResponse: Codable {
    let id: Int
    let writerID, title, content, regDate, modDate, dormitoryName: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case writerID = "writerId"
        case title, content, regDate, modDate, dormitoryName
    }
}

//
//  NoticeTitleResponse.swift
//  SujungVillage-User
//
//  Created by 홍세은 on 2022/10/12.
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

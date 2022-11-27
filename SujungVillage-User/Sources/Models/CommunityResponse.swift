//
//  CommunityResponse.swift
//  SujungVillage-User
//
//  Created by 홍세은 on 2022/11/24.
//

import Foundation

struct CommunityPostResponse: Codable {
    let id: Int
    let title, content, writerID, regDate: String
    let numOfComments: Int
    
    enum CodingKeys: String, CodingKey {
        case id, title, content
        case writerID = "writerId"
        case regDate, numOfComments
    }
}

struct CommunityWritePostModel: Codable {
    let title, content: String
}

struct CommunityWritePostResponse: Codable {
    let id: Int
    let writerID, title, content, regDate: String
    let modDate: String

    enum CodingKeys: String, CodingKey {
        case id
        case writerID = "writerId"
        case title, content, regDate, modDate
    }
}

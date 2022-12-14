//
//  HomeResponse.swift
//  SujungVillage-User
//
//  Created by νμΈμ on 2022/10/02.
//

import Foundation

//struct HomeResponse: Codable {
//    let residentInfo: ResidentInfo
//    let rollcallDays, appliedRollcallDays, appliedExeatDays: [Day]
//    let appliedLongTermExeatDays: [AppliedLongTermExeatDay]
//}
//
//struct Day: Codable {
//    let id, day: Int
//}
//
//struct AppliedLongTermExeatDay: Codable {
//    let id: Int
//    let startDate, endDate: String
//}
//
//struct ResidentInfo: Codable {
//    let name, dormitoryName, detailedAddress: String
//    let plusLMP, minusLMP: Int
//}
struct HomeResponse: Codable {
    let residentInfo: ResidentInfo
    let rollcallDays, appliedRollcallDays, appliedExeatDays: [Day]
    let appliedLongTermExeatDays: [AppliedLongTermExeatDay]
}

struct Day: Codable {
    let id, day: Int
}

struct AppliedLongTermExeatDay: Codable {
    let id: Int
    let days: [Int]
}

struct ResidentInfo: Codable {
    let name, dormitoryName, detailedAddress: String
    let plusLMP, minusLMP: Int
}

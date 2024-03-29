//
//  HomeViewModel.swift
//  SujungVillage-User
//
//  Created by 홍세은 on 2022/10/03.
//

import Foundation

class UserInfoViewModel {
    static let shared = UserInfoViewModel()
    private init() {}
    let repository = Repository()
    var onUpdated: () -> Void = {}
    var year: Int = Calendar.current.component(.year, from: Date())
    var month: Int = Calendar.current.component(.month, from: Date())
    
    var userName: String = "???"
    {
        didSet {
            onUpdated()
        }
    }
    
    var dormitoryName: String = ""
    {
        didSet {
            onUpdated()
        }
    }
    
    var detailedAddress: String = ""
    {
        didSet {
            onUpdated()
        }
    }
    
    var plusLMP: Int = 0
    {
        didSet {
            onUpdated()
        }
    }
    
    var minusLMP: Int = 0
    {
        didSet {
            onUpdated()
        }
    }
    
    var rollcallDays: [Day] = []
    {
        didSet {
            onUpdated()
        }
    }

    var appliedRollcallDays: [Day] = []
    {
        didSet {
            onUpdated()
        }
    }

    var appliedExeatDays: [Day] = []
    {
        didSet {
            onUpdated()
        }
    }
    
    var appliedLongTermExeatDays: [AppliedLongTermExeatDay] = []
    {
        didSet {
            onUpdated()
        }
    }
    
    var appliedLongTermExeatDaysAllDates: [LongTermExeatModel] = []
    {
        didSet {
            onUpdated()
        }
    }
    
    func fetchResidentInfo(year: Int, month: Int) {
        self.repository.getHomeInfo(year: year, month: month) { status, userInfoResponse in
            switch status {
            case .ok:
                if let name = userInfoResponse?.residentInfo.name,
                   let dormitory = userInfoResponse?.residentInfo.dormitoryName,
                   let detail = userInfoResponse?.residentInfo.detailedAddress,
                   let plus = userInfoResponse?.residentInfo.plusLMP,
                   let minus = userInfoResponse?.residentInfo.minusLMP,
                   let rollcallDays = userInfoResponse?.rollcallDays,
                   let appliedRollcallDays = userInfoResponse?.appliedRollcallDays,
                   let appliedExeatDays = userInfoResponse?.appliedExeatDays,
                   let appliedLongTermExeatDays = userInfoResponse?.appliedLongTermExeatDays {
                    self.userName = name
                    self.dormitoryName = dormitory
                    self.detailedAddress = detail
                    self.plusLMP = plus
                    self.minusLMP = minus
                    self.rollcallDays = rollcallDays
                    self.appliedRollcallDays = appliedRollcallDays
                    self.appliedExeatDays = appliedExeatDays
                    self.appliedLongTermExeatDays = appliedLongTermExeatDays
                    self.appliedLongTermExeatDaysAllDates.removeAll()
                    for days in appliedLongTermExeatDays {
                        let id = days.id
                        for i in days.days {
                            let date = "\(year)-\(month)-\(i)"
                            let model = LongTermExeatModel(date: date, id: id)
                            self.appliedLongTermExeatDaysAllDates.append(model)
                        }
                    }
                }
            default:
                print("home viewmodel error: \(status)")
                break
            }
        }
    }
}

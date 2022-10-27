//
//  GetExeatInfoViewModel.swift
//  SujungVillage-User
//
//  Created by 홍세은 on 2022/10/21.
//

import Foundation

class GetExeatInfoViewModel {
    static let shared = GetExeatInfoViewModel()
    private init() {}
    let repository =  Repository()
    var onUpdated: () -> Void = {}
    var exeatId: Int = -101
    
    var destination: String = ""
    {
        didSet {
            onUpdated()
        }
    }
    
    var reason: String = ""
    {
        didSet {
            onUpdated()
        }
    }
    
    var emergencyPhoneNumber: String = ""
    {
        didSet {
            onUpdated()
        }
    }
    
    func fetchExeatAlert() {
        self.repository.getAppliedExeat(exeatId: exeatId, completion: { status, response in
            switch status {
            case .ok:
                if let destination = response?.destination,
                   let reason = response?.reason,
                   let phoneNumber = response?.emergencyPhoneNumber {
                    self.destination = destination
                    self.reason = reason
                    self.emergencyPhoneNumber = phoneNumber
                }
                break
            default:
                print("fetch exeat alert error: \(status)")
                break
            }
        })
    }
}
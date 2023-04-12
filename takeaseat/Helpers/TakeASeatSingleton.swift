//
//  TakeASeatSingleton.swift
//  Take a Seat
//
//  Created by Ahmet Mert ÖZ on 5.04.2023.
//

import Foundation

class TakeASeatSingleton {
    
    static let shared = TakeASeatSingleton()
    
    var isOnboardingCompleted : Bool {
        get {
            UserDefaults.standard.bool(forKey: "isOnboardingCompleted")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "isOnboardingCompleted")
            UserDefaults.standard.synchronize()
        }
    }
    
    var fromCity = ""
    var toCity = ""
    var selectedDate = ""
    var selectedCompany : CompanySelectCellModel?
    
    
    func getTicketHistory () -> [TicketModel] {
        var tickets : [TicketModel] = []
        let decoder = JSONDecoder()
        if let savedData = UserDefaults.standard.data(forKey: "ticketList") {
            do {
                let decodedData = try decoder.decode([TicketModel].self, from: savedData)
                tickets = decodedData
            } catch {
                print("Error decoding item list: \(error.localizedDescription)")
            }
        }
        
        return tickets
    }
    
    func saveTicketHistory(tickets: [TicketModel]){
        let encoder = JSONEncoder()
        do {
            let encodedData = try encoder.encode(tickets)
            UserDefaults.standard.set(encodedData, forKey: "ticketList")
        } catch {
            print("Error encoding item list: \(error.localizedDescription)")
        }
    }
}

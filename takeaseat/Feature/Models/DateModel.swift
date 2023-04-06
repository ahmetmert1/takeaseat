//
//  DateModel.swift
//  Take a Seat
//
//  Created by Ahmet Mert ÖZ on 6.04.2023.
//

import Foundation

class TicketDate {
    
    var ticketDay : Int
    var ticketMounth : Int
    var ticketYear : Int
    
    init(ticketDay: Int, ticketMounth: Int, ticketYear: Int) {
        self.ticketDay = 1
        self.ticketMounth = 1
        self.ticketYear = 2021
    }
    
    func printTicketDate(){
        
        print("Day : \(ticketDay), Mounth : \(ticketMounth), Year : \(ticketYear)")
        
    }
    
    
}

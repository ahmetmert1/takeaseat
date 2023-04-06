//
//  Ticket.swift
//  Take a Seat
//
//  Created by Ahmet Mert ÖZ on 6.04.2023.
//

import Foundation

class Ticket {
    
    var passenger : Passenger
    var date : TicketDate
    var hour : Hour
    var seat : [Int]
    var seatNumber : Int
    
    
    init(passenger: Passenger, date: TicketDate, hour: Hour, seat: Any, seatNumber: Int) {
        self.passenger = passenger
        self.date = date
        self.hour = hour
        self.seat = seat as! [Int]
        self.seatNumber = 0
    }
    
    func compareTickets(){
        
    }
    
    func reservSeat(){
        
    }
    
    func addSeatNumber(){
        
    }
    
    func printTicker(){
        
        print("<\(passenger.passengerName)><\(passenger.passengerSurname)><\(passenger.passengerId)>,<\(date.ticketDay)>/<\(date.ticketMounth)>/<\(date.ticketYear)>,<\(hour.hour)>:<\(hour.minute)> | Seat Number : \(seat)")
        
    }
    
    
    
    
}

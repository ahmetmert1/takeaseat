//
//  PassengerModel.swift
//  Take a Seat
//
//  Created by Ahmet Mert ÖZ on 6.04.2023.
//

import Foundation

class Passenger {
    
    var passengerName : String
    var passengerSurname : String
    var passengerId : Int
    
    
    init(passengerName: String, passengerSurname: String, passengerId: Int) {
        self.passengerName = ""
        self.passengerSurname = ""
        self.passengerId = 0
    }
    
    func printPassenger(){
        
       print("Name : \(passengerName), Surname : \(passengerSurname), Id : \(passengerId)")
    }
    
}

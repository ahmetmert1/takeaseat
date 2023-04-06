//
//  HourModel.swift
//  Take a Seat
//
//  Created by Ahmet Mert ÖZ on 6.04.2023.
//

import Foundation

class Hour {
    
    var hour : Int
    var minute : Int
    
    init(hour: Int, minute: Int) {
        self.hour = 0
        self.minute = 0
    }
    
    func printHour(){
        print("Hour : \(hour), Minute : \(minute)")
    }
    
    
}

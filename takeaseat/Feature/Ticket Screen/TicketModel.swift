//
//  TicketModel.swift
//  Take a Seat
//
//  Created by Ahmet Mert ÖZ on 12.04.2023.
//

import Foundation
import UIKit


struct TicketModel : Codable {
    var companyLogo : Data
    var fromCity : String
    var toCity : String
    var date : String
    var name : String
    var surname : String
    var email : String
    var selectedSeats : String
    var ticketPrice : String
}

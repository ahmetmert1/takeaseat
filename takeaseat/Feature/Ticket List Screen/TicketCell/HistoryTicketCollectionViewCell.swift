//
//  HistoryTicketCollectionViewCell.swift
//  Take a Seat
//
//  Created by Ahmet Mert ÖZ on 12.04.2023.
//

import UIKit

class HistoryTicketCollectionViewCell: UICollectionViewCell {

    @IBOutlet var selectedSeatsLabel: UILabel!
    @IBOutlet var ticketPriceLabel: UILabel!
    @IBOutlet var passengarName: UILabel!
    @IBOutlet var toLabel: UILabel!
    @IBOutlet var fromLabel: UILabel!
    @IBOutlet var companyLogo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUp(ticket : TicketModel){
        selectedSeatsLabel.text = ticket.selectedSeats
        ticketPriceLabel.text = ticket.ticketPrice
        passengarName.text = "\(ticket.name) \(ticket.surname)"
        toLabel.text = ticket.toCity
        fromLabel.text = ticket.fromCity
        companyLogo.image = UIImage(data: ticket.companyLogo)
    }
}

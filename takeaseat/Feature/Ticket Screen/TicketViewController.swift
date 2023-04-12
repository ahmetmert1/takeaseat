//
//  TicketViewController.swift
//  Take a Seat
//
//  Created by Ahmet Mert ÖZ on 12.04.2023.
//

import UIKit

class TicketViewController: UIViewController {

    
    @IBOutlet var companyLogo: UIImageView!
    @IBOutlet var fromCityLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var toCityLabel: UILabel!
    @IBOutlet var selectedSeatsLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    var passengerName : String!
    var passengerSurname : String!
    var passengerEmail : String!
    var passengerPhoneNumber : String!
    var selectedSeatsString : String = "Seats : "
    var ticketPrice : String!
    
    var dataManager : SeatDataManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        companyLogo.image = TakeASeatSingleton.shared.selectedCompany?.companyLogo
        fromCityLabel.text = TakeASeatSingleton.shared.fromCity
        toCityLabel.text = TakeASeatSingleton.shared.toCity
        dateLabel.text = TakeASeatSingleton.shared.selectedDate
        nameLabel.text = passengerName
        surnameLabel.text = passengerSurname
        emailLabel.text = passengerEmail
        
        for seat in dataManager.selectedSeatlist {
            selectedSeatsString += "<\(seat.number)>"
        }
        
        selectedSeatsLabel.text = selectedSeatsString
        var tickets : [TicketModel] = []
        
        tickets = TakeASeatSingleton.shared.getTicketHistory()
        
        
        var currentTicket = TicketModel(companyLogo: (TakeASeatSingleton.shared.selectedCompany?.companyLogo.pngData())!, fromCity: TakeASeatSingleton.shared.fromCity, toCity: TakeASeatSingleton.shared.toCity, date: TakeASeatSingleton.shared.selectedDate, name: passengerName, surname: passengerSurname, email: passengerEmail, selectedSeats: selectedSeatsString,ticketPrice: ticketPrice)
        
        tickets.append(currentTicket)
        TakeASeatSingleton.shared.saveTicketHistory(tickets:tickets)
    }
    
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        var presentingVC = self.presentingViewController

                while let vc = presentingVC?.presentingViewController {
                    presentingVC = vc
                    if vc is HomeViewController {
                        break
                    }
                }


        (presentingVC as! HomeViewController).selectDateTextField.text = ""
        (presentingVC as! HomeViewController).fromSelectTextField.text = ""
        (presentingVC as! HomeViewController).toSelectTextField.text = ""
       presentingVC?.dismiss(animated: false)
    }
    

}

//
//  PassengerInfoViewController.swift
//  Take a Seat
//
//  Created by Ahmet Mert ÖZ on 12.04.2023.
//

import UIKit

class PassengerInfoViewController: UIViewController {
    
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var surnameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var phoneNumberField: UITextField!
    @IBOutlet var selectedSeatCountLabel: UILabel!
    @IBOutlet var costLabel: UILabel!
    @IBOutlet var warningLabel: UILabel!
    
    var dataManager : SeatDataManager!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        warningLabel.alpha = 0
        selectedSeatCountLabel.text = String(dataManager.selectedSeatlist.count)
        costLabel.text = "\(dataManager.selectedSeatlist.count * 250) ₺"
        
        
    }
    
    
    
    @IBAction func goToTicketPressed(_ sender: Any) {
        
        if nameField.text == "" || surnameField.text == "" || emailField.text == "" || phoneNumberField.text == "" {
            
            warningLabel.alpha = 1
            
        }else{
            //go to ticket page
        }
        
    }
    



}

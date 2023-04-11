//
//  SelectSeatViewController.swift
//  Take a Seat
//
//  Created by Ahmet Mert ÖZ on 11.04.2023.
//

import UIKit
import ALBusSeatView

class SelectSeatViewController: UIViewController {
    
    @IBOutlet var backButton: UIButton!
    @IBOutlet var contunieButton: UIButton!
    @IBOutlet var selectedCompanyLogo: UIImageView!
    @IBOutlet var selectedFromCity: UILabel!
    @IBOutlet var selectedToCity: UILabel!
    @IBOutlet var selectedDate: UILabel!
    @IBOutlet var busView: UIView!

    var dataManager = SeatDataManager()
    var seatView: ALBusSeatView?
    var selectedCompany : CompanySelectCellModel!
    
    //notification center
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedCompanyLogo.image = selectedCompany.companyLogo
        selectedFromCity.text = TakeASeatSingleton.shared.fromCity
        selectedToCity.text = TakeASeatSingleton.shared.toCity
        selectedDate.text = TakeASeatSingleton.shared.selectedDate
        

        seatView = ALBusSeatView(withConfig: ExampleSeatConfig())
        seatView?.delegate = dataManager
        seatView?.dataSource = dataManager
        busView.backgroundColor = .white

        busView.addSubview(seatView!)
        //self.busView.addSubview(view)
        
        let first = MockSeatCreater().create(count: 45)
        dataManager.seatList = [first]
        seatView?.reload()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let vH = busView.frame.height
        let vW = busView.frame.width
        seatView?.frame = CGRect(x: 0, y: (vH-250)/2, width: vW, height: 250)
        
    }
    

    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    
    @IBAction func continueButtonPressed(_ sender: Any) {
   
        if dataManager.selectedSeatlist.count > 0 {
            
            let passengerInfoVC = UIStoryboard(name: "PassengerInfo", bundle: nil).instantiateViewController(withIdentifier: "PassengerInfoViewController") as! PassengerInfoViewController
            passengerInfoVC.modalTransitionStyle = .crossDissolve
            passengerInfoVC.modalPresentationStyle = .custom
            passengerInfoVC.dataManager = dataManager
            self.present(passengerInfoVC, animated: true)
            
            
        }else{
            //show warning popup
            let warningPopupVC = UIStoryboard(name: "NoSeat", bundle: nil).instantiateViewController(withIdentifier: "NoSeatViewController") as! NoSeatViewController
            warningPopupVC.modalTransitionStyle = .crossDissolve
            warningPopupVC.modalPresentationStyle = .custom
            self.present(warningPopupVC, animated: true)
            
        }
        
        
    }
    
}

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
    @IBOutlet var plusSeatNumberButton: UIButton!
    @IBOutlet var enterSeatNumberTextField: UITextField!
    @IBOutlet var minusSeatNumberButton: UIButton!
    @IBOutlet var contunieButton: UIButton!
    
    @IBOutlet var busView: UIView!
    
    
    
    var dataManager = SeatDataManager()
    var seatView: ALBusSeatView?
    
    //notification center
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    @IBAction func plusButtonPressed(_ sender: Any) {
        if (dataManager.selectedMaxSeatCount < dataManager.maxSeatCount){
            dataManager.selectedMaxSeatCount += 1
            enterSeatNumberTextField.text = String(dataManager.selectedMaxSeatCount)
        }
    }
    
    
    @IBAction func minusButtonPressed(_ sender: Any) {
        if dataManager.selectedMaxSeatCount > 0 {
            dataManager.selectedMaxSeatCount -= 1
            enterSeatNumberTextField.text = String(dataManager.selectedMaxSeatCount)
        }
    }
    
    
    @IBAction func continueButtonPressed(_ sender: Any) {
        print("Mega \(dataManager.selectedSeatlist[0].number)")
        print("Mega \(dataManager.selectedSeatlist[0].gender)")
        print("Mega \(dataManager.selectedSeatlist[0].id)")
        print("Mega \(dataManager.selectedSeatlist.count)")
    }
    
}

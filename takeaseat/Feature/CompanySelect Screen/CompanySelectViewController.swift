//
//  CompanySelectViewController.swift
//  Take a Seat
//
//  Created by Ahmet Mert ÖZ on 9.04.2023.
//

import UIKit

class CompanySelectViewController: UIViewController {

    
    @IBOutlet var backButton: UIButton!
    @IBOutlet var companySelectCollectionView: UICollectionView!
    @IBOutlet var nextButton: UIButton!
   
    var companyArray : [CompanySelectCellModel] = [
    
     CompanySelectCellModel(companyLogo: UIImage(named: "kamilkoc"), takeOffHour: "10.30", seatType: UIImage(named: "seatType1"), travelTime: "6 saat", price: "280 ₺"),
     CompanySelectCellModel(companyLogo: UIImage(named: "pamukkale"), takeOffHour: "10.30", seatType: UIImage(named: "seatType1"), travelTime: "6 saat", price: "280 ₺"),
     CompanySelectCellModel(companyLogo: UIImage(named: "kamilkoc"), takeOffHour: "10.30", seatType: UIImage(named: "seatType1"), travelTime: "6 saat", price: "280 ₺"),
     CompanySelectCellModel(companyLogo: UIImage(named: "nilüfer"), takeOffHour: "10.30", seatType: UIImage(named: "seatType1"), travelTime: "6 saat", price: "280 ₺"),
     CompanySelectCellModel(companyLogo: UIImage(named: "kamilkoc"), takeOffHour: "10.30", seatType: UIImage(named: "seatType1"), travelTime: "6 saat", price: "280 ₺"),
     CompanySelectCellModel(companyLogo: UIImage(named: "pamukkale"), takeOffHour: "10.30", seatType: UIImage(named: "seatType1"), travelTime: "6 saat", price: "280 ₺"),
     CompanySelectCellModel(companyLogo: UIImage(named: "kamilkoc"), takeOffHour: "10.30", seatType: UIImage(named: "seatType1"), travelTime: "6 saat", price: "280 ₺"),
     CompanySelectCellModel(companyLogo: UIImage(named: "nilüfer"), takeOffHour: "10.30", seatType: UIImage(named: "seatType1"), travelTime: "6 saat", price: "280 ₺"),
     CompanySelectCellModel(companyLogo: UIImage(named: "kamilkoc"), takeOffHour: "10.30", seatType: UIImage(named: "seatType1"), travelTime: "6 saat", price: "280 ₺"),
     CompanySelectCellModel(companyLogo: UIImage(named: "kamilkoc"), takeOffHour: "10.30", seatType: UIImage(named: "seatType1"), travelTime: "6 saat", price: "280 ₺")
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let companyNibCell = UINib(nibName: "CompanySelectCollectionViewCell", bundle: nil)
        companySelectCollectionView.register(companyNibCell, forCellWithReuseIdentifier: "CompanySelectCollectionViewCell")
        companySelectCollectionView.dataSource = self
        companySelectCollectionView.delegate = self
        companySelectCollectionView.backgroundColor = .none
        
        

    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}

extension CompanySelectViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return companyArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = companySelectCollectionView.dequeueReusableCell(withReuseIdentifier: "CompanySelectCollectionViewCell", for: indexPath) as! CompanySelectCollectionViewCell
        cell.setUp(expeditionModel: companyArray[indexPath.row])
        cell.layer.cornerRadius = 10
        cell.fromCityLabel.text = TakeASeatSingleton.shared.fromCity
        cell.toCityLabel.text = TakeASeatSingleton.shared.toCity
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.companySelectCollectionView.frame.width, height: self.companySelectCollectionView.frame.width * 0.4)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedCompany = companyArray[indexPath.row]
        let seatPageVC = UIStoryboard(name: "SelectSeat", bundle: nil).instantiateViewController(withIdentifier: "SelectSeatViewController") as! SelectSeatViewController
        seatPageVC.modalPresentationStyle = .fullScreen
        self.present(seatPageVC, animated: true)
        
    }
    
    
}

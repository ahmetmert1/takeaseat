//
//  CompanySelectCollectionViewCell.swift
//  Take a Seat
//
//  Created by Ahmet Mert ÖZ on 9.04.2023.
//

import UIKit

class CompanySelectCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var companyLogo: UIImageView!
    @IBOutlet var takeOffHour: UILabel!
    @IBOutlet var seatTypeImage: UIImageView!
    @IBOutlet var travelTime: UILabel!
    @IBOutlet var fromCityLabel: UILabel!
    @IBOutlet var toCityLabel: UILabel!
    @IBOutlet var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUp(expeditionModel : CompanySelectCellModel){
        
        companyLogo.image = expeditionModel.companyLogo
        takeOffHour.text = expeditionModel.takeOffHour
        seatTypeImage.image = expeditionModel.seatType
        travelTime.text = expeditionModel.travelTime
        fromCityLabel.text = TakeASeatSingleton.shared.fromCity
        toCityLabel.text = TakeASeatSingleton.shared.fromCity
        price.text = expeditionModel.price
    }
}

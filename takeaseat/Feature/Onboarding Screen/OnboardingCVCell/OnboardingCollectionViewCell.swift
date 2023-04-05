//
//  OnboardingCollectionViewCell.swift
//  Take a Seat
//
//  Created by Ahmet Mert ÖZ on 5.04.2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var cellBGView: UIView!
    
    @IBOutlet var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUp(model : OnboardingCVCellModel){
        self.imageView.image = model.image
    }

}

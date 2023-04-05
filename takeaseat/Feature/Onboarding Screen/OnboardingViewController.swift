//
//  OnboardingViewController.swift
//  Take a Seat
//
//  Created by Ahmet Mert ÖZ on 5.04.2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet var skipButton: UIButton!
    @IBOutlet var onboardingCollectionView: UICollectionView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var pageTitle: UILabel!
    @IBOutlet var pageDescription: UILabel!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    
    var cellModels : [OnboardingCVCellModel] =
    [
        OnboardingCVCellModel(image: UIImage(named: "onboarding1")!),
        OnboardingCVCellModel(image: UIImage(named: "onboarding2")!),
        OnboardingCVCellModel(image: UIImage(named: "onboarding3")!)
    ]
    var promptModels : [OnboardingPromptModel] =
    [
        OnboardingPromptModel(promptTitle: "Safe and reliable travel", promptDescription: "Get a safe travel with top class facilities at an affordable price"),
        OnboardingPromptModel(promptTitle: "Buy Your Bus Ticket Remotely Today!", promptDescription: "Say Goodbye to Queues and Hello to Convenience."),
        OnboardingPromptModel(promptTitle: "Get the Best Deal", promptDescription: "Guaranteed Minimum Price. Book Now and Save Big!")
    ]
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.isHidden = true

        onboardingCollectionView.delegate = self
        onboardingCollectionView.dataSource = self
        let onboardingNibCell = UINib(nibName: "OnboardingCollectionViewCell", bundle: nil)
        onboardingCollectionView.register(onboardingNibCell, forCellWithReuseIdentifier: "OnboardingCollectionViewCell")
        onboardingCollectionView.isUserInteractionEnabled = false
        onboardingCollectionView.backgroundColor = .none
    }
    
    @IBAction func skipButtonPressed(_ sender: Any) {
        
        UserDefaults.standard.set(true, forKey: "isOnboardingCompleted")
        
        let homeVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.view.window?.rootViewController = homeVC
        self.view.window?.makeKeyAndVisible()
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        if currentPage == cellModels.count - 1 {
            //go to home screen
            
            UserDefaults.standard.set(true, forKey: "isOnboardingCompleted")
            let homeVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            self.view.window?.rootViewController = homeVC
            self.view.window?.makeKeyAndVisible()
        }else{
            currentPage += 1
            
            let indexPath = IndexPath(item: currentPage, section: 0)
            onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            backButton.isHidden = false
            pageControl.currentPage = currentPage
            setTitleAndDescription(promptModel: promptModels[currentPage])
//            if currentPage == cellModels.count - 1 {
//                nextButton.setTitle("Start", for: .normal)
//            }
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        if currentPage == 0 {
            
            //stay
        } else {
            
            currentPage -= 1
            
            let indexPath = IndexPath(item: currentPage, section: 0)
            onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            backButton.isHidden = false
            pageControl.currentPage = currentPage
            setTitleAndDescription(promptModel: promptModels[currentPage])
            
            if currentPage == 0 {
                backButton.isHidden = true
            }
        }
    }
    
    func setTitleAndDescription(promptModel : OnboardingPromptModel){
        self.pageTitle.text = promptModel.promptTitle
        self.pageDescription.text = promptModel.promptDescription
    }
}

extension OnboardingViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = onboardingCollectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
        
        cell.setUp(model: cellModels[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.onboardingCollectionView.frame.width, height: self.onboardingCollectionView.frame.height)
    }
    
}

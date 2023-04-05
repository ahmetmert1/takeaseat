//
//  TakeASeatSingleton.swift
//  Take a Seat
//
//  Created by Ahmet Mert ÖZ on 5.04.2023.
//

import Foundation

class TakeASeatSingleton {
    
    static let shared = TakeASeatSingleton()
    
    var isOnboardingCompleted : Bool {
        get {
            UserDefaults.standard.bool(forKey: "isOnboardingCompleted")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "isOnboardingCompleted")
            UserDefaults.standard.synchronize()
        }
    }
    
    
    
}

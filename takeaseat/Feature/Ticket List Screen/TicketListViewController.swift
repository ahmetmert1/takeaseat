//
//  TicketListViewController.swift
//  Take a Seat
//
//  Created by Ahmet Mert ÖZ on 12.04.2023.
//

import UIKit

class TicketListViewController: UIViewController {

    @IBOutlet var historyTicketsCollectionView: UICollectionView!
    
    var tickets : [TicketModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tickets = TakeASeatSingleton.shared.getTicketHistory()
        
        historyTicketsCollectionView.dataSource = self
        historyTicketsCollectionView.delegate = self
        historyTicketsCollectionView.backgroundColor = .none
        
        let historyTicketNibCell = UINib(nibName: "HistoryTicketCollectionViewCell", bundle: nil)
        historyTicketsCollectionView.register(historyTicketNibCell, forCellWithReuseIdentifier: "HistoryTicketCollectionViewCell")
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

extension TicketListViewController: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tickets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = historyTicketsCollectionView.dequeueReusableCell(withReuseIdentifier: "HistoryTicketCollectionViewCell", for: indexPath) as! HistoryTicketCollectionViewCell
        
        cell.setUp(ticket: self.tickets[indexPath.row])
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.historyTicketsCollectionView.frame.width, height: self.historyTicketsCollectionView.frame.width * 0.3)
    }
    
    
}

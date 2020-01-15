//
//  ViewController.swift
//  CoffeeApp
//
//  Created by Craig Larson on 1/10/20.
//  Copyright © 2020 Craig Larson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var seasonalGiftCards = [GiftCardModel]()
    var thankYouDataSource: SmallGiftCardCollectionViewDataSource?

    @IBOutlet weak var seasonalHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var thankYouHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var thankYouCollectionView: UICollectionView!
    
    @IBOutlet weak var seasonalCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        seasonalCollectionView.dataSource = self
        seasonalCollectionView.delegate = self
        
        GiftCardFunctions.getSeasonalGiftCards { [weak self] (cards) in
            guard let self = self else {return}
            self.seasonalGiftCards = cards
            self.seasonalCollectionView.reloadData()
        }
        
        GiftCardFunctions.getThankYouGiftCards { [weak self] (cards) in
            guard let self = self else {return}
            self.thankYouDataSource = SmallGiftCardCollectionViewDataSource(giftCards: cards)
            self.thankYouCollectionView.dataSource = self.thankYouDataSource
            self.thankYouCollectionView.delegate = self.thankYouDataSource
            self.thankYouCollectionView.reloadData()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setHeightOfCollectionViews()
    }
    
    func setHeightOfCollectionViews() {
        let width = seasonalCollectionView.bounds.width
        let height = width / 1.5
        seasonalHeightConstraint.constant = height
        
        thankYouHeightConstraint.constant = height / 2
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seasonalGiftCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GiftCardCell", for: indexPath) as! GiftCardCollectionViewCell
        
        cell.setup(giftCardModel: seasonalGiftCards[indexPath.item])
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width - 50
        let height = width / 1.5
        return CGSize(width: width, height: height)
    }

    
}

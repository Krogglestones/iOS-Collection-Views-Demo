//
//  SmallGiftCardCollectionViewDataSource.swift
//  CoffeeApp
//
//  Created by Craig Larson on 1/14/20.
//  Copyright © 2020 Craig Larson. All rights reserved.
//

import UIKit

class SmallGiftCardCollectionViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var giftCards = [GiftCardModel]()
    
    init(giftCards: [GiftCardModel]) {
        self.giftCards = giftCards
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return giftCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GiftCardCell", for: indexPath) as! GiftCardCollectionViewCell
        
        cell.setup(giftCardModel: giftCards[indexPath.item])
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width / 2 - 50
        let height = width / 1.5
        return CGSize(width: width, height: height)
    }

    
}
 

    
    


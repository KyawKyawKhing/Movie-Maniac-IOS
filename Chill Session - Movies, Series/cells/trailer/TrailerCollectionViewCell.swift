//
//  TrailerCollectionViewCell.swift
//  Chill Session - Movies, Series
//
//  Created by AcePlus101 on 12/9/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class TrailerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgTrailerView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(data:String){
        
    }

}
extension TrailerCollectionViewCell:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
}
extension TrailerCollectionViewCell:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrailerCollectionViewCell", for: indexPath)
        setData(data: "Genre 1")
        return cell
    }
    
    
}

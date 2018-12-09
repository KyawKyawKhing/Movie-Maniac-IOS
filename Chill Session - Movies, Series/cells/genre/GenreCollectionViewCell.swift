//
//  GenreCollectionViewCell.swift
//  Chill Session - Movies, Series
//
//  Created by AcePlus101 on 12/9/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class GenreCollectionViewCell: UICollectionViewCell{
   
    @IBOutlet weak var lblGenre: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(data:String){
        self.lblGenre.text = data
    }

}
extension GenreCollectionViewCell:UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 48)
    }
}
extension GenreCollectionViewCell:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCollectionViewCell", for: indexPath)
        setData(data: "Genre 1")
        return cell
    }
    
    
}

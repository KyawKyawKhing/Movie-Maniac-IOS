//
//  GenreDataSource.swift
//  Chill Session - Movies, Series
//
//  Created by AcePlus101 on 12/9/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class GenreDataSourceAndDelegate: NSObject,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    var dataArray:[String] = ["a","b","c","d"]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCollectionViewCell", for: indexPath) as! GenreCollectionViewCell
        cell.setData(data: dataArray[indexPath.row])
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let string = dataArray[indexPath.row]
        let font = UIFont.systemFont(ofSize: 20)
//        let size = string.widthWithConstrainedHeight(80, font: font)
//        
        let text = dataArray[indexPath.row]
        let width = UILabel.textWidth(font: font, text: text)
        
        return CGSize(width: width+20, height: 48)
    }
}

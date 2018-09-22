//
//  ViewController.swift
//  Chill Session - Movies, Series
//
//  Created by Win Than Htike on 8/19/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class NowPlayingViewController: UIViewController {

    @IBOutlet weak var nowPlayingCollectionView : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CellRegisterHelper.registerCellForCollectionView(nibName: "MovieCollectionViewCell", cellId: "MovieCollectionViewCell", collectionView: nowPlayingCollectionView)
        
    }

    

}

extension NowPlayingViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        
        return cell
        
    }
    
    
}

extension NowPlayingViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 180)
    }
    
}

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
    
    var movieList : [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CellRegisterHelper.registerCellForCollectionView(nibName: "MovieCollectionViewCell", cellId: "MovieCollectionViewCell", collectionView: nowPlayingCollectionView)
    
        CustomLoadingView.shared().showActivityIndicator(uiView: self.view)
        loadNowPlayingMovie()
        
    }

    func loadNowPlayingMovie() {
        
        DataModel.shared().loadNowPlayingMovies { (movieList) in
            self.movieList = movieList
            self.nowPlayingCollectionView.reloadData()
            CustomLoadingView.shared().hideActivityIndicator(uiView: self.view)
        }
        
    }

}

extension NowPlayingViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        
        cell.lblMovieTitle.text = self.movieList[indexPath.row].title
        
        cell.ivMovie.loadImageUsingUrlString(url: SharedConstants.IMAGE_BASE_PATH + self.movieList[indexPath.row].posterPath)
        
        return cell
        
    }
    
}

extension NowPlayingViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 180)
    }
    
}

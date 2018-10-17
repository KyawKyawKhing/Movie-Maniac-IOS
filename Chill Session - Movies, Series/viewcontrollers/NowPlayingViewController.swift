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
    
    var movieList : [Movies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CellRegisterHelper.registerCellForCollectionView(nibName: "MovieCollectionViewCell", cellId: "MovieCollectionViewCell", collectionView: nowPlayingCollectionView)
    
        CustomLoadingView.shared().showActivityIndicator(uiView: self.nowPlayingCollectionView)
        loadNowPlayingMovie()
        
    }

    func loadNowPlayingMovie() {
        
        DataModel.shared().getNowPlayingMovies(context: managedObjectContext, success: { (movieList) in
            
            self.movieList = movieList
            self.nowPlayingCollectionView.reloadData()
            CustomLoadingView.shared().hideActivityIndicator(uiView: self.view)
            
        }) { (error) in
            
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
        
        cell.ivMovie.loadImageUsingUrlString(url: SharedConstants.IMAGE_BASE_PATH + self.movieList[indexPath.row].poster_path!)
        
        cell.btnMovieOverview.tag = indexPath.row
        cell.btnMovieOverview.addTarget(self, action: #selector(onClickOverview), for: .touchUpInside)
        
        return cell
        
    }
    
    @objc func onClickOverview(sender: UIButton) {
        let movie = self.movieList[sender.tag]
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OverviewDialogViewController") as! OverviewDialogViewController
        vc.mOverview = movie.overview
        vc.mTitle = movie.title
        self.present(vc, animated: true, completion: nil)
        
    }
    
}

extension NowPlayingViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 180)
    }
    
}

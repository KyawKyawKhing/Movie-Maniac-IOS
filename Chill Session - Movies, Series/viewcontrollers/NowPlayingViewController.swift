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
        
        DataModel.shared().getMovies(context: managedObjectContext,route: SharedConstants.Route.NOW_PLAYING, success: { (movieList) in
            
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
        
        var genderIdList:[String] = []
        let toString = self.movieList[indexPath.row].genre_ids
        if let str = toString {
            let chars = CharacterSet(charactersIn: ",][ ")
            genderIdList = str.components(separatedBy: chars).filter { $0 != "" }.compactMap { String($0)}
            print(genderIdList)
        }
        
        DataModel.shared().getGenreList(context: managedObjectContext, route: SharedConstants.Route.GENRE, genreIds: genderIdList,success: { (genres) in
            var category = "("
            for index in 0..<genres.count{
                if index == genres.count - 1{
                category += "\(genres[index]))"
                }else{
                category += "\(genres[index]),"
                }
            }
            cell.lblMovieCategory.text = category
        }, failure: { (error) in
        
        })
        
        cell.lblMovieTitle.text = self.movieList[indexPath.row].title
        cell.lblMoviePopularity.text = "\(self.movieList[indexPath.row].vote_average)"
        
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
        let navigationVC = self.storyboard!.instantiateViewController(withIdentifier: "DetailViewController") as! UINavigationController
        let vc = navigationVC.children.first as!
        DetailViewController
        vc.data = movieList[indexPath.row]
        self.present(navigationVC, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 180)
    }
    
}

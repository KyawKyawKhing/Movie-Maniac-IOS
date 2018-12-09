//
//  DetailViewController.swift
//  Chill Session - Movies, Series
//
//  Created by AcePlus101 on 12/4/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imgMovieImage: UIImageView!
    @IBOutlet weak var lblMovieTitle: UILabel!
    @IBOutlet weak var lblOriginalTitle: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    @IBOutlet weak var lblReleasedDate: UILabel!
    @IBOutlet weak var cvGenre: UICollectionView!
    @IBOutlet weak var cvVideo: UICollectionView!
    @IBOutlet weak var tvReview: UITableView!
    
    
    var data:Movies!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgMovieImage.loadImageUsingUrlString(url: SharedConstants.IMAGE_BASE_PATH + data.poster_path!)
        self.lblMovieTitle.text = data.title
        self.lblOverview.text = data.overview
        self.lblReleasedDate.text = "Released Date : \(data.release_date ?? "")"
        self.lblOriginalTitle.text = "\(data.original_title ?? "")"
        CellRegisterHelper.registerCellForCollectionView(nibName: "GenreCollectionViewCell", cellId: "GenreCollectionViewCell", collectionView: cvGenre)
        CellRegisterHelper.registerCellForCollectionView(nibName: "TrailerCollectionViewCell", cellId: "TrailerCollectionViewCell", collectionView: cvVideo)
        CellRegisterHelper.registerCellForTableView(nibName: "ReviewTableViewCell", cellId: "ReviewTableViewCell", tableView: tvReview)
        
        tvReview.rowHeight = UITableView.automaticDimension
        tvReview.estimatedRowHeight = 100
        
//        tvReview.isScrollEnabled = false
        
        var genderIdList:[String] = []
        let toString = data.genre_ids
        if let str = toString {
            let chars = CharacterSet(charactersIn: ",][ ")
            genderIdList = str.components(separatedBy: chars).filter { $0 != "" }.compactMap { String($0)}
            print(genderIdList)
        }
        
        DataModel.shared().getGenreList(context: managedObjectContext, route: SharedConstants.Route.GENRE, genreIds: genderIdList,success: { (genres) in
            let dataSource:GenreDataSourceAndDelegate = self.cvGenre!.dataSource as! GenreDataSourceAndDelegate
            dataSource.dataArray = genres
            self.cvGenre.reloadData()
        }, failure: { (error) in
            
        })
        
        DataModel.shared().getReviewList(context: managedObjectContext,movieId: String(data.id), success: { (reviews) in
            let dataSource:ReviewDataSourceAndDelegate = self.tvReview!.dataSource as! ReviewDataSourceAndDelegate
            dataSource.dataArray = reviews
            self.tvReview.reloadData()
        }) { (error) in
            
        }
       
      
//        self.cvGenre.delegate = self.cvGenre.delegate
//        self.cvVideo.delegate = self.cvVideo.delegate
//        self.tvReview.delegate = self.tvReview.delegate
//
//        self.cvGenre.dataSource = self.cvGenre.dataSource
//        self.cvVideo.dataSource = self.cvVideo.dataSource
//        self.tvReview.dataSource = self.tvReview.dataSource
        
    }
    

    @IBAction func onClickBackButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

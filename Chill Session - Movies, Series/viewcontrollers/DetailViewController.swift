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
    @IBOutlet weak var lblOverview: UILabel!
    @IBOutlet weak var lblReleasedDate: UILabel!
    @IBOutlet weak var lblReview: UILabel!
    
    var data:Movies!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgMovieImage.loadImageUsingUrlString(url: SharedConstants.IMAGE_BASE_PATH + data.poster_path!)
        self.lblMovieTitle.text = data.title
        self.lblOverview.text = data.overview
        self.lblReleasedDate.text = "Released Date : \(data.release_date ?? "")"
        self.lblReview.text = data.description
    }
    

    @IBAction func onClickBackButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

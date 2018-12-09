//
//  MovieCollectionViewCell.swift
//  Chill Session - Movies, Series
//
//  Created by Win Than Htike on 9/22/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ivMovie : UIImageView!
    @IBOutlet weak var lblMovieTitle : UILabel!
    @IBOutlet weak var lblMovieCategory : UILabel!
    @IBOutlet weak var lblMoviePopularity : UILabel!
    @IBOutlet weak var btnMovieOverview : CustomButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

//
//  ReviewTableViewCell.swift
//  Chill Session - Movies, Series
//
//  Created by AcePlus101 on 12/9/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var imgAuthor: UIImageView!
    @IBOutlet weak var lblAuthorName: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(data:Review) {
//        self.imgAuthor.loadImageUsingUrlString(url:data.url)
        self.lblAuthorName.text = data.author
        self.lblContent.text = data.content
    }
    
}

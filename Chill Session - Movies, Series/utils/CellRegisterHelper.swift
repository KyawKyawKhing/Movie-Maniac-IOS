//
//  CellRegisterHelper.swift
//  Chill Session - Movies, Series
//
//  Created by Win Than Htike on 9/22/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class CellRegisterHelper {
    
    static func registerCellForTableView(nibName : String, cellId : String, tableView : UITableView) {
        let nib = UINib(nibName: (nibName), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
    }
    
    static func registerCellForCollectionView(nibName : String, cellId : String, collectionView : UICollectionView){
        let nib = UINib(nibName: (nibName), bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellId)
    }
    
}

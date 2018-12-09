//
//  ReviewDataSource.swift
//  Chill Session - Movies, Series
//
//  Created by AcePlus101 on 12/9/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class ReviewDataSourceAndDelegate: NSObject {
    
 var dataArray:[Review] = []

}
extension ReviewDataSourceAndDelegate:UITableViewDelegate{
    
}
extension ReviewDataSourceAndDelegate:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath) as! ReviewTableViewCell
        cell.setData(data: dataArray[indexPath.row])
        return cell
    }
    
    
}

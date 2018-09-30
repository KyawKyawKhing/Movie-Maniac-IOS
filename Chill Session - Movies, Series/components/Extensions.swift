//
//  Extensions.swift
//  Chill Session - Movies, Series
//
//  Created by Win Than Htike on 9/28/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension UIImageView {
    
    func loadImageUsingUrlString(url : String) {
        
        let url = URL(string: url)!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
            
        }.resume()
        
    }
    
}

extension UIViewController {
    
    var managedObjectContext: NSManagedObjectContext! {
        get{
            return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        }
    }
    
}

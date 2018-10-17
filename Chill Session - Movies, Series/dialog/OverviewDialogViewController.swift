//
//  OverviewDialogViewController.swift
//  Chill Session - Movies, Series
//
//  Created by Win Than Htike on 10/11/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import UIKit

class OverviewDialogViewController: UIViewController {

    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var popupView: UIView!
    
    var mTitle : String!
    var mOverview : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieTitle.text = mTitle
        movieOverview.text = mOverview
        
        popupViewSetup(view: popupView)
        
    }

    @IBAction func onClickOverview(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
    func popupViewSetup(view : UIView) {
        
        view.tintColor = UIColor(red: 20/255, green: 160/255, blue: 160/255, alpha: 1)
        view.layer.cornerRadius = 10
        
    }
    
}

extension OverviewDialogViewController: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController) -> UIPresentationController? {
        return DimmingPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
}

//
//  DetailsVC.swift
//  230922_LandmarkBook
//
//  Created by hasan bilgin on 22.09.2023.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var selectedLandmarkName=""
    var selectedLandmarkImage=UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        label.text=selectedLandmarkName
        imageView.image=selectedLandmarkImage
    }


}

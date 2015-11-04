//
//  DetailViewController.swift
//  ImageViewer
//
//  Created by Zoran Lazic on 02/11/15.
//  Copyright © 2015 Zoran Lazic. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var slika : UIImage?
    
    @IBOutlet weak var imageShow: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageShow.image = slika
    }
}
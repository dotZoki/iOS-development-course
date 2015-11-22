//
//  ViewController.swift
//  zoom
//
//  Created by Zoran Lazic on 22/11/15.
//  Copyright © 2015 Zoran Lazic. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    var imageView : UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = UIImage(named: "1.jpg")!
        imageView = UIImageView(image: image)
        //imageView!.frame = CGRect(origin: CGPoint(x: 0, y: 0), size:image.size)
        scrollView.addSubview(imageView!)
        
        scrollView.contentSize = image.size
        
        
        
        scrollView.delegate = self
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
    //        return imageView
    //    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print(scrollView.contentOffset)
        
    }
    
    
}


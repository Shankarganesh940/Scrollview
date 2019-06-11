//
//  ViewController.swift
//  Scrollview
//
//  Created by Greeens5 on 11/06/19.
//  Copyright © 2019 Book. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var pager: UIPageControl!
    var scrollView = UIScrollView()
    var imageView = UIImageView()
    var images = [ UIImage(named: "Rohit"), UIImage(named: "Virat"), UIImage(named: "Dhoni"), UIImage(named: "Pandya")]
    override func viewDidLoad() {
      
        scrollView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 300)
        scrollView.backgroundColor = UIColor.white
        scrollView.isPagingEnabled = true
        self.view.addSubview(scrollView)
    
        for i in 0..<images.count {
            let imageView = UIImageView()
            let x = self.view.frame.size.width * CGFloat(i)
            imageView.frame = CGRect(x: x, y: 0, width: self.view.frame.width, height: 300)
            imageView.image = images[i]
            scrollView.contentSize.width = scrollView.frame.size.width * CGFloat(i + 1)
            scrollView.addSubview(imageView)
        }
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pagecontrol = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pager.currentPage = Int(pagecontrol)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


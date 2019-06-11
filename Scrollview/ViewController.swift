//
//  ViewController.swift
//  Scrollview
//
//  Created by Greeens5 on 11/06/19.
//  Copyright © 2019 Book. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet var pager: UIPageControl!
    var scrollView = UIScrollView()
    var imageView = UIImageView()
    var images = [ UIImage(named: "Rohit"), UIImage(named: "Virat"), UIImage(named: "Dhoni")]
    
    override func viewDidLoad() {
        scrollView.frame = CGRect(x: 0, y: 100, width: self.view.frame.width, height: 300)
        scrollView.backgroundColor = UIColor.white
        scrollView.isPagingEnabled = true
        self.view.addSubview(scrollView)
        
        for i in 0..<images.count {
            let imageView = UIImageView()
            let x = self.view.frame.size.width * CGFloat(i)
            imageView.frame = CGRect(x: x, y: 0, width: self.view.frame.width, height: 500)
            imageView.image = images[i]
            scrollView.contentSize.width = scrollView.frame.size.width * CGFloat(i + 1)
            scrollView.addSubview(imageView)
        }
        configurePageControl()
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        self.view.addSubview(scrollView)
        self.scrollView.contentSize = CGSize(width:self.scrollView.frame.size.width * 4,height: self.scrollView.frame.size.height)
        pager.addTarget(self, action: #selector(self.changePage(sender:)), for: UIControlEvents.valueChanged)
    }
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        pager.numberOfPages = images.count
        pager.pageIndicatorTintColor = UIColor.black
        pager.currentPageIndicatorTintColor = UIColor.green
    }
    @objc func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pager.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x:x, y:0), animated: true)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pager.currentPage = Int(pageNumber)
         super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


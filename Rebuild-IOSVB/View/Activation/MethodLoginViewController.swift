//
//  MethodLoginViewController.swift
//  Rebuild-IOSVB
//
//  Created by Mắt Kính IG on 11/27/19.
//  Copyright © 2019 Mắt Kính IG. All rights reserved.
//

import UIKit

class MethodLoginViewController: UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var slideView: UIScrollView!{
        didSet{
            slideView.delegate = self
        }
    }
    @IBOutlet weak var pageControl: UIPageControl!
    
    var arrSlides : [SlideView] = [];
    
    
    var index : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slideView.delegate = self
        // Do any additional setup after loading the view.
        setupNavigationBarItem()
        arrSlides = createSlides()
        self.slideView.bounces = false
        
        
        setupSlidesScrollView(slides: arrSlides)
        pageControl.numberOfPages = arrSlides.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = .systemBlue
        view.bringSubviewToFront(pageControl)
    }
    
    private func setupNavigationBarItem(){
        self.navigationItem.title = "Device Activation"
        self.navigationController?.navigationBar.barTintColor = UIColor.systemBlue
        
        let textChangeColor = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textChangeColor
        
        let leftItem = UIButton(type: .system)
        leftItem.setImage(#imageLiteral(resourceName: "back_white-default"), for: .normal)
        leftItem.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        leftItem.contentMode = .scaleAspectFit
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "back_white-default").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(dismissView))
    }
    
    @objc func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func createSlides() -> [SlideView] {
        let s1:SlideView = Bundle.main.loadNibNamed("SlideView", owner: self, options: nil)?.first as! SlideView
        s1.imgView.image = UIImage(named: "unlock_pin-default")
        s1.lbTitle.text = "PIN CODE"
        s1.lbDetail.text = "You can choose 6 digits long pin code"
        
        let s2:SlideView = Bundle.main.loadNibNamed("SlideView", owner: self, options: nil)?.first as! SlideView
        s2.imgView.image = UIImage(named: "unlock_lock_pattern-default")
        s2.lbTitle.text = "CONNECT THE DOT"
        s2.lbDetail.text = "You can connect dots"
        return [s1,s2]
    }
    
    func setupSlidesScrollView(slides : [SlideView]) -> Void {
        slideView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.5)
        slideView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: 1.0)
        slideView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height * 0.3)
            slideView.addSubview(slides[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        index = Int(round(scrollView.contentOffset.x/view.frame.width))
        pageControl.currentPage = index
        //        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        //        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        //
        //        // vertical
        //        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        //        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
        //
        //        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        //        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        //
        //        /*
        //         * below code changes the background color of view on paging the scrollview
        //         */
        //        //        self.scrollView(scrollView, didScrollToPercentageOffset: percentageHorizontalOffset)
        //
        //        let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
        //
        //        if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
        //            arrSlides[0].imgView.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
        //            arrSlides[1].imgView.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
        //        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        /*
         *
         */
        setupSlidesScrollView(slides: arrSlides)
    }
    
    @IBAction func changePage(_ sender: Any) {
        if index == 0 {
            let pinView = STORYBOARD_ACTIVATION.instantiateViewController(withIdentifier: "PinViewController") as! PinViewController
            let navController = UINavigationController(rootViewController: pinView)
            navController.modalPresentationStyle = .fullScreen
            self.navigationController?.present(navController, animated: true, completion: nil)
        } else {
            print("123")
        }
    }
    
}

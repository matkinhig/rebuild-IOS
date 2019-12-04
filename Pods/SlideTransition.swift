//
//  SlideTransition.swift
//  Rebuild-IOSVB
//
//  Created by Mắt Kính IG on 12/2/19.
//  Copyright © 2019 Mắt Kính IG. All rights reserved.
//

import UIKit

class SlideTransition: NSObject, UIViewControllerAnimatedTransitioning {
    var isPresenting : Bool = false
    var spView : DashboardViewController?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toVC = transitionContext.viewController(forKey: .to),
            let fromVC = transitionContext.viewController(forKey: .from) else { return }
        
        let viewContainer = transitionContext.containerView
        let finalWidth = toVC.view.bounds.width * 0.6
        let finalHeight = spView?.heightScreen
        if isPresenting {
            //set menu view controller to container
            viewContainer.addSubview(toVC.view)
            toVC.view.frame = CGRect(x: -finalWidth, y: 0, width: finalWidth, height: finalHeight ?? toVC.view.bounds.height)
        }
        
        //animate on screen
        let transform = {
            toVC.view.transform = CGAffineTransform(translationX: finalWidth, y: 0)
            
        }
        
        //animate back off screen
        let identify = {
            fromVC.view.transform = .identity
        }
        
        
        //animation of transition
        let duration = transitionDuration(using: transitionContext)
        let isCancelled = transitionContext.transitionWasCancelled
        UIView.animate(withDuration: duration, animations: {
            self.isPresenting ? transform() : identify()
        }) { (_) in
            transitionContext.completeTransition(!isCancelled)
        }
    }
    
    
}

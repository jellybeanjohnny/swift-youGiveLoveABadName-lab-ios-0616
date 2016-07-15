//
//  ViewController.swift
//  YouGiveLoveABadName
//
//  Created by Flatiron School on 6/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	let offset: CGFloat = 50.0
	
	@IBOutlet weak var equalHeightConstraint: NSLayoutConstraint!
	@IBOutlet weak var smallHeightConstraint: NSLayoutConstraint!
	
	var shouldExpand: Bool = true
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func expandButtonTapped(sender: AnyObject) {
			
			UIView.animateKeyframesWithDuration(0.5, delay: 0, options: UIViewKeyframeAnimationOptions.CalculationModeLinear, animations: {
				self.shouldExpand ? self.expandAnimation() : self.shrinkAnimation()
				}, completion: nil)
			self.shouldExpand = !self.shouldExpand
    }
	
	func expandAnimation() {
		UIView.addKeyframeWithRelativeStartTime(1/3, relativeDuration: 1/3, animations: {
			// shrink a little
			self.smallHeightConstraint.constant = -self.offset
			self.view.layoutIfNeeded()
		})
		
		UIView.addKeyframeWithRelativeStartTime(2/3, relativeDuration: 1/3, animations: {
			self.smallHeightConstraint.active = false
			self.equalHeightConstraint.active = true
			self.equalHeightConstraint.constant = self.offset
			self.view.layoutIfNeeded()
		})
		
		UIView.addKeyframeWithRelativeStartTime(3/3, relativeDuration: 1/3, animations: {
			self.equalHeightConstraint.constant = 0
			self.view.layoutIfNeeded()
		})
	}
	
	func shrinkAnimation() {
		UIView.addKeyframeWithRelativeStartTime(1/3, relativeDuration: 1/3, animations: {
			
			// Expand the image a little bit beyond the screen
			self.equalHeightConstraint.constant = self.offset
			self.view.layoutIfNeeded()
		})
		
		UIView.addKeyframeWithRelativeStartTime(2/3, relativeDuration: 1/3, animations: {
		
			// shrink to slightly below the smaller image
			self.equalHeightConstraint.active = false
			self.smallHeightConstraint.active = true
			self.smallHeightConstraint.constant = -self.offset
			self.view.layoutIfNeeded()
		
		})
		
		UIView.addKeyframeWithRelativeStartTime(3/3, relativeDuration: 1/3, animations: {
			// normal small image size
			self.smallHeightConstraint.constant = 0
			self.view.layoutIfNeeded()
		})
	}

}


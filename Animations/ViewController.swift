//
//  ViewController.swift
//  Animations
//
//  Created by Jesus Lopez de Nava on 7/14/15.
//  Copyright (c) 2015 LodenaApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timesPassed = 0
    
    var alienFrame = 1
    var flyFrame = 1
    var beamFrame = 1
    var walkFrame = 1
    
    var alienAnimating = false
    var flyAnimating = false
    var beamAnimating = false
    var walkAnimating = false
    
    var alienTimer = NSTimer()
    var flyTimer = NSTimer()
    var beamTimer = NSTimer()
    var walkTimer = NSTimer()
    
    @IBOutlet var alien: UIImageView!
    @IBOutlet var fly: UIImageView!
    @IBOutlet var beam: UIImageView!
    @IBOutlet var walk: UIImageView!
    
    @IBAction func AlienTap(sender: AnyObject) {
        
        if alienAnimating {
            
            alienTimer.invalidate()

        } else {
            
            alienTimer = NSTimer.scheduledTimerWithTimeInterval(0.13, target: self, selector: Selector("alienAnimation"), userInfo: nil, repeats: true)
        }
        
        alienAnimating = !alienAnimating

    }
    
    @IBAction func flyTap(sender: AnyObject) {
        
        if flyAnimating {
            
            flyTimer.invalidate()
            
        } else {
            
            flyTimer = NSTimer.scheduledTimerWithTimeInterval(0.13, target: self, selector: Selector("flyAnimation"), userInfo: nil, repeats: true)
        }
        
        flyAnimating = !flyAnimating
        
    }
    
    @IBAction func beamTap(sender: AnyObject) {

        if beamAnimating {
            
            beamTimer.invalidate()
            
        } else {
            
            beamTimer = NSTimer.scheduledTimerWithTimeInterval(0.13, target: self, selector: Selector("beamAnimation"), userInfo: nil, repeats: true)
        }
        
        beamAnimating = !beamAnimating
    }
    
    @IBAction func walkTap(sender: AnyObject) {
    
        if walkAnimating {
            
            walkTimer.invalidate()
            
        } else {
        
            walkTimer = NSTimer.scheduledTimerWithTimeInterval(0.06, target: self, selector: Selector("walkAnimation"), userInfo: nil, repeats: true)
        }
        
        walkAnimating = !walkAnimating
    }
    
    func alienAnimation() {
        
        alienFrame++
        
        if alienFrame == 6 {
            
            alienFrame = 1
            
        }
        
        alien.image = UIImage(named: "alien\(alienFrame).png")
        
    }
    
    func flyAnimation() {
        
        flyFrame++
        
        if flyFrame == 17 {
            
            flyFrame = 1
            
        }
        
        fly.image = UIImage(named: "fly\(flyFrame).png")
        
    }
    
    func beamAnimation() {
        
        beamFrame++
        
        if beamFrame == 11 {
            
            beamFrame = 1
            
        }
        
        beam.image = UIImage(named: "beam\(beamFrame).png")
        
    }
    
    func walkAnimation() {
        
        walkFrame++
        
        if walkFrame == 17 {
            
            walkFrame = 1
            
        }
        
        walk.image = UIImage(named: "walk\(walkFrame).png")
        
    }
    
    @IBAction func alienDrag(recognizer:UIPanGestureRecognizer) {

        let translation = recognizer.translationInView(self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPointZero, inView: self.view)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    override func viewDidLayoutSubviews() {
//    override func viewWillAppear(animated: Bool) {
        
        timesPassed++
        
        if timesPassed == 1 || timesPassed == 2 {
            
            //alien.center = CGPointMake(alien.center.x - 400, alien.center.y)
            
            //alien.alpha = 0

            alien.frame = CGRectMake(12, 79, 0, 0)
            fly.frame = CGRectMake(313, 99, 0, 0)
            beam.frame = CGRectMake(12, 500, 0, 0)
            walk.frame = CGRectMake(296, 493, 0, 0)
        }
        
//        println("Passed \(timesPassed) times")
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(1, animations: { () -> Void in
            
            //self.alien.center = CGPointMake(self.alien.center.x + 400, self.alien.center.y)
            //self.alien.alpha = 1
            
            self.alien.frame = CGRectMake(12, 79, 130, 195)
            self.fly.frame = CGRectMake(137, 99, 176, 195)
            self.beam.frame = CGRectMake(12, 305, 130, 195)
            self.walk.frame = CGRectMake(169, 318, 127, 175)
        })
        
    }
    
}



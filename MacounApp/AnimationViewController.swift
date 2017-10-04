//
//  AnimationViewController.swift
//  MacounApp
//
//  Created by Manu Rink on 04.10.17.
//  Copyright © 2017 microsoft. All rights reserved.
//


import UIKit

class AnimationViewController : UIViewController {
    
    @IBOutlet weak var imageViewTop: UIImageView!
    @IBOutlet weak var imageViewBottom: UIImageView!
    
    var imageArray : [UIImage] = []
    var animating = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageArray.append(UIImage(named: "appledroid0")!)
        imageArray.append(UIImage(named: "appledroid1")!)
        imageArray.append(UIImage(named: "appledroid2")!)
        imageArray.append(UIImage(named: "appledroid1")!)
        imageArray.append(UIImage(named: "appledroid0")!)
        imageArray.append(UIImage(named: "appledroid3")!)
        imageArray.append(UIImage(named: "appledroid4")!)
        imageArray.append(UIImage(named: "appledroid3")!)

        imageViewTop.animationImages = imageArray
        imageViewTop.animationRepeatCount = 1
        imageViewTop.animationDuration = 2
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func toggleImageAnimation(_ sender: Any) {
        imageViewTop.isAnimating ? imageViewTop.stopAnimating() : imageViewTop.startAnimating()
    }
    
    @IBAction func toggleUIViewAnimation(_ sender: Any) {
        animating ? () : animateTheAppleDroid()
    }
    
    func animateTheAppleDroid () {
        UIView.animate(withDuration: 0.3, animations: {
            self.animating = true
            self.imageViewBottom.frame.origin.x -= 10
        }) { completed in
            UIView.animate(withDuration: 0.3, animations: {
                self.imageViewBottom.frame.origin.y -= 5
            }) { completed in
                UIView.animate(withDuration: 0.3, animations: {
                    self.imageViewBottom.frame.origin.x += 5
                }) { completed in
                    UIView.animate(withDuration: 0.3, animations: {
                        self.imageViewBottom.frame.origin.y += 15
                    }) { completed in
                        UIView.animate(withDuration: 0.3) {
                            self.imageViewBottom.frame.origin.x += 5
                            self.imageViewBottom.frame.origin.y -= 10
                        
                            self.animating = false
                        }
                    }
                }
            }
        }
    }
}

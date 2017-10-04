//
//  FirstViewController.swift
//  MacounApp
//
//  Created by Manu Rink on 04.10.17.
//  Copyright © 2017 microsoft. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var startImage: UIImageView!
    @IBOutlet weak var changeImageBtn: UIButton!
    @IBOutlet weak var changeImageViewBtn: UIButton!
    @IBOutlet weak var classObjDesc: UILabel!
    
    let marginFixedSize : CGFloat = 16.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classObjDesc.text = "class description : \n" + startImage.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func updateImage(_ sender: Any) {
        startImage.image = UIImage(named: "nativebuilds")
    }
    
    @IBAction func changeImageView(_ sender: Any) {
        startImage.removeFromSuperview()
        
        let myImageView = UIImageView(image: UIImage(named:"appledroid"))
        myImageView.contentMode = .scaleAspectFit
        view.addSubview(myImageView)
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let margins = view.layoutMarginsGuide
        myImageView.leadingAnchor.constraint(
            equalTo: margins.leadingAnchor,
            constant: marginFixedSize * -1).isActive = true
        myImageView.trailingAnchor.constraint(
            equalTo: margins.trailingAnchor,
            constant: marginFixedSize).isActive = true
        myImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        myImageView.bottomAnchor.constraint(
            equalTo: changeImageViewBtn.topAnchor,
            constant: marginFixedSize).isActive = true
        
        startImage = myImageView
        
        classObjDesc.text = "class description: \n" + startImage.description
    }
}


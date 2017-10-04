//
//  NetworkViewController.swift
//  MacounApp
//
//  Created by Manu Rink on 04.10.17.
//  Copyright © 2017 microsoft. All rights reserved.
//

import UIKit
import Foundation

class NetworkViewController : UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func fetchText(_ sender: Any) {
        self.textView.text = ""
        
        let url = URL(string: "https://gist.githubusercontent.com/codePrincess/7a3fdd1675a4a3e106d9eee9aaca3b6d/raw/b9ca126c65647a643097a13b9d724d1b7ea356ed/.swift")
        
        let request = NSMutableURLRequest(url: url!)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            if let error = error {
                print("Big UPS: \(error)")
            }
            
            if let data = data,
               let myData = String(data: data, encoding:String.Encoding.utf8) {
                DispatchQueue.main.async {
                    self.textView.text = myData
                }
            }
        }
        
        task.resume()
        
    }
    
}

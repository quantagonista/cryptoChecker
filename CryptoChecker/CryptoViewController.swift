//
//  CryptoViewController.swift
//  CryptoChecker
//
//  Created by quantagonista on 2/8/18.
//  Copyright © 2018 quantadev. All rights reserved.
//

import UIKit

class CryptoViewController: UIViewController {
    //MARK: Properties
    var curInstance: Currency?
    
    @IBOutlet weak var curName: UILabel!
    @IBOutlet weak var curPrice: UILabel!
    @IBOutlet weak var curImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let currency = curInstance{
            if let image = UIImage(named: currency.code.lowercased()){
                curImage.image = image
            }
            self.navigationItem.title = currency.name
            curPrice.text = String(currency.price) + " $"
            curName.text = currency.name
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

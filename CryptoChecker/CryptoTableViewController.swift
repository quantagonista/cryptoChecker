//
//  CryptoTableViewController.swift
//  CryptoChecker
//
//  Created by quantagonista on 2/7/18.
//  Copyright © 2018 quantadev. All rights reserved.
//

import UIKit
import Alamofire

class CryptoTableViewController: UITableViewController {
    let getLimited = "https://api.coinmarketcap.com/v1/ticker/?limit=3"
    let getAll = "https://api.coinmarketcap.com/v1/ticker/"
    var json: Any?
    var currencyList: [Currency] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrencies()
        refreshControl = UIRefreshControl()
        refreshControl!.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl!.addTarget(self, action:#selector(refresh(sender:)), for: .valueChanged)
        tableView.addSubview(refreshControl!)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action: nil)
        // Uncomment the following line to preserve selection between presentations
        
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return currencyList.count
    }
    
    func getCurrencies(){
        Alamofire.request(getAll, method:.get).responseJSON{ response in
            if let jsonResponse = response.result.value {
                print("JSON: \(jsonResponse)")
                self.json = jsonResponse
                self.currencyList = Currency.getCurrenciesFromJSON(data: self.json)
                self.tableView.reloadData()
            } else { print("Error") }
        }
    }
    
    @objc func refresh(sender: AnyObject){
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "CryptoCell"
        let currency = currencyList[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? CryptoTableViewCell
            else {
                return UITableViewCell()
        }
        cell.cName.text = currency.name
        cell.cRank.text = String(currency.rank)
        cell.cPrice.text = String(currency.price)
        cell.cInstance = currency
        return cell
    }
    
    func goToDestinationVC(data:Any?){
        let id = "CryptoDetailVC"
        if let destinationVC = storyboard?.instantiateViewController(withIdentifier: id) as? CryptoViewController {
            if let currency = data as? Currency {
                destinationVC.curInstance = currency
            }
            navigationController?.pushViewController(destinationVC, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currency = currencyList[indexPath.row]
        goToDestinationVC(data: currency)
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

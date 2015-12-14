//
//  NewsTableViewController.swift
//  Myfoot
//
//  Created by Lucas Blanqui on 24/11/2015.
//  Copyright © 2015 Lucas Blanqui. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    var tableData = []
    
    func CallApiFootBall() {
        let url = NSURL(string: "http://football-api.com/api/?Action=fixtures&APIKey=b1b58843-d058-955c-5edcae14653a&comp_id=1204&match_date=24.10.2015")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            do {
                let anyObj = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! NSDictionary
//                print(anyObj["teams"])
                
                    let results: NSArray = anyObj["matches"] as! NSArray
                    self.tableData = results
                    self.tableView.reloadData()
                    //print(self.tableData)
                
                
                
            } catch {
                print("json error: \(error)")
            }
            
        }
        
        
        task.resume()
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.title = "News"
        
        CallApiFootBall()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Match de cette semaine"
    }
    
//    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let vw = UIView()
//        vw.backgroundColor = UIColor(
//            red: 0x86/255,
//            green: 0xBD/255,
//            blue: 0x3C/255,
//            alpha: 1.0)        //UIColor(rgba: "#86BD3C").CGColor
//        
//        return vw
//    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //print(tableData.count)
        return self.tableData.count
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("news", forIndexPath: indexPath) as! MatchTableViewCell

        // Afficher le nom de chaque rows ( Json convert to string )
        let rowData : NSDictionary = self.tableData[indexPath.row] as! NSDictionary
        cell.NameLocal.text = rowData["match_localteam_name"] as? String
        cell.ScoreLocal.text = rowData["match_localteam_score"] as? String
        cell.NameVisitor.text = rowData["match_visitorteam_name"] as? String
        cell.ScoreVisitor.text = rowData["match_visitorteam_score"] as? String
        
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

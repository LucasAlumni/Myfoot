//
//  LiveViewController.swift
//  Myfoot
//
//  Created by Lucas Blanqui on 24/11/2015.
//  Copyright © 2015 Lucas Blanqui. All rights reserved.
//

import UIKit

class LiveViewController: UIViewController {
    
    @IBOutlet weak var text: UITextView!
    
    func CallApiFootBall() {
        let url = NSURL(string: "http://football-api.com/api/?Action=today&APIKey=b1b58843-d058-955c-5edcae14653a&comp_id=1204")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            print(NSString(data: data!, encoding: NSUTF8StringEncoding))
            
        }
        
        task.resume()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        CallApiFootBall()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

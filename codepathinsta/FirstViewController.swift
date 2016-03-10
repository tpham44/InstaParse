//
//  FirstViewController.swift
//  This file will contain the Feed image and caption view in cell to diplay all images
//
//  codepathinsta
//
//  Created by JP on 3/6/16.
//  Copyright © 2016 tpham44. All rights reserved.
//

import UIKit
import Parse
import ParseUI

let UserLogoutNotification = "UserLogoutNotification"


class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var photos: [PFObject]!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        parseAPICall()
        tableView.reloadData()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(animated: Bool) {
         parseAPICall()
        print("did appear")
        
    }
    
//    override func viewWillAppear(animated: Bool) {
//        parseAPICall()
//    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return photos?.count ?? 0
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("FirstTableViewCell", forIndexPath:
            indexPath) as! FirstTableViewCell
        
        let photo = photos[indexPath.row]
        
//        var instagramPost: PFObject! {
//            didSet {
//                print("image was set")
//                cell.photoFromParse.file = photo["media"] as? PFFile
//                cell.photoFromParse.loadInBackground()
//            }
//        }
//        This is the problem 
        
        //setting image
        cell.photoFromParse.file = photo["media"] as? PFFile
        cell.photoFromParse.loadInBackground()

        
        // setting caption
        let caption = photo ["caption"] as! String
        cell.captionUILabel.text = caption
           
       return cell
        
    }
   
    
    func parseAPICall() {
        // construct PFQuery
        let query = PFQuery(className: "Post")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (posts: [PFObject]?, error: NSError?) -> Void in
            if let posts = posts {
                // do something with the data fetched
                print("data fetched")
                self.photos = posts
                self.tableView.reloadData()
                
            } else {
                // handle error
                print ("Error")
            }
            //self.tableView.reloadData()
        }
 }

    
    @IBAction func onLogout(sender: AnyObject) {
        
        PFUser.logOut()
     
        //in order to access the logout function inside AppDelegate you must first
        //access the current instance of it
       
        
        print("User has logged off ")
        self.dismissViewControllerAnimated(true, completion: nil)
        view.endEditing(true)
        NSNotificationCenter.defaultCenter().postNotificationName (UserLogoutNotification, object: nil)
        
        //when log out, we must use the live above to notify that user has been logout successfully

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

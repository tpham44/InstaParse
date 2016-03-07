//
//  userViewController.swift
//  codepathinsta
//
//  Created by JP on 3/7/16.
//  Copyright © 2016 tpham44. All rights reserved.
//

import UIKit

class userViewController: UIViewController, UITableViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
   
    var image = UIImage()
    
    var currentViewController: UIViewController?
    // set UIImagePickerController to imageCapture
    let imageCapture = UIImagePickerController()
    
    @IBOutlet weak var CaptionTextField: UITextField!
    
 
    @IBOutlet weak var image_view: UIImageView!
    
    
    @IBAction func onSave(sender: AnyObject) {
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageCapture.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tabBar( tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        let capture = UIImagePickerController()
        
        capture.delegate = self
        capture.sourceType = .PhotoLibrary
        
        presentViewController(capture, animated: true, completion: nil)
    }
    
    //Camera function
    
    @IBAction func Camera(sender: AnyObject) {
        
        let capture_2 = UIImagePickerController()
        capture_2.delegate = self
        capture_2.sourceType = .Camera
        
        presentViewController(capture_2, animated: true, completion: nil)
    }
    //Folder Access funcion
    
    @IBAction func Folders(sender: AnyObject) {
        
        let capture = UIImagePickerController()
        capture.delegate = self
        capture.sourceType = .PhotoLibrary
        presentViewController(capture, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        image_view.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        dismissViewControllerAnimated(true , completion: nil)
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

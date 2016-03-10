//
//  userViewController.swift
//  codepathinsta
//
//  Created by JP on 3/7/16.
//  Copyright © 2016 tpham44. All rights reserved.
//

import UIKit
import Parse
//import MBProgressHUD

class userViewController: UIViewController, UITableViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
   
    var image = UIImage()
    
    var currentViewController: UIViewController?
    // set UIImagePickerController to imageCapture
    let imageCapture = UIImagePickerController()
    //display caption
    @IBOutlet weak var CaptionTextField: UITextField!
    
 
    @IBOutlet weak var image_view: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //imageCapture.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onSave(sender: AnyObject) {
        
        let newImage = Post.resize(image, newSize: CGSize(width: 300, height: 500))
        
        Post.postUserImage(newImage, withCaption: CaptionTextField.text) { (success: Bool, error: NSError?) -> Void in
            
            if success {
                print("Captions saved !!!")
                self.image_view.image = nil
                self.CaptionTextField.text = nil
                
            } else {
                print("Error: Can not save.. ")
            }
            
            self.tabBarController?.selectedIndex = 0
            
        }
        self.tabBarController?.selectedIndex = 0
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    @IBAction func OnTap(sender: AnyObject) {
        
        view.endEditing(true)
    }

    

    


 
    
    func tabBar( tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        let capture = UIImagePickerController()
        
        capture.delegate = self
        capture.sourceType = .PhotoLibrary
        
        presentViewController(capture, animated: true, completion: nil)
    }
    
    //Camera function
    
    @IBAction func Camera(sender: AnyObject) {
        
        let picker_2 = UIImagePickerController()
        picker_2.delegate = self
        picker_2.sourceType = .Camera
        
        presentViewController(picker_2, animated: true, completion: nil)
    }
    // onclick Folder Access funcion
    
    @IBAction func Folders(sender: AnyObject) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        //picker.sourceType = .PhotoLibrary  ORIGINAL
        picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        // call saveimages function
        saveImages(image)
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    func saveImages(image:UIImage?){
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let firstPhoto = info[UIImagePickerControllerOriginalImage] as! UIImage
        _ = info[UIImagePickerControllerOriginalImage] as! UIImage
        image = firstPhoto
        //image_view.image = info[UdIImagePickerControllerOriginalImage] as? UIImage
        saveImages(image)
        dismissViewControllerAnimated(true, completion: nil)
        self.image_view.image = image
    }
    // Fu
    func imagePickerController_2(picker_2: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let firstPhoto = info[UIImagePickerControllerOriginalImage] as! UIImage
        _ = info[UIImagePickerControllerOriginalImage] as! UIImage
        image = firstPhoto
        //image_view.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        saveImages(image)
        dismissViewControllerAnimated(true, completion: nil)
        self.image_view.image = image
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

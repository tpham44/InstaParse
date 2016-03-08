//
//  FirstTableViewCell.swift
//  codepathinsta
//
//  Created by JP on 3/6/16.
//  Copyright © 2016 tpham44. All rights reserved.
//

import UIKit
import Parse
import ParseUI




class FirstTableViewCell: UITableViewCell {
    
  
    @IBOutlet weak var photoFromParse: PFImageView!
    @IBOutlet weak var captionUILabel: UILabel!

    
    var view: UIView!
    var object: PFObject? {
        didSet {
            photo = Photo(object: object!)
            photo.cell = self
           
            
            
        }
    }
    

    
    var photo: Photo!{
        didSet {
            print("did set caption and image?")
            photoFromParse.image = photo.image
            //userImaGE.image = photo.image
            print("This is the image that is to be set: \(photo.image)")
            //labelCell.text = photo.caption
        }
    }
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
}

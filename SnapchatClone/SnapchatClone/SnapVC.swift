//
//  SnapVC.swift
//  SnapchatClone
//
//  Created by Şule Kaptan on 2.12.2023.
//

import UIKit
import ImageSlideshow
import ImageSlideshowKingfisher

class SnapVC: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
     
    var selectedSnap : Snap?
    
    var inputArray = [KingfisherSource]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let snap = selectedSnap {
            
            timeLabel.text = "Time left: \(snap.timeDifference)"
            
            for imageUrl in snap.imageUrlArray {
                inputArray.append(KingfisherSource(urlString: imageUrl)!)
            }
            
            let imageSlideShow = ImageSlideshow(frame: CGRect(x: 10, y: 20, width: self.view.frame.width * 0.95, height: self.view.frame.height * 0.9))
            imageSlideShow.backgroundColor = UIColor.white
            imageSlideShow.contentScaleMode = UIViewContentMode.scaleAspectFit
            imageSlideShow.setImageInputs(inputArray)
            
            let pageIndicator = UIPageControl()
            pageIndicator.currentPageIndicatorTintColor = UIColor.lightGray
            pageIndicator.pageIndicatorTintColor = .black
            imageSlideShow.pageIndicator = pageIndicator
            
            self.view.addSubview(imageSlideShow)
            self.view.bringSubviewToFront(timeLabel) //hep önde gösterir.
        }
    }
    
}

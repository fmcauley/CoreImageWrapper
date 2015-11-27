//
//  ViewController.swift
//  CorImageWrapper
//
//  Created by MLS Discovery on 11/26/15.
//  Copyright © 2015 Single Focus Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sampleImage: UIImageView!
    
    @IBOutlet weak var secondImage: UIImageView!
    
    var coreImageWrap : CoreImageWrap!
    var image : CIImage!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.coreImageWrap = CoreImageWrap()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.sampleImage.image = UIImage(named: "testImage.jpg")
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.image = CIImage(image: UIImage(named: "testImage.jpg")!)
        
        let blurRadius = 5.0
        let overlayColor = CIColor(red: 255, green: 0, blue: 0, alpha: 0.2)
        let blurredImage = self.coreImageWrap.blur(blurRadius)(self.image)
        let overlaidImage = self.coreImageWrap.colorOverlay(overlayColor)(blurredImage)
        
        
        let myFilter = self.coreImageWrap.composeFilters(self.coreImageWrap.blur(blurRadius), filter2: self.coreImageWrap.colorOverlay(overlayColor))
        
        let result = myFilter(self.image)

        self.sampleImage.image = UIImage(CIImage: overlaidImage)
        self.secondImage.image = UIImage(CIImage: result)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


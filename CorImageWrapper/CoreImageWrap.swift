//
//  CoreImageWrap.swift
//  CorImageWrapper
//
//  Created by MLS Discovery on 11/26/15.
//  Copyright © 2015 Single Focus Software. All rights reserved.
//

import Foundation
import UIKit

infix operator >>> { associativity left }

func >>> (filter1: Filter, filter2: Filter) -> Filter {
    return { img in
        filter2(filter1(img))
    }
}

//: * defining the proper type will drive our development

typealias Filter = CIImage -> CIImage

struct CoreImageWrap {
//: ### Blur
    func blur(radius: Double) -> Filter {
        return { image in
            let parameters = [kCIInputRadiusKey: radius,
                kCIInputImageKey: image]
            let filter = CIFilter(name: "CIGaussianBlur", withInputParameters: parameters)
            return (filter?.outputImage)!
        }
    }
    
//: ### Color Overlay
    
    func colorGenerator(color: CIColor) -> Filter {
        return { _ in
            let parameters = [kCIInputColorKey: color]
            let filter = CIFilter(name: "CIConstantColorGenerator", withInputParameters: parameters)!
            return filter.outputImage!
        }
    }
    
    
//: ### Composite Filter
    func compositeSourceOver(overlay: CIImage) -> Filter {
        return { image in
            let parameters = [
                kCIInputBackgroundImageKey: image,
                kCIInputImageKey: overlay
            ]
            let filter = CIFilter(name: "CISourceOverCompositing", withInputParameters: parameters)!
            let cropRect = image.extent
            return filter.outputImage!.imageByCroppingToRect(cropRect)
        }
    }
    
//: ### Color Overlay
    func colorOverlay(color: CIColor) -> Filter {
        return {image in
            let overlay = self.colorGenerator(color)(image)
            return self.compositeSourceOver(overlay)(image)
        }
        
    }
    
//: ### Composing Filters
    func composeFilters (filter1: Filter, filter2: Filter) -> Filter {
        return { img in
            filter2(filter1(img))
        }
    }
}

//: Playground - noun: a place where people can play
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
        let overlay = colorGenerator(color)(image)
        return compositeSourceOver(overlay)(image)
    }
    
}

//: ### Composing Filters
    func composeFilters (filter1: Filter, filter2: Filter) -> Filter {
        return { img in
            filter2(filter1(img))
        }
    }

//: * test the blur image

var testCIImage = CIImage(image: UIImage(named: "testImage.jpg")!)
var blurAnImage = blur(10.0)
var outputImage = blurAnImage(testCIImage!)

//: * overlay the image with a color

var image = CIImage(image: UIImage(named: "testImage.jpg")!)

let blurRadius = 5.0
let overlayColor = CIColor(red: 255, green: 0, blue: 0, alpha: 0.2)
let blurredImage = blur(blurRadius)(image!)
let overlaidImage = colorOverlay(overlayColor)(blurredImage)
//
//
//let myFilter = composeFilters(blur(blurRadius), filter2: colorOverlay(overlayColor))
//
//let result = myFilter(image!)



//: [Next](@next)

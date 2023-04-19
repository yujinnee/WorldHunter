//
//  ZoomableImageView.swift
//  WorldHunter
//
//  Created by 이유진 on 2023/04/13.
//

import Foundation
import UIKit
import SwiftUI


struct ZoomableImageView: UIViewRepresentable {
    var image: UIImage
    
    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.delegate = context.coordinator
        scrollView.maximumZoomScale = 30
        scrollView.minimumZoomScale = 1
        scrollView.bouncesZoom = false
        scrollView.bounces = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        
        
        let imageView = context.coordinator.imageView
        imageView.frame = scrollView.bounds
        imageView.contentMode = .scaleAspectFit
        scrollView.addSubview(imageView)
        return scrollView
    }
    
    func makeCoordinator() -> Coordinator {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = true
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return Coordinator(imageView: imageView)
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {


        context.coordinator.imageView.image = self.image
        let scrollView = context.coordinator.imageView.superview as! UIScrollView
        scrollView.zoomScale = 1.0
    }
    

    class Coordinator: NSObject, UIScrollViewDelegate {
        var imageView: UIImageView
        
        init(imageView: UIImageView) {
            self.imageView = imageView
        }
        
        func viewForZooming(in scrollView: UIScrollView) -> UIView? {
            return imageView
        }
        
        func scrollViewDidZoom(_ scrollView: UIScrollView) {
            centerImage()
        }
        
        func centerImage() {
            

            let boundsSize = imageView.bounds.size
            var frameToCenter = imageView.frame
            

            if frameToCenter.size.width < boundsSize.width {
                frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width)/2
            }
            else {
                frameToCenter.origin.x = 0
            }
            

            if frameToCenter.size.height < boundsSize.height {
                frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height)/2
            }
            else {
                frameToCenter.origin.y = 0
            }
            
            imageView.frame = frameToCenter
        }
    }
}

//
//  CATransformLayerViewController.swift
//  Animation
//
//  Created by 雨月星缘 on 2017/11/9.
//  Copyright © 2017年 雨月星缘. All rights reserved.
//

import UIKit

class CATransformLayerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var pt = CATransform3DIdentity
        pt.m34 = -1.0 / 500.0
        self.view.layer.sublayerTransform = pt
        
        var c1 = CATransform3DIdentity
        c1 = CATransform3DTranslate(c1, 0, 50, 0)
        let layer1 = cubeWith(transform: c1)
        self.view.layer.addSublayer(layer1)
        
        
        var c2 = CATransform3DIdentity
        c2 = CATransform3DTranslate(c2, 0, 200, 0)
        c2 = CATransform3DRotate(c2, -CGFloat(Double.pi / 4), 1, 0, 0)
        c2 = CATransform3DRotate(c2, -CGFloat(Double.pi / 4), 0, 1, 0)
        let layer2 = cubeWith(transform: c2)
        self.view.layer.addSublayer(layer2)
        
    
        // Do any additional setup after loading the view.
    }

    func faceWith(transform: CATransform3D) -> CALayer {
        let layer = CALayer()
        layer.frame = CGRect(x: -50, y: -50, width: 100, height: 100)
        
        let red = Double(arc4random()) / Double(INT_MAX)
        let green = Double(arc4random()) / Double(INT_MAX)
        let blue = Double(arc4random()) / Double(INT_MAX)
        
        layer.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0).cgColor
        layer.transform = transform
        return layer
    }
    
    func cubeWith(transform: CATransform3D) -> CALayer {
        let transformLayer = CATransformLayer()
        
        var ct = CATransform3DMakeTranslation(0, 0, 50)
        transformLayer.addSublayer(faceWith(transform: ct))
        
        ct = CATransform3DMakeTranslation(50, 0, 0)
        ct = CATransform3DRotate(ct, CGFloat(Double.pi / 2.0), 0, 1, 0)
        transformLayer.addSublayer(faceWith(transform: ct))
        
        ct = CATransform3DMakeTranslation(0, -50, 0)
        ct = CATransform3DRotate(ct, CGFloat(Double.pi / 2.0), 1, 0, 0)
        transformLayer.addSublayer(faceWith(transform: ct))
        
        ct = CATransform3DMakeTranslation(0, 50, 0)
        ct = CATransform3DRotate(ct, -CGFloat(Double.pi / 2.0), 1, 0, 0)
        transformLayer.addSublayer(faceWith(transform: ct))
        
        
        ct = CATransform3DMakeTranslation(-50, 0, 0)
        ct = CATransform3DRotate(ct, -CGFloat(Double.pi / 2.0), 0, 1, 0)
        transformLayer.addSublayer(faceWith(transform: ct))
        
        ct = CATransform3DMakeTranslation(0, 0, -50)
        ct = CATransform3DRotate(ct, CGFloat(Double.pi), 0, 1, 0)
        transformLayer.addSublayer(faceWith(transform: ct))
        
        transformLayer.position = CGPoint(x: self.view.bounds.width / 2.0, y: self.view.bounds.width / 2.0)
        
        transformLayer.transform = transform
        
        return transformLayer
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}

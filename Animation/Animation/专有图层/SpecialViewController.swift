//
//  SpecialViewController.swift
//  Animation
//
//  Created by 雨月星缘 on 2017/11/9.
//  Copyright © 2017年 雨月星缘. All rights reserved.
//

import UIKit

class SpecialViewController: UIViewController {
    
    /*
     CAShapeLayer渲染快速，使用硬件加速；高效使用内存；不会被图层边界剪裁掉；不会出现像素化
     CAShapeLayer可以用来绘制所有能够通过CGPath来表示的形状。这个形状不一定要闭合，图层路径也不一定要不可破
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()

        normalShapeLayer()
        
        circularShapeLayer()
        // Do any additional setup after loading the view.
    }

    // 一般用法
    func normalShapeLayer() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 175, y: 100))
        path.addArc(withCenter: CGPoint(x: 150, y: 100), radius: 25, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        path.move(to: CGPoint(x: 150, y: 125))
        path.addLine(to: CGPoint(x: 150, y: 175))
        path.addLine(to: CGPoint(x: 125, y: 225))
        path.move(to: CGPoint(x: 150, y: 175))
        path.addLine(to: CGPoint(x: 175, y: 225))
        path.move(to: CGPoint(x: 100, y: 150))
        path.addLine(to: CGPoint(x: 200, y: 150))
        
        let layer = CAShapeLayer()
        layer.strokeColor = UIColor.red.cgColor // 画笔颜色
        layer.fillColor = UIColor.clear.cgColor // 填充颜色
        layer.lineWidth = 5 // 线宽
        layer.lineJoin = kCALineJoinRound // 线条结合点的样子
        layer.lineCap = kCALineCapRound // 线条结尾的样子
        layer.path = path.cgPath
        
        self.view.layer.addSublayer(layer) // 将CAShapeLayer实例添加到根视图的图层上，只有添加上才能显示
        
    }
    
    // CAShapeLayer可以圆角，优势是可以单独指定每一个角
    func circularShapeLayer() {
        let rect = CGRect(x: 50, y: 300, width: 100, height: 100)
        let radii = CGSize(width: 20, height: 20)
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: (UIRectCorner(rawValue: UIRectCorner.bottomRight.rawValue | UIRectCorner.topLeft.rawValue)), cornerRadii: radii)
        
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.red.cgColor
        layer.path = path.cgPath
        
        self.view.layer.addSublayer(layer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}

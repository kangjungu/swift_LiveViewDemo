//
//  MyDrawView.swift
//  LiveViewDemo
//
//  Created by JHJG on 2016. 7. 18..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import UIKit
import QuartzCore

//인터페이스 빌더에 있튼 뷰가 살아있도록 하기 위해서 지시자를 추가하면됨. 그러면 스토리보드가 라이브로 계속 바뀐다.
@IBDesignable
class MyDrawView: UIView {

    //@IBInspectable를 붙이면 다른 속성들처럼 스토리보드에서 애트리뷰트 인스펙터 패널을 이용하여 수정할수 있다.
    @IBInspectable var startColor:UIColor = UIColor.whiteColor()
    @IBInspectable var endColor:UIColor = UIColor.redColor()
    @IBInspectable var endRadius: CGFloat = 200
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        let colorspace = CGColorSpaceCreateDeviceRGB()
        let location:[CGFloat] = [0.0,1.0]
        
        let gradient = CGGradientCreateWithColors(colorspace, [startColor.CGColor, endColor.CGColor], location)
        
        var startPoint = CGPoint()
        var endPoint = CGPoint()
        
        let startRadius:CGFloat = 0
        
        startPoint.x = 210
        startPoint.y = 180
        endPoint.x = 210
        endPoint.y = 200
        
        CGContextDrawRadialGradient(context, gradient, startPoint, startRadius, endPoint, endRadius, .DrawsBeforeStartLocation)
    
    }

}

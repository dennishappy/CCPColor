//
//  CCPColor.swift
//  CCPLauchView
//
//  Created by 储诚鹏 on 17/2/16.
//  Copyright © 2017年 chengpeng.chu. All rights reserved.
//

import UIKit


public extension UIColor {
    //rgba
    public class func rgb(_ colors : [CGFloat]) -> UIColor {
        var color : UIColor = UIColor.white
        guard ((colors.count == 1) || (colors.count == 3) || (colors.count == 4) || (colors.count == 2)) else {
            return color;
        }
        let subColors = colors.map {$0 / 255.0}
        switch colors.count {
        case 1:
            color = UIColor(red: subColors[0], green: subColors[0], blue: subColors[0], alpha: 1.0)
            break
        case 2:
            color = UIColor(red: subColors[0], green: subColors[0], blue: subColors[0], alpha: subColors[1] * 255)
            break
        case 3:
            color = UIColor(red: subColors[0], green: subColors[1], blue: subColors[2], alpha: 1.0)
            break
        case 4:
            color = UIColor(red: subColors[0], green: subColors[1], blue: subColors[2], alpha: subColors[3] * 255)
            break
        default:
            break
        }
        return color
    }
    
    //cgRgb
    public class func cgRgb(_ colors : [CGFloat]) -> CGColor {
        return rgb(colors).cgColor
    }

    //hex
    public class func hex(_ string : String) -> UIColor {
        var hex = string.hasPrefix("#") ? String(string.characters.dropFirst()) : string
        guard hex.characters.count == 3 || hex.characters.count == 6 else {
            return UIColor.white
        }
        if hex.characters.count == 3 {
            for (index,char) in hex.characters.enumerated() {
                hex.insert(char, at: hex.index(hex.startIndex, offsetBy: index * 2))
            }
        }
       return  self.rgb([CGFloat((Int(hex, radix: 16)! >> 16) & 0xFF),CGFloat((Int(hex, radix: 16)! >> 8) & 0xFF),CGFloat((Int(hex, radix: 16)!) & 0xFF)])
        
    }
    
}

//gradient
//这个方法参考HUE
public extension Array where Element : UIColor {
    public func gradient(_ transform : ((_ g : inout CAGradientLayer) -> CAGradientLayer)? = nil) -> CAGradientLayer {
        var gradient = CAGradientLayer()
        gradient.colors = self.map {$0.cgColor}
        if let transform = transform {
            gradient = transform(&gradient)
        }
        return gradient
    }
}






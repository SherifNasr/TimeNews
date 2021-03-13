//
//  UIViewExtension.swift
//  LatestNews
//
//  Created by Sherif Nasr on 12/03/2021.
//

import UIKit

extension UIView {
    func addShadow(){
        layer.shadowColor = .init(red: 0, green: 0, blue: 0, alpha: 16)
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        layer.masksToBounds = false
    }
}

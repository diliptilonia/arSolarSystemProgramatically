//
//  planet.swift
//  arSolarSystemProgramatically
//
//  Created by Dilip Gurjar on 23/02/19.
//  Copyright © 2019 Dilip Gurjar. All rights reserved.
//

import UIKit

class Planet {
    
    var name: String
    var radius: CGFloat
    var rotation: CGFloat
    var color: UIColor
    var sunDistance: Float
    
    init(name: String, radius: CGFloat, rotation: CGFloat, color: UIColor, sunDistance: Float) {
        self.name = name
        self.radius = radius
        self.rotation = rotation
        self.color = color
        self.sunDistance = sunDistance
    }
}

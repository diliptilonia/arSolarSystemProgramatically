//
//  ViewController.swift
//  arSolarSystemProgramatically
//
//  Created by Dilip Gurjar on 23/02/19.
//  Copyright © 2019 Dilip Gurjar. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        let scene = SCNScene()
        sceneView.scene = scene
        
        createSolarSystem()
    }
    
    func createSolarSystem() {
        // ParentNode
        let parentNode = SCNNode()
            parentNode.position.z = 0.5
        
        // Planets
        let mercury = Planet(name: "mercury", radius: 0.14, rotation: 32.degreesToRadians, color: .orange, sunDistance: 1.3)
        let venus = Planet(name: "venus", radius: 0.35, rotation: 10.degreesToRadians, color: .cyan, sunDistance: 2)
        let earth = Planet(name: "earth", radius: 0.5, rotation: 18.degreesToRadians, color: .blue, sunDistance: 7)
        let saturn = Planet(name: "saturn ", radius: 1, rotation: 12.degreesToRadians, color: .brown, sunDistance: 12)
        
        let planets = [mercury, venus, earth, saturn]
        
        for planet in planets {
            parentNode.addChildNode(createPanetsNode(from : planet))
        }
        
        // Light
        let light = SCNLight()
        light.type = .omni
        parentNode.light = light
        
        // Stars
    }
    
    
    func createPanetsNode(from planet : Planet) -> SCNNode {
        
        let parentNode = SCNNode()
        let rotationAction = SCNAction.rotateBy(x: 0, y: planet.rotation, z: 0, duration: 1)
        parentNode.runAction(rotationAction)
        
        let geomatric = SCNSphere(radius: planet.radius)
        geomatric.firstMaterial?.diffuse.contents = planet.color
        
        let planetNode = SCNNode(geometry: geomatric)
        planetNode.position.z = -planet.sunDistance
        planetNode.name = planet.name
        parentNode.addChildNode(planetNode)
        
        return parentNode
        
    }
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }



}


extension Int {
    var degreesToRadians : CGFloat {
        return CGFloat(self) * .pi / 180
    }
}

//
//  ViewController.swift
//  SceneKitPractice
//
//  Created by Vladislav on 12.03.2022.
//

import UIKit
import SnapKit
import SceneKit

class HomeViewController: UIViewController {

    let sceneView = SCNView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSceneView()
    }

    private func addSceneView() {
        view.addSubview(sceneView)
        // 1: Load .obj file
        let scene = SCNScene(named: "converse_obj.obj")
     //   let scene = SCNScene(named: "Squid_Games_Leader_mask.obj")
        // 2: Add camera node
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        // 3: Place camera
        cameraNode.position = SCNVector3(x: 0, y: 12, z: 45)
        // 4: Set camera on scene
        scene?.rootNode.addChildNode(cameraNode)
        // 5: Adding light to scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 40)
        scene?.rootNode.addChildNode(lightNode)
        // 6: Creating and adding ambien light to scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = .ambient
        ambientLightNode.light?.color = UIColor.darkGray
        scene?.rootNode.addChildNode(ambientLightNode)
        // Allow user to manipulate camera
        sceneView.allowsCameraControl = true
        // Show FPS logs and timming
        // sceneView.showsStatistics = true
        
        // Set background color
        sceneView.backgroundColor = UIColor.black
        // Set scene settings
        sceneView.scene = scene
        sceneView.snp.makeConstraints { make in
            make.top.equalTo(60)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(340)
        }
    }
}

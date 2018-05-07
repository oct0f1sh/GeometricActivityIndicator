//
//  ViewController.swift
//  GeometricActivityIndicator
//
//  Created by oct0f1sh on 05/04/2018.
//  Copyright (c) 2018 oct0f1sh. All rights reserved.
//

import UIKit
import GeometricActivityIndicator

class ViewController: UIViewController {
    @IBOutlet weak var geometricView: GeometricActivityIndicator!
    @IBOutlet weak var shapeLabel: UILabel!
    
    override func viewDidLoad() {
        changeShapeLabel()
    }
    
    func changeShapeLabel() {
        shapeLabel.text = "SHAPE \(geometricView.shapeTypeIndex)"
    }

    @IBAction func leftButtonTapped(_ sender: Any) {
        geometricView.shapeTypeIndex -= 1
        
        changeShapeLabel()
    }
    
    @IBAction func rightButtonTapped(_ sender: Any) {
        geometricView.shapeTypeIndex += 1
        
        changeShapeLabel()
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        geometricView.startAnimating()
    }
    
    @IBAction func stopButtonTapped(_ sender: Any) {
        geometricView.stopAnimating()
    }
}


//![shape 1](ReadmeAssets/shape1.gif "Shape 1") ![shape 2](ReadmeAssets/shape2.gif "Shape 2") ![shape 3](ReadmeAssets/shape3.gif "Shape 3")
//![shape 4](ReadmeAssets/shape4.gif "Shape 4") ![shape 5](ReadmeAssets/shape5.gif "Shape 5") ![shape 6](ReadmeAssets/shape6.gif "Shape 6")

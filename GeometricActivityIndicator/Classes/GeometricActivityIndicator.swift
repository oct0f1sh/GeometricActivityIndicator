
//
//  GeometricActivityIndicator.swift
//  animations
//
//  Created by Duncan MacDonald on 5/1/18.
//  Copyright © 2018 Duncan MacDonald. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class GeometricActivityIndicatorView: UIView {
    
    // --------------------------
    // MARK - STENCIL ATTRIBUTES
    // --------------------------
    var nodes: [Ring]
    
    @IBInspectable var shouldDrawStencil: Bool = true {
        didSet {
            reloadOptions()
        }
    }
    
    var stencilAnimDuration: CFTimeInterval = 1.5
    
    var stencilAnimFromValue: Float = -0.5
    var pausedStencilAnimFromValue: Float = 1
    
    var stencilAnimToValue: Float = 2
    var pausedStencilAnimToValue: Float = 1
    
    @IBInspectable var stencilLineColor: UIColor = UIColor.darkGray {
        didSet {
            reloadOptions()
        }
    }
    
    @IBInspectable var stencilLineWidth: CGFloat = 1 {
        didSet {
            reloadOptions()
        }
    }
    
    // --------------------------
    // MARK - SHAPE ATTRIBUTES
    // --------------------------
    var shapeAnimDuration: CFTimeInterval = 1.5
    
    var shapeAnimFromValue: Float = -2
    var pausedShapeAnimFromValue: Float = 1
    
    var shapeAnimToValue: Float = 1.5
    var pausedShapeAnimToValue: Float = 1
    
    @IBInspectable var shapeTypeIndex: Int = 1 {
        didSet {
            reloadOptions()
        }
    }
    
    @IBInspectable var shapeLineColor: UIColor = UIColor.red {
        didSet {
            reloadOptions()
        }
    }
    
    @IBInspectable var shapeLineWidth: CGFloat = 0 {
        didSet {
            reloadOptions()
        }
    }
    
    // --------------------------
    // MARK - OVERRIDE VALUES
    // --------------------------
    override var bounds: CGRect {
        didSet {
            reloadOptions()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 30, height: 30)
    }
    
    // --------------------------
    // MARK - OVERRIDE METHODS
    // --------------------------
//    override func layoutSubviews() {
//        self.backgroundColor = .clear
//
//        layoutSubviews()
//    }
    
    override init(frame: CGRect) {
        nodes = []
        
        super.init(frame: frame)
        
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        nodes = []
        
        super.init(coder: aDecoder)
        
        backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect) {
        makeNodes()
        if shouldDrawStencil {
            drawMetatron(isStencil: true)
            drawCube()
        }
        
        switch shapeTypeIndex {
        case 1:
            drawIcosahedron()
        case 2:
            drawTetrahedron()
        case 3:
            drawCube()
        case 4:
            drawOctahedron()
        case 5:
            drawUnnamed3()
        case 6:
            drawUnnamed1()
        case 7:
            drawMetatron()
        default:
            break
        }
    }
    
    // --------------------------
    // MARK - HELPER METHODS
    // --------------------------
    func reloadOptions() {
        layer.sublayers?.forEach({ (layer) in
            layer.removeFromSuperlayer()
        })
        
        setNeedsDisplay()
    }
    
    func makeNodes() -> () {
        let radius: CGFloat = bounds.height / 8
        
        let offset: CGFloat = sqrt( pow(2 * radius, 2) - pow(radius, 2) )
        
        let topWidth: CGFloat = sqrt( pow(4 * radius, 2) - pow(2 * radius, 2) )
        
        var node1Point = CGPoint(x: (bounds.width / 2) - radius, y: bounds.maxY - radius)
        var node2Point = CGPoint(x: node1Point.x + topWidth, y: node1Point.y - (radius * 2))
        var node3Point = CGPoint(x: node1Point.x + topWidth, y: node1Point.y - (radius * 6))
        
        for _ in 1...5 {
            let node1 = Ring(frame: CGRect(x: node1Point.x, y: node1Point.y, width: radius * 2, height: radius * 2))
            node1.tag = 15
            
            let node2 = Ring(frame: CGRect(x: node2Point.x, y: node2Point.y, width: radius * 2, height: radius * 2))
            node2.tag = 15
            
            let node3 = Ring(frame: CGRect(x: node3Point.x, y: node3Point.y, width: radius * 2, height: radius * 2))
            node3.tag = 15
            
            nodes.append(contentsOf: [node1, node2, node3])
            
            node1Point.y = node1Point.y - (radius * 2)
            
            node2Point.x = node2Point.x - offset
            node2Point.y = node2Point.y - radius
            
            node3Point.x = node3Point.x - offset
            node3Point.y = node3Point.y + radius
        }
        layoutSubviews()
    }
    
    // --------------------------
    // MARK - DRAWING METHOD
    // --------------------------
    func drawShapeFromCoords(coords: [[Int]], isStencil: Bool = false) {
        for coord in coords {
            let ring = nodes[coord[0]]
            let target = nodes[coord[1]]
            
            let linePath = UIBezierPath()
            linePath.move(to: ring.center)
            linePath.addLine(to: target.center)
            
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = linePath.cgPath
            shapeLayer.strokeColor = isStencil ? stencilLineColor.cgColor : shapeLineColor.cgColor
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.lineWidth = isStencil ? stencilLineWidth : shapeLineWidth
            shapeLayer.lineCap = kCALineCapRound
            
            layer.addSublayer(shapeLayer)
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.duration = isStencil ? stencilAnimDuration : shapeAnimDuration
            animation.fromValue = isStencil ? pausedStencilAnimFromValue : pausedShapeAnimFromValue
            animation.toValue = isStencil ? pausedStencilAnimToValue : pausedShapeAnimToValue
            animation.isRemovedOnCompletion = false
            animation.repeatCount = .infinity
            animation.autoreverses = true
            shapeLayer.add(animation, forKey: "myanim")
        }
    }
    
    // --------------------------
    // MARK - ANIMATION CONTROL METHODS
    // --------------------------
    func startAnimating() {
        pausedStencilAnimFromValue = stencilAnimFromValue
        pausedStencilAnimToValue = stencilAnimToValue
        
        pausedShapeAnimFromValue = shapeAnimFromValue
        pausedShapeAnimToValue = shapeAnimToValue
        
        reloadOptions()
    }
    
    func stopAnimating() {
        pausedStencilAnimFromValue = 1
        pausedStencilAnimToValue = 1
        
        pausedShapeAnimFromValue = 1
        pausedShapeAnimToValue = 1
        
        reloadOptions()
    }
    
    // --------------------------
    // MARK - SHAPE COORDINATES
    // --------------------------
    func drawCube() -> () {
        
        let cube: [[Int]] = [[0, 1], [1, 2], [2, 12], [12, 13], [13, 14], [14, 0],
                             [3, 4], [4, 5], [5, 9], [9, 10], [10, 11], [11, 3],
                             [0, 6], [1, 6], [2, 6], [12, 6], [13, 6], [14, 6]]
        
        drawShapeFromCoords(coords: cube)
    }
    
    func drawOctahedron() -> () {
        let coords: [[Int]] = [[0, 1], [1, 2], [2, 12], [12, 13], [13, 14], [14, 0],
                               [3, 4], [4, 5], [5, 9], [9, 10], [10, 11], [11, 3],
                               [12, 14], [14, 1], [1, 12],
                               [13, 2], [2, 0], [0, 13],
                               [10, 5], [5, 3], [3, 10],
                               [11, 4], [4, 9], [9, 11]]
        
        drawShapeFromCoords(coords: coords)
    }
    
    func drawTetrahedron() -> () {
        let coords: [[Int]] = [[12, 14], [14, 1], [1, 12],
                               [13, 2], [2, 0], [0, 13],
                               [11, 4], [4, 9], [9, 11],
                               [12, 6], [14, 6], [1, 6]]
        
        drawShapeFromCoords(coords: coords)
    }
    
    func drawIcosahedron() -> () {
        let coords: [[Int]] = [[0, 1], [1, 2], [2, 12], [12, 13], [13, 14], [14, 0],
                               [13, 10], [0, 3], [2, 5],
                               [12, 14], [14, 1], [1, 12],
                               [10, 5], [5, 3], [3, 10]]
        
        drawShapeFromCoords(coords: coords)
    }
    
    func drawUnnamed1() -> () {
        let coords: [[Int]] = [[0, 1], [1, 2], [2, 12], [12, 13], [13, 14], [14, 0],
                               [12, 10], [12, 5], [12, 11], [12, 4], [12, 6],
                               [2, 9], [2, 4], [2, 10], [2, 3], [2, 6],
                               [1, 5], [1, 3], [1, 11], [1, 9], [1, 6],
                               [0, 11], [0, 4], [0, 10], [0, 5], [0, 6],
                               [14, 3], [14, 10], [14, 9], [14, 4], [14, 6],
                               [13, 11], [13, 9], [13, 3], [13, 5], [13, 6]]
        
        drawShapeFromCoords(coords: coords)
    }
    
    func drawMetatron(isStencil: Bool = false) -> () {
        let coords: [[Int]] = [[0, 1], [1, 2], [2, 12], [12, 13], [13, 14], [14, 0],
                               [12, 10], [12, 5], [12, 11], [12, 4], [12, 6],
                               [2, 9], [2, 4], [2, 10], [2, 3], [2, 6],
                               [1, 5], [1, 3], [1, 11], [1, 9], [1, 6],
                               [0, 11], [0, 4], [0, 10], [0, 5], [0, 6],
                               [14, 3], [14, 10], [14, 9], [14, 4], [14, 6],
                               [13, 11], [13, 9], [13, 3], [13, 5], [13, 6],
                               [9, 5], [5, 4], [4, 3], [3, 11], [11, 10], [10, 9],
                               [9, 4], [4, 11], [11, 9],
                               [5, 3], [3, 10], [10, 5]]
        
        if isStencil {
            drawShapeFromCoords(coords: coords, isStencil: true)
        } else {
            drawShapeFromCoords(coords: coords)
        }
    }
    
    func drawUnnamed3() -> () {
        drawCube()
        drawOctahedron()
        drawTetrahedron()
        drawIcosahedron()
    }
}

class Ring {
    var tag: Int = 0
    var rect: CGRect
    
    var center: CGPoint {
        get {
            return CGPoint(x: self.rect.midX, y: self.rect.midY)
        }
    }
    
    init(frame: CGRect) {
        self.rect = frame
    }
}

//
//  RoundView.swift
//  Application
//
//  Created by Alex Gikaev on 01.08.2021.
//

import UIKit

@IBDesignable
class RoundImageView: UIImageView {

    private var round = false


    @IBInspectable var inspectRound: Bool {
        set {
            round = newValue
            makeRound()
        }
        get {
            return self.round
        }
    }

    override internal var frame: CGRect{
        set {
            super.frame = newValue
            makeRound()
        }
        get {
            return super.frame
        }
    }

    private func makeRound() {
        if self.round {
            self.clipsToBounds = true
            self.layer.cornerRadius = (self.frame.width + self.frame.height) / 4
        } else {
            self.layer.cornerRadius = 0
        }
    }

}
//
//
//@IBDesignable
//class RoundImageView: UIImageView {
//
//    private var round = false
//
//    @IBInspectable var inspectRound: Bool {
//            set {
//                round = newValue
//                setRound()
//            }
//            get {return self.round}
//        }
//
//    @IBInspectable var intensity:Float = 0.2{
//        didSet{
//            setShadow()
//        }
//    }
//
//    override internal var frame: CGRect{
//            set {
//                super.frame = newValue
//                setRound()
//            }
//            get {
//                return super.frame
//            }
//        }
//
//
//
//    override func layoutSubviews(){
//        super.layoutSubviews()
//        setShadow()
//        setRound()
//    }
//
//    func setShadow(){
//        let shadowPath = UIBezierPath(rect: bounds)
//        layer.masksToBounds = false
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = CGSize(width: 0.0, height: 0.3)
//        layer.shadowOpacity = intensity
//        layer.shadowPath = shadowPath.cgPath
//    }
//    func setRound(){
//        if self.round {
//            self.clipsToBounds = true
//            self.layer.cornerRadius = (self.frame.width + self.frame.height) / 4
//        } else {
//            self.layer.cornerRadius = 0
//        }
//    }
//}

//protocol RoundedShadowable: UIImageView {
//    var shadowLayer: CAShapeLayer? { get set }
//    var layer: CALayer { get }
//    var bounds: CGRect { get }
//}
//
//extension RoundedShadowable {
//    func applyShadowOnce(withCornerRadius cornerRadius: CGFloat, andFillColor fillColor: UIColor) {
//        if self.shadowLayer == nil {
//            let shadowLayer = CAShapeLayer()
//            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
//            shadowLayer.fillColor = fillColor.cgColor
//            shadowLayer.shadowColor = UIColor.black.cgColor
//            shadowLayer.shadowPath = shadowLayer.path
//            shadowLayer.shadowOffset = CGSize(width: 0.0, height: 2.0)
//            shadowLayer.shadowOpacity = 0.2
//            shadowLayer.shadowRadius = 3
//            self.layer.insertSublayer(shadowLayer, at: 0)
//            self.shadowLayer = shadowLayer
//        }
//    }
//}

//@IBDesignable
//extension UIImageView {
//    
//    @IBInspectable var shadow: Bool {
//        get {
//            return layer.shadowOpacity > 0.0
//        }
//        set {
//            if newValue == true {
//                self.addShadow()
//            }
//        }
//    }
//
//    fileprivate func addShadow(shadowColor: CGColor = UIColor.black.cgColor, shadowOffset: CGSize = CGSize(width: 3.0, height: 3.0), shadowOpacity: Float = 0.35, shadowRadius: CGFloat = 5.0) {
//        let layer = self.layer
//        layer.masksToBounds = false
//
//        layer.shadowColor = shadowColor
//        layer.shadowOffset = shadowOffset
//        layer.shadowRadius = shadowRadius
//        layer.shadowOpacity = shadowOpacity
//        layer.shadowPath = UIBezierPath(roundedRect: layer.bounds, cornerRadius: layer.cornerRadius).cgPath
//
//        let backgroundColor = self.backgroundColor?.cgColor
//        self.backgroundColor = nil
//        layer.backgroundColor = backgroundColor
//    }
//
//
//
//    @IBInspectable var circle: Bool {
//        get {
//            return layer.cornerRadius == self.bounds.width*0.5
//        }
//        set {
//            if newValue == true {
//                self.cornerRadius = self.bounds.width*0.5
//            }
//        }
//    }
//
//    @IBInspectable var cornerRadius: CGFloat {
//        get {
//            return self.layer.cornerRadius
//        }
//
//        set {
//            self.layer.cornerRadius = newValue
//        }
//    }
//}

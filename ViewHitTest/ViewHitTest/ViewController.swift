//
//  ViewController.swift
//  ViewHitTest
//
//  Created by Behzad Dogahe on 6/24/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 250))
        let subview1 = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        let subview2 = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        let subview3 = UIView(frame: CGRect(x: 30, y: 30, width: 50, height: 25))
        let subview4 = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        let subview5 = UIView(frame: CGRect(x: 50, y: 50, width: 50, height: 50))

        mainView.addSubview(subview1)
        mainView.addSubview(subview2)
        subview1.addSubview(subview3)
        subview2.addSubview(subview4)
        subview2.addSubview(subview5)

        let result1 = mainView.hitTest(CGPoint(x: 40, y: 40), with: nil)
        print(result1)

        let result2 = mainView.myHitTest(CGPoint(x: 40, y: 40))
        print(result2)
        
        let result3 = mainView.hitTest(CGPoint(x: 190, y: 190), with: nil)
        print(result3)

        let result4 = mainView.myHitTest(CGPoint(x: 190, y: 190))
        print(result4)
        
        let result5 = mainView.hitTest(CGPoint(x: 110, y: 110), with: nil)
        print(result5)

        let result6 = mainView.myHitTest(CGPoint(x: 110, y: 110))
        print(result6)
    }
}

extension UIView {
    func myHitTest(_ point: CGPoint) -> UIView? {
        if !self.point(inside: point, with: nil) {
            return nil
        }
        for subview in subviews {
            let convertedPoint = subview.convert(point, from: self)
            if let candidate = subview.myHitTest(convertedPoint) {
                return candidate
            }
        }
        return self
    }
}


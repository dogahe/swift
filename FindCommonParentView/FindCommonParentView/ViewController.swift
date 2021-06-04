//
//  ViewController.swift
//  FindCommonParentView
//
//  Created by Behzad Dogahe on 5/12/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var greenColorView: UIView!
    
    @IBOutlet weak var indigoColorView: UIView!
    
    @IBOutlet weak var orangeColorView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
        recognizer.numberOfTapsRequired = 1
        view.addGestureRecognizer(recognizer)
        
    }
    
    override func viewDidLayoutSubviews() {
        print(view.superview)
        print(view)
        print("Green:\(greenColorView) \(greenColorView.frame.minX) \(greenColorView.frame.minY)  \(greenColorView.frame.width)  \(greenColorView.frame.height) - Parent: \(greenColorView.superview)")
        print("Indigo:\(indigoColorView) - Parent: \(indigoColorView.superview)")
        print("Orange:\(orangeColorView) - Parent: \(orangeColorView.superview)")
        
        print(findParent(indigoColorView, orangeColorView))
    }

    func findParent(_ view1: UIView, _ view2: UIView) -> UIView? {
        var v1: UIView? = view1
        var v2: UIView? = view2
        while v1 != v2 {
            v1 = v1 == nil ? view2 : v1?.superview
            v2 = v2 == nil ? view1 : v2?.superview
        }
        return v1
    }
    
    
    @objc func tapped(_ touch: UITapGestureRecognizer) {
        let touchPoint = touch.location(in: view)
        print(touchPoint)
        print(view.hitTest(touchPoint, with: nil))
    }

}


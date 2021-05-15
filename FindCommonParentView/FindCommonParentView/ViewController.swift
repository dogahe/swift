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

        print(view.superview)
        print(view)
        print(greenColorView)
        print(indigoColorView)
        print(orangeColorView)
        
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

}


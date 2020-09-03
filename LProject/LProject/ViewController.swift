//
//  ViewController.swift
//  LProject
//
//  Created by Behzad Dogahe on 8/31/20.
//  Copyright © 2020 Dogahe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let citations = [3,0,6,1,5]
        hIndex(citations)
        
    }
    
    func hIndex(_ citations: [Int]) -> Int {
        let sortedCitations = citations.sorted()
        
        print(sortedCitations)
        
        let length: Int = sortedCitations.count
        var hIndex: Int = 0
        var remainingCitations: Int = length
        
        var index: Int = -1
        while hIndex < remainingCitations {
            index += 1
            remainingCitations = length - index - 1
            let citationNumber = sortedCitations[index]
            if citationNumber >= remainingCitations {
                hIndex = citationNumber
                break
            } else {
                hIndex = sortedCitations[index]
            }
        }
        return hIndex
    }





}


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
    permute("abcde")
        
    }
    
    func permute(_ str: String) {
        let length = str.count
        var used: [Bool] = Array(repeating: false, count: length)
        var output: [Character] = []
        let input = Array(str)
        
        doPermute(input, output: &output, used: &used, length: length, level: 0)
    }

    func doPermute(_ input: [Character], output: inout [Character], used: inout [Bool], length: Int, level: Int) {
        if level == length {
            print(output)
            return
        }
        for i in 0..<length {
            if used[i] {
                continue
            }
            output.append(input[i])
            used[i] = true
            doPermute(input, output: &output, used: &used, length: length, level: level + 1)
            used[i] = false
            output = output.dropLast()
        }
    }
}


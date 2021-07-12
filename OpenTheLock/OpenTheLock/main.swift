//
//  main.swift
//  OpenTheLock
//
//  Created by Behzad Dogahe on 7/9/21.
//

import Foundation


func openLockQueue(_ deadends: [String], _ target: String) -> Int {
    var deads: Set<String> = Set(deadends)
    let start: [Character] = Array("0000")
    var steps = 0
    var queue: [[Character]] = []
    queue.append(start)
    while !queue.isEmpty {
        let size = queue.count
        for _ in 0 ..< size {
            let top = queue.removeLast()
            if deads.contains(String(top)) {
                continue
            }
            if String(top) == target {
                return steps
            }
            deads.insert(String(top))
            print(deads)
            for next in adj(top) {
                if !deads.contains(String(next)) {
                    queue.append(next)
                }
            }
            
        }
        steps += 1
    }
    return -1
}

func openLock(_ deadends: [String], _ target: String) -> Int {
    let start: [Character] = Array("0000")
    var visited: [[Character]:Int] = [:]
    visited[start] = 0
    bfs(start, &visited, deadends, target)
    return 0
}

func bfs(_ node: [Character], _ visited: inout [[Character]:Int], _ deadends: [String], _ target: String) {
    //print("BFS: \(node)")
    if !deadends.contains(String(node)) {
        //print(adj(node))
        for next in adj(node) {
            if let val = visited[next] {
                
            } else {
                visited[next] = visited[node]! + 1
                if String(next) == target {
                    print(visited[next]!)
                } else {
                    bfs(next, &visited, deadends, target)
                }
            }
        }
    }
}

func adj(_ node: [Character]) -> [[Character]] {
    var arr: [[Character]] = []
    for i in 0 ..< node.count {
        if let num = Int(String(node[i])) {
            let next = (num + 1) % 10
            let prev = (num + 9) % 10
            var nextElem = node
            nextElem[i] = Character(String(next))
            arr.append(nextElem)
            var prevElem = node
            prevElem[i] = Character(String(prev))
            arr.append(prevElem)
        }
    }
    return arr
}

let deadends = ["0201","0101","0102","1212","2002"]
let target = "0202"
let lock = openLockQueue(deadends, target)
print(lock)

let deadends2 = ["8888"]
let target2 = "0009"
let lock2 = openLockQueue(deadends2, target2 )
print(lock2)





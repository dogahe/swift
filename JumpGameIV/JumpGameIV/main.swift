//
//  main.swift
//  JumpGameIV
//
//  Created by Behzad Dogahe on 7/25/21.
//

func minJumps(_ arr: [Int]) -> Int {
    if arr.count == 1 {
        return 0
    }
    var dict: [Int: [Int]] = [:]
    for i in 0 ..< arr.count {
        if let val = dict[arr[i]] {
            var newVal = val
            newVal.append(i)
            dict[arr[i]] = newVal
        } else {
            dict[arr[i]] = [i]
        }
    }
    var adj: [[Int]] = []
    for i in 0 ..< arr.count {
        var a: [Int] = []
        if i > 0 {
            a.append(i - 1)
        }
        if i < arr.count - 1 {
            a.append(i + 1)
        }
        if let val = dict[arr[i]] {
            var newVal = val
            newVal.remove(at: newVal.firstIndex(of: i)!)
            a.append(contentsOf: newVal)
        }
        
        adj.append(a)
    }
    var q: [Int] = []
    var visited: [Int] = Array(repeating: 0, count: arr.count)
    var distance: [Int] = Array(repeating: 0, count: arr.count)
    q.append(0)
    visited[0] = 1
    while !q.isEmpty {
        let node = q.removeFirst()
        for a in adj[node] {
            if visited[a] == 0 {
                visited[a] = 1
                distance[a] = distance[node] + 1
                if a == arr.count - 1 {
                    return distance[a]
                }
                q.append(a)
            }
        }
        adj[node] = []
    }
    return -1
}


let arr = [100,-23,-23,404,100,23,23,23,3,404]
let j = minJumps(arr)
print(j)

let arr2 = [7]
let j2 = minJumps(arr2)
print(j2)

let arr3 = [6,1,9]
let j3 = minJumps(arr3)
print(j3)

let arr4 = [11,22,7,7,7,7,7,7,7,22,13]
let j4 = minJumps(arr4)
print(j4)

let arr5 = [7,6,9,6,9,6,9,7]
let j5 = minJumps(arr5)
print(j5)

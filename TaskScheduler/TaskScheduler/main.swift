//
//  main.swift
//  TaskScheduler
//
//  Created by Behzad Dogahe on 6/19/21.
//

/*
 
 tags:Facebook
 
 621. Task Scheduler
 
 Given a characters array tasks, representing the tasks a CPU needs to do, where each letter represents a different task. Tasks could be done in any order. Each task is done in one unit of time. For each unit of time, the CPU could complete either one task or just be idle.

 However, there is a non-negative integer n that represents the cooldown period between two same tasks (the same letter in the array), that is that there must be at least n units of time between any two same tasks.

 Return the least number of units of times that the CPU will take to finish all the given tasks.

 Example 1:
 Input: tasks = ["A","A","A","B","B","B"], n = 2
 Output: 8
 Explanation:
 A -> B -> idle -> A -> B -> idle -> A -> B
 There is at least 2 units of time between any two same tasks.
 
 Example 2:
 Input: tasks = ["A","A","A","B","B","B"], n = 0
 Output: 6
 Explanation: On this case any permutation of size 6 would work since n = 0.
 ["A","A","A","B","B","B"]
 ["A","B","A","B","A","B"]
 ["B","B","B","A","A","A"]
 ...
 And so on.
 
 Example 3:
 Input: tasks = ["A","A","A","A","A","A","B","C","D","E","F","G"], n = 2
 Output: 16
 Explanation:
 One possible solution is
 A -> B -> C -> A -> D -> E -> A -> F -> G -> A -> idle -> idle -> A -> idle -> idle -> A
  
 Constraints:

 1 <= task.length <= 104
 tasks[i] is upper-case English letter.
 The integer n is in the range [0, 100].
 
 */

import Foundation

public class MaxPQ<T: Comparable> {
    private var pq: [T]
    private var n: Int
    init(_ keys: [T]) {
        n = keys.count
        pq = keys
        for i in stride(from: Int(floor(Double(n)/2)) - 1, to: -1, by: -1) {
            maxHeapify(i)
        }
    }
    
    func maxHeapify(_ i: Int) {
        let l = 2 * i + 1
        let r = 2 * i + 2
        var largest: Int
        if l < n && pq[l] > pq[i] {
            largest = l
        } else {
            largest = i
        }
        if r < n && pq[r] > pq[largest] {
            largest = r
        }
        if largest != i {
            let temp = pq[largest]
            pq[largest] = pq[i]
            pq[i] = temp
            maxHeapify(largest)
        }
    }
    
    func max() -> T {
        return pq[0]
    }
    
    func extractMax() -> T {
        let max = pq[0]
        pq[0] = pq[n - 1]
        n = n - 1
        maxHeapify(0)
        return max
    }
    
    func insert(_ key: T) {
        n = n + 1
        pq.append(key) // dummy value just to increase the size of pq
        increaseKey(n - 1, key)
    }
    
    func increaseKey(_ i: Int, _ key: T) {
        var index = i
        pq[index] = key
        while index > 0 && pq[(index - 1)/2] < pq[index] {
            let temp = pq[(index - 1)/2]
            pq[(index - 1)/2] = pq[index]
            pq[index] = temp
            index = (index - 1)/2
        }
    }
    
    func queue() -> [T] {
        return Array(pq.prefix(n))
    }
    
    func size() -> Int {
        return n
    }
}


func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    var dict: [Character: Int] = [:]
    for task in tasks {
        if let val = dict[task] {
            dict[task] = val + 1
        } else {
            dict[task] = 1
        }
    }
    
    let taskCounts = dict.map( { $0.value } )
    let pq = MaxPQ(taskCounts)
    
    var result = 0
    while pq.size() > 0 {
        var time = 0
        var temp: [Int] = []
        for _ in 0 ..< n + 1 {
            if pq.size() > 0 {
                temp.append(pq.extractMax() - 1)
                time += 1
            }
        }
        for t in temp {
            if t > 0 {
                pq.insert(t)
            }
        }
        result += pq.size() == 0 ? time : n + 1
    }
    return result
}


let tasks1 = ["A","A","A","B","B","B"].map( { Character($0) } )
let n1 = 2
print(leastInterval(tasks1, n1))

let tasks2 = ["A","A","A","B","B","B"].map( { Character($0) } )
let n2 = 0
print(leastInterval(tasks2, n2))

let tasks3 = ["A","A","A","A","A","A","B","C","D","E","F","G"].map( { Character($0) } )
let n3 = 2
print(leastInterval(tasks3, n3))



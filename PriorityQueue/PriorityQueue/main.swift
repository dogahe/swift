//
//  main.swift
//  PriorityQueue
//
//  Created by Behzad Dogahe on 2/6/21.
//

import Foundation

public class MaxPQ<T: Comparable> {
    private var pq: [T]
    var n: Int
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
        if key < pq[index] {
            print("Error")
        } else {
            pq[index] = key
            while index > 0 && pq[(index - 1)/2] < pq[index] {
                let temp = pq[(index - 1)/2]
                pq[(index - 1)/2] = pq[index]
                pq[index] = temp
                index = (index - 1)/2
            }
        }
    }
    
    func queue() -> [T] {
        return Array(pq.prefix(n))
    }
}

let a: [Int] = [15, 13, 9, 5, 12, 8, 7, 4, 0, 6, 2, 1]
var maxPQ = MaxPQ(a)
print(maxPQ.queue())
let m = maxPQ.extractMax()
print("max: \(m)")
print(maxPQ.queue())

maxPQ = MaxPQ(a)
print(maxPQ.queue())
maxPQ.insert(10)
print(maxPQ.queue())

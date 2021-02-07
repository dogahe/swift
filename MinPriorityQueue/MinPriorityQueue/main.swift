//
//  main.swift
//  MinPriorityQueue
//
//  Created by Behzad Dogahe on 2/7/21.
//

import Foundation

public class MinPQ<T: Comparable> {
    private var pq: [T]
    var n: Int
    init(_ keys: [T]) {
        n = keys.count
        pq = keys
        for i in stride(from: Int(floor(Double(n)/2)) - 1, to: -1, by: -1) {
            minHeapify(i)
        }
    }
    
    func minHeapify(_ i: Int) {
        let l = 2 * i + 1
        let r = 2 * i + 2
        var smallest: Int
        if l < n && pq[l] < pq[i] {
            smallest = l
        } else {
            smallest = i
        }
        if r < n && pq[r] < pq[smallest] {
            smallest = r
        }
        if smallest != i {
            let temp = pq[smallest]
            pq[smallest] = pq[i]
            pq[i] = temp
            minHeapify(smallest)
        }
    }
    
    func min() -> T {
        return pq[0]
    }
    
    func extractMin() -> T {
        let min = pq[0]
        pq[0] = pq[n - 1]
        n = n - 1
        minHeapify(0)
        return min
    }
    
    func insert(_ key: T) {
        n = n + 1
        pq.append(key) // dummy value just to increase the size of pq
        decreaseKey(n - 1, key)
    }
    
    func decreaseKey(_ i: Int, _ key: T) {
        var index = i
        if key > pq[index] {
            print("Error")
        } else {
            pq[index] = key
            while index > 0 && pq[(index - 1)/2] > pq[index] {
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
var minPQ = MinPQ(a)
print(minPQ.queue())
let m = minPQ.extractMin()
print("min: \(m)")
print(minPQ.queue())

minPQ = MinPQ(a)
print(minPQ.queue())
minPQ.insert(10)
print(minPQ.queue())


//
//  main.swift
//  Heap
//
//  Created by Behzad Dogahe on 2/6/21.
//

import Foundation

struct Heap<T: Comparable> {
    var heapSize: Int
    var a: [T]
    init(_ a: [T]) {
        heapSize = a.count
        self.a = []
        var aCopy = a
        for i in stride(from: Int(floor(Double(a.count)/2)) - 1, to: -1, by: -1) {
            maxHeapify(&aCopy, i)
        }
        self.a = aCopy
    }
    
    init(_ a: [T], _ heapSize: Int) {
        self.heapSize = heapSize
        self.a = []
        var aCopy = a
        for i in stride(from: Int(floor(Double(a.count)/2)) - 1, to: -1, by: -1) {
            maxHeapify(&aCopy, i)
        }
        self.a = aCopy
    }
    
    func maxHeapify(_ a: inout [T], _ i: Int) {
        let l = 2 * i + 1
        let r = 2 * i + 2
        var largest: Int
        if l < heapSize && a[l] > a[i] {
            largest = l
        } else {
            largest = i
        }
        if r < heapSize && a[r] > a[largest] {
            largest = r
        }
        if largest != i {
            let temp = a[largest]
            a[largest] = a[i]
            a[i] = temp
            maxHeapify(&a, largest)
        }
    }
    
    mutating func heapSort() -> [T] {
        for i in stride(from: a.count - 1, to: 0, by: -1) {
            let temp = a[0]
            a[0] = a[i]
            a[i] = temp
            heapSize = heapSize - 1
            maxHeapify(&a, 0)
        }
        return a
    }
}

let a: [Int] = [4, 1, 3, 2, 16, 9, 10, 14, 8, 7]
var heap = Heap(a)
let b = heap.a
print(b)

let sorted = heap.heapSort()
print(sorted)


/*
 295. Find Median from Data Stream
 
 The median is the middle value in an ordered integer list. If the size of the list is even, there is no middle value and the median is the mean of the two middle values.

 For example, for arr = [2,3,4], the median is 3.
 For example, for arr = [2,3], the median is (2 + 3) / 2 = 2.5.
 Implement the MedianFinder class:

 MedianFinder() initializes the MedianFinder object.
 void addNum(int num) adds the integer num from the data stream to the data structure.
 double findMedian() returns the median of all elements so far. Answers within 10-5 of the actual answer will be accepted.
  

 Example 1:

 Input
 ["MedianFinder", "addNum", "addNum", "findMedian", "addNum", "findMedian"]
 [[], [1], [2], [], [3], []]
 Output
 [null, null, null, 1.5, null, 2.0]

 Explanation
 MedianFinder medianFinder = new MedianFinder();
 medianFinder.addNum(1);    // arr = [1]
 medianFinder.addNum(2);    // arr = [1, 2]
 medianFinder.findMedian(); // return 1.5 (i.e., (1 + 2) / 2)
 medianFinder.addNum(3);    // arr[1, 2, 3]
 medianFinder.findMedian(); // return 2.0
  

 Constraints:

 -105 <= num <= 105
 There will be at least one element in the data structure before calling findMedian.
 At most 5 * 104 calls will be made to addNum and findMedian.
  

 Follow up:

 If all integer numbers from the stream are in the range [0, 100], how would you optimize your solution?
 If 99% of all integer numbers from the stream are in the range [0, 100], how would you optimize your solution?
 
 */

import Foundation

class MedianFinder {
    var arr: [Int]
    
    init() {
        arr = []
    }
    
    func addNum(_ num: Int) {
        if arr.isEmpty {
            arr = [num]
        } else {
            var added = false
            for i in 0 ..< arr.count {
                if num <= arr[i] {
                    arr.insert(num, at: i)
                    added = true
                    break
                }
            }
            if !added {
                arr.append(num)
            }
        }

    }
    
    func findMedian() -> Double {
        if arr.count % 2 == 0 {
            return Double(arr[arr.count/2] + arr[arr.count/2 - 1])/2
        } else {
            return Double(arr[arr.count/2])
        }
    }
}

class MedianFinderHeap {

    var minQueue: MinPQ<Int>
    var maxQueue: MaxPQ<Int>

    init() {
        minQueue = MinPQ()
        maxQueue = MaxPQ()
    }
    
    func addNum(_ num: Int) {
        let l = maxQueue.size()
        let r = minQueue.size()
        
        if l > r {
            if num <= maxQueue.max() {
                let currMax = maxQueue.extractMax()
                maxQueue.insert(num)
                minQueue.insert(currMax)
            } else {
                minQueue.insert(num)
            }
        } else { // l == r
            if l == 0 {
                maxQueue.insert(num)
            } else {
                if num <= minQueue.min() {
                    maxQueue.insert(num)
                } else {
                    let currMin = minQueue.extractMin()
                    minQueue.insert(num)
                    maxQueue.insert(currMin)
                }
            }
        }
    }
    
    func findMedian() -> Double {
        let l = maxQueue.size()
        let r = minQueue.size()
        
        if l > r {
            return Double(maxQueue.max())
        } else {
            return Double(maxQueue.max() + minQueue.min())/2
        }
    }
}

public class MaxPQ<T: Comparable> {
    private var pq: [T]
    private var n: Int
    init() {
        n = 0
        pq = []
    }
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

public class MinPQ<T: Comparable> {
    private var pq: [T]
    var n: Int
    
    init() {
        n = 0
        pq = []
    }
    
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
        pq[index] = key
        while index > 0 && pq[(index - 1)/2] > pq[index] {
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

var mf = MedianFinder()
mf.addNum(-1)
mf.findMedian()
mf.addNum(-2)
mf.findMedian()
mf.addNum(-3)
mf.findMedian()

var mf2 = MedianFinderHeap()
mf2.addNum(-1)
mf2.findMedian()
mf2.addNum(-2)
mf2.findMedian()
mf2.addNum(-3)
mf2.findMedian()

class LFUCache {

    var capacity: Int
    var total: Int
    private var dict: [Int: (Int, Int, Int)]
    var t: Int
    
    init(_ capacity: Int) {
        self.capacity = capacity
        total = 0
        t = 0
        dict = [:]
    }
    
    func get(_ key: Int) -> Int {
        if let val = dict[key] {
            t += 1
            dict[key] = (val.0, t, val.2 + 1)
            return val.0
        } else {
            return -1
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if total < capacity {
            if let val = dict[key] {
                t += 1
                dict[key] = (value, t, val.2 + 1)
            } else {
                t += 1
                dict[key] = (value, t, 1)
                total += 1
            }
        } else {
            // Only need to remove if  we are adding a new  key
            if let val = dict[key] {
                t += 1
                dict[key] = (value, t, val.2 + 1)
            } else {
                var smallestF: Int = Int.max
                var smallestT: Int = Int.max
                var smallestKeys: [Int] = []
                for (index, (key, val)) in dict.enumerated() {
                    let currF = val.2
                    if currF <= smallestF {
                        if currF < smallestF {
                            smallestKeys = []
                        }
                        smallestF = currF
                        smallestKeys.append(key)
                    }
                }
                var smallestKey: Int?
                for key in smallestKeys {
                    let currT = dict[key]!.1
                    if currT < smallestT {
                        smallestT = currT
                        smallestKey = key
                    }
                }
                if let smallestKey = smallestKey {
                    dict[smallestKey] = nil
                    total -= 1
                }
                t += 1
                dict[key] = (value, t, 1)
                total += 1
            }
        }
    }
}

let lfu = LFUCache(2)
lfu.put(1, 101)
lfu.put(2, 102)
lfu.get(1)
lfu.put(3, 103)
lfu.get(2)
lfu.get(3)
lfu.put(4, 104)
lfu.get(1)
lfu.get(3)
lfu.get(4)

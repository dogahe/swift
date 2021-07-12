class SnapshotArray {
    var arr: [[Int:Int]]
    var snapId: Int = 0
    var snapshots: [[Int]] = []
    init(_ length: Int) {
        arr = Array(repeating: [0:0], count: length)
    }
    
    func set(_ index: Int, _ val: Int) {
        arr[index][snapId] = val
        print(arr)
    }
    
    func snap() -> Int {
        snapId += 1
        return snapId - 1
    }
    
    func get(_ index: Int, _ snap_id: Int) -> Int {
        let allkeys = arr[index].keys.sorted()
        for i in 0 ..< allkeys.count {
            let thatKey = allkeys[allkeys.count - 1 - i]
            if thatKey <= snap_id {
                return arr[index][thatKey]!
            }
        }
        return 0
    }
}


let sa = SnapshotArray(3)
sa.set(0, 5)
sa.snap()
sa.set(0, 6)
sa.get(0, 0)


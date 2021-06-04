func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    var tasksCount: [Int] = Array(repeating: 0, count: 26)
    for i in 0 ..< tasks.count {
        let c = tasks[i]
        let index = Int(c.asciiValue! - Character("A").asciiValue!)
        tasksCount[index] += 1
    }
    tasksCount.sort(by: { $0 > $1 })
    var num = (tasksCount[0] - 1) * (n + 1) + 1
    var index = 1
    while tasksCount[index] == tasksCount[0] {
        num += 1
        index += 1
    }
    return num
}


//let tasks: [Character] = ["A","A","A","B","B","B"], n = 0

let tasks: [Character] = ["A","A","A","A","B","B","B","B","C", "C", "D", "D", ], n = 2
leastInterval(tasks, n)


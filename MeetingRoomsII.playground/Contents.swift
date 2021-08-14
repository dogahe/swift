func minMeetingRooms(_ intervals: [[Int]]) -> Int {
    var times: [Int] = []
    for interval in intervals {
        times.append(interval[0])
        times.append(interval[1])
    }
    
    var maxRooms: Int = 0
    for time in times {
        var rooms = 0
        for interval in intervals {
            if time >= interval[0] && time <= interval[1] {
                rooms += 1
            }
        }
        maxRooms = max(maxRooms, rooms)
    }
    return maxRooms
}

let intervals = [[0,30],[5,10],[15,20]]
minMeetingRooms(intervals)

let intervals2 = [[7,10],[2,4]]
minMeetingRooms(intervals2)

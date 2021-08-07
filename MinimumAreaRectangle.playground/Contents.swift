func minAreaRect(_ points: [[Int]]) -> Int {
    var xVals: [Int:Int] = [:]
    var yVals: [Int:Int] = [:]
    var xLines: [Int] = []
    var yLines: [Int] = []
    for i in 0 ..< points.count {
        let point = points[i]
        if let val = xVals[point[0]] {
            xVals[point[0]] = val + 1
        } else {
            xVals[point[0]] = 1
        }
        if let val = yVals[point[1]] {
            yVals[point[1]] = val + 1
        } else {
            yVals[point[1]] = 1
        }
    }
    
    for (_, (key, val)) in xVals.enumerated() {
        if val >= 2 {
            xLines.append(key)
        }
    }
    for (_, (key, val)) in yVals.enumerated() {
        if val >= 2 {
            yLines.append(key)
        }
    }
    xLines.sort()
    yLines.sort()
    var xDiff = Int.max
    for i in 0 ..< xLines.count - 1 {
        let first = xLines[i]
        let second = xLines[i + 1]
        xDiff = min(xDiff, second - first)
    }
    var yDiff = Int.max
    for i in 0 ..< yLines.count - 1 {
        let first = yLines[i]
        let second = yLines[i + 1]
        yDiff = min(yDiff, second - first)
    }
    return xDiff * yDiff
}

let points = [[1,1],[1,3],[3,1],[3,3],[2,2]]
minAreaRect(points)

let points2 = [[1,1],[1,3],[3,1],[3,3],[4,1],[4,3]]
minAreaRect(points2)

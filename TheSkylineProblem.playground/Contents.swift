import Foundation

func getSkyline(_ buildings: [[Int]]) -> [[Int]] {
    let leftMost = buildings[0][0]
    let rightMost = buildings.last![1]
    var skies: [Int] = []
    for left in leftMost ..< rightMost {
        let right = left + 1
        var sky: Int = 0
        for building in buildings {
            if (right > building[0] && left < building[1]) || (left < building[1] && right > building[0]) {
                sky = max(sky, building[2])
            }
        }
        skies.append(sky)
    }
    print(skies)
    
    var lastSky: Int = skies[0]
    var lastEdge: Int = leftMost
    var index: Int = 1
    var output: [[Int]] = []
    while index < skies.count {
        let sky = skies[index]
        if sky != lastSky {
            output.append([lastEdge, lastSky])
            lastSky = sky
            lastEdge = leftMost + index
        }
        index += 1
    }
    output.append([rightMost, 0])
    return output
}

var b = [ [2, 9, 10], [3, 7, 15], [5, 12, 12], [15, 20, 10], [19, 24, 8] ]

getSkyline(b)

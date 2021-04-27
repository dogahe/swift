//
//  main.swift
//  FloodFill
//
//  Created by Behzad Dogahe on 4/26/21.
//

/*

733. Flood Fill

 An image is represented by a 2-D array of integers, each integer representing the pixel value of the image (from 0 to 65535).

 Given a coordinate (sr, sc) representing the starting pixel (row and column) of the flood fill, and a pixel value newColor, "flood fill" the image.

 To perform a "flood fill", consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color as the starting pixel), and so on. Replace the color of all of the aforementioned pixels with the newColor.

 At the end, return the modified image.

 Example 1:

 Input:
 image = [[1,1,1],[1,1,0],[1,0,1]]
 sr = 1, sc = 1, newColor = 2
 Output: [[2,2,2],[2,2,0],[2,0,1]]
 Explanation:
 From the center of the image (with position (sr, sc) = (1, 1)), all pixels connected
 by a path of the same color as the starting pixel are colored with the new color.
 Note the bottom corner is not colored 2, because it is not 4-directionally connected
 to the starting pixel.
 Note:

 The length of image and image[0] will be in the range [1, 50].
 The given starting pixel will satisfy 0 <= sr < image.length and 0 <= sc < image[0].length.
 The value of each color in image[i][j] and newColor will be an integer in [0, 65535].
 
*/

func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
    let m = image.count
    let n = image[0].count
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: m)
    var output = image
    let oldColor = image[sr][sc]
    dfs(&output, sr, sc, &visited, oldColor, newColor)
    return output
}

func dfs(_ output: inout [[Int]], _ row: Int, _ col: Int, _ visited: inout [[Bool]], _ oldColor: Int, _ newColor: Int) {
    let movements: [(Int, Int)] = [(0, 1), (0, -1), (1, 0), (-1, 0)]
    visited[row][col] = true
    output[row][col] = newColor
    for move in movements {
        if isSafe(output, row + move.0, col + move.1, visited, oldColor) {
            dfs(&output, row + move.0, col + move.1, &visited, oldColor, newColor)
        }
    }
}

func isSafe(_ grid: [[Int]], _ row: Int, _ col: Int, _ visited: [[Bool]], _ oldColor: Int) -> Bool {
    return row >= 0 && row < grid.count && col >= 0 && col < grid[0].count && grid[row][col] == oldColor && !visited[row][col]
}

let image = [[1,1,1],[1,1,0],[1,0,1]]
let sr = 1
let sc = 1
let newColor = 2

print(floodFill(image, sr, sc, newColor))

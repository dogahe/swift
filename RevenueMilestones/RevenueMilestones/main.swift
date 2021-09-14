//
//  main.swift
//  RevenueMilestones
//
//  Created by Behzad Dogahe on 5/10/21.
//

/*
 
 tags:Facebook
 
 Revenue Milestones
 We keep track of the revenue Facebook makes every day, and we want to know on what days Facebook hits certain revenue milestones. Given an array of the revenue on each day, and an array of milestones Facebook wants to reach, return an array containing the days on which Facebook reached every milestone.
 Signature
 int[] getMilestoneDays(int[] revenues, int[] milestones)
 Input
 revenues is a length-N array representing how much revenue FB made on each day (from day 1 to day N). milestones is a length-K array of total revenue milestones.
 Output
 Return a length-K array where K_i is the day on which FB first had milestones[i] total revenue. If the milestone is never met, return -1.
 Example
 revenues = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
 milestones = [100, 200, 500]
 output = [4, 6, 10]
 Explanation
 On days 4, 5, and 6, FB has total revenue of $100, $150, and $210 respectively. Day 6 is the first time that FB has >= $200 of total revenue.
 
 */

func getMilestoneDays(_ revenues: [Int], _ milestones: [Int]) -> [Int] {
    var sum: Int = 0
    var cumulRevenues: [Int] = []
    for i in 0 ..< revenues.count {
        sum += revenues[i]
        cumulRevenues.append(sum)
    }
    var output: [Int] = Array(repeating: -1, count: milestones.count)
    for i in 0 ..< milestones.count {
        let milestone = milestones[i]
        for j in 0 ..< cumulRevenues.count {
            let cumul = cumulRevenues[j]
            if cumul >= milestone {
                output[i] = j + 1
                break
            }
        }
    }
    return output
}

let revenues_1 = [100, 200, 300, 400, 500]
let milestones_1 = [300, 800, 1000, 1400]
let expected_1 = [2, 4, 4, 5]
let output_1 = getMilestoneDays(revenues_1, milestones_1)
print(output_1)

let revenues_2 = [700, 800, 600, 400, 600, 700]
let milestones_2 = [3100, 2200, 800, 2100, 1000]
let expected_2 = [5, 4, 2, 3, 2]
let output_2 = getMilestoneDays(revenues_2, milestones_2)
print(output_2)


/*
 We assume that we know, for i = 1, 2, ... , the price pi in dollars that Serling Enterprises charges for a rod of length i inches. Rod lengths are always an integral number of inches. Figure 15.1 gives a sample price table.
 The rod-cutting problem is the following. Given a rod of length n inches and a table of prices pi for i =  1, 2, ..., n, determine the maximum revenue rn obtainable by cutting up the rod and selling the pieces. Note that if the price pn for a rod of length n is large enough, an optimal solution may require no cutting at all.
 Consider the case when n = 4. Figure 15.2 shows all the ways to cut up a rod of 4 inches in length, including the way with no cuts at all. We see that cutting a 4-inch rod into two 2-inch pieces produces revenue p2 + p2 = 5 + 5 = 10, which is optimal.
 We can cut up a rod of length n in 2^(n-􏰐1) different ways, since we have an independent option of cutting, or not cutting, at distance i inches from the left end,
 length i   1 2 3 4 5  6  7  8  9  10
 price pi   1 5 8 9 10 17 17 20 24 30
 
 r1 = 1 from solution 1 = 1 (nocuts);
 r2 = 5 fromsolution 2 = 2 (nocuts)
 r3 = 8 from solution 3 = 3 (nocuts);
 r4 = 10 from solution 4 = 2 + 2;
 r5 = 13 from solution 5 = 2 + 3;
 r6 = 17 fromsolution 6 = 6 (nocuts);
 r7 18 = from solution 7 = 1 + 6 or 7 = 2 + 2 + 3;
 r8 = 22 from solution 8 = 2 + 6;
 r9 = 25 from solution 9 = 3 + 6;
 r10 = 30 from solution 10 = 10 (no cuts)

 */
import Foundation

func cutRod(p: [Int], n: Int) -> Int {
    if n == 0 {
        return 0
    }
    var q = -1
    for i in 0..<n {
        q = max(q, p[i] + cutRod(p: p, n: n - i - 1))
    }
    return q
}

var p = [1, 5, 8, 9, 10, 17, 17, 20, 24, 30]

cutRod(p: p, n: 8)

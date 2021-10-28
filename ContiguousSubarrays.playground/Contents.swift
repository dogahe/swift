/*
 tags:Facebook
 
 Contiguous Subarrays
 You are given an array arr of N integers. For each index i, you are required to determine the number of contiguous subarrays that fulfill the following conditions:
 The value at index i must be the maximum element in the contiguous subarrays, and
 These contiguous subarrays must either start from or end on index i.
 Signature
 int[] countSubarrays(int[] arr)
 Input
 Array arr is a non-empty list of unique integers that range between 1 to 1,000,000,000
 Size N is between 1 and 1,000,000
 Output
 An array where each index i contains an integer denoting the maximum number of contiguous subarrays of arr[i]
 Example:
 arr = [3, 4, 1, 6, 2]
 output = [1, 3, 1, 5, 1]
 Explanation:
 For index 0 - [3] is the only contiguous subarray that starts (or ends) with 3, and the maximum value in this subarray is 3.
 For index 1 - [4], [3, 4], [4, 1]
 For index 2 - [1]
 For index 3 - [6], [6, 2], [1, 6], [4, 1, 6], [3, 4, 1, 6]
 For index 4 - [2]
 So, the answer for the above input is [1, 3, 1, 5, 1]
 
 Hints:
 
 Complexity 1
 Any solution must have time and space complexities of at least O(N) to deal with the array of N integers. A relatively simple solution considering all possible contiguous subarrays, or in fact any solution counting the valid subarrays one-by-one, would require a time complexity of at least O(N^2). However, a number of observations can allow this to be optimized down to the ideal time complexity of O(N). For example, letting L[i] be the number of valid subarrays ending at index i (useful to compute on the way to the final answer), consider how we might efficiently compute L[i] for each i from 1 to N by reusing past information rather than computing it from scratch.
 Complexity 2
 When analyzing such a solution, note that even if we’re computing N values L[1..N], and computing any single one of those values might take on the order of N steps, the overall time complexity will not necessarily be O(N^2) - we should instead consider how many steps may occur in total across all N of them in the worst case.
 
 Solution approach 1
 Letting L[i] be the number of valid subarrays ending at index i and R[i] be the number of valid subarrays beginning at index i, we’ll have output[i] = L[i] + R[i] - 1. Computing R[1..N] is equivalent to computing L[1..N] if a were reversed, allowing us to reduce the problem to computing L[1..N] for an array of N distinct integers.
 Solution approach 2
 We can next observe that the index of the latest element to the left of the ith element which is larger than it determines which subarrays ending at index i are valid - specifically, the ones beginning to the right of that larger element. Letting G[i] be equal to the largest index j such that j < i and a[j] > a[i] (or equal to 0 if there’s no such j), then L[i] = i - G[i]. We’ve now reduced the problem to computing these values G[1..N] for an array of N distinct integers.
 Solution approach 3
 Computing G[i] for each i from 1 to N is a promising approach, but we’ll still need to consider how to do so as efficiently as possible. We can observe that it’s not possible to compute G[i] purely based on the values of G[i-1], a[i-1], and a[i]; we may need more information about earlier a values as well, but would like to avoid simply scanning over all of them. Out of earlier indices j (such that j < i), we can consider which indices are worth considering as potential candidates for G[i] - for example, if there exists a pair of indices j and k such that j < k and a[j] < a[k], can index j ever be a candidate for G[i] for any i > k? If we can maintain information about the set of these possible candidate indices as we go through the array, it’s possible to efficiently determine the one that’s actually equal to G[i] for each i.
 */

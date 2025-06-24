//
//  countLargestGroup-1399.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/24/25.
/*
 https://leetcode.com/problems/count-largest-group/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 You are given an integer n.

 We need to group the numbers from 1 to n according to the sum of its digits. For example, the numbers 14 and 5 belong to the same group, whereas 13 and 3 belong to different groups.

 Return the number of groups that have the largest size, i.e. the maximum number of elements.

  

 Example 1:

 Input: n = 13
 Output: 4
 Explanation: There are 9 groups in total, they are grouped according sum of its digits of numbers from 1 to 13:
 [1,10], [2,11], [3,12], [4,13], [5], [6], [7], [8], [9].
 There are 4 groups with largest size.
 Example 2:

 Input: n = 2
 Output: 2
 Explanation: There are 2 groups [1], [2] of size 1.
  

 Constraints:

 1 <= n <= 104
 
 */

func countLargestGroup(_ n: Int) -> Int {
    guard n > 0 else { return 0 }
    var counts = [Int: Int]()
    for i in 1...n {
        counts[sumOfDigits(i), default: 0] += 1
    }
    
    let maxSize = counts.values.max() ?? 0
    return counts.values.filter { $0 == maxSize }.count
}

private func sumOfDigits(_ x: Int) -> Int {
    var sum = 0, v = x
    while v > 0 {
        sum += v % 10
        v /= 10
    }
    return sum
}

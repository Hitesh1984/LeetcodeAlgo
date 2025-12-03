//
//  H-Index-274.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 11/11/25.
/*
 
 https://leetcode.com/problems/h-index/description/?envType=problem-list-v2&envId=array
 
 Given an array of integers citations where citations[i] is the number of citations a researcher received for their ith paper, return the researcher's h-index.

 According to the definition of h-index on Wikipedia: The h-index is defined as the maximum value of h such that the given researcher has published at least h papers that have each been cited at least h times.

  

 Example 1:

 Input: citations = [3,0,6,1,5]
 Output: 3
 Explanation: [3,0,6,1,5] means the researcher has 5 papers in total and each of them had received 3, 0, 6, 1, 5 citations respectively.
 Since the researcher has 3 papers with at least 3 citations each and the remaining two with no more than 3 citations each, their h-index is 3.
 Example 2:

 Input: citations = [1,3,1]
 Output: 1
  

 Constraints:

 n == citations.length
 1 <= n <= 5000
 0 <= citations[i] <= 1000

 */

func hIndex(_ arr: [Int]) -> Int {
    var (l,r) = (0, arr.count)
    while l < r {
        let mid = (l+r+1)/2
        if arr.filter({ $0 >= mid}).count < mid {
            r = mid - 1
        }else{
            l = mid
        }
    }
    return l
}

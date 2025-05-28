//
//  medianTwoSortedArray-4.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/1/25.
//
/*
 https://leetcode.com/problems/median-of-two-sorted-arrays/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.
 
 The overall run time complexity should be O(log (m+n)).
 
 
 
 Example 1:
 
 Input: nums1 = [1,3], nums2 = [2]
 Output: 2.00000
 Explanation: merged array = [1,2,3] and median is 2.
 Example 2:
 
 Input: nums1 = [1,2], nums2 = [3,4]
 Output: 2.50000
 Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
 
 
 Constraints:
 
 nums1.length == m
 nums2.length == n
 0 <= m <= 1000
 0 <= n <= 1000
 1 <= m + n <= 2000
 -106 <= nums1[i], nums2[i] <= 106
 */
import Foundation

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var count1 = nums1.count
    let count2 = nums2.count
    var first = 0//count1 - 1
    var second = 0//  count2 - 1
    var totalIteration = (count1 + count2) / 2 // 2
    var iteration = 0
    var last:Int?
    var secondlast:Int?
    while iteration <=  totalIteration {
        
        if first < count1 && second < count2 {
            if nums1[first] < nums2[second] {
                
                if(iteration == totalIteration) {
                    last = nums1[first]
                }
                if(iteration == totalIteration-1) {
                    secondlast = nums1[first]
                }
                first += 1
            } else {
                if(iteration == totalIteration) {
                    last = nums2[second]
                }
                if(iteration == totalIteration-1) {
                    secondlast = nums2[second]
                }
                second += 1
            }
            
        } else if first < count1 {
            if(iteration == totalIteration) {
                last = nums1[first]
            }
            if(iteration == totalIteration-1) {
                secondlast = nums1[first]
            }
            first += 1
            
        } else if second < count2 {
            if(iteration == totalIteration) {
                last = nums2[second]
            }
            if(iteration == totalIteration-1) {
                secondlast = nums2[second]
            }
            second += 1
        }
        iteration += 1
        
    }
    return (count1 + count2) % 2 == 0 ? Double(( Double(last!) + Double(secondlast!) )/2) : Double(last!)
}

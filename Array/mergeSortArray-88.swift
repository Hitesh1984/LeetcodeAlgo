//
//  mergeSortArray-88.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/15/25.
/*
 https://leetcode.com/problems/merge-sorted-array/
 
 */

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
 
    var last1 = m-1
    var last2 = n-1
    var count = nums1.count - 1
    while last1 >= 0, last2 >= 0 {
        if nums1[last1] >= nums2[last2] {
            nums1[count] = nums1[last1]
            count -= 1
            last1 -= 1
        } else {
            nums1[count] = nums2[last2]
            count -= 1
            last2 -= 1
        }
    }
    while last2 >= 0 {
        nums1[count] = nums2[last2]
        count -= 1
        last2 -= 1
    }
}

//
//  mergeTwoSortedList-21.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/6/25.
//
/*
 https://leetcode.com/problems/merge-two-sorted-lists/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 You are given the heads of two sorted linked lists list1 and list2.
 
 Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.
 
 Return the head of the merged linked list.
 
 
 
 Example 1:
 
 
 Input: list1 = [1,2,4], list2 = [1,3,4]
 Output: [1,1,2,3,4,4]
 Example 2:
 
 Input: list1 = [], list2 = []
 Output: []
 Example 3:
 
 Input: list1 = [], list2 = [0]
 Output: [0]
 
 
 Constraints:
 
 The number of nodes in both lists is in the range [0, 50].
 -100 <= Node.val <= 100
 Both list1 and list2 are sorted in non-decreasing order.
 
 */
import Foundation

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil { return l2 }
    else if l2 == nil { return l1 }
    else if l1!.val < l2!.val {
        l1!.next = mergeTwoLists(l1!.next, l2); return l1
    } else { l2!.next = mergeTwoLists(l2!.next, l1); return l2
    }
}

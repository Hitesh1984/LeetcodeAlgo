//
//  AddTwoNumbers.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 4/30/25.
//

/*
 https://leetcode.com/problems/add-two-numbers/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.

  

 Example 1:


 Input: l1 = [2,4,3], l2 = [5,6,4]
 Output: [7,0,8]
 Explanation: 342 + 465 = 807.
 Example 2:

 Input: l1 = [0], l2 = [0]
 Output: [0]
 Example 3:

 Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 Output: [8,9,9,9,0,0,0,1]
  

 Constraints:

 The number of nodes in each linked list is in the range [1, 100].
 0 <= Node.val <= 9
 It is guaranteed that the list represents a number that does not have leading zeros.
 */

import Foundation



 


 
class SolutionLinkList {
    private var dig = 0
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil && dig == 0 { return nil }
        let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + dig
        dig = sum / 10
        return .init(sum % 10, addTwoNumbers(l1?.next, l2?.next))

    }
}

//
//  ReverseLinkList-206.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/29/25.
/*
 https://leetcode.com/problems/reverse-linked-list/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given the head of a singly linked list, reverse the list, and return the reversed list.

  

 Example 1:


 Input: head = [1,2,3,4,5]
 Output: [5,4,3,2,1]
 Example 2:


 Input: head = [1,2]
 Output: [2,1]
 Example 3:

 Input: head = []
 Output: []
  

 Constraints:

 The number of nodes in the list is the range [0, 5000].
 -5000 <= Node.val <= 5000
  
 */

func reverseList(_ head: ListNode?) -> ListNode? {
 
    var prev:ListNode? = nil
    var curr = head
    while let node = curr {
        
        let next = node.next
        node.next = prev
        prev = node
        curr = next
    }
    return prev
}

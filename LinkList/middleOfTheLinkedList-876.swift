//
//  middleOfTheLinkedList-876.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/29/25.
/*
 https://leetcode.com/problems/middle-of-the-linked-list/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given the head of a singly linked list, return the middle node of the linked list.

 If there are two middle nodes, return the second middle node.

  

 Example 1:


 Input: head = [1,2,3,4,5]
 Output: [3,4,5]
 Explanation: The middle node of the list is node 3.
 Example 2:


 Input: head = [1,2,3,4,5,6]
 Output: [4,5,6]
 Explanation: Since the list has two middle nodes with values 3 and 4, we return the second one.
  

 Constraints:

 The number of nodes in the list is in the range [1, 100].
 1 <= Node.val <= 100

 */

func middleNode(_ head: ListNode?) -> ListNode? {
    var slow = head
    var fast = head
    
    while fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }
    return slow
}

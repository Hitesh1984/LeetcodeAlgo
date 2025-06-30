//
//  palindromeLinkList-.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/29/25.
/*
 https://leetcode.com/problems/palindrome-linked-list/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given the head of a singly linked list, return true if it is a palindrome or false otherwise.

  

 Example 1:


 Input: head = [1,2,2,1]
 Output: true
 Example 2:


 Input: head = [1,2]
 Output: false
  

 Constraints:

 The number of nodes in the list is in the range [1, 105].
 0 <= Node.val <= 9
  
 */

func isPalindrome(_ head: ListNode?) -> Bool {
    var cur = head
    var count = 0
    while cur != nil {
        count += 1
        cur = cur?.next
    }
    guard count > 1 else { return true }
    cur = head
    var prev:ListNode? = nil
    var curCount = 0
    while let node = cur, curCount < (count/2) {
        let next = node.next
        node.next = prev
        prev = node
        cur = next
        curCount += 1
    }
    if count % 2 == 1 {
        cur = cur?.next
    }
    while prev != nil && cur != nil {
        if prev?.val != cur?.val {
            return false
        }
        prev = prev?.next
        cur = cur?.next
    }
    return true
}

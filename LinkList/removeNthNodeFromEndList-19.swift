//
//  removeNthNodeFromEndList-19.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/28/25.
/*
 https://leetcode.com/problems/remove-nth-node-from-end-of-list/description/?envType=company&envId=facebook&favoriteSlug=facebook-three-months
 
 Given the head of a linked list, remove the nth node from the end of the list and return its head.

  

 Example 1:


 Input: head = [1,2,3,4,5], n = 2
 Output: [1,2,3,5]
 Example 2:

 Input: head = [1], n = 1
 Output: []
 Example 3:

 Input: head = [1,2], n = 1
 Output: [1]
  

 Constraints:

 The number of nodes in the list is sz.
 1 <= sz <= 30
 0 <= Node.val <= 100
 1 <= n <= sz

 */

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    guard let head = head else { return nil }
    var current = head // [1,2,3,4,5]
    var count = 1
    
    while current.next != nil {
        count += 1 // count = 5
        current = current.next!
    }
    let newCount = count - n // 5 - 2 = 3
    current = head
    if newCount == 0 { return head.next }
    if n > count { return head }
    for _ in 0..<newCount - 1 { //loop 0 -> 1 => 2 times
        if let nextCurrent = current.next { // 1 -> 2 || 2 -> 3
            current = nextCurrent
        }
    }
    current.next = current.next?.next
    return head
}

//
//  linkList.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 5/1/25.
//

import Foundation

public class ListNode {
   public var val: Int
   public var next: ListNode?
   public init() { self.val = 0; self.next = nil; }
   public init(_ val: Int) { self.val = val; self.next = nil; }
   public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

//
//  implementTrie-208.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/1/25.
/*
 https://leetcode.com/problems/implement-trie-prefix-tree/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 A trie (pronounced as "try") or prefix tree is a tree data structure used to efficiently store and retrieve keys in a dataset of strings. There are various applications of this data structure, such as autocomplete and spellchecker.

 Implement the Trie class:

 Trie() Initializes the trie object.
 void insert(String word) Inserts the string word into the trie.
 boolean search(String word) Returns true if the string word is in the trie (i.e., was inserted before), and false otherwise.
 boolean startsWith(String prefix) Returns true if there is a previously inserted string word that has the prefix prefix, and false otherwise.
  

 Example 1:

 Input
 ["Trie", "insert", "search", "search", "startsWith", "insert", "search"]
 [[], ["apple"], ["apple"], ["app"], ["app"], ["app"], ["app"]]
 Output
 [null, null, true, false, true, null, true]

 Explanation
 Trie trie = new Trie();
 trie.insert("apple");
 trie.search("apple");   // return True
 trie.search("app");     // return False
 trie.startsWith("app"); // return True
 trie.insert("app");
 trie.search("app");     // return True
  

 Constraints:

 1 <= word.length, prefix.length <= 2000
 word and prefix consist only of lowercase English letters.
 At most 3 * 104 calls in total will be made to insert, search, and startsWith.

 */


class Trie2 {
    private class Node {
        var isTerminating: Bool = false
        var children: [Character: Node] = [:]
    }

    private let root: Node

    init() {
        self.root = Node()
    }

    func insert(_ word: String) {
        var node = root
        word.map { if node.children[$0] == nil { node.children[$0] = Node() }
                        node = node.children[$0]! }
        node.isTerminating = true
    }

    func search(_ word: String) -> Bool {
        traverse(root, Array(word), 0)
    }

    func startsWith(_ prefix: String) -> Bool {
        traverse(root, Array(prefix), 0, true)
    }

    private func traverse(_ node: Node, _ chars: [Character], _ i: Int, _ isPrefix:Bool = false) -> Bool {
        guard i < chars.count else { return isPrefix || node.isTerminating }
        if let next = node.children[chars[i]] {
            return traverse(next, chars, i + 1, isPrefix)
        }
        return false
    }
}

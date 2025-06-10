//
//  DesignAdd-SearchWordsDataStructure.swift
//  Code challenge
//
//  Created by Dave, Hiteshkumar on 6/1/25.

/*
 https://leetcode.com/problems/design-add-and-search-words-data-structure/description/?envType=company&envId=amazon&favoriteSlug=amazon-three-months
 
 Design a data structure that supports adding new words and finding if a string matches any previously added string.

 Implement the WordDictionary class:

 WordDictionary() Initializes the object.
 void addWord(word) Adds word to the data structure, it can be matched later.
 bool search(word) Returns true if there is any string in the data structure that matches word or false otherwise. word may contain dots '.' where dots can be matched with any letter.
  

 Example:

 Input
 ["WordDictionary","addWord","addWord","addWord","search","search","search","search"]
 [[],["bad"],["dad"],["mad"],["pad"],["bad"],[".ad"],["b.."]]
 Output
 [null,null,null,null,false,true,true,true]

 Explanation
 WordDictionary wordDictionary = new WordDictionary();
 wordDictionary.addWord("bad");
 wordDictionary.addWord("dad");
 wordDictionary.addWord("mad");
 wordDictionary.search("pad"); // return False
 wordDictionary.search("bad"); // return True
 wordDictionary.search(".ad"); // return True
 wordDictionary.search("b.."); // return True
  

 Constraints:

 1 <= word.length <= 25
 word in addWord consists of lowercase English letters.
 word in search consist of '.' or lowercase English letters.
 There will be at most 2 dots in word for search queries.
 At most 104 calls will be made to addWord and search.
 */

class Trie3 {
    var isTerminating = false
    var children = [Character : Trie3]()
}

class WordDictionary {
    let root = Trie3()
    
    func addWord(_ word: String) {
        var node = root
        word.map { if node.children[$0] == nil { node.children[$0] = Trie3() }
                        node = node.children[$0]! }
        node.isTerminating = true
    }
    
    func search(_ word: String) -> Bool {
        return dfs(root, Array(word), 0)
    }
    
    func dfs( _ node: Trie3, _ word: [Character], _ index: Int) -> Bool {
        if index == word.count { return node.isTerminating }
        let char = word[index]
        if char == "." {
            for ch in node.children.keys {
                if node.children[ch] != nil && dfs(node.children[ch]!, word, index + 1) {
                    return true
                }
            }
        } else {
            return node.children[char] != nil && dfs(node.children[char]!, word, index + 1)
        }
        return false
    }
}

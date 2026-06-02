//: [← Previous: 1. Two Sum](@previous)
//:
//: # 49. Group Anagrams
//: [LeetCode](https://leetcode.com/problems/group-anagrams/)
//:
//: Given an array of strings `strs`, group the anagrams together. You can return the answer in any order.
//:
//: An **anagram** is a word or phrase formed by rearranging the letters of a different word or phrase,
//: typically using all the original letters exactly once.
//:
//: **Example 1:**
//: - Input: `strs = ["eat","tea","tan","ate","nat","bat"]`
//: - Output: `[["bat"],["nat","tan"],["ate","eat","tea"]]`
//: - Explanation: There is no string in strs that can be rearranged to form "bat".
//:   The strings "nat" and "tan" are anagrams as they can be rearranged to form each other.
//:   The strings "ate", "eat", and "tea" are anagrams as they can be rearranged to form each other.
//:
//: **Example 2:**
//: - Input: `strs = [""]`
//: - Output: `[[""]]`
//:
//: **Example 3:**
//: - Input: `strs = ["a"]`
//: - Output: `[["a"]]`
//:
//: **Constraints:**
//: - `1 <= strs.length <= 10^4`
//: - `0 <= strs[i].length <= 100`
//: - `strs[i]` consists of lowercase English letters.
//:
//: **Hint:** How can you identify if two strings are anagrams?
//: **Hint:** Think about using a hash map to group strings with the same characters.

import Foundation

// MARK: - Solution

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        // Write your solution here
        return []
    }
}

// MARK: - Test Cases

let solution = Solution()

// Helper function to check if two arrays of arrays contain the same groups (order independent)
func areGroupsEqual(_ result: [[String]], _ expected: [[String]]) -> Bool {
    guard result.count == expected.count else { return false }
    
    let sortedResult = result.map { $0.sorted() }.sorted { $0.joined() < $1.joined() }
    let sortedExpected = expected.map { $0.sorted() }.sorted { $0.joined() < $1.joined() }
    
    return sortedResult == sortedExpected
}

// Test 1
let test1 = solution.groupAnagrams(["eat","tea","tan","ate","nat","bat"])
let expected1 = [["bat"],["nat","tan"],["ate","eat","tea"]]
assert(areGroupsEqual(test1, expected1), "Test 1 Failed")

// Test 2
let test2 = solution.groupAnagrams([""])
let expected2 = [[""]]
assert(areGroupsEqual(test2, expected2), "Test 2 Failed")

// Test 3
let test3 = solution.groupAnagrams(["a"])
let expected3 = [["a"]]
assert(areGroupsEqual(test3, expected3), "Test 3 Failed")

// Test 4
let test4 = solution.groupAnagrams(["cab","tin","pew","duh","may","ill","buy","bar","max","doc"])
let expected4 = [["max"],["buy"],["doc"],["may"],["ill"],["duh"],["tin"],["bar"],["pew"],["cab"]]
assert(areGroupsEqual(test4, expected4), "Test 4 Failed")

print("All test cases passed! ✅")

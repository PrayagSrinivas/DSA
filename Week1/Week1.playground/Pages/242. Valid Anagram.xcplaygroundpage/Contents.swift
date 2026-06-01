//: [← Previous](@previous)
//:
//: # 242. Valid Anagram
//: [LeetCode](https://leetcode.com/problems/valid-anagram/)
//:
//: Given two strings `s` and `t`, return `true` if `t` is an anagram of `s`, and `false` otherwise.
//: An anagram is a word formed by rearranging the letters of another word, using all original letters exactly once.
//:
//: **Example 1:** Input: `s = "anagram"`, `t = "nagaram"` → Output: `true`
//: **Example 2:** Input: `s = "rat"`, `t = "car"` → Output: `false`

import Foundation

// MARK: - Solution

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        // Write your solution here
        return false
    }
}

// MARK: - Test Cases

let solution = Solution()

assert(solution.isAnagram("anagram", "nagaram") == true,  "Test 1 Failed")
assert(solution.isAnagram("rat", "car")          == false, "Test 2 Failed")
assert(solution.isAnagram("a", "a")              == true,  "Test 3 Failed")
assert(solution.isAnagram("ab", "a")             == false, "Test 4 Failed")

print("All test cases passed! ✅")

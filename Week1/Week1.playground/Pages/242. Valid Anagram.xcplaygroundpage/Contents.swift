//: [← Previous: 121. Best Time to Buy and Sell Stock](@previous)
//:
//: # 242. Valid Anagram
//: [LeetCode](https://leetcode.com/problems/valid-anagram/)
//:
//: Given two strings `s` and `t`, return `true` if `t` is an anagram of `s`, and `false` otherwise.
//:
//: An anagram is a word formed by rearranging the letters of another word, using all original letters exactly once.
//:
//: **Example 1:**
//: - Input: `s = "anagram"`, `t = "nagaram"`
//: - Output: `true`
//:
//: **Example 2:**
//: - Input: `s = "rat"`, `t = "car"`
//: - Output: `false`
//:
//: **Constraints:**
//: - `1 <= s.length, t.length <= 5 * 10^4`
//: - `s` and `t` consist of lowercase English letters.

import Foundation

// MARK: - Solution

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        // Intuition: First create a hashMap with first string, then try to compare the hashmap wiht second string value.
        
        // First check if both are having same number of character or not
        guard s.count == t.count else { return false }
        
        var hashMap: [Character : Int] = [:]
        
        for char in s {
            hashMap[char, default: 0] += 1
        }
        
        for char in t {
            guard let value = hashMap[char], value > 0 else { return false }
            hashMap[char] = value - 1
        }
        return true
    }
}

// MARK: - Test Cases

let solution = Solution()

assert(solution.isAnagram("anagram", "nagaram") == true,  "Test 1 Failed")
assert(solution.isAnagram("rat", "car") == false, "Test 2 Failed")
assert(solution.isAnagram("a", "a") == true,  "Test 3 Failed")
assert(solution.isAnagram("ab", "a") == false, "Test 4 Failed")

print("All test cases passed! ✅")

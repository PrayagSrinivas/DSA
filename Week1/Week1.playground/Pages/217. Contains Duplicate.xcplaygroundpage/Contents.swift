//: # 217. Contains Duplicate
//: [LeetCode](https://leetcode.com/problems/contains-duplicate/)
//:
//: Given an integer array `nums`, return `true` if any value appears **at least twice**,
//: and `false` if every element is distinct.
//:
//: **Example 1:** Input: `[1,2,3,1]` → Output: `true`
//: **Example 2:** Input: `[1,2,3,4]` → Output: `false`
//: **Example 3:** Input: `[1,1,1,3,3,4,3,2,4,2]` → Output: `true`

import Foundation

// MARK: - Solution

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        // Write your solution here
        return false
    }
}

// MARK: - Test Cases

let solution = Solution()

assert(solution.containsDuplicate([1, 2, 3, 1]) == true,  "Test 1 Failed")
assert(solution.containsDuplicate([1, 2, 3, 4]) == false, "Test 2 Failed")
assert(solution.containsDuplicate([1,1,1,3,3,4,3,2,4,2]) == true, "Test 3 Failed")

print("All test cases passed! ✅")

//: [Next → 242. Valid Anagram](@next)

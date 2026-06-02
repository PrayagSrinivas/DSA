//: [← Previous: 242. Valid Anagram](@previous)
//:
//: # 1. Two Sum
//: [LeetCode](https://leetcode.com/problems/two-sum/)
//:
//: Given an array of integers `nums` and an integer `target`, return indices of the two numbers such that they add up to `target`.
//:
//: You may assume that each input would have **exactly one solution**, and you may not use the same element twice.
//:
//: You can return the answer in any order.
//:
//: **Example 1:**
//: - Input: `nums = [2,7,11,15]`, `target = 9`
//: - Output: `[0,1]`
//: - Explanation: Because `nums[0] + nums[1] == 9`, we return `[0, 1]`.
//:
//: **Example 2:**
//: - Input: `nums = [3,2,4]`, `target = 6`
//: - Output: `[1,2]`
//:
//: **Example 3:**
//: - Input: `nums = [3,3]`, `target = 6`
//: - Output: `[0,1]`
//:
//: **Constraints:**
//: - `2 <= nums.length <= 10^4`
//: - `-10^9 <= nums[i] <= 10^9`
//: - `-10^9 <= target <= 10^9`
//: - Only one valid answer exists.
//:
//: **Follow-up:** Can you come up with an algorithm that is less than O(n²) time complexity?

import Foundation

// MARK: - Solution

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var loungeEntry: [Int : Int] = [:]
        
        for (index, num) in nums.enumerated() {
            let complement = target - num
            
            if let complementIndex = loungeEntry[complement] {
                return [complementIndex, index]
            }
            
            loungeEntry[num] = index
        }
        
        return []
    }
    
//    // Brute Force Approach - O(n²)
//    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        for i in 0..<nums.count {
//            for j in (i+1)..<nums.count {
//                if nums[i] + nums[j] == target {
//                    return [i, j]
//                }
//            }
//        }
//        return []
//    }
}

// MARK: - Test Cases

let solution = Solution()

assert(solution.twoSum([2,7,11,15], 9) == [0,1], "Test 1 Failed")
assert(solution.twoSum([3,2,4], 6) == [1,2], "Test 2 Failed")
assert(solution.twoSum([3,3], 6) == [0,1], "Test 3 Failed")
assert(solution.twoSum([2,5,5,11], 10) == [1,2], "Test 4 Failed")
assert(solution.twoSum([-1,-2,-3,-4,-5], -8) == [2,4], "Test 5 Failed")

print("All test cases passed! ✅")

//: [Next → 49. Group Anagrams](@next)

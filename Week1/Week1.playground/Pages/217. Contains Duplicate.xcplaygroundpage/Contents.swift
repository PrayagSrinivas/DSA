//: # Week 1 - Array & Hashing
//:
//: # 217. Contains Duplicate
//: [LeetCode](https://leetcode.com/problems/contains-duplicate/)
//:
//: Given an integer array `nums`, return `true` if any value appears **at least twice**,
//: and `false` if every element is distinct.
//:
//: **Example 1:**
//: - Input: `[1,2,3,1]`
//: - Output: `true`
//:
//: **Example 2:**
//: - Input: `[1,2,3,4]`
//: - Output: `false`
//:
//: **Example 3:**
//: - Input: `[1,1,1,3,3,4,3,2,4,2]`
//: - Output: `true`
//:
//: **Constraints:**
//: - `1 <= nums.length <= 10^5`
//: - `-10^9 <= nums[i] <= 10^9`

import Foundation

// MARK: - Solution

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var hashmap = [Int : Int]()
        for i in nums {
            hashmap[i, default: 0] += 1
        }
        
        for (key, value) in hashmap {
            if value > 1 {
                return true
            }
        }
        return false
    }

//    func containsDuplicate(_ nums: [Int]) -> Bool {
//        return Set(nums).count != nums.count
//    }
}

// MARK: - Test Cases

let solution = Solution()

var passed = 0
var failed = [String]()

func check(_ result: Bool, _ expected: Bool, _ label: String) {
    if result == expected { passed += 1 }
    else { failed.append(label) }
}

check(solution.containsDuplicate([1, 2, 3, 1]),                true,  "TC01 - Basic duplicate")
check(solution.containsDuplicate([1, 2, 3, 4]),                false, "TC02 - All unique")
check(solution.containsDuplicate([1,1,1,3,3,4,3,2,4,2]),       true,  "TC03 - Multiple duplicates")
check(solution.containsDuplicate([]),                           false, "TC04 - Empty array")
check(solution.containsDuplicate([1]),                          false, "TC05 - Single element")
check(solution.containsDuplicate([1, 1]),                       true,  "TC06 - Two same elements")
check(solution.containsDuplicate([-1, -1]),                     true,  "TC07 - Negative duplicates")
check(solution.containsDuplicate([Int.min, Int.max]),           false, "TC08 - Extreme values no dup")
check(solution.containsDuplicate([Int.min, Int.min]),           true,  "TC09 - Extreme value duplicate")
check(solution.containsDuplicate(Array(1...1000)),              false, "TC10 - Large all-unique array")

if failed.isEmpty {
    print("All \(passed) test cases passed! ✅")
} else {
    print("⚠️ \(failed.count) test(s) failed: \(failed.joined(separator: ", "))")
}

//: [Next → 121. Best Time to Buy and Sell Stock](@next)

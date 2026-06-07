/*:
 [Previous](@previous) | [Next](@next)
 
 # 347. Top K Frequent Elements
 
 [LeetCode Link](https://leetcode.com/problems/top-k-frequent-elements/)
 
 ## Problem Description
 
 Given an integer array `nums` and an integer `k`, return *the* `k` *most frequent elements*. You may return the answer in **any order**.
 
 ### Example 1:
 ```
 Input: nums = [1,1,1,2,2,3], k = 2
 Output: [1,2]
 ```
 **Explanation:** 1 appears 3 times, 2 appears 2 times, and 3 appears 1 time. The 2 most frequent elements are 1 and 2.
 
 ### Example 2:
 ```
 Input: nums = [1], k = 1
 Output: [1]
 ```
 **Explanation:** There is only one element, so it's the most frequent.
 
 ### Example 3:
 ```
 Input: nums = [4,1,-1,2,-1,2,3], k = 2
 Output: [-1,2]
 ```
 **Explanation:** -1 and 2 both appear twice, making them the 2 most frequent elements.
 
 ## Constraints
 
 - `1 <= nums.length <= 10^5`
 - `-10^4 <= nums[i] <= 10^4`
 - `k` is in the range `[1, the number of unique elements in the array]`
 - It is **guaranteed** that the answer is **unique**
 
 ## Follow-up
 
 Your algorithm's time complexity must be better than `O(n log n)`, where `n` is the array's size.
 
 ---
 
 ## Hints
 
 1. **Hint 1:** Use a hash map to count the frequency of each element.
 2. **Hint 2:** Consider using a heap (priority queue) or bucket sort to find the k most frequent elements efficiently.
 3. **Hint 3:** For O(n) time complexity, think about using bucket sort where the bucket index represents the frequency.
 
 ---
 
 ## Solution
 
 */

//func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
//    // TODO: Implement your solution here
//    return []
//}

/*:
 ---
 
 ## Test Cases
 
 */

// Helper function to check if result contains the correct k most frequent elements
func isValidTopK(_ nums: [Int], _ k: Int, _ result: [Int]) -> Bool {
    guard result.count == k else { return false }
    
    // Count frequencies
    var freqMap: [Int: Int] = [:]
    for num in nums {
        freqMap[num, default: 0] += 1
    }
    
    // Get frequencies of result elements
    let resultFreqs = result.map { freqMap[$0] ?? 0 }
    
    // Get all frequencies sorted in descending order
    let allFreqs = Array(freqMap.values).sorted(by: >)
    let topKFreqs = Array(allFreqs.prefix(k))
    
    // Check if result frequencies match top k frequencies
    return Set(resultFreqs.sorted(by: >)) == Set(topKFreqs)
}


func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    
    // 1. SAFETY CHECK
    // Guard against an empty array immediately to prevent unnecessary allocation.
    guard !nums.isEmpty else { return [] }
    
    // 2. FREQUENCY MAPPING
    // Dictionary to track the count of each number.
    // Key: The actual number. Value: How many times it appears.
    var hash: [Int : Int] = [:]
    
    for num in nums {
        // Using Swift's default subscript safely increments without optional unwrapping
        hash[num, default: 0] += 1
    }
    
    // 3. PODIUM (BUCKET) INITIALIZATION
    // Create an array of arrays where the INDEX represents the FREQUENCY.
    // Size is `nums.count + 1` because the absolute maximum frequency a number
    // could have is the size of the entire input array itself.
    var bucket = Array(repeating: [Int](), count: nums.count + 1)
    
    // 4. POPULATE THE PODIUM
    // Route each number into the bucket index that matches its exact frequency.
    for (number, frequency) in hash {
        bucket[frequency].append(number)
    }
    
    // 5. EXTRACT THE WINNERS (TOP-DOWN)
    var topK = [Int]()
    
    // Walk backward from the highest possible frequency (the end of the array)
    // down to 0. This guarantees we encounter the most frequent elements first.
    for i in stride(from: bucket.count - 1, through: 0, by: -1) {
        
        // Append all numbers sitting at this frequency level
        topK.append(contentsOf: bucket[i])
        
        // The moment our result array reaches the requested 'k' size,
        // we have our final answer. Exit the loop instantly to save CPU cycles.
        if topK.count == k {
            return topK
        }
    }
    
    // Fallback return (should rarely hit unless k is larger than unique elements)
    return topK
}

// Test 1: Basic example with clear frequency differences
let test1 = topKFrequent([1,1,1,2,2,3], 2)
let result1 = isValidTopK([1,1,1,2,2,3], 2, test1)
print("Test 1: \(test1)")
print("Expected: [1,2] (in any order)")
print("Valid: \(result1)\n")

// Test 2: Single element
let test2 = topKFrequent([1], 1)
let result2 = isValidTopK([1], 1, test2)
print("Test 2: \(test2)")
print("Expected: [1]")
print("Valid: \(result2)\n")

// Test 3: With negative numbers
let test3 = topKFrequent([4,1,-1,2,-1,2,3], 2)
let result3 = isValidTopK([4,1,-1,2,-1,2,3], 2, test3)
print("Test 3: \(test3)")
print("Expected: [-1,2] (in any order)")
print("Valid: \(result3)\n")

// Test 4: All elements have same frequency
let test4 = topKFrequent([1,2,3,4,5], 3)
let result4 = isValidTopK([1,2,3,4,5], 3, test4)
print("Test 4: \(test4)")
print("Expected: Any 3 elements from [1,2,3,4,5]")
print("Valid: \(result4)\n")

// Test 5: K equals number of unique elements
let test5 = topKFrequent([1,1,2,2,3,3], 3)
let result5 = isValidTopK([1,1,2,2,3,3], 3, test5)
print("Test 5: \(test5)")
print("Expected: [1,2,3] (in any order)")
print("Valid: \(result5)\n")

// Test 6: Large frequency difference
let test6 = topKFrequent([1,1,1,1,1,2,3,4,5], 1)
let result6 = isValidTopK([1,1,1,1,1,2,3,4,5], 1, test6)
print("Test 6: \(test6)")
print("Expected: [1]")
print("Valid: \(result6)\n")

// Final check
if result1 && result2 && result3 && result4 && result5 && result6 {
    print("All test cases passed! ✅")
} else {
    print("Some test cases failed! ❌")
}

/*:
 
 [Previous](@previous) | [Next](@next)
 
 */

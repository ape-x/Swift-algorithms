import Cocoa

var array = [Int]()

for i in 0...1000{
    array.append(i)
}

func binarySearch(search_in_this_array array : [Int], for_number number : Int){
    
    var left = 0, right = array.count-1, mid = (left+right)/2
    
    while left<=right{
        mid=(left+right)/2
        if number == array[mid]{
            print("Found \(number) at position \(mid)")
            break
        }
        if number>array[mid]{
            left = mid+1
        }
        if number<array[mid]{
            right=mid-1
        }
    }
}

binarySearch(search_in_this_array: array, for_number: 388)


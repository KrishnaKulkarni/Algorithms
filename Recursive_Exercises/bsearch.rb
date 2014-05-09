# Binary Search
def bsearch(arr, target)
  return nil if arr.length == 0

  mid_idx = arr.length / 2
  
  case (arr[mid_idx] <=> target)
    when 1
       sub_arr = arr[0...mid_idx]
       bsearch(sub_arr, target)

    when 0
      return mid_idx

    when -1
      sub_arr = arr[mid_idx + 1 ... arr.length]
      sub_arr_result = bsearch(sub_arr, target)
      return nil if sub_arr_result.nil?
      (mid_idx + 1) + sub_arr_result
  end
end

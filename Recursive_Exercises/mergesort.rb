# Mergesort
def merge_sort(array)

  return array if array.length == 1

  mid = array.length / 2
  arr1, arr2 = array[0...mid], array[mid...array.length]

  merge(merge_sort(arr1), merge_sort(arr2))
end

def merge(arr1, arr2)
  merged_array = []

  until arr1.empty? || arr2.empty?
    merged_array << (arr1.first <= arr2.first ? arr1.shift : arr2.shift)
  end

  merged_array + arr1 + arr2
end
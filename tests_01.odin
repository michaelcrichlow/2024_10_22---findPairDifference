package test

import "core:fmt"
import "core:mem"
import "core:slice"
import "core:strconv"
import "core:strings"
print :: fmt.println

main :: proc() {

	my_list := [?]int{1, 7, 5, 9, 2, 12, 3}
	print(findPairDifference(my_list[:], 2, context.temp_allocator))
	print(findPairDifference(my_list[:], 7, context.temp_allocator))
	print(findPairDifference(my_list[:], 9, context.temp_allocator))
	print(findPairDifference(my_list[:], 30, context.temp_allocator))

	my_list_0 := [?]int{3, 3}
	print(findPairDifference(my_list_0[:], 2, context.temp_allocator))

	free_all(context.temp_allocator)
}

findPairDifference :: proc(l: []int, n: int, allocator := context.allocator) -> []int {
	local_set := make(map[int]struct {}, allocator = allocator)
	local_array := make([dynamic]int, allocator = allocator)

	for val in l {
		if n >= val {
			if val + n not_in local_set {
				local_set[val] = {}
			} else {
				append(&local_array, val)
				append(&local_array, val + n)
				break
			}
		} else if n < val {
			if val - n not_in local_set {
				local_set[val] = {}
			} else {
				append(&local_array, val)
				append(&local_array, val - n)
				break
			}
		}
	}
	sort(local_array[:])

	return local_array[:]
}

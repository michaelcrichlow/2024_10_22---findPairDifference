def findPairDifference(l: list[int], n: int) -> list[int]:
    local_set = set()
    local_array = []

    for val in l:
        if n >= val:
            if val + n not in local_set:
                local_set.add(val)
            else:
                local_array.append(val)
                local_array.append(val + n)
                break

        elif n < val:
            if val - n not in local_set:
                local_set.add(val)
            else:
                local_array.append(val)
                local_array.append(val - n)
                break

    local_array.sort()

    return local_array


def main() -> None:
    print(findPairDifference([1, 7, 5, 9, 2, 12, 3], 2))
    print(findPairDifference([1, 7, 5, 9, 2, 12, 3], 7))
    print(findPairDifference([1, 7, 5, 9, 2, 12, 3], 9))
    print(findPairDifference([1, 7, 5, 9, 2, 12, 3], 30))
    print(findPairDifference([3, 3], 2))


if __name__ == '__main__':
    main()

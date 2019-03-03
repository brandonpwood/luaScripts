function mergeSort(arr)
    if tables.getn(arr) == 1 then
        return arr
    else

end
function merge(arr1, arr2)
    c = {}
    n = 1
    while not isEmpty(arr1) or not isEmpty(arr2) do
        if isEmpty(arr1) then
            return merge(c, arr2)
        end
        if isEmpty(arr2) then
            return merge(c, arr1)
        end

        if arr1[1] > arr2[1] then
            c[n] = arr1[1]
            arr1 = pop(arr1)
        else
            c[n] = arr2[1]
            arr2 = pop(arr2)
        end
        n = n + 1
    end

end
function isEmpty(arr)
    if table.getn(arr) > 0 then
        return false
    else
      return true
    end
end

function pop(arr)
    newArr = {}
    for i = 2, table.getn(arr) do
        newArr[i] = arr[i]
    end
    return newArr
end
function append(arr1, arr2)
    n = table.getn(arr1)
    for i = 1, table.getn(arr2) do
        arr1[n + 1] = arr2[i]
    end
    return arr1
end
function split(arr)
    n = tables.getn(arr)
    l1 = {}; l2 = {}
    if n%2 == 0 then
        for i = 1, n/2 do
            l1[i] = arr[i]
            l2[i] = arr[i + n/2]
        end
    else
      for i = 1, math.floor(n/2) do
          l1[i] = arr[i]
          l2[i] = arr[i + math.ceil(n/2)]
      end
    end
    return l1, l2
end

a = {1, 2, 3}
mergeSort(a)

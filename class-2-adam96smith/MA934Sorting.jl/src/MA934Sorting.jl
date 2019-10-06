module MA934Sorting

export InsertionSort
export mergepresorted
export mergesort

function InsertionSort(a)
    for i = 1:length(a)-1
        while a[i] > a[i+1]
            a[i],a[i+1] = a[i+1],a[i]
            return InsertionSort(a)
        end
    end
    return a
end

function mergepresorted(A::Array{Int64,1}, B::Array{Int64,1})
    if length(A) == 0
        return B
    elseif length(B) == 0
        return A
    elseif A[1] < B[1]
        return vcat([A[1]], mergepresorted(A[2:end], B))
    else
        return vcat([B[1]], mergepresorted(A, B[2:end]))
    end    
end

function mergesort(a)
    n = length(a)
    if n == 1
        return a
    else
        m = Int(n/2)
        return mergepresorted(mergesort(a[1:m]),mergesort(a[m+1:n]))
    end
end
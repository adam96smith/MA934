module MA934Sorting

export Iter_Sort
export mergepresorted
export mergesort

function Iter_Sort(a)
    for i = 2:length(a)
        tmp = a[i]
        j = i-1
            while j != 0
                if a[j] > tmp
                    a[j+1],a[j] = a[j],tmp
                    j = j - 1
                else
                    j = 0
                end
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




end
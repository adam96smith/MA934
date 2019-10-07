module MA934Sorting

using BenchmarkTools
using Statistics
using Plots
using JLD

export Iter_Sort
export mergepresorted
export mergesort
export Iter_mergesort
export Iter_mergepresorted

function Iter_Sort(b)
    a = copy(b)
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

function mergesort(b)
    a = copy(b)
    n = length(a)
    if n == 1
        return a
    else
        m = Int(n/2)
        return mergepresorted(mergesort(a[1:m]),mergesort(a[m+1:n]))
    end
end

function Iter_mergepresorted(A::Array{Int64,1}, B::Array{Int64,1})
    if length(A) == 0
        return B
    elseif length(B) == 0
        return A
    else
        i = 1
        j = 1
        m = length(A)+length(B)
        c = rand(0:0,m)
        for l = 1:m
            if i > length(A)
                c[l] = B[j]
                j = j+1
            elseif j > length(B)
                c[l] = A[i]
                i = i+1
            elseif A[i] < B[j]
                c[l] = A[i]
                i = i+1
            else
                c[l] = B[j]
                j = j+1
            end
        end
    end
    return c
end

function Iter_mergesort(b)
    a = copy(b)
    n = length(a)
    if n == 1
        return a
    else
        m = Int(n/2)
        return Iter_mergepresorted(Iter_mergesort(a[1:m]),Iter_mergesort(a[m+1:n]))
    end
end


end
module Starter2

#using BenchMark

export FibIt
export FibRec

function FibIt(n,a,b)
    if n == 1
        return a
    elseif n == 1
        return b
    else
        x = Array{Int64}(undef,n)
        x[1] = a
        x[2] = b
        for i = 3:n
            x[i] = x[i-1] + x[i-2]
        end
        return x[n]
    end
end

function FibRec(n,a,b)
    if n == 1
        return a
    elseif n == 2
        return b
    else
        return FibRec(n-1,a,b)+FibRec(n-2,a,b)
    end
end

function FibMem()
    
    
end

end
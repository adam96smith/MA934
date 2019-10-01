module Starter1 #Create new module
# List of dependencies
using Plots

# List of functions to be exported (provide for use)
export example_plot
export log_plot

# Definitions of any new types provided

# Function definitions
"""
    example_plot(n)

This function evaluates Sin(x) at n points in the interval [0, 2π], creates a
    plot and then returns the plot.
"""
function example_plot(n)
    title = "This is an example plot."
    x1 = collect(range(0.0, 2*π, length=n)) #changes the range to a list of values
    y1 = sin.(x1)

    # Plot the points
    p = plot(x1, y1, seriestype=:scatter,label="Some sample points",
    title=title, xlabel="x", ylabel="sin(x)", markersize=10, markercolor="red")

    # Now plot the true function
    x2 = collect(range(0.0, 2*π, length=1000))
    y2 = sin.(x2)
    plot!(x2, y2, label="Underlying function.", color="green", linewidth=2) 
    #plot! modifies/replaces the plot from before instead of creating a new one
    return p #return plot then display
end

function log_plot(n,alpha)
    title = "This is an example plot."
    x1 = collect(range(0.0, 2^n, length=n)) #changes the range to a list of values
    y1 = x1.^alpha.*log.(x1)

    # Plot the points
    p = plot(x1, y1, seriestype=:scatter,label="Some sample points",
    title=title, xlabel="x", ylabel="sin(x)", markersize=10, markercolor="red")

    # Now plot the true function
    x2 = collect(range(0.0, 2^n, length=1000))
    y2 = x2.^alpha.*log.(x2)
    plot!(x2, y2, label="Underlying function.", color="green", linewidth=2) 
    #plot! modifies/replaces the plot from before instead of creating a new one
    return p #return plot then display
end
# End the module definition
end

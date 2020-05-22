include("PhasePortraitV2_F1.jl")

# Function for a dual repression system without cooperativity
# D1: range of D1 values (i.e. A values)
# D2: range of D2 values (i.e. R values)
# We use `@.` to apply the calculations across all rows.
# Note that model parameters are specified within the function
# Returns computed (dD1/dt, dD2/dt) over the range of (D1, D2)
function toggleMono(D1, D2)
    u = @. (-D1+1/(1+10*(D2^2/(.1+D2^2))^2))
    v = @. (-D2+1/(1+10*(D1^2/(.1+D1^2))^2))  

    return (u,v)
end

#Range of x1, x2 values
D1range = (0,1,15)          #Has the form (min, max, num points)
D2range = (0,1,15)          #Has the form (min, max, num points)
D₀ = ()                     #initial state vectors; a common must be included after the first array
tspan=(0.0,30.0)            #time span

#Call the phaseplot functon to construct the phase portrait
phaseplot(toggleMono, D1range, D2range, xinit=D₀, t=tspan, clines=true,
        norm=true, scale=0.5)

---
layout:     post
title:      Julia vectors
date:       2022-01-11
summary:    Julia vectors?
categories: Julia
---
For numerics experts, one of Julia’s killer features is its powerful N-dimensional array support. This extends not just to high-level “vectorised” operations like broadcasting arithmetic, but also to the inner loops in the lowest-level kernels. For example, take a CPU kernel that adds two 2D arrays:
function add!(out, a, b)
  for i = 1:size(a, 1)
    for j = 1:size(a, 2)
      out[i,j] = a[i,j] + b[i,j]
    end
  end
end
 
This kernel is fast, but hard to generalise across different numbers of dimensions. The change needed to support 3D arrays, for example, is small and mechanical (add an extra inner loop), but we can’t write it using normal functions.
Julia’s code generation enables an elegant, if slightly arcane, solution:
using Base.Cartesian

@generated function add!(out, a, b)
  N = ndims(out)
  quote
    @nloops $N i out begin
      @nref($N, out, i) = @nref($N, a, i) + @nref($N, b, i)
    end
  end
end
 
The @generated annotation allows us to hook into Julia’s code specialisation; when the function receives matrices as input, our custom code generation will create and run a twice-nested loop. This will behave the same as our add! function above, but for arrays of any dimension. If you remove @generated you can see the internals.
julia> using MacroTools
julia> add!(zs, xs, ys) |> macroexpand |> MacroTools.prettify
quote
    for i_2 = indices(out, 2)
        nothing
        for i_1 = indices(out, 1)
            nothing
            out[i_1, i_2] = a[i_1, i_2] + b[i_1, i_2]
            nothing
        end
        nothing
    end
end
 
If you try it with, say, a seven dimensional input, you’ll be glad you didn’t have to write the code yourself.


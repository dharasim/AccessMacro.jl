using AccessMacro
using Base.Test

@access struct A
    x :: Int
end

@access mutable struct B{T}
    x
    y :: T
end

@access type C{S, T}
    x :: S
    y :: T
end

@access immutable D
    x
end

@test x(A(3)) == 3

@test x(B(1, "2")) == 1 && y(B(1, "2")) == "2"

@test x(C(1.0, [2])) == 1.0 && y(B(1.0, [2])) == [2]

@test x(D(43)) == 43

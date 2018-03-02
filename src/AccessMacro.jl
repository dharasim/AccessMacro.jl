module AccessMacro

using MacroTools
export @access

get_fieldname(expr::Expr)   = expr.args[1]
get_fieldname(symb::Symbol) = symb

function field_to_function_expr(f, T)
    s = gensym()
    :(function $f($s :: $T)
        $s.$f
    end)
    #:( ($f)($s :: $T) = $s.$f )
end

macro access(expr)
    return_expr = Expr(:block)
    @capture(expr, struct (T_{P__}|T_) fields__ end | type (T_{P__}|T_) fields__ end | mutable struct (T_{P__}|T_) fields__ end | immutable (T_{P__}|T_) fields__ end)
    push!(return_expr.args, expr)
    push!(return_expr.args, field_to_function_expr.(get_fieldname.(fields), T)...)
    push!(return_expr.args, T)
    esc(return_expr)
end

end # module

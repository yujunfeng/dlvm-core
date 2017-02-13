//
//  Lexicon.swift
//  DLVM
//
//  Created by Richard Wei on 1/18/17.
//
//

import Foundation

public protocol LexicallyConvertible {
    static var lexicon: [String : Self] { get }
}

extension IntegrationFunction : LexicallyConvertible {
    public static var lexicon: [String : IntegrationFunction] = [
        "softmax"    : .softmax,
        "logSoftmax" : .logSoftmax,
        "argmax"     : .argmax,
        "argmin"     : .argmin
    ]
}

extension ComparisonPredicate : LexicallyConvertible {
    public static let lexicon: [String : ComparisonPredicate] = [
        "lt"  : .lessThan,
        "leq" : .lessThanOrEqualTo,
        "gt"  : .greaterThan,
        "geq" : .greaterThanOrEqualTo,
        "eq"  : .equalTo,
        "neq" : .notEqualTo
    ]
}

extension ArithmeticOperator : LexicallyConvertible {
    public static let lexicon: [String : ArithmeticOperator] = [
        "add"      : .add,
        "sub"      : .subtract,
        "mul"      : .multiply,
        "div"      : .divide,
        "min"      : .min,
        "max"      : .max,
        "truncDiv" : .truncateDivide,
        "floorDiv" : .floorDivide,
        "mod"      : .modulo,
        "pow"      : .power,
        "mean"     : .mean
    ]
}

extension ElementwiseFunction : LexicallyConvertible {
    public static let lexicon: [String : ElementwiseFunction] = [
        "sigmoid" : .sigmoid,
        "tanh"    : .tanh,
        "log"     : .log,
        "exp"     : .exp,
        "neg"     : .neg,
        "sign"    : .sign,
        "square"  : .square,
        "sqrt"    : .sqrt,
        "round"   : .round,
        "rsqrt"   : .rsqrt,
        "ceil"    : .ceil,
        "floor"   : .floor,
        "tan"     : .tan,
        "cos"     : .cos,
        "sin"     : .sin,
        "acos"    : .acos,
        "asin"    : .asin,
        "atan"    : .atan,
        "lgamma"  : .lgamma,
        "digamma" : .digamma,
        "erf"     : .erf,
        "erfc"    : .erfc,
        "rint"    : .rint
    ]
}

extension BooleanFunction : LexicallyConvertible {
    public static var lexicon: [String : BooleanFunction] = [
        "and" : .and,
        "or"  : .or,
        "xor" : .xor
    ]
}

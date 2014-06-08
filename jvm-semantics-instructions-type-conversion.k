require "jvm-semantics-common.k"

module JVM-SEMANTICS-INSTRUCTIONS-TYPE-CONVERSION
    imports JVM-SEMANTICS-COMMON

    /*@ \subsection{Arithmetic Intructions}
    From the JVM Specification:
    \begin{quote}
    The type conversion instructions allow conversion between Java Virtual Machine numeric types. 
    These may be used to implement explicit conversions in user code or to mitigate the lack of orthogonality 
    in the instruction set of the Java Virtual Machine.

    The Java Virtual Machine directly supports the following widening numeric conversions:

    int to long, float, or double

    long to float or double

    float to double

    The widening numeric conversion instructions are i2l, i2f, i2d, l2f, l2d, and f2d. 
    The mnemonics for these opcodes are straightforward given the naming conventions for typed instructions 
    and the punning use of 2 to mean "to." For instance, the i2d instruction converts an int value to a double. 
    Widening numeric conversions do not lose information about the overall magnitude of a numeric value. 
    Indeed, conversions widening from int to long and int to double do not lose any information at all; 
    the numeric value is preserved exactly. Conversions widening from float to double that are FP-strict (§2.8.2) 
    also preserve the numeric value exactly; however, such conversions that are not FP-strict may lose 
    information about the overall magnitude of the converted value.

    Conversion of an int or a long value to float, or of a long value to double, may lose precision, that is, 
    may lose some of the least significant bits of the value; the resulting floating-point value is a 
    correctly rounded version of the integer value, using IEEE 754 round to nearest mode.

    A widening numeric conversion of an int to a long simply sign-extends the two's-complement representation 
    of the int value to fill the wider format. A widening numeric conversion of a char to an 
    integral type zero-extends the representation of the char value to fill the wider format.

    Despite the fact that loss of precision may occur, widening numeric conversions never cause the 
    Java Virtual Machine to throw a run-time exception (not to be confused with an IEEE 754 floating-point exception).

    Note that widening numeric conversions do not exist from integral types byte, char, and short to type int. 
    As noted in §2.11.1, values of type byte, char, and short are internally widened to type int, 
    making these conversions implicit.

    The Java Virtual Machine also directly supports the following narrowing numeric conversions:

    int to byte, short, or char

    long to int

    float to int or long

    double to int, long, or float

    The narrowing numeric conversion instructions are i2b, i2c, i2s, l2i, f2i, f2l, d2i, d2l, and d2f. 
    A narrowing numeric conversion can result in a value of different sign, a different order of magnitude, 
    or both; it may thereby lose precision.

    A narrowing numeric conversion of an int or long to an integral type T simply discards all but the N lowest-order bits, 
    where N is the number of bits used to represent type T. 
    This may cause the resulting value not to have the same sign as the input value.

    In a narrowing numeric conversion of a floating-point value to an integral type T, where T is either int or long, 
    the floating-point value is converted as follows:

    If the floating-point value is NaN, the result of the conversion is an int or long 0.

    Otherwise, if the floating-point value is not an infinity, the floating-point value is rounded to an integer value V 
    using IEEE 754 round towards zero mode. There are two cases:

    If T is long and this integer value can be represented as a long, then the result is the long value V.

    If T is of type int and this integer value can be represented as an int, then the result is the int value V.

    Otherwise:

    Either the value must be too small (a negative value of large magnitude or negative infinity), 
    and the result is the smallest representable value of type int or long.

    Or the value must be too large (a positive value of large magnitude or positive infinity), 
    and the result is the largest representable value of type int or long.

    A narrowing numeric conversion from double to float behaves in accordance with IEEE 754. 
    The result is correctly rounded using IEEE 754 round to nearest mode. 
    A value too small to be represented as a float is converted to a positive or negative zero of type float; 
    a value too large to be represented as a float is converted to a positive or negative infinity. 
    A double NaN is always converted to a float NaN.

    Despite the fact that overflow, underflow, or loss of precision may occur, narrowing conversions among numeric types 
    never cause the Java Virtual Machine to throw a run-time exception (not to be confused with an IEEE 754 floating-point exception).
    \end{quote}
    */


    //-------i2l-------

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => ListItem(L1) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> i2l ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>


    //-------i2f-------

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => ListItem(Int2Float(L1)) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> i2f ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>


    //-------i2d-------

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => ListItem(Int2Float(L1)) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> i2d ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>


    //-------l2f-------

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => ListItem(Int2Float(L1)) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> l2f ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>


    //-------l2d-------

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => ListItem(Int2Float(L1)) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> l2d ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>


    //-------f2d-------

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) => ListItem(L1) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> f2d ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>


    //-------i2b-------

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => ListItem(L1 -Int (256 *Int (L1 /Int 256))) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> i2b ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         when L1 >Int 127

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => ListItem(L1 +Int (256 *Int (L1 /Int 256))) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> i2b ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         when L1 <Int -127    

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> i2b ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         when L1 >=Int -127 andBool L1 <=Int 127


    //-------i2c-------

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => ListItem(L1 -Int (65536 *Int (L1 /Int 65536))) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> i2c ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         when L1 >Int 65535

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => ListItem(L1 +Int (65536 *Int (L1 /Int 65536))) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> i2c ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         when L1 <Int 0    

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> i2c ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         when L1 >=Int 0 andBool L1 <=Int 65535


    //-------i2s-------

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => ListItem(L1 -Int (32767 *Int (L1 /Int 32767))) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> i2s ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         when L1 >Int 32767

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => ListItem(L1 +Int (32767 *Int (L1 /Int 32767))) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> i2s ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         when L1 <Int -32767    

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> i2s ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         when L1 >=Int -32767 andBool L1 <=Int 32767


    //-------l2i-------

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => ListItem(L1 -Int (2147483647 *Int (L1 /Int 2147483647))) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> l2i ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         when L1 >Int 2147483647

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => ListItem(L1 +Int (2147483647 *Int (L1 /Int 2147483647))) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> l2i ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         when L1 <Int -2147483647  

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> l2i ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         when L1 >=Int -2147483647 andBool L1 <=Int 2147483647


    //-------f2i-------

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) => 
                ListItem(Float2Int(L1) -Int (2147483647 *Int (Float2Int(L1) /Int 2147483647))) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> f2i ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         when Float2Int(L1) >Int 2147483647

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) => 
                ListItem(Float2Int(L1) +Int (2147483647 *Int (Float2Int(L1) /Int 2147483647))) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> f2i ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         when Float2Int(L1) <Int -2147483647  

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) => ListItem(Float2Int(L1)) ... </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> f2i ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         when Float2Int(L1) >=Int -2147483647 andBool Float2Int(L1) <=Int 2147483647


    //-------f2l-------

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) => 
                ListItem(Float2Int(L1) -Int (9223372036854775807 *Int (Float2Int(L1) /Int 9223372036854775807))) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> f2l ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         when Float2Int(L1) >Int 9223372036854775807

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) => 
                ListItem(Float2Int(L1) +Int (9223372036854775807 *Int (Float2Int(L1) /Int 9223372036854775807))) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> f2l ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         when Float2Int(L1) <Int -9223372036854775807  

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) => ListItem(Float2Int(L1)) ... </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> f2l ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         when Float2Int(L1) >=Int -9223372036854775807 andBool Float2Int(L1) <=Int 9223372036854775807


    //-------d2i-------

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) => 
                ListItem(Float2Int(L1) -Int (2147483647 *Int (Float2Int(L1) /Int 2147483647))) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> d2i ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         when Float2Int(L1) >Int 2147483647

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) => 
                ListItem(Float2Int(L1) +Int (2147483647 *Int (Float2Int(L1) /Int 2147483647))) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> d2i ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         when Float2Int(L1) <Int -2147483647  

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) => ListItem(Float2Int(L1)) ... </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> d2i ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         when Float2Int(L1) >=Int -2147483647 andBool Float2Int(L1) <=Int 2147483647


    //-------d2l-------

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) => 
                ListItem(Float2Int(L1) -Int (9223372036854775807 *Int (Float2Int(L1) /Int 9223372036854775807))) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> d2l ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         when Float2Int(L1) >Int 9223372036854775807

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) => 
                ListItem(Float2Int(L1) +Int (9223372036854775807 *Int (Float2Int(L1) /Int 9223372036854775807))) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> d2l ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         when Float2Int(L1) <Int -9223372036854775807  

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) => ListItem(Float2Int(L1)) ... </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> d2l ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         when Float2Int(L1) >=Int -9223372036854775807 andBool Float2Int(L1) <=Int 9223372036854775807


    //-------d2f-------

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) => ListItem(L1 -Float (3.4028235E38 *Float (L1 /Float 3.4028235E38))) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> d2f ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         when L1 >Float 3.4028235E38

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) => ListItem(L1 +Float (3.4028235E38 *Float (L1 /Float 3.4028235E38))) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> d2f ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         when L1 <Float 1.4E-45     

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <methodStmts> ... I |-> d2f ... </methodStmts>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         when L1 >=Float 1.4E-45 andBool L1 <=Float 3.4028235E38

endmodule

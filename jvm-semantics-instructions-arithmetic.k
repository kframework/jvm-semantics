require "jvm-semantics-common.k"

module JVM-SEMANTICS-INSTRUCTIONS-ARITHMETIC
    imports JVM-SEMANTICS-COMMON

    /*@ \subsection{Arithmetic Intructions}
    From the JVM Specification:
    \begin{quote}
    The arithmetic instructions compute a result that is typically a function of two values on the operand stack, 
    pushing the result back on the operand stack. There are two main kinds of arithmetic instructions: 
    those operating on integer values and those operating on floating-point values. 
    Within each of these kinds, the arithmetic instructions are specialized to Java Virtual Machine numeric types. 
    There is no direct support for integer arithmetic on values of the byte, short, and char types (§2.11.1), 
    or for values of the boolean type; those operations are handled by instructions operating on type int. 
    Integer and floating-point instructions also differ in their behavior on overflow and divide-by-zero. 
    The arithmetic instructions are as follows:

    Add: iadd, ladd, fadd, dadd.

    Subtract: isub, lsub, fsub, dsub.

    Multiply: imul, lmul, fmul, dmul.

    Divide: idiv, ldiv, fdiv, ddiv.

    Remainder: irem, lrem, frem, drem.

    Negate: ineg, lneg, fneg, dneg.

    Shift: ishl, ishr, iushr, lshl, lshr, lushr.

    Bitwise OR: ior, lor.

    Bitwise AND: iand, land.

    Bitwise exclusive OR: ixor, lxor.

    Local variable increment: iinc.

    Comparison: dcmpg, dcmpl, fcmpg, fcmpl, lcmp.

    The semantics of the Java programming language operators on integer and floating-point values 
    (JLS §4.2.2, JLS §4.2.4) are directly supported by the semantics of the Java Virtual Machine instruction set.

    The Java Virtual Machine does not indicate overflow during operations on integer data types. 
    The only integer operations that can throw an exception are the integer divide instructions (idiv and ldiv) 
    and the integer remainder instructions (irem and lrem), which throw an ArithmeticException if the divisor is zero.

    Java Virtual Machine operations on floating-point numbers behave as specified in IEEE 754. 
    In particular, the Java Virtual Machine requires full support of IEEE 754 denormalized floating-point numbers 
    and gradual underflow, which make it easier to prove desirable properties of particular numerical algorithms.

    The Java Virtual Machine requires that floating-point arithmetic behave as if 
    every floating-point operator rounded its floating-point result to the result precision. 
    Inexact results must be rounded to the representable value nearest to the infinitely precise result; 
    if the two nearest representable values are equally near, the one having a least significant bit of zero is chosen. 
    This is the IEEE 754 standard's default rounding mode, known as round to nearest mode.

    The Java Virtual Machine uses the IEEE 754 round towards zero mode when converting a floating-point value to an integer. 
    This results in the number being truncated; any bits of the significand that represent the fractional part of 
    the operand value are discarded. Round towards zero mode chooses as its result the type's value closest to, 
    but no greater in magnitude than, the infinitely precise result.

    The Java Virtual Machine's floating-point operators do not throw run-time exceptions 
    (not to be confused with IEEE 754 floating-point exceptions). 
    An operation that overflows produces a signed infinity, an operation that underflows produces a 
    denormalized value or a signed zero, and an operation that has no mathematically definite result produces NaN. 
    All numeric operations with NaN as an operand produce NaN as a result.

    Comparisons on values of type long (lcmp) perform a signed comparison. 
    Comparisons on values of floating-point types (dcmpg, dcmpl, fcmpg, fcmpl) are performed using IEEE 754 nonsignaling comparisons.
    \end{quote}
    */

    
    //-------iadd-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => ListItem(L1 +Int L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> iadd ... </methodStmts>    

    
    //-------ladd-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => ListItem(L1 +Int L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> ladd ... </methodStmts>    


    //-------fadd-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) ListItem(L2:Float) => ListItem(L1 +Float L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> fadd ... </methodStmts>    


    //-------dadd-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) ListItem(L2:Float) => ListItem(L1 +Float L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> dadd ... </methodStmts>    


    //-------isub-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => ListItem(L1 -Int L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> isub ... </methodStmts>


    //-------lsub-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => ListItem(L1 -Int L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> lsub ... </methodStmts>


    //-------fsub-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) ListItem(L2:Float) => ListItem(L1 -Float L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> fsub ... </methodStmts>


    //-------dsub-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) ListItem(L2:Float) => ListItem(L1 -Float L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> dsub ... </methodStmts>


    //-------imul-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => ListItem(L1 *Int L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> imul ... </methodStmts>    


    //-------lmul-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => ListItem(L1 *Int L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> lmul ... </methodStmts>    


    //-------fmul-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) ListItem(L2:Float) => ListItem(L1 *Float L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> fmul ... </methodStmts>    


    //-------dmul-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) ListItem(L2:Float) => ListItem(L1 *Float L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> dmul ... </methodStmts>    


    //-------idiv-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => ListItem(L1 /Int L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> idiv ... </methodStmts>    


    //-------ldiv-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => ListItem(L1 /Int L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> ldiv ... </methodStmts>    


    //-------fdiv-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) ListItem(L2:Float) => ListItem(L1 /Float L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> fdiv ... </methodStmts>    


    //-------ddiv-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) ListItem(L2:Float) => ListItem(L1 /Float L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> ddiv ... </methodStmts>    


    //-------irem-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => 
                ListItem(L1 -Int (L1 /Int L2) *Int L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> irem ... </methodStmts>    


    //-------lrem-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => 
                ListItem(L1 -Int (L1 /Int L2) *Int L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> lrem ... </methodStmts>    


    //-------frem-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) ListItem(L2:Float) => ListItem(L1 %Float L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> frem ... </methodStmts>    
    

    //-------drem-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) ListItem(L2:Float) => ListItem(L1 %Float L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> drem ... </methodStmts>    


    //-------ineg-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => ListItem(0 -Int L1) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> ineg ... </methodStmts>


    //-------lneg-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => ListItem(0 -Int L1) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> lneg ... </methodStmts>


    //-------fneg-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) => ListItem(0.0 -Float L1) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> fneg ... </methodStmts>


    //-------dneg-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) => ListItem(0.0 -Float L1) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> dneg ... </methodStmts>


    //-------ishl-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => ListItem(L1 <<Int L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> ishl ... </methodStmts>  


    //-------ishr-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => ListItem(L1 >>Int L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> ishr ... </methodStmts> 

    
    //-------iushr-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => ListItem(L1 >>Int L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> iushr ... </methodStmts> 


    //-------lshl-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => ListItem(L1 <<Int L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> lshl ... </methodStmts>  


    //-------lshr-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => ListItem(L1 >>Int L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> lshr ... </methodStmts> 

    
    //-------lushr-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => ListItem(L1 >>Int L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> lushr ... </methodStmts> 


    //-------ior-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => ListItem(L1 |Int L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> ior ... </methodStmts>    


    //-------lor-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => ListItem(L1 |Int L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> lor ... </methodStmts>


    //-------iand-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => ListItem(L1 &Int L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> iand ... </methodStmts>    


    //-------land-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => ListItem(L1 &Int L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> land ... </methodStmts>


    //-------ixor-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => ListItem(L1 xorInt L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> ixor ... </methodStmts>    


    //-------lxor-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => ListItem(L1 xorInt L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> lxor ... </methodStmts>


    //-------iinc-------
    
    rule <pc> I:Int => I +Int 3 </pc>
         <k> runInstruction ... </k>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 3 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... I1 |-> (I7:Int , I4:Id , I5:CValue , I6:Int) => I1 |-> (I7 , I4 , I5 , I6 +Int I2) ... </localVarArr>
         <methodStmts> ... I |-> iinc I1:Int , I2:Int ... </methodStmts>


    //-------dcmp<op>-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) ListItem(L2:Float) => ListItem(-1) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> dcmpg ... </methodStmts>
         when L1 <Float L2
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) ListItem(L2:Float) => ListItem(1) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> dcmpg ... </methodStmts>
         when L1 >Float L2

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) ListItem(L2:Float) => ListItem(0) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> dcmpg ... </methodStmts>
         when L1 ==Float L2

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) ListItem(L2:Float) => ListItem(-1) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> dcmpl ... </methodStmts>
         when L1 <Float L2
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) ListItem(L2:Float) => ListItem(1) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> dcmpl ... </methodStmts>
         when L1 >Float L2

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) ListItem(L2:Float) => ListItem(0) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> dcmpl ... </methodStmts>
         when L1 ==Float L2


    //-------fcmp<op>-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) ListItem(L2:Float) => ListItem(-1) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> fcmpg ... </methodStmts>
         when L1 <Float L2
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) ListItem(L2:Float) => ListItem(1) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> fcmpg ... </methodStmts>
         when L1 >Float L2

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) ListItem(L2:Float) => ListItem(0) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> fcmpg ... </methodStmts>
         when L1 ==Float L2

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) ListItem(L2:Float) => ListItem(-1) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> fcmpl ... </methodStmts>
         when L1 <Float L2
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) ListItem(L2:Float) => ListItem(1) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> fcmpl ... </methodStmts>
         when L1 >Float L2

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) ListItem(L2:Float) => ListItem(0) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> fcmpl ... </methodStmts>
         when L1 ==Float L2


    //-------lcmp-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => ListItem(-1) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> lcmp ... </methodStmts>
         when L1 <Int L2
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => ListItem(1) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> lcmp ... </methodStmts>
         when L1 >Int L2

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => ListItem(0) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> lcmp ... </methodStmts>
         when L1 ==Int L2

endmodule

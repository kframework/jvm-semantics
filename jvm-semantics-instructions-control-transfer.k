require "jvm-semantics-common.k"

module JVM-SEMANTICS-INSTRUCTIONS-CONTROL-TRANSFER
    imports JVM-SEMANTICS-COMMON

    /*@ \subsection{Arithmetic Intructions}
    From the JVM Specification:
    \begin{quote}
    The control transfer instructions conditionally or unconditionally cause the Java Virtual Machine to continue 
    execution with an instruction other than the one following the control transfer instruction. They are:

    Conditional branch: 
    ifeq, ifne, iflt, ifle, ifgt, ifge, ifnull, ifnonnull, if_icmpeq, if_icmpne, 
    if_icmplt, if_icmple, if_icmpgt if_icmpge, if_acmpeq, if_acmpne.

    Compound conditional branch: tableswitch, lookupswitch.

    Unconditional branch: goto, goto_w, jsr, jsr_w, ret.

    The Java Virtual Machine has distinct sets of instructions that conditionally branch on 
    comparison with data of int and reference types. It also has distinct conditional branch instructions that 
    test for the null reference and thus it is not required to specify a concrete value for null (§2.4).

    Conditional branches on comparisons between data of types boolean, byte, char, and short are performed using 
    int comparison instructions (§2.11.1). A conditional branch on a comparison between data of types long, float, or double 
    is initiated using an instruction that compares the data and produces an int result of the comparison (§2.11.3). 
    A subsequent int comparison instruction tests this result and effects the conditional branch. 
    Because of its emphasis on int comparisons, the Java Virtual Machine provides a rich complement of 
    conditional branch instructions for type int.

    All int conditional control transfer instructions perform signed comparisons.
    \end{quote}
    */

    
    //-------if_icmp<cond>-------
    
    rule <pc> I:Int => I +Int 3 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 3 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> if_icmpge I2:Int ... </methodStmts>
         when L1 <Int L2
         
    rule <pc> I:Int => I2 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I2 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> if_icmpge I2:Int ... </methodStmts>
         when L1 >=Int L2

    rule <pc> I:Int => I +Int 3 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 3 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> if_icmpgt I2:Int ... </methodStmts>
         when L1 <=Int L2
         
    rule <pc> I:Int => I2 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I2 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> if_icmpgt I2:Int ... </methodStmts>
         when L1 >Int L2

    rule <pc> I:Int => I +Int 3 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 3 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> if_icmple I2:Int ... </methodStmts>
         when L1 >Int L2
         
    rule <pc> I:Int => I2 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I2 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> if_icmple I2:Int ... </methodStmts>
         when L1 <=Int L2

    rule <pc> I:Int => I +Int 3 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 3 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> if_icmplt I2:Int ... </methodStmts>
         when L1 >=Int L2
         
    rule <pc> I:Int => I2 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I2 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> if_icmplt I2:Int ... </methodStmts>
         when L1 <Int L2

    rule <pc> I:Int => I +Int 3 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 3 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> if_icmpne I2:Int ... </methodStmts>
         when L1 ==Int L2
         
    rule <pc> I:Int => I2 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I2 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> if_icmpne I2:Int ... </methodStmts>
         when L1 =/=Int L2

    rule <pc> I:Int => I +Int 3 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 3 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> if_icmpeq I2:Int ... </methodStmts>
         when L1 =/=Int L2
         
    rule <pc> I:Int => I2 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I2 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> if_icmpeq I2:Int ... </methodStmts>
         when L1 ==Int L2


    //-------if<cond>-------
    
    rule <pc> I:Int => I +Int 3 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 3 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> ifge I2:Int ... </methodStmts>
         when L1 <Int 0
         
    rule <pc> I:Int => I2 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I2 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> ifge I2:Int ... </methodStmts>
         when L1 >=Int 0

    rule <pc> I:Int => I +Int 3 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 3 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> ifgt I2:Int ... </methodStmts>
         when L1 <=Int 0
         
    rule <pc> I:Int => I2 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I2 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> ifgt I2:Int ... </methodStmts>
         when L1 >Int 0

    rule <pc> I:Int => I +Int 3 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 3 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> ifle I2:Int ... </methodStmts>
         when L1 >Int 0
         
    rule <pc> I:Int => I2 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I2 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> ifle I2:Int ... </methodStmts>
         when L1 <=Int 0

    rule <pc> I:Int => I +Int 3 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 3 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> iflt I2:Int ... </methodStmts>
         when L1 >=Int 0
         
    rule <pc> I:Int => I2 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 2 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> iflt I2:Int ... </methodStmts>
         when L1 <Int 0

    rule <pc> I:Int => I +Int 3 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 3 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> ifeq I2:Int ... </methodStmts>
         when L1 =/=Int 0
         
    rule <pc> I:Int => I2 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I2 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> ifeq I2:Int ... </methodStmts>
         when L1 ==Int 0

    rule <pc> I:Int => I +Int 3 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 3 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> ifne I2:Int ... </methodStmts>
         when L1 ==Int 0
         
    rule <pc> I:Int => I2 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I2 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> ifne I2:Int ... </methodStmts>
         when L1 =/=Int 0


    //-------if_acmp<cond>-------
    
    rule <pc> I:Int => I +Int 3 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 3 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> if_acmpeq I2:Int ... </methodStmts>
         when L1 =/=Int L2

    rule <pc> I:Int => I2 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I2 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> if_acmpeq I2:Int ... </methodStmts>
         when L1 ==Int L2

    rule <pc> I:Int => I +Int 3 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 3 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> if_acmpne I2:Int ... </methodStmts>
         when L1 ==Int L2

    rule <pc> I:Int => I2 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I2 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> if_acmpne I2:Int ... </methodStmts>
         when L1 =/=Int L2


    //-------ifnull-------
    
    rule <pc> I:Int => I +Int 3 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 3 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> ifnull I2:Int ... </methodStmts>
         when L1 =/=Int -1000

    rule <pc> I:Int => I2 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I2 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> ifnull I2:Int ... </methodStmts>
         when L1 ==Int -1000


    //-------ifnonnull-------
    
    rule <pc> I:Int => I +Int 3 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 3 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> ifnonnull I2:Int ... </methodStmts>
         when L1 ==Int -1000

    rule <pc> I:Int => I2 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I2 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> ifnonnull I2:Int ... </methodStmts>
         when L1 =/=Int -1000


    //-------goto-------
    
    rule <pc> I:Int => I1 </pc>
         <k> runInstruction ... </k>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> goto I1:Int ... </methodStmts>


    //-------goto_w-------
    
    rule <pc> I:Int => I1 </pc>
         <k> runInstruction ... </k>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> goto_w I1:Int ... </methodStmts>

endmodule

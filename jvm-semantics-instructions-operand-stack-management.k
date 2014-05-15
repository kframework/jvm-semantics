require "jvm-semantics-common.k"

module JVM-SEMANTICS-INSTRUCTIONS-OPERAND-STACK-MANAGEMENT
    imports JVM-SEMANTICS-COMMON

    /*@ \subsection{Operand Stack Management Intructions}
    From the JVM Specification:
    \begin{quote}
    A number of instructions are provided for the direct manipulation of the operand stack: 
    pop, pop2, dup, dup2, dup_x1, dup2_x1, dup_x2, dup2_x2, swap.
    \end{quote}
    */


    //-------nop-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> nop ... </methodStmts>
    

    //-------pop-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:CValue) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> pop ... </methodStmts>


    //-------pop2-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> pop2 ... </methodStmts>

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:CValue) ListItem(L2:CValue) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> pop2 ... </methodStmts>


    //-------dup-------

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Int) => ListItem(L1) ListItem(L1) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> dup ... </methodStmts>

endmodule

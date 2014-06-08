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
         <operandStack> ... ListItem(L1:CValue) => ListItem(L1) ListItem(L1) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> dup ... </methodStmts>


    //-------dup_x1-------

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:CValue) ListItem(L2:CValue) => ListItem(L2) ListItem(L1) ListItem(L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> dup_x1 ... </methodStmts>


    //-------dup_x2-------

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:CValue) ListItem(L2:CValue) ListItem(L3:CValue) 
                => ListItem(L3) ListItem(L1) ListItem(L2) ListItem(L3) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> dup_x2 ... </methodStmts>

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) ListItem(L2:CValue) => ListItem(L2) ListItem(L1) ListItem(L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> dup_x2 ... </methodStmts>


    //-------dup2-------

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:CValue) ListItem(L2:CValue) 
                => ListItem(L1) ListItem(L2) ListItem(L1) ListItem(L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> dup2 ... </methodStmts>

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) => ListItem(L1) ListItem(L1) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> dup2 ... </methodStmts>


    //-------dup2_x1-------

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:CValue) ListItem(L2:CValue) ListItem(L3:CValue) 
                => ListItem(L2) ListItem(L3) ListItem(L1) ListItem(L2) ListItem(L3) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> dup2_x1 ... </methodStmts>

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:CValue) ListItem(L2:Float) => ListItem(L2) ListItem(L1) ListItem(L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> dup2_x1 ... </methodStmts>


    //-------dup2_x2-------

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:CValue) ListItem(L2:CValue) ListItem(L3:CValue) ListItem(L4:CValue)
                => ListItem(L3) ListItem(L4) ListItem(L1) ListItem(L2) ListItem(L3) ListItem(L4) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> dup2_x2 ... </methodStmts>

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:CValue) ListItem(L2:CValue) ListItem(L3:Float)
                => ListItem(L3) ListItem(L1) ListItem(L2) ListItem(L3) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> dup2_x1 ... </methodStmts>

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) ListItem(L2:CValue) ListItem(L3:CValue)
                => ListItem(L2) ListItem(L3) ListItem(L1) ListItem(L2) ListItem(L3) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> dup2_x1 ... </methodStmts>

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:Float) ListItem(L2:Float) => ListItem(L2) ListItem(L1) ListItem(L2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> dup2_x1 ... </methodStmts>


    //-------swap-------

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L1:CValue) ListItem(L2:CValue) => ListItem(L2) ListItem(L1) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> swap ... </methodStmts>

endmodule

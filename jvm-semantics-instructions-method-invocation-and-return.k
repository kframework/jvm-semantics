require "jvm-semantics-common.k"

module JVM-SEMANTICS-INSTRUCTIONS-METHOD-INVOCATION-AND-RETURN
    imports JVM-SEMANTICS-COMMON

    /*@ \subsection{Arithmetic Intructions}
    From the JVM Specification:
    \begin{quote}
    The following five instructions invoke methods:

    invokevirtual invokes an instance method of an object, dispatching on the (virtual) type of the object. 
    This is the normal method dispatch in the Java programming language.

    invokeinterface invokes an interface method, searching the methods implemented by 
    the particular run-time object to find the appropriate method.

    invokespecial invokes an instance method requiring special handling, 
    whether an instance initialization method (§2.9), a private method, or a superclass method.

    invokestatic invokes a class (static) method in a named class.

    invokedynamic invokes the method which is the target of the call site object bound to the invokedynamic instruction. 
    The call site object was bound to a specific lexical occurrence of the invokedynamic instruction by the Java Virtual Machine 
    as a result of running a bootstrap method before the first execution of the instruction. 
    Therefore, each occurrence of an invokedynamic instruction has a unique linkage state, 
    unlike the other instructions which invoke methods.

    The method return instructions, which are distinguished by return type, are ireturn 
    (used to return values of type boolean, byte, char, short, or int), lreturn, freturn, dreturn, and areturn. 
    In addition, the return instruction is used to return from methods declared to be void, 
    instance initialization methods, and class or interface initialization methods.
    \end{quote}
    */


    //-------invokestatic-------
        
    rule <pc> I:Int => -1 </pc>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameMethod> C5:CValue : C6:CValue </frameMethod>
         <methodNameType> C5 : C6 </methodNameType>
         <k> runInstruction => addFrame (C , C3 , C4) ~> runInstruction ... </k>
         <frameStack> ... F |-> (I , C , C5 , C6) => F |-> (I +Int 3 , C , C5 , C6) ... </frameStack>
         <crntFrame> F:Int </crntFrame>
         <cpoolVals> ... C1 |-> C2:CValue . (C3:CValue : C4:CValue) ... </cpoolVals>
         <methodStmts> ... I |-> invokestatic C1:CIndex ... </methodStmts>

    
    //-------ireturn-------
    
    rule <pc> I:Int </pc>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <k> runInstruction => ireturn L1 ... </k>
         <frameStack> ... F |-> (I , C , C1 , C2) => . ... </frameStack>
         <crntFrame> F:Int => F -Int 1 </crntFrame>
         <methodStmts> ... I |-> ireturn ... </methodStmts>
         (<frame>
            <localVarArr> _ </localVarArr>
            <operandStack> ... ListItem(L1:Operand) </operandStack>
            <refs>
                <frameClass> C </frameClass>
                <frameMethod> C1:CValue : C2:CValue </frameMethod>
            </refs>
         </frame> => .)
    
         
    rule <k> ireturn I:Int => runInstruction ... </k>
         <operandStack> ... . => ListItem(I) </operandStack>
         <frameMethod> C2:CValue : C3:CValue </frameMethod>
         <frameClass> C </frameClass>
         <frameStack> ... F |-> (I2:Int , C:ClassDecl , C2:CValue , C3:CValue) ... </frameStack>
         <crntFrame> F:Int </crntFrame>
         <pc> _ => I2 </pc>


    //-------invokespecial-------
        
    rule <pc> I:Int => -1 </pc>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameMethod> C5:CValue : C6:CValue </frameMethod>
         <methodNameType> C5 : C6 </methodNameType>
         <k> runInstruction => searchClassSpecial (C2 , C3 , C4 , 0 , C , C5 , C6) ~> runInstruction ... </k>
         <frameStack> ... F |-> (I , C , C5 , C6) => F |-> (I +Int 3 , C , C5 , C6) ... </frameStack>
         <crntFrame> F:Int </crntFrame>
         <cpoolVals> ... C1 |-> C2:CValue . (C3:CValue : C4:CValue) ... </cpoolVals>
         <methodStmts> ... I |-> invokespecial C1:CIndex ... </methodStmts>
         when countAllOccurences(K2String(C2), "Object") ==Int 0
         
    rule <pc> I:Int => I +Int 3 </pc>
         <k> runInstruction ... </k>
         <classDecl> C:ClassDecl </classDecl>
         <operandStack> ... ListItem(I1) => . </operandStack>
         <frameClass> C </frameClass>
         <frameMethod> C5:CValue : C6:CValue </frameMethod>
         <methodNameType> C5 : C6 </methodNameType>
         <frameStack> ... F |-> (I , C , C5 , C6) => F |-> (I +Int 3 , C , C5 , C6) ... </frameStack>
         <crntFrame> F:Int </crntFrame>
         <cpoolVals> ... C1 |-> C2:CValue . (C3:CValue : C4:CValue) ... </cpoolVals>
         <methodStmts> ... I |-> invokespecial C1:CIndex ... </methodStmts>
         <heap> ... I1 |-> object(_ , <envStack> ... . => (C2 , <env> . </env>) </envStack>) ... </heap>
         when countAllOccurences(K2String(C2), "Object") =/=Int 0


    //-------return-------
    
    rule <pc> I:Int </pc>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameStack> ... F |-> (I , C , C1 , C2) => . ... </frameStack>
         <crntFrame> F:Int => F -Int 1 </crntFrame>
         <k> runInstruction => return ~> runInstruction ... </k>
         <methodStmts> ... I |-> return ... </methodStmts>
         (<frame>
            <localVarArr> _ </localVarArr>
            <operandStack> _ </operandStack>
            <refs>
                <frameClass> C </frameClass>
                <frameMethod> C1:CValue : C2:CValue </frameMethod>
            </refs>
         </frame> => .)

    rule <k> return => . ... </k>
         <frameMethod> C2:CValue : C3:CValue </frameMethod>
         <frameClass> C </frameClass>
         <frameStack> ... F |-> (I2:Int , C:ClassDecl , C2:CValue , C3:CValue) ... </frameStack>
         <crntFrame> F:Int </crntFrame>
         <pc> _ => I2 </pc>

    rule <k> return ~> runInstruction => . ... </k>
         <crntFrame> -1 </crntFrame>


    //-------invokevirtual-------
        
    rule <pc> I:Int => -1 </pc>
         <classDecl> C:ClassDecl </classDecl>
         //<operandStack> ... ListItem(I1) => . </operandStack>
         <metaInfo> ... args_size |-> I1:Int ... </metaInfo>
         <frameClass> C </frameClass>
         <frameMethod> C5:CValue : C6:CValue </frameMethod>
         <methodNameType> C5 : C6 </methodNameType>
         <k> runInstruction => searchClassVirtual (C2 , C3 , C4, I1 , C , C5 , C6) ~> runInstruction ... </k>
         <frameStack> ... F |-> (I , C , C5 , C6) => F |-> (I +Int 3 , C , C5 , C6) ... </frameStack>
         <crntFrame> F:Int </crntFrame>
         <cpoolVals> ... C1 |-> C2:CValue . (C3:CValue : C4:CValue) ... </cpoolVals>
         <methodStmts> ... I |-> invokevirtual C1:CIndex ... </methodStmts>

endmodule

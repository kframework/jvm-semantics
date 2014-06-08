require "jvm-semantics-common.k"

module JVM-SEMANTICS-INSTRUCTIONS-OBJECT-CREATION-AND-MANIPULATION
    imports JVM-SEMANTICS-COMMON

    /*@ \subsection{Object Creation and Manipulation}
    From the JVM Specification:
    \begin{quote}
    Although both class instances and arrays are objects, the Java Virtual Machine creates and manipulates 
    class instances and arrays using distinct sets of instructions:

    Create a new class instance: new.

    Create a new array: newarray, anewarray, multianewarray.

    Access fields of classes (static fields, known as class variables) and fields of class instances 
    (non-static fields, known as instance variables): getfield, putfield, getstatic, putstatic.

    Load an array component onto the operand stack: baload, caload, saload, iaload, laload, faload, daload, aaload.

    Store a value from the operand stack as an array component: bastore, castore, sastore, 
    iastore, lastore, fastore, dastore, aastore.

    Get the length of array: arraylength.

    Check properties of class instances or arrays: instanceof, checkcast.
    \end{quote}
    */


    //-------new-------
        
    rule <pc> I:Int => I +Int 3 </pc>
         <operandStack> ... . => ListItem(I1) </operandStack>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameMethod> C5:CValue : C6:CValue </frameMethod>
         <methodNameType> C5 : C6 </methodNameType>
         <k> runInstruction => newObject (C2, I1) ~> runInstruction ... </k>
         <frameStack> ... F |-> (I , C , C5 , C6) => F |-> (I +Int 3 , C , C5 , C6) ... </frameStack>
         <crntFrame> F:Int </crntFrame>
         <cpoolVals> ... C1 |-> C2:CValue ... </cpoolVals>
         <methodStmts> ... I |-> new C1:CIndex ... </methodStmts>
         <env> X:Map </env>
         <heap> ... . => I1 |-> object(C2 , <envStack> . </envStack>) ... </heap>
         <nextRefLoc> I1:Int => I1 +Int 1 </nextRefLoc>


    //---------------newarray------------------

    rule <pc> I:Int => I +Int 2 </pc>
         <operandStack> ... ListItem(S:Int) => ListItem(I1) </operandStack>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameMethod> C5:CValue : C6:CValue </frameMethod>
         <methodNameType> C5 : C6 </methodNameType>
         <k> runInstruction => newArrayElement (S) ~> runInstruction ... </k>
         <frameStack> ... F |-> (I , C , C5 , C6) => F |-> (I +Int 2 , C , C5 , C6) ... </frameStack>
         <crntFrame> F:Int </crntFrame>
         <methodStmts> ... I |-> newarray T:Primitives ... </methodStmts>
         <heap> ... . => I1 |-> array(T , I1 +Int 1 , S) ... </heap>
         <nextRefLoc> I1:Int => I1 +Int 1 </nextRefLoc>

    rule <k> newArrayElement (S:Int) => newArrayElement(S -Int 1) ... </k>
         <heap> ... . => I1 |-> 0 ... </heap>
         <nextRefLoc> I1:Int => I1 +Int 1 </nextRefLoc>
         when S =/=Int 0

    rule <k> newArrayElement (S:Int) => . ... </k>
         when S ==Int 0


    //---------------anewarray------------------

    rule <pc> I:Int => I +Int 3 </pc>
         <operandStack> ... ListItem(S:Int) => ListItem(I1) </operandStack>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameMethod> C5:CValue : C6:CValue </frameMethod>
         <methodNameType> C5 : C6 </methodNameType>
         <k> runInstruction => newArrayElement (S) ~> runInstruction ... </k>
         <frameStack> ... F |-> (I , C , C5 , C6) => F |-> (I +Int 3 , C , C5 , C6) ... </frameStack>
         <crntFrame> F:Int </crntFrame>
         <cpoolVals> ... T |-> T2:CValue ... </cpoolVals>
         <methodStmts> ... I |-> anewarray T:CIndex ... </methodStmts>
         <heap> ... . => I1 |-> array(T2 , I1 +Int 1 , S) ... </heap>
         <nextRefLoc> I1:Int => I1 +Int 1 </nextRefLoc>


    //-------putfield-------
        
    rule <pc> I:Int => I +Int 3 </pc>
         <operandStack> ... ListItem(I1:Int) ListItem(I2:CValue) => . </operandStack>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameMethod> C5:CValue : C6:CValue </frameMethod>
         <methodNameType> C5 : C6 </methodNameType>
         <frameStack> ... F |-> (I , C , C5 , C6) => F |-> (I +Int 3 , C , C5 , C6) ... </frameStack>
         <crntFrame> F:Int </crntFrame>
         <cpoolVals> ... C1 |-> C2:CValue . (C3:CValue : C4:CValue) ... </cpoolVals>
         <methodStmts> ... I |-> putfield C1:CIndex ... </methodStmts>
         <env> X:Map </env>
         <heap> ... I1 |-> object(_ , <envStack> ... (_ , <env> ... C3 |-> I3:Int ... </env>) ... </envStack>) ... </heap>
         <k> runInstruction => updateField(I3 , I2) ~> runInstruction ... </k>

    rule <k> updateField(I1:Int , I2:CValue) => . ... </k>
          <heap> ... I1 |-> _ => I1 |-> I2 ... </heap>


    //-------putstatic-------
        
    rule <pc> I:Int => I +Int 3 </pc>
         <operandStack> ... ListItem(I1:CValue) => . </operandStack>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameMethod> C5:CValue : C6:CValue </frameMethod>
         <methodNameType> C5 : C6 </methodNameType>
         <frameStack> ... F |-> (I , C , C5 , C6) => F |-> (I +Int 3 , C , C5 , C6) ... </frameStack>
         <crntFrame> F:Int </crntFrame>
         <cpoolVals> ... C1 |-> C2:CValue . (C3:CValue : C4:CValue) ... </cpoolVals>
         <methodStmts> ... I |-> putstatic C1:CIndex ... </methodStmts>
         <k> runInstruction => updateStatic(C2 , C3 , I1) ~> runInstruction ... </k>

    rule <pc> I:Int => I +Int 3 </pc>
         <operandStack> ... ListItem(I1:Float) => . </operandStack>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameMethod> C5:CValue : C6:CValue </frameMethod>
         <methodNameType> C5 : C6 </methodNameType>
         <frameStack> ... F |-> (I , C , C5 , C6) => F |-> (I +Int 3 , C , C5 , C6) ... </frameStack>
         <crntFrame> F:Int </crntFrame>
         <cpoolVals> ... C1 |-> C2:CValue . (C3:CValue : C4:CValue) ... </cpoolVals>
         <methodStmts> ... I |-> putstatic C1:CIndex ... </methodStmts>
         <k> runInstruction => updateStatic(C2 , C3 , I1) ~> runInstruction ... </k>

    rule <k> updateStatic(C1:CValue , C2:CValue , C3:CValue) => . ... </k>
         <classDecl> C:ClassModType C1 </classDecl>
         <staticFields> ... C2 |-> _ => C2 |-> C3 ... </staticFields>

    rule <k> updateStatic(C1:CValue , C2:CValue , C3:Float) => . ... </k>
         <classDecl> C:ClassModType C1 </classDecl>
         <staticFields> ... C2 |-> _ => C2 |-> C3 ... </staticFields>


    //-------getfield-------
        
    rule <pc> I:Int => I +Int 3 </pc>
         <operandStack> ... ListItem(I1:Int) => . </operandStack>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameMethod> C5:CValue : C6:CValue </frameMethod>
         <methodNameType> C5 : C6 </methodNameType>
         <frameStack> ... F |-> (I , C , C5 , C6) => F |-> (I +Int 3 , C , C5 , C6) ... </frameStack>
         <crntFrame> F:Int </crntFrame>
         <cpoolVals> ... C1 |-> C2:CValue . (C3:CValue : C4:CValue) ... </cpoolVals>
         <methodStmts> ... I |-> getfield C1:CIndex ... </methodStmts>
         <env> X:Map </env>
         <heap> ... I1 |-> object(_ , <envStack> ... (_ , <env> ... C3 |-> I3:Int ... </env>) ... </envStack>) ... </heap>
         <k> runInstruction => retrieveField(I3) ~> runInstruction ... </k>

    rule <k> retrieveField(I1:Int) => . ... </k>
         <heap> ... I1 |-> I2:CValue ... </heap>
         <operandStack> ... . => ListItem(I2) </operandStack>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameMethod> C5:CValue : C6:CValue </frameMethod>
         <methodNameType> C5 : C6 </methodNameType>
         <frameStack> ... F |-> (I , C , C5 , C6) ... </frameStack>
         <crntFrame> F:Int </crntFrame>

    rule <k> retrieveField(I1:Int) => . ... </k>
         <heap> ... I1 |-> I2:Float ... </heap>
         <operandStack> ... . => ListItem(I2) </operandStack>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameMethod> C5:CValue : C6:CValue </frameMethod>
         <methodNameType> C5 : C6 </methodNameType>
         <frameStack> ... F |-> (I , C , C5 , C6) ... </frameStack>
         <crntFrame> F:Int </crntFrame>


    //-------getstatic-------
        
    rule <pc> I:Int => I +Int 3 </pc>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameMethod> C5:CValue : C6:CValue </frameMethod>
         <methodNameType> C5 : C6 </methodNameType>
         <frameStack> ... F |-> (I , C , C5 , C6) => F |-> (I +Int 3 , C , C5 , C6) ... </frameStack>
         <crntFrame> F:Int </crntFrame>
         <cpoolVals> ... C1 |-> C2:CValue . (C3:CValue : C4:CValue) ... </cpoolVals>
         <methodStmts> ... I |-> getstatic C1:CIndex ... </methodStmts>
         <k> runInstruction => retrieveStatic(C2 , C3) ~> runInstruction ... </k>

    rule <k> retrieveStatic(C2:CValue , C3:CValue) => . ... </k>
         <classDecl> C1:ClassModType C2 </classDecl>
         <staticFields> ... C3 |-> I1:CValue ... </staticFields>
         <operandStack> ... . => ListItem(I1) </operandStack>
         <frameClass> C:ClassDecl </frameClass>
         <frameMethod> C5:CValue : C6:CValue </frameMethod>
         <methodNameType> C5 : C6 </methodNameType>
         <frameStack> ... F |-> (I , C , C5 , C6) => F |-> (I , C , C5 , C6) ... </frameStack>
         <crntFrame> F:Int </crntFrame>
                 
    rule <k> retrieveStatic(C2:CValue , C3:CValue) => . ... </k>
         <classDecl> C1:ClassModType C2 </classDecl>
         <staticFields> ... C3 |-> I1:Float ... </staticFields>
         <operandStack> ... . => ListItem(I1) </operandStack>
         <frameClass> C:ClassDecl </frameClass>
         <frameMethod> C5:CValue : C6:CValue </frameMethod>
         <methodNameType> C5 : C6 </methodNameType>
         <frameStack> ... F |-> (I , C , C5 , C6) => F |-> (I , C , C5 , C6) ... </frameStack>
         <crntFrame> F:Int </crntFrame>

    //-------iaload-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <operandStack> ... ListItem(L:Int) ListItem(L1:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>     
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... I5 |-> (I7:Int , I2:Id , I3:CValue , I4:Int) => I5 |-> (I7 , I2 , I3 , L) ... </localVarArr>
         <k> runInstruction => retrieveField (L +Int 1 +Int L1) ~> runInstruction ... </k>
         <methodStmts> ... I |-> iaload ... </methodStmts>


    //-------laload-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <operandStack> ... ListItem(L:Int) ListItem(L1:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>     
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... I5 |-> (I7:Int , I2:Id , I3:CValue , I4:Int) => I5 |-> (I7 , I2 , I3 , L) ... </localVarArr>
         <k> runInstruction => retrieveField (L +Int 1 +Int L1) ~> runInstruction ... </k>
         <methodStmts> ... I |-> laload ... </methodStmts>


    //-------baload-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <operandStack> ... ListItem(L:Int) ListItem(L1:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>     
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... I5 |-> (I7:Int , I2:Id , I3:CValue , I4:Int) => I5 |-> (I7 , I2 , I3 , L) ... </localVarArr>
         <k> runInstruction => retrieveField (L +Int 1 +Int L1) ~> runInstruction ... </k>
         <methodStmts> ... I |-> baload ... </methodStmts>


    //-------caload-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <operandStack> ... ListItem(L:Int) ListItem(L1:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>     
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... I5 |-> (I7:Int , I2:Id , I3:CValue , I4:Int) => I5 |-> (I7 , I2 , I3 , L) ... </localVarArr>
         <k> runInstruction => retrieveField (L +Int 1 +Int L1) ~> runInstruction ... </k>
         <methodStmts> ... I |-> caload ... </methodStmts>


    //-------saload-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <operandStack> ... ListItem(L:Int) ListItem(L1:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>     
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... I5 |-> (I7:Int , I2:Id , I3:CValue , I4:Int) => I5 |-> (I7 , I2 , I3 , L) ... </localVarArr>
         <k> runInstruction => retrieveField (L +Int 1 +Int L1) ~> runInstruction ... </k>
         <methodStmts> ... I |-> saload ... </methodStmts>

    
    //-------faload-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <operandStack> ... ListItem(L:Int) ListItem(L1:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>     
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... I5 |-> (I7:Int , I2:Id , I3:CValue , I4:Int) => I5 |-> (I7 , I2 , I3 , L) ... </localVarArr>
         <k> runInstruction => retrieveField (L +Int 1 +Int L1) ~> runInstruction ... </k>
         <methodStmts> ... I |-> faload ... </methodStmts>

    
    //-------daload-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <operandStack> ... ListItem(L:Int) ListItem(L1:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>     
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... I5 |-> (I7:Int , I2:Id , I3:CValue , I4:Int) => I5 |-> (I7 , I2 , I3 , L) ... </localVarArr>
         <k> runInstruction => retrieveField (L +Int 1 +Int L1) ~> runInstruction ... </k>
         <methodStmts> ... I |-> daload ... </methodStmts>

    
    //-------aaload-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <operandStack> ... ListItem(L:Int) ListItem(L1:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>     
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... I5 |-> (I7:Int , I2:Id , I3:CValue , I4:Int) => I5 |-> (I7 , I2 , I3 , L) ... </localVarArr>
         <k> runInstruction => retrieveField (L +Int 1 +Int L1) ~> runInstruction ... </k>
         <methodStmts> ... I |-> aaload ... </methodStmts>


    //-------iastore-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <operandStack> ... ListItem(L:Int) ListItem(L1:Int) ListItem(L2:CValue) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>     
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... I5 |-> (I7:Int , I2:Id , I3:CValue , I4:Int) => I5 |-> (I7 , I2 , I3 , L) ... </localVarArr>
         <k> runInstruction => updateField(L +Int 1 +Int L1 , L2) ~> runInstruction ... </k>
         <methodStmts> ... I |-> iastore ... </methodStmts>


    //-------lastore-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <operandStack> ... ListItem(L:Int) ListItem(L1:Int) ListItem(L2:CValue) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>     
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... I5 |-> (I7:Int , I2:Id , I3:CValue , I4:Int) => I5 |-> (I7 , I2 , I3 , L) ... </localVarArr>
         <k> runInstruction => updateField(L +Int 1 +Int L1 , L2) ~> runInstruction ... </k>
         <methodStmts> ... I |-> lastore ... </methodStmts>


    //-------bastore-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <operandStack> ... ListItem(L:Int) ListItem(L1:Int) ListItem(L2:CValue) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>     
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... I5 |-> (I7:Int , I2:Id , I3:CValue , I4:Int) => I5 |-> (I7 , I2 , I3 , L) ... </localVarArr>
         <k> runInstruction => updateField(L +Int 1 +Int L1 , L2) ~> runInstruction ... </k>
         <methodStmts> ... I |-> bastore ... </methodStmts>


    //-------castore-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <operandStack> ... ListItem(L:Int) ListItem(L1:Int) ListItem(L2:CValue) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>     
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... I5 |-> (I7:Int , I2:Id , I3:CValue , I4:Int) => I5 |-> (I7 , I2 , I3 , L) ... </localVarArr>
         <k> runInstruction => updateField(L +Int 1 +Int L1 , L2) ~> runInstruction ... </k>
         <methodStmts> ... I |-> castore ... </methodStmts>


    //-------sastore-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <operandStack> ... ListItem(L:Int) ListItem(L1:Int) ListItem(L2:CValue) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>     
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... I5 |-> (I7:Int , I2:Id , I3:CValue , I4:Int) => I5 |-> (I7 , I2 , I3 , L) ... </localVarArr>
         <k> runInstruction => updateField(L +Int 1 +Int L1 , L2) ~> runInstruction ... </k>
         <methodStmts> ... I |-> sastore ... </methodStmts>


    //-------fastore-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <operandStack> ... ListItem(L:Int) ListItem(L1:Int) ListItem(L2:Float) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>     
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... I5 |-> (I7:Int , I2:Id , I3:CValue , I4:Int) => I5 |-> (I7 , I2 , I3 , L) ... </localVarArr>
         <k> runInstruction => updateField(L +Int 1 +Int L1 , L2) ~> runInstruction ... </k>
         <methodStmts> ... I |-> fastore ... </methodStmts>


    //-------dastore-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <operandStack> ... ListItem(L:Int) ListItem(L1:Int) ListItem(L2:Float) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>     
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... I5 |-> (I7:Int , I2:Id , I3:CValue , I4:Int) => I5 |-> (I7 , I2 , I3 , L) ... </localVarArr>
         <k> runInstruction => updateField(L +Int 1 +Int L1 , L2) ~> runInstruction ... </k>
         <methodStmts> ... I |-> dastore ... </methodStmts>


    //-------aastore-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <operandStack> ... ListItem(L:Int) ListItem(L1:Int) ListItem(L2:CValue) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>     
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... I5 |-> (I7:Int , I2:Id , I3:CValue , I4:Int) => I5 |-> (I7 , I2 , I3 , L) ... </localVarArr>
         <k> runInstruction => updateField(L +Int 1 +Int L1 , L2) ~> runInstruction ... </k>
         <methodStmts> ... I |-> aastore ... </methodStmts>

    rule <k> updateField(I1:Int , I2:Float) => . ... </k>
         <heap> ... I1 |-> _ => I1 |-> I2 ... </heap>

    
    //-------arraylength-------
        
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(I1:Int) => ListItem(I3) </operandStack>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameMethod> C5:CValue : C6:CValue </frameMethod>
         <methodNameType> C5 : C6 </methodNameType>
         <frameStack> ... F |-> (I , C , C5 , C6) => F |-> (I +Int 1 , C , C5 , C6) ... </frameStack>
         <crntFrame> F:Int </crntFrame>
         <methodStmts> ... I |-> arraylength ... </methodStmts>
         <heap> ... I1 |-> array(C7:Primitives , I2:Int , I3:Int) ... </heap>

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(I1:Int) => ListItem(I3) </operandStack>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameMethod> C5:CValue : C6:CValue </frameMethod>
         <methodNameType> C5 : C6 </methodNameType>
         <frameStack> ... F |-> (I , C , C5 , C6) => F |-> (I +Int 1 , C , C5 , C6) ... </frameStack>
         <crntFrame> F:Int </crntFrame>
         <methodStmts> ... I |-> arraylength ... </methodStmts>
         <heap> ... I1 |-> array(C7:CValue , I2:Int , I3:Int) ... </heap>

endmodule

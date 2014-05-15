require "jvm-semantics-common.k"

module JVM-SEMANTICS-INSTRUCTIONS-LOAD-AND-STORE
    imports JVM-SEMANTICS-COMMON

    /*@ \subsection{Load And Store Intructions}
    From the JVM Specification:
    \begin{quote}
    The load and store instructions transfer values between the local variables (§2.6.1) 
    and the operand stack (§2.6.2) of a Java Virtual Machine frame (§2.6):

    Load a local variable onto the operand stack: 
    iload, iload_<n>, lload, lload_<n>, fload, fload_<n>, dload, dload_<n>, aload, aload_<n>.

    Store a value from the operand stack into a local variable: 
    istore, istore_<n>, lstore, lstore_<n>, fstore, fstore_<n>, dstore, dstore_<n>, astore, astore_<n>.

    Load a constant on to the operand stack: 
    bipush, sipush, ldc, ldc_w, ldc2_w, aconst_null, iconst_m1, iconst_<i>, lconst_<l>, fconst_<f>, dconst_<d>.

    Gain access to more local variables using a wider index, or to a larger immediate operand: wide.

    Instructions that access fields of objects and elements of arrays (§2.11.5) also transfer data to and from the operand stack.

    Instruction mnemonics shown above with trailing letters between angle brackets (for instance, iload_<n>) 
    denote families of instructions (with members iload_0, iload_1, iload_2, and iload_3 in the case of iload_<n>). 
    Such families of instructions are specializations of an additional generic instruction (iload) that takes one operand. 
    For the specialized instructions, the operand is implicit and does not need to be stored or fetched. 
    The semantics are otherwise the same (iload_0 means the same thing as iload with the operand 0). 
    The letter between the angle brackets specifies the type of the implicit operand for that family of instructions: 
    for <n>, a nonnegative integer; for <i>, an int; for <l>, a long; for <f>, a float; and for <d>, a double. 
    Forms for type int are used in many cases to perform operations on values of type byte, char, and short (§2.11.1).
    \end{quote}
    */


    //-------iload_<n>-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <operandStack> ... . => ListItem(I6) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 0 |-> (I4:Id , I5:CValue , I6:Int) ... </localVarArr>
         <methodStmts> ... I |-> iload_0 ... </methodStmts>
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(I6) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 1 |-> (I4:Id , I5:CValue , I6:Int) ... </localVarArr>
         <methodStmts> ... I |-> iload_1 ... </methodStmts>
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(I6) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 2 |-> (I4:Id , I5:CValue , I6:Int) ... </localVarArr>
         <methodStmts> ... I |-> iload_2 ... </methodStmts>

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(I6) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 3 |-> (I4:Id , I5:CValue , I6:Int) ... </localVarArr>
         <methodStmts> ... I |-> iload_3 ... </methodStmts>
         

    //-------iload-------
    
    rule <pc> I:Int => I +Int 2 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(I6) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 2 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... I2 |-> (I4:Id , I5:CValue , I6:Int) ... </localVarArr>
         <methodStmts> ... I |-> iload I2:Int ... </methodStmts>
    

    //-------lload_<n>-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(I6) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 0 |-> (I4:Id , I5:CValue , I6) ... </localVarArr>
         <methodStmts> ... I |-> lload_0 ... </methodStmts>
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(I6) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 1 |-> (I4:Id , I5:CValue , I6) ... </localVarArr>
         <methodStmts> ... I |-> lload_1 ... </methodStmts>
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(I6) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 2 |-> (I4:Id , I5:CValue , I6) ... </localVarArr>
         <methodStmts> ... I |-> lload_2 ... </methodStmts>

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(I6) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 3 |-> (I4:Id , I5:CValue , I6) ... </localVarArr>
         <methodStmts> ... I |-> lload_3 ... </methodStmts>
         

    //-------lload-------
    /*
    rule <pc> I:Int => I +Int 2 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(I6) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 2 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... I2 |-> (I4:Id , I5:CValue , I6:Int) ... </localVarArr>
         <methodStmts> ... I |-> lload I2:Int l... </methodStmts>
    */


    //-------fload_<n>-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(I6) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 0 |-> (I4:Id , I5:CValue , I6) ... </localVarArr>
         <methodStmts> ... I |-> fload_0 ... </methodStmts>
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(I6) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 1 |-> (I4:Id , I5:CValue , I6) ... </localVarArr>
         <methodStmts> ... I |-> fload_1 ... </methodStmts>
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(I6) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 2 |-> (I4:Id , I5:CValue , I6) ... </localVarArr>
         <methodStmts> ... I |-> fload_2 ... </methodStmts>

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(I6) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 3 |-> (I4:Id , I5:CValue , I6) ... </localVarArr>
         <methodStmts> ... I |-> fload_3 ... </methodStmts>
         

    //-------fload-------
    
    rule <pc> I:Int => I +Int 2 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(I6) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 2 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... I2 |-> (I4:Id , I5:CValue , I6) ... </localVarArr>
         <methodStmts> ... I |-> fload I2:Int ... </methodStmts>
         

    //-------dload_<n>-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(I6) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 0 |-> (I4:Id , I5:CValue , I6) ... </localVarArr>
         <methodStmts> ... I |-> dload_0 ... </methodStmts>
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(I6) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 1 |-> (I4:Id , I5:CValue , I6) ... </localVarArr>
         <methodStmts> ... I |-> dload_1 ... </methodStmts>
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(I6) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 2 |-> (I4:Id , I5:CValue , I6) ... </localVarArr>
         <methodStmts> ... I |-> dload_2 ... </methodStmts>

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(I6) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 3 |-> (I4:Id , I5:CValue , I6) ... </localVarArr>
         <methodStmts> ... I |-> dload_3 ... </methodStmts>
         

    //-------dload-------
    
    rule <pc> I:Int => I +Int 2 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(I6) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 2 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... I2 |-> (I4:Id , I5:CValue , I6) ... </localVarArr>
         <methodStmts> ... I |-> dload I2:Int ... </methodStmts>


    //-------aload_<n>-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(I6) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 0 |-> (I4:Id , I5:CValue , I6:Int) ... </localVarArr>
         <methodStmts> ... I |-> aload_0 ... </methodStmts>
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(I6) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 1 |-> (I4:Id , I5:CValue , I6:Int) ... </localVarArr>
         <methodStmts> ... I |-> aload_1 ... </methodStmts>
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(I6) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 2 |-> (I4:Id , I5:CValue , I6:Int) ... </localVarArr>
         <methodStmts> ... I |-> aload_2 ... </methodStmts>

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(I6) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 3 |-> (I4:Id , I5:CValue , I6:Int) ... </localVarArr>
         <methodStmts> ... I |-> aload_3 ... </methodStmts>
        
 
    //-------aload-------
    
    rule <pc> I:Int => I +Int 2 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(I6) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 2 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... I2 |-> (I4:Id , I5:CValue , I6:Int) ... </localVarArr>
         <methodStmts> ... I |-> iload I2:Int ... </methodStmts>


    //-------istore_<n>-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>    
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>     
         <localVarArr> ... 0 |-> (I2:Id , I3:CValue , I4:Int) => 0 |-> (I2 , I3 , L) ... </localVarArr>
         <methodStmts> ... I |-> istore_0 ... </methodStmts>
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>    
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 1 |-> (I2:Id , I3:CValue , I4:Int) => 1 |-> (I2 , I3 , L) ... </localVarArr>
         <methodStmts> ... I |-> istore_1 ... </methodStmts>
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>    
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 2 |-> (I2:Id , I3:CValue , I4:Int) => 2 |-> (I2 , I3 , L) ... </localVarArr>
         <methodStmts> ... I |-> istore_2 ... </methodStmts>
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>    
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 3 |-> (I2:Id , I3:CValue , I4:Int) => 3 |-> (I2 , I3 , L) ... </localVarArr>
         <methodStmts> ... I |-> istore_3 ... </methodStmts>
         

    //-------istore-------
    
    rule <pc> I:Int => I +Int 2 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>     
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 2 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... I5 |-> (I2:Id , I3:CValue , I4:Int) => I5 |-> (I2 , I3 , L) ... </localVarArr>
         <methodStmts> ... I |-> istore I5:Int... </methodStmts>


    //-------lstore_<n>-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>    
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>     
         <localVarArr> ... 0 |-> (I2:Id , I3:CValue , _) => 0 |-> (I2 , I3 , L) ... </localVarArr>
         <methodStmts> ... I |-> lstore_0 ... </methodStmts>
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>    
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 1 |-> (I2:Id , I3:CValue , _) => 1 |-> (I2 , I3 , L) ... </localVarArr>
         <methodStmts> ... I |-> lstore_1 ... </methodStmts>
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>    
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 2 |-> (I2:Id , I3:CValue , _) => 2 |-> (I2 , I3 , L) ... </localVarArr>
         <methodStmts> ... I |-> lstore_2 ... </methodStmts>
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>    
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 3 |-> (I2:Id , I3:CValue , _) => 3 |-> (I2 , I3 , L) ... </localVarArr>
         <methodStmts> ... I |-> lstore_3 ... </methodStmts>

         
    //-------lstore-------
    
    rule <pc> I:Int => I +Int 2 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>     
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 2 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... I5 |-> (I2:Id , I3:CValue , _) => I5 |-> (I2 , I3 , L) ... </localVarArr>
         <methodStmts> ... I |-> lstore I5:Int ... </methodStmts>


    //-------fstore_<n>-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>    
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>     
         <localVarArr> ... 0 |-> (I2:Id , I3:CValue , _) => 0 |-> (I2 , I3 , L) ... </localVarArr>
         <methodStmts> ... I |-> fstore_0 ... </methodStmts>
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>    
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 1 |-> (I2:Id , I3:CValue , _) => 1 |-> (I2 , I3 , L) ... </localVarArr>
         <methodStmts> ... I |-> fstore_1 ... </methodStmts>
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>    
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 2 |-> (I2:Id , I3:CValue , _) => 2 |-> (I2 , I3 , L) ... </localVarArr>
         <methodStmts> ... I |-> fstore_2 ... </methodStmts>
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>    
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 3 |-> (I2:Id , I3:CValue , _) => 3 |-> (I2 , I3 , L) ... </localVarArr>
         <methodStmts> ... I |-> fstore_3 ... </methodStmts>
    
     
    //-------fstore-------
    
    rule <pc> I:Int => I +Int 2 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>     
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 2 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... I5 |-> (I2:Id , I3:CValue , _) => I5 |-> (I2 , I3 , L) ... </localVarArr>
         <methodStmts> ... I |-> fstore I5:Int ... </methodStmts>
         

    //-------dstore_<n>-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>    
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>     
         <localVarArr> ... 0 |-> (I2:Id , I3:CValue , _) => 0 |-> (I2 , I3 , L) ... </localVarArr>
         <methodStmts> ... I |-> dstore_0 ... </methodStmts>
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>    
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 1 |-> (I2:Id , I3:CValue , _) => 1 |-> (I2 , I3 , L) ... </localVarArr>
         <methodStmts> ... I |-> dstore_1 ... </methodStmts>
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>    
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 2 |-> (I2:Id , I3:CValue , _) => 2 |-> (I2 , I3 , L) ... </localVarArr>
         <methodStmts> ... I |-> dstore_2 ... </methodStmts>
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>    
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 3 |-> (I2:Id , I3:CValue , _) => 3 |-> (I2 , I3 , L) ... </localVarArr>
         <methodStmts> ... I |-> dstore_3 ... </methodStmts>
         

    //-------dstore-------
    
    rule <pc> I:Int => I +Int 2 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>     
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 2 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... I5 |-> (I2:Id , I3:CValue , _) => I5 |-> (I2 , I3 , L) ... </localVarArr>
         <methodStmts> ... I |-> dstore I5:Int ... </methodStmts>


    //-------astore_<n>-------
    
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>    
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>     
         <localVarArr> ... 0 |-> (I2:Id , I3:CValue , I4:Int) => 0 |-> (I2 , I3 , L) ... </localVarArr>
         <methodStmts> ... I |-> astore_0 ... </methodStmts>
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>    
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 1 |-> (I2:Id , I3:CValue , I4:Int) => 1 |-> (I2 , I3 , L) ... </localVarArr>
         <methodStmts> ... I |-> astore_1 ... </methodStmts>
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>    
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 2 |-> (I2:Id , I3:CValue , I4:Int) => 2 |-> (I2 , I3 , L) ... </localVarArr>
         <methodStmts> ... I |-> astore_2 ... </methodStmts>
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>    
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... 3 |-> (I2:Id , I3:CValue , I4:Int) => 3 |-> (I2 , I3 , L) ... </localVarArr>
         <methodStmts> ... I |-> astore_3 ... </methodStmts>
        
 
    //-------astore-------
    
    rule <pc> I:Int => I +Int 2 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... ListItem(L:Int) => . </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>     
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 2 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <localVarArr> ... I5 |-> (I2:Id , I3:CValue , I4:Int) => I5 |-> (I2 , I3 , L) ... </localVarArr>
         <methodStmts> ... I |-> astore I5:Int ... </methodStmts>
    

    //-------bipush-------
    
    rule <pc> I:Int => I +Int 2 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(I2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 2 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> bipush I2:Int ... </methodStmts>


    //-------sipush-------
    
    rule <pc> I:Int => I +Int 3 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(I2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 3 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> sipush I2:Int ... </methodStmts>


    //-------ldc-------

    rule <pc> I:Int => I +Int 2 </pc>
         <k> runInstruction ... </k>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <operandStack> ... . => ListItem(F) </operandStack>
         <frameMethod> C5:CValue : C6:CValue </frameMethod>
         <methodNameType> C5 : C6 </methodNameType>
         <frameStack> ... S |-> (I , C , C5 , C6) => S |-> (I +Int 2 , C , C5 , C6) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <cpoolVals> ... C1 |-> F:Float ... </cpoolVals>
         <methodStmts> ... I |-> ldc C1:CIndex ... </methodStmts>

    rule <pc> I:Int => I +Int 2 </pc>
         <k> runInstruction ... </k>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <operandStack> ... . => ListItem(F) </operandStack>
         <frameMethod> C5:CValue : C6:CValue </frameMethod>
         <methodNameType> C5 : C6 </methodNameType>
         <frameStack> ... S |-> (I , C , C5 , C6) => S |-> (I +Int 2 , C , C5 , C6) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <cpoolVals> ... C1 |-> F:Int ... </cpoolVals>
         <methodStmts> ... I |-> ldc C1:CIndex ... </methodStmts>


    //-------ldc_w-------

    rule <pc> I:Int => I +Int 3 </pc>
         <k> runInstruction ... </k>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <operandStack> ... . => ListItem(F) </operandStack>
         <frameMethod> C5:CValue : C6:CValue </frameMethod>
         <methodNameType> C5 : C6 </methodNameType>
         <frameStack> ... S |-> (I , C , C5 , C6) => S |-> (I +Int 3 , C , C5 , C6) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <cpoolVals> ... C1 |-> F:Float ... </cpoolVals>
         <methodStmts> ... I |-> ldc_w C1:CIndex ... </methodStmts>

    rule <pc> I:Int => I +Int 3 </pc>
         <k> runInstruction ... </k>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <operandStack> ... . => ListItem(F) </operandStack>
         <frameMethod> C5:CValue : C6:CValue </frameMethod>
         <methodNameType> C5 : C6 </methodNameType>
         <frameStack> ... S |-> (I , C , C5 , C6) => S |-> (I +Int 3 , C , C5 , C6) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <cpoolVals> ... C1 |-> F:Int ... </cpoolVals>
         <methodStmts> ... I |-> ldc_w C1:CIndex ... </methodStmts>

    
    //-------ldc2_w-------

    rule <pc> I:Int => I +Int 3 </pc>
         <k> runInstruction ... </k>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <operandStack> ... . => ListItem(F) </operandStack>
         <frameMethod> C5:CValue : C6:CValue </frameMethod>
         <methodNameType> C5 : C6 </methodNameType>
         <frameStack> ... S |-> (I , C , C5 , C6) => S |-> (I +Int 3 , C , C5 , C6) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <cpoolVals> ... C1 |-> F:Float ... </cpoolVals>
         <methodStmts> ... I |-> ldc2_w C1:CIndex ... </methodStmts>

    rule <pc> I:Int => I +Int 3 </pc>
         <k> runInstruction ... </k>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <operandStack> ... . => ListItem(F) </operandStack>
         <frameMethod> C5:CValue : C6:CValue </frameMethod>
         <methodNameType> C5 : C6 </methodNameType>
         <frameStack> ... S |-> (I , C , C5 , C6) => S |-> (I +Int 3 , C , C5 , C6) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <cpoolVals> ... C1 |-> F:Int ... </cpoolVals>
         <methodStmts> ... I |-> ldc2_w C1:CIndex ... </methodStmts>


    //-------iconst_<n>-------    
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(0) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> iconst_0 ... </methodStmts>
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(1) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> iconst_1 ... </methodStmts>
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(2) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> iconst_2 ... </methodStmts>
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(3) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> iconst_3 ... </methodStmts>
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(4) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> iconst_4 ... </methodStmts>
              
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(5) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> iconst_5 ... </methodStmts>
    

    //-------lconst_<n>-------    
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(0) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> lconst_0 ... </methodStmts>
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(1) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> lconst_1 ... </methodStmts>


    //-------fconst_<n>-------    
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(0.0) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> fconst_0 ... </methodStmts>
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(1.0) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> fconst_1 ... </methodStmts>

    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(2.0) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> fconst_2 ... </methodStmts>


    //-------dconst_<n>-------    
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(0.0) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> dconst_0 ... </methodStmts>
         
    rule <pc> I:Int => I +Int 1 </pc>
         <k> runInstruction ... </k>
         <operandStack> ... . => ListItem(1.0) </operandStack>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <frameStack> ... S |-> (I , C , C1 , C2) => S |-> (I +Int 1 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
         <methodStmts> ... I |-> dconst_1 ... </methodStmts>

endmodule

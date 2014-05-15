require "jvm-syntax.k"
require "jvm-configuration.k"

module JVM-SEMANTICS-COMMON
    imports JVM-SYNTAX
    imports JVM-CONFIGURATION
    
    rule (C1:Classes C2:Classes) => C1 ~> C2        [structural]

    rule trimTail(Str:String, Count:Int) => substrString(Str, 0, lengthString(Str) -Int Count)

    rule trimFront(Str:String, Count:Int) => substrString(Str, 0 +Int Count, lengthString(Str))

    rule getTail(Str:String, Count:Int) => substrString(Str, lengthString(Str) -Int Count, lengthString(Str))
    
    rule <k> (I1:ClassInfo1 C:ClassDecl I2:ClassInfo2 C1:ClassFlagsAccess C2:CPool { F:Fields M:Methods }) => 
                    C ~> I1 ~> I2 ~> C1 ~> C2 ~> F ~> M ... </k>        [structural]
         
    rule <k> (I1:ClassInfo1 C:ClassDecl I2:ClassInfo2 C1:ClassFlagsAccess C2:CPool { M:Methods }) => 
                    C ~> I1 ~> I2 ~> C1 ~> C2 ~> M ... </k>        [structural] 
         
    rule <k> initialize => . ... </k>
         <frameStack> . </frameStack>
         <frames> ... (. => <frame>
                                <localVarArr> . </localVarArr>
                                <operandStack> . </operandStack>
                                <refs>
                                    <frameClass> . </frameClass>
                                    <frameMethod> . </frameMethod>
                                </refs>
                            </frame>) 
                ... </frames>

    rule <k> setupExecution => . ... </k>
         <frames> ... (. => <frame>
                                <localVarArr> . </localVarArr>
                                <operandStack> . </operandStack>
                                <refs>
                                    <frameClass> . </frameClass>
                                    <frameMethod> . </frameMethod>
                                </refs>
                            </frame>) 
                ... </frames>
         <crntFrame> S:Int => S +Int 1 </crntFrame>

    rule <k> classLoad => newObject(C2, I1) ... </k>
         <methodDecl> M:MainMethod </methodDecl>         
         <classDecl> C1:ClassModType C2:CValue </classDecl>
         <nextRefLoc> I1:Int => I1 +Int 1 </nextRefLoc>
         <heap> ... . => I1 |-> object(C2 , <envStack> . </envStack>) ... </heap>
        
    rule <k> mainConstructor => setMainReference ... </k>
         <heap> ... 1 |-> object(C3:CValue , <envStack> _ </envStack>) ... </heap>
         <frameMethod> _ => C3 : ( ) V </frameMethod>
         <methodNameType> C3 : ( ) V </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> _ => C </frameClass>
         <methodStmts> I:Int |-> O:InstructionOps I2:Int |-> O2:InstructionOps ... </methodStmts>
         <pc> _ => I </pc>
         <localVarTbl> T:Map </localVarTbl>
         <localVarArr> . => T </localVarArr>
         <crntClass> _ => . </crntClass>
         <crntMethod> _ => . </crntMethod>
         <crntField> _ => . </crntField>
         <frameStack> ... . => S |-> (0 , C , C3 , ( ) V) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
    
    rule <k> execute => runInstruction ... </k>
         <frameMethod> _ => C1:CValue : C2:CValue </frameMethod>
         <methodDecl> M:MainMethod </methodDecl>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> _ => C </frameClass>
         <methodStmts> I:Int |-> O:InstructionOps I2:Int |-> O2:InstructionOps ... </methodStmts>
         <pc> _ => I </pc>
         <localVarTbl> V:Map </localVarTbl>
         <localVarArr> . => V </localVarArr>
         <crntClass> _ => . </crntClass>
         <crntMethod> _ => . </crntMethod>
         <crntField> _ => . </crntField>
         <frameStack> ... . => S |-> (0 , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>
        
 
    //---------------rewrite local variable array-----------------

    rule <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <localVarArr> ... I:Int |-> (I1:Int , I3:Int , I4:Id , I5:CValue) => 
                I |-> (I4 , I5 , -1000) ...  </localVarArr>
         <frameStack> ... S |-> (_ , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>

    rule <k> setMainReference => . ... </k>
         <frameMethod> C1:CValue : C2:CValue </frameMethod>
         <methodNameType> C1 : C2 </methodNameType>
         <classDecl> C:ClassDecl </classDecl>
         <frameClass> C </frameClass>
         <localVarArr> ... I:Int |-> (I4:Id , I5:CValue , -1000) => I |-> (I4 , I5 , 1) ...  </localVarArr>
         <frameStack> ... S |-> (_ , C , C1 , C2) ... </frameStack>
         <crntFrame> S:Int </crntFrame>


    //---------------add new stack frame-----------------
         
    rule <k> addFrame (C:ClassDecl , C2:CValue , C3:CValue) => . ... </k>
         <frames> ... (. => <frame>
                                <localVarArr> V </localVarArr>
                                <operandStack> . </operandStack>
                                <refs>
                                    <frameClass> C </frameClass>
                                    <frameMethod> C2 : C3 </frameMethod>
                                </refs>
                            </frame>) 
                ... </frames>
         <methodNameType> C2 : C3 </methodNameType>
         <classDecl> C </classDecl>
         <localVarTbl> V:Map </localVarTbl>
         <frameStack> ... . => F +Int 1 |-> (0 , C , C2 , C3) ... </frameStack>
         <crntFrame> F:Int => F +Int 1 </crntFrame>
         <pc> _ => 0 </pc>


    //---------------create heap locations-----------------

    rule <classDecl> C:ClassModType C1 </classDecl>
         <k> newObject (C1:CValue , I:Int) => . ... </k>
         <env> X:Map </env>
         <heap> ... I |-> object(_ , <envStack> ... . => (C1 , <env> X </env>) </envStack>) ... </heap>    

    rule <classDecl> C:ClassModType C1 extends C2:Id </classDecl>
         <k> newObject (C1:CValue , I:Int) => newObject(C2, I) ... </k>
         <env> X:Map </env>
         <heap> ... I |-> object(_ , <envStack> ... . => (C1 , <env> X </env>) </envStack>) ... </heap>    

    rule <k> ... . => addLocation(I1) </k>
         <heap> ... _ |-> object(_ , <envStack> ... (_ , <env> ... I:Id |-> undefined => 
                    I |-> I1 ... </env>) ... </envStack>) ... </heap>
         <nextRefLoc> I1:Int => I1 +Int 1 </nextRefLoc>

    rule <k> ... addLocation(I:Int) => . </k>
         <heap> ... . => I |-> 0 ... </heap>


    //---------------search special class-----------------

    rule <classDecl> C:ClassModType C2 </classDecl>
         <k> searchClassSpecial (C2:CValue , C3:CValue , C4:CValue, I:Int , C5:ClassDecl , C6:CValue , C7:CValue) => 
                    addFrame (C C2, C2 , C4 , I , C5 , C6 , C7) ... </k>

    rule <classDecl> C:ClassModType C2 extends C5:CValue </classDecl>
         <k> searchClassSpecial (C2:CValue , C3:CValue , C4:CValue, I:Int , C6:ClassDecl , C7:CValue , C8:CValue) => 
                    addFrame (C C2 extends C5, C2 , C4, I , C6 , C7 , C8) ... </k>


    //---------------add new stack frame (constructor)-----------------
         
    rule <k> addFrame (C:ClassDecl , C2:CValue , C3:CValue , I:Int , C5:ClassDecl , C6:CValue , C7:CValue) => 
                    getReferences (C , C2 , C3 , I1 , C5 , C6 , C7) ... </k>
         <frames> ... (. => <frame>
                                <localVarArr> V </localVarArr>
                                <operandStack> . </operandStack>
                                <refs>
                                    <frameClass> C </frameClass>
                                    <frameMethod> C2 : C3 </frameMethod>
                                </refs>
                            </frame>) 
                ... </frames>
         <methodNameType> C2 : C3 </methodNameType>
         <classDecl> C </classDecl>
         <metaInfo> ... args_size |-> I1:Int ... </metaInfo>
         <localVarTbl> V:Map </localVarTbl>
         <frameStack> ... . => F +Int 1 |-> (0 , C , C2 , C3) ... </frameStack>
         <crntFrame> F:Int => F +Int 1 </crntFrame>

         
    //---------------set/get reference-----------------
    
    rule <frameClass> C5 </frameClass>
         <frameMethod> C6 : C7 </frameMethod>
         <operandStack> ... ListItem(I1) => . </operandStack>
         <k> getReferences (C:ClassDecl , C2:CValue , C3:CValue , I:Int , C5:ClassDecl , C6:CValue , C7:CValue) => 
                    setReference (C , C2 , C3 , I -Int 1, C5 , C6 , C7 , I1) ... </k>


    rule <frameClass> C5 </frameClass>
         <frameMethod> C6 : C7 </frameMethod>
         <operandStack> ... ListItem(I1) => . </operandStack>
         <k> getReference (C:ClassDecl , C2:CValue , C3:CValue , I:Int , C5:ClassDecl , C6:CValue , C7:CValue , I2:Int) => 
                    setReference (C , C2 , C3 , I -Int 1, C5 , C6 , C7 , I1) ... </k>

    rule <frameClass> C </frameClass>
         <frameMethod> C2 : C3 </frameMethod>
         <k> setReference (C:ClassDecl , C2:CValue , C3:CValue , I:Int , C5:ClassDecl , C6:CValue , C7:CValue , I1:Int) => 
                    getReference(C , C2 , C3 , I , C5 , C6 , C7 , I1) ... </k>
         <localVarArr> ... I |-> (I4:Id , I5:CValue , I6:Int) => I |-> (I4 , I5 , I1) ... </localVarArr>
         when I =/=Int 0

    rule <frameClass> C </frameClass>
         <frameMethod> C2 : C3 </frameMethod>
         <k> setReference (C:ClassDecl , C2:CValue , C3:CValue , I:Int , C5:ClassDecl , C6:CValue , C7:CValue , I1:Int) => . ... </k>
         <localVarArr> ... I |-> (I4:Id , I5:CValue , I6:Int) => I |-> (I4 , I5 , I1) ... </localVarArr>
         <pc> _ => 0 </pc>
         when I ==Int 0


    //---------------search virtual class-----------------

    rule <classDecl> C:ClassModType C2 </classDecl>
         <k> searchClassVirtual (C2:CValue , C3:CValue , C4:CValue, I:Int , C5:ClassDecl , C6:CValue , C7:CValue) => 
                    addFrame (C C2, C3 , C4, I , C5 , C6 , C7) ... </k>

endmodule

require "jvm-semantics-common.k"

module JVM-SEMANTICS-CONSTANT-POOL
    imports JVM-SEMANTICS-COMMON

    rule C1:CItems C2:CItems => C1 ~> C2        [structural]
    
    rule <k> Constant pool : C:CItems => C ... </k>

    rule <k> I:CIndex = C1:CType C2:CValue => . ... </k>
         <crntClass> C:ClassDecl </crntClass>
         <classDecl> C </classDecl>
         <cpoolStmts> ... . => I |-> C1 . C2 </cpoolStmts>
         <cpoolVals> ... . => I |-> C2 </cpoolVals>    

    rule <k> I:CIndex = C1:CType => . ... </k>
         <crntClass> C:ClassDecl </crntClass>
         <classDecl> C </classDecl>
    
    rule <cpoolStmts> ... I:CIndex |-> U:CType . I2:CValue => I |-> U . I2 ... </cpoolStmts>
         <cpoolVals> ... I3:CIndex |-> I => I3 |-> I2  ... </cpoolVals>
         <crntClass> C:ClassDecl </crntClass>
         <classDecl> C </classDecl>
         
    rule <cpoolStmts> ... I:CIndex |-> U:CType . I2:CValue => I |-> U . I2 ... </cpoolStmts>
         <cpoolVals> ... I3:CIndex |-> I : I4:CIndex => I3 |-> I2 : I4 ... </cpoolVals>
         <crntClass> C:ClassDecl </crntClass>
         <classDecl> C </classDecl>
         
    rule <cpoolStmts> ... I:CIndex |-> U:CType . I2:CValue => I |-> U . I2 ... </cpoolStmts>
         <cpoolVals> ... I3:CIndex |-> I4:CValue : I => I3 |-> I4 : I2 ... </cpoolVals>
         <crntClass> C:ClassDecl </crntClass>
         <classDecl> C </classDecl>
         
    rule <cpoolStmts> ... I:CIndex |-> (U:CType . I2:CValue) => I |-> (U . I2) ... </cpoolStmts>
         <cpoolVals> ... I3:CIndex |-> (I . I4:CValue) => I3 |-> (I2 . I4) ... </cpoolVals>
         <crntClass> C:ClassDecl </crntClass>
         <classDecl> C </classDecl>
         
    rule <cpoolStmts> ... I:CIndex |-> U:CType . I2:CValue => I |-> U . I2 ... </cpoolStmts>
         <cpoolVals> ... I3:CIndex |-> (I4:CValue . (I : I5:CIndex)) => I3 |-> (I4 . (I2 : I5)) ... </cpoolVals>
         <crntClass> C:ClassDecl </crntClass>
         <classDecl> C </classDecl>
    
    rule <cpoolStmts> ... I:CIndex |-> U:CType . I2:CValue => I |-> U . I2 ... </cpoolStmts>
         <cpoolVals> ... I3:CIndex |-> (I4:CValue . I) => I3 |-> (I4 . I2) ... </cpoolVals>
         <crntClass> C:ClassDecl </crntClass>
         <classDecl> C </classDecl>
         
    rule <cpoolStmts> ... I:CIndex |-> U:CType . I2:CValue => I |-> U . I2 ... </cpoolStmts>
         <cpoolVals> ... I3:CIndex |-> (I4:CValue . (I5:CValue : I)) => I3 |-> (I4 . (I5 : I2)) ... </cpoolVals>
         <crntClass> C:ClassDecl </crntClass>
         <classDecl> C </classDecl>    

    rule <cpoolVals> ... I:CIndex |-> I1:TFloat => 
            I |-> String2Float(trimTail(#tokenToString(I1), 1)) ... </cpoolVals>     

    rule <cpoolVals> ... I:CIndex |-> I1:TLong => 
            I |-> String2Int(trimTail(#tokenToString(I1), 1)) ... </cpoolVals>    

    rule <cpoolVals> ... I:CIndex |-> I1:TDouble => 
            I |-> String2Float(trimTail(#tokenToString(I1), 1)) ... </cpoolVals>
endmodule

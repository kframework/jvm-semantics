require "jvm-semantics-common.k"

module JVM-SEMANTICS-METHODS
    imports JVM-SEMANTICS-COMMON

    rule (M1:Methods M2:Methods) => M1 ~> M2        [structural]

    rule (M1:MethodDeclaration M2:MethodInfo) => M1 ~> M2       [structural]
    
    rule (M1:MethodDeclaration M2:MethodInfo Code : M4:MethodProperties I:Instructions 
            LineNumberTable : L:LinesNumberTable) => M1 ~> M2 ~> M4 ~> I ~> L        [structural]

    rule (M1:MethodDeclaration M2:MethodInfo Code : M4:MethodProperties I:Instructions LineNumberTable : 
            L:LinesNumberTable LocalVariableTable : L2:LocalVariableTable) => 
            M1 ~> M2 ~> M4 ~> I ~> L ~> L2        [structural]
    
    rule (M1:MethodDeclaration M2:MethodInfo Code : M4:MethodProperties I:Instructions LineNumberTable : 
            L:LinesNumberTable LocalVariableTable : L2:LocalVariableTable StackMapTable : S:StackMapTable) => 
            M1 ~> M2 ~> M4 ~> I ~> L ~> L2 ~> S    [structural]


    rule <k> (M1:MethodModType I:CValue M2:MethodArg ;) => . ... </k>
        <methods> ... (. => <method>
                                <methodDecl> M1 I M2 ; </methodDecl>
                                <methodNameType> I </methodNameType>
                                <methodFlags> . </methodFlags>
                                <code>
                                    <metaInfo> . </metaInfo>
                                    <methodStmts> . </methodStmts>
                                    <lineNoTbl> . </lineNoTbl>
                                    <localVarTbl> . </localVarTbl>
                                    <stackMapTbl> . </stackMapTbl>
                                </code>
                            </method>) 
                ... </methods>    
        <crntClass> C1:ClassDecl </crntClass>
        <classDecl> C1 </classDecl>
        <crntMethod> _ => M1 I M2 ; </crntMethod>

    rule <k> I:TId M2:MethodArg ; => . ... </k>
        <methods> ... (. => <method>
                                <methodDecl> I M2 ; </methodDecl>
                                <methodNameType> I </methodNameType>
                                <methodFlags> . </methodFlags>
                                <code>
                                    <metaInfo> . </metaInfo>
                                    <methodStmts> . </methodStmts>
                                    <lineNoTbl> . </lineNoTbl>
                                    <localVarTbl> . </localVarTbl>
                                    <stackMapTbl> . </stackMapTbl>
                                </code>
                            </method>) 
                ... </methods>    
        <crntClass> C1:ClassDecl </crntClass>
        <classDecl> C1 </classDecl>
        <crntMethod> _ => I M2 ; </crntMethod>    

    rule <k> static {}; => . ... </k>
        <methods> ... (. => <method>
                                <methodDecl> static {}; </methodDecl>
                                <methodNameType> static </methodNameType>
                                <methodFlags> . </methodFlags>
                                <code>
                                    <metaInfo> . </metaInfo>
                                    <methodStmts> . </methodStmts>
                                    <lineNoTbl> . </lineNoTbl>
                                    <localVarTbl> . </localVarTbl>
                                    <stackMapTbl> . </stackMapTbl>
                                </code>
                            </method>) 
                ... </methods>    
        <crntClass> C1:ClassDecl </crntClass>
        <classDecl> C1 </classDecl>
        <preparation> ... . => prepare(C1) ... </preparation>
        <crntMethod> _ => static {}; </crntMethod>
    
    rule <k> Signature : C:CValue flags : M:MethodFlags => M ... </k>
         <crntClass> C1:ClassDecl </crntClass>
         <crntMethod> M2:MethodDeclaration </crntMethod>
         <methodDecl> M2 </methodDecl>
         <classDecl> C1 </classDecl>
         <methodNameType> N:CValue => N : C </methodNameType>
         <implMethods> ... . => SetItem(N : C) ... </implMethods>

    rule <k> Signature : C:CValue flags : => . ... </k>
         <crntClass> C1:ClassDecl </crntClass>
         <crntMethod> M2:MethodDeclaration </crntMethod>
         <methodDecl> M2 </methodDecl>
         <classDecl> C1 </classDecl>
         <methodNameType> N:CValue => N : C </methodNameType>
         <implMethods> ... . => SetItem(N : C) ... </implMethods>
    
    rule M1:MethodFlag , M2:MethodFlags => M1 ~> M2        [structural]
    
    rule <k> C:MethodFlag => . ... </k>
         <crntClass> C1:ClassDecl </crntClass>
         <crntMethod> M2:MethodDeclaration </crntMethod>
         <methodDecl> M2 </methodDecl>
         <classDecl> C1 </classDecl>
         <methodFlags> ... . => SetItem(C) ... </methodFlags>        
            
    rule M1:MethodProperty, M2:MethodProperty, M3:MethodProperty => M1 ~> M2 ~> M3        [structural]
    
    rule <k> P:PropertyType = I:Int => . ... </k>
         <crntClass> C1:ClassDecl </crntClass>
         <crntMethod> M2:MethodDeclaration </crntMethod>
         <methodDecl> M2 </methodDecl>
         <classDecl> C1 </classDecl>
         <metaInfo> ... . => P |-> I </metaInfo>
         
    rule (I1:Instructions I2:Instructions) => I1 ~> I2    [structural]
         
    rule <k> I:Int : O:InstructionOps => . ... </k>
         <crntClass> C1:ClassDecl </crntClass>
         <crntMethod> M2:MethodDeclaration </crntMethod>
         <methodDecl> M2 </methodDecl>
         <classDecl> C1 </classDecl>
         <methodStmts> ... . => I |-> O </methodStmts>
         
    rule L1:LinesNumberTable L2:LinesNumberTable => L1 ~> L2    [structural]
    
    rule <k> line I1:Int : I2:Int => . ... </k>
         <crntClass> C1:ClassDecl </crntClass>
         <crntMethod> M2:MethodDeclaration </crntMethod>
         <methodDecl> M2 </methodDecl>
         <classDecl> C1 </classDecl>
         <lineNoTbl> ... . => I1 |-> I2 </lineNoTbl>
         
    rule <k> S:StackMapTable => . ... </k>
         <crntClass> C1:ClassDecl </crntClass>
         <crntMethod> M2:MethodDeclaration </crntMethod>
         <methodDecl> M2 </methodDecl>
         <classDecl> C1 </classDecl>
         <stackMapTbl> _ => S </stackMapTbl>
         
    rule <k> T:TableHeader L:LocalVariables => L ... </k>
    
    rule (L1:LocalVariables L2:LocalVariables) => L1 ~> L2        [structural]
    
    rule <k> (I1:Int I2:Int I3:Int I4:Id I5:CValue) => . ... </k>
         <crntClass> C1:ClassDecl </crntClass>
         <crntMethod> M2:MethodDeclaration </crntMethod>
         <methodDecl> M2 </methodDecl>
         <classDecl> C1 </classDecl>
         <localVarTbl> ... . => I3 |-> (I1 , I2 , I4 , I5) </localVarTbl>

endmodule

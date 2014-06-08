require "jvm-semantics-common.k"

module JVM-SEMANTICS-CLASSES
    imports JVM-SEMANTICS-COMMON

    rule <k> C:ClassDecl => . ... </k>
         <classes> ... (. => <class>
                                <classDecl> C </classDecl>
                                <classInfo> . </classInfo>
                                <classFlags> . </classFlags>
                                <staticFields> . </staticFields>
                                <implMethods> . </implMethods>
                                <cpool>
                                    <cpoolStmts> . </cpoolStmts>
                                    <cpoolVals> . </cpoolVals>
                                </cpool>
                                <methods> . </methods>
                                <fields> . </fields>
                                <env> . </env>
                             </class>) 
                   ... </classes>
         <crntClass> _ => C </crntClass>
    
    rule <k> flags : C:ClassFlags => C ... </k>     
         
    rule C1:ClassFlag , C2:ClassFlags => C1 ~> C2        [structural]
    
    rule <k> C:ClassFlag => . ... </k>
         <crntClass> C2:ClassDecl </crntClass>
         <classDecl> C2 </classDecl>
         <classFlags> ... . => SetItem(C) ... </classFlags>        

    rule (C:Classfile M:Modified M1:MDFive C1:Compiled) => C ~> M ~> M1 ~> C1        [structural]    

    rule <k> Classfile C:CValue => . ... </k>
         <crntClass> C1:ClassDecl </crntClass>
         <classDecl> C1 </classDecl>
         <classInfo> ... . => classfile |-> C ... </classInfo>

    rule <k> Last modified I:Id I1:Int , I2:Int ; size I3:Int bytes => . ... </k>
         <crntClass> C1:ClassDecl </crntClass>
         <classDecl> C1 </classDecl>
         <classInfo> ... . => last_modified |-> (I , I1 , I2) ... </classInfo>

    rule <k> MD5 checksum I:TChecksum => . ... </k>
         <crntClass> C1:ClassDecl </crntClass>
         <classDecl> C1 </classDecl>
         <classInfo> ... . => md5_checksum |-> I ... </classInfo>

    rule <k> Compiled from S:String => . ... </k>
         <crntClass> C1:ClassDecl </crntClass>
         <classDecl> C1 </classDecl>
         <classInfo> ... . => compiled_from |-> S ... </classInfo>

    rule (S:SourceFile M:MinorVersion M1:MajorVersion) => S ~> M ~> M1        [structural]

    rule (S:SourceFile InnerClasses : I:InnerClassInfo M:MinorVersion M1:MajorVersion) => 
                S ~> I ~> M ~> M1        [structural]

    rule (S:SourceFile EnclosingMethod : C:CValue InnerClasses : I:InnerClassInfo M:MinorVersion M1:MajorVersion) => 
                S ~> EnclosingMethod : C ~> I ~> M ~> M1        [structural]

    rule <k> SourceFile : S:String => . ... </k>
         <crntClass> C1:ClassDecl </crntClass>
         <classDecl> C1 </classDecl>
         <classInfo> ... . => sourcefile |-> S ... </classInfo>

    rule <k> minor version : I:Int => . ... </k>
         <crntClass> C1:ClassDecl </crntClass>
         <classDecl> C1 </classDecl>
         <classInfo> ... . => minor_version |-> I ... </classInfo>

    rule <k> major version : I:Int => . ... </k>
         <crntClass> C1:ClassDecl </crntClass>
         <classDecl> C1 </classDecl>
         <classInfo> ... . => major_version |-> I ... </classInfo>

    rule <k> I:InnerClassInfo => . ... </k>
         <crntClass> C1:ClassDecl </crntClass>
         <classDecl> C1 </classDecl>
         <classInfo> ... . => inner_class |-> I ... </classInfo>

    rule (I1:InnerClassInfo I2:InnerClassInfo) => I1 ~> I2    [structural]

    rule <k> EnclosingMethod : C2:CValue => . ... </k>
         <crntClass> C1:ClassDecl </crntClass>
         <classDecl> C1 </classDecl>
         <classInfo> ... . => enclosing_method |-> C2 ... </classInfo>

endmodule

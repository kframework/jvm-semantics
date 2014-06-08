require "jvm-semantics-common.k"

module JVM-SEMANTICS-FIELDS
    imports JVM-SEMANTICS-COMMON

    rule (F1:Fields F2:Fields) => F1 ~> F2        [structural]

    rule (F1:FieldDeclaration F2:FieldSignature flags :) => F1        [structural]
    
    rule (F1:FieldDeclaration F2:FieldSignature flags : F3:FieldFlags) => F1 ~> F3        [structural]

    rule (F1:FieldDeclaration F2:FieldSignature flags : F4:FConstVal) => F1 ~> F4        [structural]
    
    rule (F1:FieldDeclaration F2:FieldSignature flags : F3:FieldFlags F4:FConstVal) => F1 ~> F3 ~> F4        [structural]
    
    rule <k> F:NonStaticFieldModifier F1:FieldId ; => . ... </k>
        <fields> ... (. => <field>
                                <fieldDecl> F F1 ;</fieldDecl>
                                <fieldFlags> . </fieldFlags>
                                <constVal> . </constVal>
                            </field>) 
                ... </fields>
        <crntClass> C1:ClassDecl </crntClass>
        <classDecl> C1 </classDecl>
        <crntField> _ => F F1 ;</crntField>
        <env> ... . => F1 |-> undefined ... </env>

    rule <k> F:StaticFieldModifier F1:FieldId ; => . ... </k>
        <fields> ... (. => <field>
                                <fieldDecl> F F1 ;</fieldDecl>
                                <fieldFlags> . </fieldFlags>
                                <constVal> . </constVal>
                            </field>) 
                ... </fields>
        <crntClass> C1:ClassDecl </crntClass>
        <classDecl> C1 </classDecl>
        <crntField> _ => F F1 ;</crntField>
        <staticFields> ... . => F1 |-> -1000 ... </staticFields>
    
    rule (F1:FieldFlag , F2:FieldFlag) => F1 ~> F2        [structural]

    rule (F1:FieldFlag , F2:FieldFlag , F3:FieldFlag) => F1 ~> F2 ~> F3        [structural]
    
    rule <k> F:FieldFlag => . ... </k>
         <crntClass> C1:ClassDecl </crntClass>
         <crntField> F2:FieldDeclaration </crntField>
         <fieldDecl> F2 </fieldDecl>
         <classDecl> C1 </classDecl>
         <fieldFlags> ... . => SetItem(F) ... </fieldFlags>
    
    rule <k> ConstantValue : F:FConstValAtt => . ... </k>
         <crntClass> C1:ClassDecl </crntClass>
         <crntField> F2:FieldDeclaration </crntField>
         <fieldDecl> F2 </fieldDecl>
         <classDecl> C1 </classDecl>
         <constVal> _ => F </constVal>

endmodule

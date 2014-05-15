require "jvm-semantics-common.k"

module JVM-CONFIGURATION
    imports JVM-SEMANTICS-COMMON

    configuration <t>
        <k color="green"> (initialize ~> $PGM:K ~> classLoad ~> mainConstructor ~> setupExecution ~> execute) </k>                    
        <pc> 0 </pc>
        <stack>        
            <frameStack> .Map </frameStack>
            <crntFrame> 0 </crntFrame>
            <frames>
                <frame multiplicity="*">
                    <localVarArr> .Map </localVarArr>
                    <operandStack> .List </operandStack>
                    <refs>
                        <frameClass> .K </frameClass>
                        <frameMethod> .K </frameMethod>
                    </refs>
                </frame>
            </frames>
        </stack>
        <heap> .Map </heap>
        <envStack> .List </envStack>
        <nextRefLoc> 1 </nextRefLoc>
        <crntClass> .K </crntClass>
        <crntMethod> .K </crntMethod>
        <crntField> .K </crntField>
        <classes>
            <class multiplicity="*" color="red">
                <classDecl> .K </classDecl>
                <classInfo> .Map </classInfo>
                <classFlags> .Set </classFlags>
                <env> .Map </env>
                <cpool color="blue">
                    <cpoolStmts> .Map </cpoolStmts>
                    <cpoolVals> .Map </cpoolVals>
                </cpool>
                <fields>
                    <field multiplicity="*" color="violet">
                        <fieldDecl> .K </fieldDecl>
                        <fieldFlags> .Set </fieldFlags>
                        <constVal> .K </constVal>
                    </field>
                </fields>
                <methods>
                    <method multiplicity="*" color="cyan">
                        <methodDecl> .K </methodDecl>
                        <methodNameType> .K </methodNameType>
                        <methodFlags> .Set </methodFlags>
                        <code>
                            <metaInfo> .Map </metaInfo>
                            <methodStmts> .Map </methodStmts>
                            <lineNoTbl> .Map </lineNoTbl>
                            <localVarTbl> .Map </localVarTbl>
                            <stackMapTbl> .K </stackMapTbl>
                        </code>
                    </method>
                </methods>
            </class>
        </classes>
    </t>    

endmodule                  

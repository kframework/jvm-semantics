require "jvm-semantics-common.k"

module JVM-CONFIGURATION
    imports JVM-SEMANTICS-COMMON

    configuration <t>
        <k color="green"> (initialize ~> $PGM:K ~> preparation ~> classLoad ~> 
                mainConstructor ~> setupExecution ~> execute) </k>  
        <crntClass> .K </crntClass>
        <crntMethod> .K </crntMethod>
        <crntField> .K </crntField>                  
        <pc> 0 </pc>
        <nextRefLoc> 1 </nextRefLoc>     
        <preparation> .K </preparation>
        <envStack> .List </envStack>
        <localVarTblCnt> 0 </localVarTblCnt>
        <tempOperandStack> .List </tempOperandStack>
        <classes>
            <class multiplicity="*" color="red">
                <classDecl> .K </classDecl>
                <classInfo> .Map </classInfo>
                <classFlags> .Set </classFlags>
                <env> .Map </env>
                <staticFields> .Map </staticFields>
                <implMethods> .Set </implMethods>
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
    </t>    

endmodule                  

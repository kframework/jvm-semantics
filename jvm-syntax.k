module JVM-SYNTAX

    syntax Classes ::= Class
                    | Classes Classes        [left]

    syntax Class ::= ClassInfo1 ClassDecl ClassInfo2 ClassFlagsAccess CPool "{" Fields Methods "}"
                | ClassInfo1 ClassDecl ClassInfo2 ClassFlagsAccess CPool "{" Methods "}"



    //------------------------------class info------------------------------

    syntax Classfile ::= "Classfile" CValue

    syntax Modified ::= "Last" "modified" Id Int "," Int ";" "size" Int "bytes"

    syntax TChecksum ::= ChecksumToken | Id

    syntax ChecksumToken ::= Token{[0-9][0-9a-f]+}

    syntax MDFive ::= "MD5" "checksum" TChecksum

    syntax Compiled ::= "Compiled" "from" String

    syntax ClassInfo1 ::= Classfile Modified MDFive Compiled

    syntax SourceFile ::= "SourceFile" ":" String

    syntax MinorVersion ::= "minor" "version" ":" Int

    syntax MajorVersion ::= "major" "version" ":" Int

    syntax ClassInfo2 ::= SourceFile MinorVersion MajorVersion
                        | SourceFile InnerClasses MinorVersion MajorVersion
                        | SourceFile "EnclosingMethod" ":" CValue InnerClasses MinorVersion MajorVersion

    syntax InnerClasses ::= "InnerClasses" ":" InnerClassInfo

    syntax InnerClassInfo ::= Modifier "static" CIndex "=" CIndex "of" CIndex ";"
                            | CIndex "=" CIndex ";"
                            | "static" CIndex ";"
                            | InnerClassInfo InnerClassInfo        [left] 


    
    //------------------------------instructions------------------------------
    
    syntax InstructionOps ::= Opcode | Opcode Operand
    
    syntax Instruction ::= Int ":" InstructionOps
                    
    syntax Opcode ::= "aaload" | "aastore" | "anewarray" | "arraylength" | "baload" | "bastore"
                    | "caload" | "castore" | "multianewarray" | "newarray"                                
                    | "d2f" | "d2i" | "d2l" | "dadd" | "daload"    | "dastore"    | "dcmpg" | "dcmpl" 
                    | "dconst_0" | "dconst_1" | "ddiv" | "dload" | "dload_0" | "dload_1" | "dload_2" 
                    | "dload_3" | "dmul" | "dneg" | "drem" | "dreturn" | "dstore" 
                    | "dstore_0" | "dstore_1" | "dstore_2" | "dstore_3" | "dsub"                 
                    | "f2d" | "f2i" | "f2l" | "fadd" | "faload" | "fastore" | "fcmpl" | "fcmpg" 
                    | "fconst_0" | "fconst_1" | "fconst_2" | "fdiv" | "fload" | "fload_0" | "fload_1" 
                    | "fload_2" | "fload_3" | "fmul" | "fneg" | "frem" | "freturn" | "fstore" 
                    | "fstore_0" | "fstore_1" | "fstore_2" | "fstore_3" | "fsub"
                    | "i2b" | "i2c" | "i2d" | "i2f" | "i2l" | "i2s" | "iadd" | "iaload" | "iand"
                    | "iastore" | "if_icmpge" | "if_icmpgt" | "if_icmple" | "if_icmplt" | "if_icmpne" 
                    | "if_icmpeq" | "iinc" | "iload" | "iload_0" | "iload_1" | "iload_2"
                    | "iload_3" | "imul" | "ineg" | "ior" | "irem" | "ireturn" | "ishl" | "ishr" 
                    | "istore" | "istore_0" | "istore_1" | "istore_2" | "istore_3" | "isub" | "iushr" 
                    | "ixor" | "sipush" | "idiv"
                    | "iconst_0" | "iconst_1" | "iconst_2" | "iconst_3" | "iconst_4" | "iconst_5" | "iconst_m1"               
                    | "ifeq" | "ifge" | "ifgt" | "ifle" | "iflt" | "ifne"            
                    | "l2d" | "l2f" | "l2i" | "ladd" | "laload" | "land" | "lastore" | "lcmp" | "lconst_0" 
                    | "lconst_1" | "ldc" | "ldc_w" | "ldc2_w" | "ldiv" | "lload" | "lload_0" | "lload_1" 
                    | "lload_2" | "lload_3"    | "lmul" | "lneg" | "lor" | "lrem" | "lreturn" | "lshl" | "lshr" 
                    | "lstore" | "lstore_0" | "lstore_1" | "lstore_2" | "lstore_3" | "lsub" | "lushr" | "lxor"            
                    | "aconst_null" | "athrow" | "bipush" | "checkcast" | "dup" | "dup_x1" | "dup_x2"    
                    | "dup2" | "dup2_x1" | "dup2_x2" | "getfield" | "getstatic" | "goto" | "goto_w"
                    | "instanceof" | "lookupswitch" | "new" | "nop" | "pop" | "pop2" | "putfield"
                    | "putstatic" | "return" | "swap" | "tableswitch" | "wide"
                    | "invokedynamic" | "invokeinterface" | "invokespecial" | "invokestatic" | "invokevirtual"                     
                    | "saload" | "sastore" | "areturn"      
                    | "aload" | "aload_0" | "aload_1" | "aload_2" | "aload_3" | "astore" | "astore_0" | "astore_1"
                    | "astore_2" | "astore_3" | "if_acmpne" | "if_acmpeq" | "ifnonnull" | "ifnull" | "monitorenter"    
                    | "monitorexit"    
                    
    syntax Operand ::= Int 
                    | CIndex
                    | Primitives
                    | Operand "," Operand    
                    
    syntax Instructions ::= Instruction
                        | Instructions Instructions                [left]
    


    //------------------------------class declaration------------------------------    

    syntax ClassDecl ::= ClassModType CValue
                    | ClassModType CValue ClassExtImpl

    syntax ClassModType ::= Modifier "class"
                        | "class"                        
                        | Modifier "abstract" "class"
                        | "abstract" "class"                
                        | Modifier "final" "class"
                        | "final" "class"
                        | Modifier "interface"
                        | "interface"
                        | Modifier "abstract" "interface"
                        | "abstract" "interface"

    syntax ClassExtImpl ::= "extends" CValue
                            | "implements" CValue
                            | "extends" CValue "implements" CValue
                    

    
    //------------------------------class flags------------------------------
    
    syntax CommonFlag ::= "ACC_PUBLIC" | "ACC_FINAL" | "ACC_ABSTRACT" | "ACC_SYNTHETIC" | "ACC_PRIVATE" 
                        | "ACC_PROTECTED" | "ACC_STATIC"

    syntax ClassFlags ::= ClassFlag
                 | ClassFlag "," ClassFlags
                 
    syntax ClassFlag ::= CommonFlag | "ACC_SUPER" | "ACC_INTERFACE" 
                        | "ACC_ANNOTATION" | "ACC_ENUM"
                 
    syntax ClassFlagsAccess ::= "flags" ":" ClassFlags    
    


    //------------------------------fields------------------------------    

    syntax FieldDeclaration ::= FieldModifierType FieldId ";"

    syntax FieldModifierType ::= StaticFieldModifier
                                | NonStaticFieldModifier

    syntax StaticFieldModifier ::= Modifier "static" Type
                                | Modifier "static" "final" Type
                                | "static" Type

    syntax NonStaticFieldModifier ::= Modifier Type
                                | Modifier "final" Type
                                | "final" Type
                                | Type

    syntax FType ::= Id | Int | String
    
    syntax FieldId ::= Id
                    | Id "=" FType
                    | FieldId "," FieldId        [left]
                    
    syntax FieldFlag ::= CommonFlag
                    
    syntax FieldFlags ::= FieldFlag
                        | FieldFlags "," FieldFlags        [left]
                    
    syntax FieldFlagsAccess ::= "flags" ":" FieldFlags
                            | "flags" ":"
    
    syntax FConstValAtt ::= Type FType
    
    syntax FConstVal ::= "ConstantValue" ":" FConstValAtt

    syntax FieldSignature ::= "Signature" ":" CValue
                    
    syntax Field ::= FieldDeclaration FieldSignature FieldFlagsAccess
                    | FieldDeclaration FieldSignature FieldFlagsAccess FConstVal

    syntax Fields ::= Field
                    | Fields Fields                [left]
    


    //------------------------------methods------------------------------                                                
    
    syntax Modifier ::= "private" | "public" | "protected"

    syntax Primitives ::= "int" | "boolean" | "short" | "void" | "byte"  | "char" | "float" | "double" | "long"
    
    syntax Type ::= Type "," Type        [left]
                    | Primitives | Id
    
    syntax MethodArg ::= "(" ")" | "(" CValue "[" "]" ")" | "(java.lang.String[])"
                        | "(" Id ")" | "(" Type ")"

    syntax MethodModType ::= Modifier Type
                            | Modifier "static" Type
                            | Modifier "abstract" Type
                            | Modifier "final" Type
                            | Modifier "static" "final" Type
                            | "static" "final" Type
                            | "static" Type
                            | "abstract" Type
                            | "final" Type
                            | Type
                            | Modifier

    syntax MethodDeclaration ::= TId MethodArg ";"
                                | "static" "{" "}" ";"
                                | MethodModType CValue MethodArg ";"
    
    syntax MethodInfo ::= MethodSignature MethodFlagsAccess
                    
    syntax Method ::= MethodDeclaration MethodInfo
                    | MethodDeclaration MethodInfo "Code" ":" MethodProperties 
                        Instructions "LineNumberTable" ":" LinesNumberTable
                    | MethodDeclaration MethodInfo "Code" ":" MethodProperties 
                        Instructions "LineNumberTable" ":" LinesNumberTable "LocalVariableTable" ":" LocalVariableTable
                    | MethodDeclaration MethodInfo "Code" ":" MethodProperties 
                        Instructions "LineNumberTable" ":" LinesNumberTable "LocalVariableTable" ":" 
                        LocalVariableTable "StackMapTable" ":" StackMapTable
                                            
    syntax Methods ::= Method
                    | Methods Methods        [left]
                    
    syntax MainStuff ::= "{" Methods "}"
    
    syntax MethodSignature ::= "Signature" ":" CValue
                    

    syntax MethodFlag ::= CommonFlag | "ACC_SYNCHRONIZED" 
                        | "ACC_BRIDGE" | "ACC_VARARGS" | "ACC_NATIVE"
                        | "ACC_STRICT"
    
    syntax MethodFlags ::= MethodFlag
                 | MethodFlags "," MethodFlags        [left]
                 
    syntax MethodFlagsAccess ::= "flags" ":" MethodFlags
                                | "flags" ":"
    
    syntax LineNumberTable ::= "line" Int ":" Int
    
    syntax LinesNumberTable ::= LineNumberTable
                              | LinesNumberTable LinesNumberTable        [left]
                        
    syntax PropertyType ::= "stack" | "locals" | "args_size"
                        
    syntax MethodProperty ::= PropertyType "=" Int
    
    syntax MethodProperties ::= MethodProperty
                                | MethodProperties "," MethodProperties        [left]
                    

            
    //------------------------------stack map table------------------------------
                                
    syntax StackMapTable ::= EntriesNumber Entries
    
    syntax EntriesNumber ::= "number_of_entries" "=" Int
    
    syntax Entries ::= Entry
                     | Entries Entries        [left]    
    
    syntax Entry ::= FrameType | OffsetDelta | VerificationLocals 
                   | VerificationStack | LocalsNumber | StackItemsNumber
    
    syntax Exp ::= Id | Primitives | "class" Id | "class" String
        
    syntax Exps ::= List{Exp," "}
    
    syntax StackMapExps ::= List{Exps ,","}
    
    syntax FrameType ::= "frame_type" "=" Int
    
    syntax OffsetDelta ::= "offset_delta" "=" Int    
    
    syntax VerificationLocals ::= "locals" "=" "[" StackMapExps "]" 
                                | "locals" "=" "[" "]"
    
    syntax VerificationStack ::=  "stack" "=" "[" StackMapExps "]"
                                | "stack" "=" "[" "]"                    
    
    syntax LocalsNumber ::="number_of_locals" "=" Int
    
    syntax StackItemsNumber ::= "number_of_stack_items" "=" Int
                    | "access" "$" Int
    

    
    //------------------------------local variable table------------------------------
        
    syntax LocalVariableTable ::= TableHeader LocalVariables
    
    syntax TableHeader ::= "Start" "Length" "Slot" "Name" "Signature"
    
    syntax LocalVariables ::= LocalVariable
                            | LocalVariables LocalVariables            [left]
                            
    syntax LocalVariable ::= Int Int Int Id CValue
    


    //------------------------------constant pool------------------------------
    
    syntax CommonType ::=  "Double" | "Float" | "Long" | "String" | "Integer" | "Class"
    
    syntax CType ::= "Fieldref" | "Methodref" | "InterfaceMethodref"
                    | "NameAndType" | "Utf8" | CommonType
                    
    syntax CPType ::= Id | CommonType
    
    syntax CIds ::= Id
                    | CIds "/" CPType
                    |"main" | "class"
                    | CIds ";"
                    | CIds "/" TId
                    | TId
                    | CIds ";" CPType        

    syntax TFloat ::= FloatToken

    syntax FloatToken ::= Token{[0-9]+[\.][0-9]+[E]*[0-9]*[f]}

    syntax TLong ::= LongToken

    syntax LongToken ::= Token{[0-9]+[l]}

    syntax TDouble ::= DoubleToken

    syntax DoubleToken ::= Token{[0-9]+[\.][0-9]+[d]}

    syntax TId ::= IdToken

    syntax IdToken ::= Token{[A-Za-z\_][A-Za-z0-9\_]*[\$][0-9]*[A-Za-z\_]*[A-Za-z0-9\_]*}
                        
    syntax CValue ::= CIds
                    | "/" CValue "." CValue     
                    | Int 
                    | TFloat
                    | TLong
                    | TDouble
                    | CValue "." CValue   
                    | CValue ":" CValue                    
                    | CIndex
                    | "<init>"
                    | "<clinit>"
                    | "static"
                    | "(" ")" CIds
                    | "(" CIds ")" CIds
                    | "Code" | "ConstantValue" | "StackMapTable" | "Exceptions" | "InnerClasses"
                    | "EnclosingMethod" | "Synthetic" | "Signature" | "SourceFile" | "SourceDebugExtension"
                    | "LineNumberTable" | "LocalVariableTable" | "LocalVariableTypeTable" | "Deprecated"
                    | "RuntimeVisibleAnnotations" | "RuntimeInvisibleAnnotations" 
                    | "RuntimeVisibleParameterAnnotations"
                    | "RuntimeInvisibleParameterAnnotations" | "AnnotationDefault" | "BootstrapMethods"
                    | "access" "$" Int 
                    | "(" "[" CIds ")" CIds
                    | "[" CValue
                    | CValue "-" CValue        [left]
                    | TId
                    
    syntax CIndex ::= "#" Int
                        
    syntax CItem ::= CIndex "=" CType CValue
                    | CIndex "=" CType
                        
    syntax CItems ::= CItem
                    | CItems CItems        [left]
                        
    syntax CPool ::= "Constant" "pool" ":" CItems

    syntax K ::= "execute" | "initialize" | "addframe" | "removeframe" | "undefined"
            | "classfile" | "last_modified" | "md5_checksum" | "compiled_from"
            | "sourcefile" | "minor_version" | "major_version" | "inner_class" | "enclosing_method"
            | (Int, ClassDecl, CValue, CValue)
            | (Int, Int, Int, Id, CValue)
            | (Int , Id, CValue, CValue)
            | (Int, Int, Id, CValue)
            | (Id , Int , Int)
            | CType "." CValue
            | "addFrame" "(" ClassDecl "," CValue "," CValue ")"
            | "addFrame" "(" ClassDecl "," CValue "," CValue "," Int ")"
            | "setObjectReference" "(" ClassDecl "," CValue "," CValue "," Int ")"
            | "searchClassSpecial" "(" CValue "," CValue "," CValue "," Int ")"
            | "searchClassVirtual" "(" CValue "," CValue "," CValue "," Int ")"
            | "newObject" "(" CValue "," Int ")"
            | "addLocation" "(" Int ")"
            | "updateField" "(" Int "," CValue ")"
            | "updateField" "(" Int "," Float ")"
            | "updateField" "(" Int "," Int "," CValue ")"
            | "searchClassSpecial" "(" CValue "," CValue "," CValue "," ClassDecl "," CValue "," CValue ")"
            | "addFrame" "(" ClassDecl "," CValue "," CValue "," ClassDecl "," CValue "," CValue ")"
            | "getReference" "(" ClassDecl "," CValue "," CValue "," Int "," ClassDecl "," CValue "," CValue ")"
            | "setReference" "(" ClassDecl "," CValue "," CValue "," Int "," ClassDecl "," CValue "," CValue "," CValue ")"
            | "searchClass" "(" CValue "," CValue "," CValue "," ClassDecl "," CValue "," CValue ")"
            | "lookup" "(" CValue "," CValue "," CValue "," ClassDecl "," CValue "," CValue ")"
            | "prepareLookup" "(" CValue "," CValue "," CValue "," ClassDecl "," CValue "," CValue ")"
            | "prepareLookup" "(" CValue "," CValue "," CValue "," ClassDecl "," CValue "," CValue "," Int ")"
            | "arg" "(" Int ")"
            | "retrieveField" "(" Int ")" | "returnValue" "(" CValue ")" | "returnValue" "(" Float ")"
            | "classLoad" | "mainConstructor" | "setupExecution" | "setMainReference" | "preparation" | "prepare" "(" ClassDecl ")"
            | "updateStatic" "(" CValue "," CValue "," CValue ")"
            | "updateStatic" "(" CValue "," CValue "," Float ")"
            | "retrieveStatic" "(" CValue "," CValue ")"
            | "newArrayElement" "(" Int ")"
            | "runInstruction"
            | "createLocations"
            | "trimTail" "(" String "," Int ")"        [function]
            | "trimFront" "(" String "," Int ")"       [function]
            | "getTail" "(" String "," Int ")"        [function]

    syntax ListItem ::= (CValue , BagItem)

    syntax Val ::= object(CValue , EnvCellFragment)
                | array(Primitives , Int , Int)
                | array(CValue , Int , Int)                

endmodule

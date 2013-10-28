module JVM-SYNTAX
	
	syntax Class ::= ClassDecl ClassFlagsAccess CPool "{" Fields Methods "}"
					| ClassDecl ClassFlagsAccess CPool "{" Methods "}"

	//------------------------------INSTRUCTION SYNTAX------------------------------
	
	syntax InstructionOps ::= Opcode | Opcode Operand
	
	syntax Instruction ::= Int ":" InstructionOps
					
	syntax Opcode ::= "aaload" | "aastore" | "anewarray" | "arraylength" | "baload" | "bastore"
					| "caload" | "castore" | "multianewarray" | "newarray"																				
					
					| "d2f" | "d2i" | "d2l" | "dadd" | "daload"	| "dastore"	| "dcmpg" | "dcmpl" 
					| "dconst_0" | "dconst_1" | "ddiv" | "dload" | "dload_0" | "dload_1" | "dload_2" 
					| "dload_3" | "dmul" | "dneg" | "drem" | "dreturn" | "dstore" | "dstore_0" 
					| "dstore_1" | "dstore_2" | "dstore_3" | "dsub"																							
						
					| "f2d" | "f2i" | "f2l" | "fadd" | "faload" | "fastore" | "fcmpl" | "fcmpg" 
					| "fconst_0" | "fconst_1" | "fconst_2" | "fdiv" | "fload" | "fload_0" | "fload_1" 
					| "fload_2" | "fload_3" | "fmul" | "fneg" | "frem" | "freturn" | "fstore" 
					| "fstore_0" | "fstore_1" | "fstore_2" | "fstore_3" | "fsub"																						

					| "i2b" | "i2c" | "i2d" | "i2f" | "i2l" | "i2s" | "iadd" | "iaload" | "iand"
					| "iastore" | "if_icmpge" | "if_icmpgt" | "if_icmple" | "if_icmplt" | "if_icmpne" 
					| "iinc" | "iload" | "iload_0" | "iload_1" | "iload_2"
					| "iload_3" | "imul" | "ineg" | "ior" | "irem" | "ireturn" | "ishl" | "ishr" 
					| "istore" | "istore_0" | "istore_1" | "istore_2" | "istore_3" | "isub" | "iushr" 
					| "ixor" | "sipush" | "idiv"
					| "iconst_0" | "iconst_1" | "iconst_2" | "iconst_3" | "iconst_4" | "iconst_5"
					
					| "ifeq" | "ifge" | "ifgt" | "ifle" | "iflt" | "ifne"
					
					| "l2d" | "l2f" | "l2i" | "ladd" | "laload" | "land" | "lastore" | "lcmp" | "lconst_0" 
					| "lconst_1" | "ldc" | "ldc_w" | "ldc2_w" | "ldiv" | "lload" | "lload_0" | "lload_1" 
					| "lload_2" | "lload_3"	| "lmul" | "lneg" | "lor" | "lrem" | "lreturn" | "lshl" | "lshr" 
					| "lstore" | "lstore_0" | "lstore_1" | "lstore_2" | "lstore_3" | "lsub" | "lushr" | "lxor"
					
					| "aconst_null" | "athrow" | "bipush" | "checkcast" | "dup" | "dup_x1" | "dup_x2"	
					| "dup2" | "dup2_x1" | "dup2_x2" | "getfield" | "getstatic" | "goto" | "goto_w"
					| "instanceof" | "lookupswitch" | "new" | "nop" | "pop" | "pop2" | "putfield"
					| "putstatic" | "return" | "swap" | "tableswitch" | "wide"
					| "invokedynamic" | "invokeinterface" | "invokespecial" | "invokestatic" | "invokevirtual" 		
					
					| "saload" | "sastore"
					
					| "aload" | "aload_0" | "aload_1" | "aload_2" | "aload_3" | "astore" | "astore_0" | "astore_1"
					| "astore_2" | "astore_3" | "if_acmpne" | "if_acmpeq" | "ifnonnull" | "ifnull" | "monitorenter"	
					| "monitorexit"	
					
	syntax Operand ::= Int 
					| CIndex
					| Operand "," Operand	
					
	syntax Instructions ::= Instruction
						| Instructions Instructions				[left]
	
	//------------------------------CLASS DECLARATION SYNTAX------------------------------	
						
	syntax ClassDecl ::=  Modifier "class" CValue
						| Modifier "class" CValue "extends" CValue
						| Modifier "class" CValue "implements" CValue
						| Modifier "class" CValue "extends" CValue "implements" CValue	
						| "class" CValue
						| "class" CValue "extends" CValue
						| "class" CValue "implements" CValue
						| "class" CValue "extends" CValue "implements" CValue
						
						| Modifier "abstract" "class" CValue
						| Modifier "abstract" "class" CValue "extends" CValue
						| Modifier "abstract" "class" CValue "implements" CValue
						| Modifier "abstract" "class" CValue "extends" CValue "implements" CValue
						| "abstract" "class" CValue
						| "abstract" "class" CValue "extends" CValue
						| "abstract" "class" CValue "implements" CValue
						| "abstract" "class" CValue "extends" CValue "implements" CValue
						
						| Modifier "final" "class" CValue
						| Modifier "final" "class" CValue "extends" CValue
						| Modifier "final" "class" CValue "implements" CValue
						| Modifier "final" "class" CValue "extends" CValue "implements" CValue	
						| "final" "class" CValue
						| "final" "class" CValue "extends" CValue
						| "final" "class" CValue "implements" CValue
						| "final" "class" CValue "extends" CValue "implements" CValue
						
						
	//------------------------------CLASS FLAGS SYNTAX------------------------------
	
	syntax CommonFlag ::= "ACC_PUBLIC" | "ACC_FINAL" | "ACC_ABSTRACT" | "ACC_SYNTHETIC" | "ACC_PRIVATE" | "ACC_PROTECTED" | "ACC_STATIC"

	syntax ClassFlags ::= ClassFlag
				 | ClassFlag "," ClassFlags
				 
	syntax ClassFlag ::= CommonFlag | "ACC_SUPER" | "ACC_INTERFACE" 
					    | "ACC_ANNOTATION" | "ACC_ENUM"
				 
	syntax ClassFlagsAccess ::= "flags" ":" ClassFlags	
	
	//------------------------------FIELD SYNTAX------------------------------	
	
	syntax FieldDeclaration ::= Modifier Type FieldId ";"
								| Modifier "final" Type FieldId ";"
	
	syntax FType ::= Id | Int | String
	
	syntax FieldId ::= Id
					| Id "=" FType
					| FieldId "," FieldId			[left]
					
	syntax FieldFlag ::= CommonFlag
					
	syntax FieldFlags ::= FieldFlag
						| FieldFlags "," FieldFlags		[left]
					
	syntax FieldFlagsAccess ::= "flags" ":" FieldFlags
	
	syntax FConstValAtt ::= Type FType
	
	syntax FConstVal ::= "ConstantValue" ":" FConstValAtt
					
	syntax Field ::= FieldDeclaration FieldFlagsAccess
					| FieldDeclaration FieldFlagsAccess FConstVal
					
	syntax Fields ::= Field
					| Fields Fields				[left]
	
	//------------------------------METHOD SYNTAX------------------------------												
	
	syntax Modifier ::= "private" | "public" | "protected"

	syntax Primitives ::= "int" | "boolean" | "short" | "void" | "byte"  | "char" | "float"
	
	syntax Type ::= Primitives
	
	syntax MethodArg ::= "(" ")" | "(" CValue "[" "]" ")" | "(java.lang.String[])"
	
	
	syntax MethodDeclaration ::= Modifier Type Id MethodArg ";"
								| Modifier "static" Type Id MethodArg ";"
								| MainMethod
								| Constructor

								
	syntax Constructor ::= Modifier Id MethodArg ";"
								
	syntax MainMethod ::= "public" "static" "void" "main" "(java.lang.String[])" ";"
	
	syntax MethodInfo ::= MethodSignature MethodFlagsAccess

					
	syntax Method ::= MethodDeclaration MethodInfo "Code" ":" MethodProperties Instructions "LineNumberTable" ":" LinesNumberTable
					| MethodDeclaration MethodInfo "Code" ":" MethodProperties Instructions "LineNumberTable" ":" LinesNumberTable "LocalVariableTable" ":" LocalVariableTable
					| MethodDeclaration MethodInfo "Code" ":" MethodProperties Instructions "LineNumberTable" ":" LinesNumberTable "LocalVariableTable" ":" LocalVariableTable "StackMapTable" ":" StackMapTable
											
	syntax Methods ::= Method
					| Methods Methods									[left]
					
	syntax MainStuff ::= "{" Methods "}"
	
	syntax MethodSignature ::= "Signature" ":" CValue
					

	syntax MethodFlag ::= CommonFlag | "ACC_SYNCHRONIZED" 
						| "ACC_BRIDGE" | "ACC_VARARGS" | "ACC_NATIVE"
						| "ACC_STRICT"
	
	syntax MethodFlags ::= MethodFlag
				 | MethodFlags "," MethodFlags					[left]
				 
	syntax MethodFlagsAccess ::= "flags" ":" MethodFlags
	
	syntax LineNumberTable ::= "line" Int ":" Int
	
	syntax LinesNumberTable ::= LineNumberTable
							  | LinesNumberTable LinesNumberTable				[left]
						
	syntax PropertyType ::= "stack" | "locals" | "args_size"
						
	syntax MethodProperty ::= PropertyType "=" Int
	
	syntax MethodProperties ::= MethodProperty
								| MethodProperties "," MethodProperties			[left]
								
	//------------------------------STACK MAP TABLE SYNTAX------------------------------
								
	syntax StackMapTable ::= EntriesNumber Entries
	
	syntax EntriesNumber ::= "number_of_entries" "=" Int
	
	syntax Entries ::= Entry
					 | Entries Entries										[left]	
	
	syntax Entry ::= FrameType | OffsetDelta | VerificationLocals 
				   | VerificationStack | LocalsNumber | StackItemsNumber
	
	syntax Exp ::= Id | Primitives
		
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
	
	
	//------------------------------LOCAL VARIABLE TABLE SYNTAX------------------------------
		
	syntax LocalVariableTable ::= TableHeader LocalVariables
	
	syntax TableHeader ::= "Start" "Length" "Slot" "Name" "Signature"
	
	syntax LocalVariables ::= LocalVariable
							| LocalVariables LocalVariables			[left]
							
	syntax LocalVariable ::= Int Int Int Id CValue
	//syntax LocalVariable ::= Int "," Int "," Int "," Id "," CValue
	
	//------------------------------CONSTANT POOL SYNTAX------------------------------
	
	syntax CommonType ::=  "Double" | "Float" | "Long" | "String" | "Integer" | "Class"
	
	syntax CType ::= "Fieldref" | "Methodref" | "InterfaceMethodref"
					| "NameAndType" | "Utf8" | CommonType
					
	syntax CPType ::= Id | CommonType
	
	
	syntax CIds ::= Id
					| "main"
					| CIds "/" CPType				
					| CIds ";"
					| CIds "$" Int
					| CIds "$" Id
					| CIds ";" CPType			 	[left]
						
	syntax CValue ::= CIds
					| Int | Float 
					| CValue "." CValue 	[left]
					| CValue ":" CValue
					| CIndex
					| "<init>"
					| "(" ")" CIds
					| "(" CIds ")" CIds
					| "Code" | "ConstantValue" | "StackMapTable" | "Exceptions" | "InnerClasses"
					| "EnclosingMethod" | "Synthetic" | "Signature" | "SourceFile" | "SourceDebugExtension"
					| "LineNumberTable" | "LocalVariableTable" | "LocalVariableTypeTable" | "Deprecated"
					| "RuntimeVisibleAnnotations" | "RuntimeInvisibleAnnotations" | "RuntimeVisibleParameterAnnotations"
					| "RuntimeInvisibleParameterAnnotations" | "AnnotationDefault" | "BootstrapMethods"
					| "access" "$" Int 
					| "(" "[" CIds ")" CIds
					| "[" CValue
					
	syntax CIndex ::= "#" Int
						
	syntax CItem ::= CIndex "=" CType CValue
						
	syntax CItems ::= CItem
					| CItems CItems								[left]
						
	syntax CPool ::= "Constant" "pool" ":" CItems
	
endmodule

module JVM
	imports JVM-SYNTAX
	
	//------------------------------CONFIGURATION------------------------------
	
	configuration <t>
						<k color="green"> (initialize ~> $PGM:K ~> execute) </k>					
						<pc> 0 </pc>
						<stack>		
							<frameStack> .List </frameStack>
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
						//<heap> ... </heap>
						<crnt> .K </crnt>
						<classes>
							<class multiplicity="*" color="red">
								<classDecl> .K </classDecl>
								<classFlags> .Set </classFlags>
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
										//<methodSig> .K </methodSig>
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
	
	rule <k> (C:ClassDecl C1:ClassFlagsAccess C2:CPool { F:Fields M:Methods }) => C ~> C1 ~> C2 ~> F ~> M ... </k> 
		 <crnt> . </crnt>
		 
	rule <k> (C:ClassDecl C1:ClassFlagsAccess C2:CPool { M:Methods }) => C ~> C1 ~> C2 ~> M ... </k> 
		 <crnt> . </crnt>
		 
	syntax K ::= "execute" | "initialize" | "addframe" | "removeframe"
	
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

	syntax K ::= (Int, ClassDecl, CValue, CValue)
			| "addframe" "(" ClassDecl "," CValue "," CValue ")"
			| (Int, Int, Int, Id, CValue)
			| (Id, CValue, Int)
			| (Int, Int, Id, CValue)
	
	rule <k> execute =>  . ... </k>
		 <frameMethod> _ => C1:CValue : C2:CValue </frameMethod>
		 <methodDecl> M:MainMethod </methodDecl>
		 <methodNameType> C1 : C2 </methodNameType>
		 <classDecl> C:ClassDecl </classDecl>
		 <frameClass> _ => C </frameClass>
		 <methodStmts> I:Int |-> O:InstructionOps I2:Int |-> O2:InstructionOps ... </methodStmts>
		 <pc> _ => I </pc>
		 <localVarTbl> V:Map </localVarTbl>
		 <localVarArr> . => V </localVarArr>
		 <crnt> _ => . </crnt>
		<frameStack> ... . => ListItem((0 , C , C1 , C2)) ... </frameStack>
		 
	rule <frameMethod> C1:CValue : C2:CValue </frameMethod>
		 <methodNameType> C1 : C2 </methodNameType>
		 <classDecl> C:ClassDecl </classDecl>
		 <frameClass> C </frameClass>
		 <localVarArr> ... I:Int |-> (I1:Int , I3:Int , I4:Id , I5:CValue) => I |-> (I4 , I5 , 0) ...  </localVarArr>
		 <frameStack> ... ListItem((_ , C , C1 , C2)) </frameStack>
		 
	//------------------------------BYTECODE RULES------------------------------
	
	//-------iconst_<n>-------	
		 
	rule <pc> I:Int => I +Int 1 </pc>
		 <operandStack> ... . => ListItem(0) </operandStack>
		 <frameMethod> C1:CValue : C2:CValue </frameMethod>
		 <methodNameType> C1 : C2 </methodNameType>
		 <classDecl> C:ClassDecl </classDecl>
		 <frameClass> C </frameClass>
		 <frameStack> ... ListItem((I , C , C1 , C2)) => ListItem((I +Int 1 , C , C1 , C2)) ... </frameStack>
		 <methodStmts> ... I |-> iconst_0 ... </methodStmts>
		 
	rule <pc> I:Int => I +Int 1 </pc>
		 <operandStack> ... . => ListItem(1) </operandStack>
		 <frameMethod> C1:CValue : C2:CValue </frameMethod>
		 <methodNameType> C1 : C2 </methodNameType>
		 <classDecl> C:ClassDecl </classDecl>
		 <frameClass> C </frameClass>
		 <frameStack> ... ListItem((I , C , C1 , C2)) => ListItem((I +Int 1 , C , C1 , C2)) ... </frameStack>
		 <methodStmts> ... I |-> iconst_1 ... </methodStmts>
		 
	rule <pc> I:Int => I +Int 1 </pc>
		 <operandStack> ... . => ListItem(2) </operandStack>
		 <frameMethod> C1:CValue : C2:CValue </frameMethod>
		 <methodNameType> C1 : C2 </methodNameType>
		 <classDecl> C:ClassDecl </classDecl>
		 <frameClass> C </frameClass>
		 <frameStack> ... ListItem((I , C , C1 , C2)) => ListItem((I +Int 1 , C , C1 , C2)) ... </frameStack>
		 <methodStmts> ... I |-> iconst_2 ... </methodStmts>
		 
	rule <pc> I:Int => I +Int 1 </pc>
		 <operandStack> ... . => ListItem(3) </operandStack>
		 <frameMethod> C1:CValue : C2:CValue </frameMethod>
		 <methodNameType> C1 : C2 </methodNameType>
		 <classDecl> C:ClassDecl </classDecl>
		 <frameClass> C </frameClass>
		 <frameStack> ... ListItem((I , C , C1 , C2)) => ListItem((I +Int 1 , C , C1 , C2)) ... </frameStack>
		 <methodStmts> ... I |-> iconst_3 ... </methodStmts>
		 
	rule <pc> I:Int => I +Int 1 </pc>
		 <operandStack> ... . => ListItem(4) </operandStack>
		 <frameMethod> C1:CValue : C2:CValue </frameMethod>
		 <methodNameType> C1 : C2 </methodNameType>
		 <classDecl> C:ClassDecl </classDecl>
		 <frameClass> C </frameClass>
		 <frameStack> ... ListItem((I , C , C1 , C2)) => ListItem((I +Int 1 , C , C1 , C2)) ... </frameStack>
		 <methodStmts> ... I |-> iconst_4 ... </methodStmts>
		 	 
	rule <pc> I:Int => I +Int 1 </pc>
		 <operandStack> ... . => ListItem(5) </operandStack>
		 <frameMethod> C1:CValue : C2:CValue </frameMethod>
		 <methodNameType> C1 : C2 </methodNameType>
		 <classDecl> C:ClassDecl </classDecl>
		 <frameClass> C </frameClass>
		 <frameStack> ... ListItem((I , C , C1 , C2)) => ListItem((I +Int 1 , C , C1 , C2)) ... </frameStack>
		 <methodStmts> ... I |-> iconst_5 ... </methodStmts>
		 
	//-------istore_<n>-------
	
	rule <pc> I:Int => I +Int 1 </pc>
		 <operandStack> ... ListItem(L:Int) => . ... </operandStack>
		 <frameMethod> C1:CValue : C2:CValue </frameMethod>
		 <methodNameType> C1 : C2 </methodNameType>
		 <classDecl> C:ClassDecl </classDecl>
		 <frameClass> C </frameClass>	
		 <frameStack> ... ListItem((I , C , C1 , C2)) => ListItem((I +Int 1 , C , C1 , C2)) ... </frameStack>	 
		 <localVarArr> ... 0 |-> (I2:Id , I3:CValue , I4:Int) => 0 |-> (I2 , I3 , L) ... </localVarArr>
		 <methodStmts> ... I |-> istore_0 ... </methodStmts>
		 
	rule <pc> I:Int => I +Int 1 </pc>
		 <operandStack> ... ListItem(L:Int) => . ... </operandStack>
		 <frameMethod> C1:CValue : C2:CValue </frameMethod>
		 <methodNameType> C1 : C2 </methodNameType>
		 <classDecl> C:ClassDecl </classDecl>
		 <frameClass> C </frameClass>	
		 <frameStack> ... ListItem((I , C , C1 , C2)) => ListItem((I +Int 1 , C , C1 , C2)) ... </frameStack>
		 <localVarArr> ... 1 |-> (I2:Id , I3:CValue , I4:Int) => 1 |-> (I2 , I3 , L) ... </localVarArr>
		 <methodStmts> ... I |-> istore_1 ... </methodStmts>
		 
	rule <pc> I:Int => I +Int 1 </pc>
		 <operandStack> ... ListItem(L:Int) => . ... </operandStack>
		 <frameMethod> C1:CValue : C2:CValue </frameMethod>
		 <methodNameType> C1 : C2 </methodNameType>
		 <classDecl> C:ClassDecl </classDecl>
		 <frameClass> C </frameClass>	
		 <frameStack> ... ListItem((I , C , C1 , C2)) => ListItem((I +Int 1 , C , C1 , C2)) ... </frameStack>
		 <localVarArr> ... 2 |-> (I2:Id , I3:CValue , I4:Int) => 2 |-> (I2 , I3 , L) ... </localVarArr>
		 <methodStmts> ... I |-> istore_2 ... </methodStmts>
		 
	rule <pc> I:Int => I +Int 1 </pc>
		 <operandStack> ... ListItem(L:Int) => . ... </operandStack>
		 <frameMethod> C1:CValue : C2:CValue </frameMethod>
		 <methodNameType> C1 : C2 </methodNameType>
		 <classDecl> C:ClassDecl </classDecl>
		 <frameClass> C </frameClass>	
		 <frameStack> ... ListItem((I , C , C1 , C2)) => ListItem((I +Int 1 , C , C1 , C2)) ... </frameStack>
		 <localVarArr> ... 3 |-> (I2:Id , I3:CValue , I4:Int) => 3 |-> (I2 , I3 , L) ... </localVarArr>
		 <methodStmts> ... I |-> istore_3 ... </methodStmts>
		 
	//-------istore-------
	
	rule <pc> I:Int => I +Int 2 </pc>
		 <operandStack> ... ListItem(L:Int) => . ... </operandStack>
		 <frameMethod> C1:CValue : C2:CValue </frameMethod>
		 <methodNameType> C1 : C2 </methodNameType>
		 <classDecl> C:ClassDecl </classDecl>
		 <frameClass> C </frameClass>	 
		 <frameStack> ... ListItem((I , C , C1 , C2)) => ListItem((I +Int 2 , C , C1 , C2)) ... </frameStack>
		 <localVarArr> ... I5 |-> (I2:Id , I3:CValue , I4:Int) => I5 |-> (I2 , I3 , L) ... </localVarArr>
		 <methodStmts> ... I |-> istore I5:Int... </methodStmts>
		 
	//-------iload_<n>-------
	
	rule <pc> I:Int => I +Int 1 </pc>
		 <operandStack> ... . => ListItem(I6) </operandStack>
		 <frameMethod> C1:CValue : C2:CValue </frameMethod>
		 <methodNameType> C1 : C2 </methodNameType>
		 <classDecl> C:ClassDecl </classDecl>
		 <frameClass> C </frameClass>
		 <frameStack> ... ListItem((I , C , C1 , C2)) => ListItem((I +Int 1 , C , C1 , C2)) ... </frameStack>
		 <localVarArr> ... 0 |-> (I4:Id , I5:CValue , I6:Int) ... </localVarArr>
		 <methodStmts> ... I |-> iload_0 ... </methodStmts>
	
	rule <pc> I:Int => I +Int 1 </pc>
		 <operandStack> ... . => ListItem(I6) </operandStack>
		 <frameMethod> C1:CValue : C2:CValue </frameMethod>
		 <methodNameType> C1 : C2 </methodNameType>
		 <classDecl> C:ClassDecl </classDecl>
		 <frameClass> C </frameClass>
		 <frameStack> ... ListItem((I , C , C1 , C2)) => ListItem((I +Int 1 , C , C1 , C2)) ... </frameStack>
		 <localVarArr> ... 1 |-> (I4:Id , I5:CValue , I6:Int) ... </localVarArr>
		 <methodStmts> ... I |-> iload_1 ... </methodStmts>
		 
	rule <pc> I:Int => I +Int 1 </pc>
		 <operandStack> ... . => ListItem(I6) </operandStack>
		 <frameMethod> C1:CValue : C2:CValue </frameMethod>
		 <methodNameType> C1 : C2 </methodNameType>
		 <classDecl> C:ClassDecl </classDecl>
		 <frameClass> C </frameClass>
		 <frameStack> ... ListItem((I , C , C1 , C2)) => ListItem((I +Int 1 , C , C1 , C2)) ... </frameStack>
		 <localVarArr> ... 2 |-> (I4:Id , I5:CValue , I6:Int) ... </localVarArr>
		 <methodStmts> ... I |-> iload_2 ... </methodStmts>
		 
	//-------iload-------
	
	rule <pc> I:Int => I +Int 2 </pc>
		 <operandStack> ... . => ListItem(I6) </operandStack>
		 <frameMethod> C1:CValue : C2:CValue </frameMethod>
		 <methodNameType> C1 : C2 </methodNameType>
		 <classDecl> C:ClassDecl </classDecl>
		 <frameClass> C </frameClass>
		 <frameStack> ... ListItem((I , C , C1 , C2)) => ListItem((I +Int 2 , C , C1 , C2)) ... </frameStack>
		 <localVarArr> ... I2 |-> (I4:Id , I5:CValue , I6:Int) ... </localVarArr>
		 <methodStmts> ... I |-> iload I2:Int ... </methodStmts>
	
	//-------bipush-------
	
	rule <pc> I:Int => I +Int 2 </pc>
		 <operandStack> ... . => ListItem(I2) </operandStack>
		 <frameMethod> C1:CValue : C2:CValue </frameMethod>
		 <methodNameType> C1 : C2 </methodNameType>
		 <classDecl> C:ClassDecl </classDecl>
		 <frameClass> C </frameClass>
		 <frameStack> ... ListItem((I , C , C1 , C2)) => ListItem((I +Int 2 , C , C1 , C2)) ... </frameStack>
		 <methodStmts> ... I |-> bipush I2:Int ... </methodStmts>
		 
	//-------if_icmp<cond>-------
	
	rule <pc> I:Int => I +Int 3 </pc>
		 <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => . ... </operandStack>
		 <frameMethod> C1:CValue : C2:CValue </frameMethod>
		 <methodNameType> C1 : C2 </methodNameType>
		 <classDecl> C:ClassDecl </classDecl>
		 <frameClass> C </frameClass>
		 <frameStack> ... ListItem((I , C , C1 , C2)) => ListItem((I +Int 3 , C , C1 , C2)) ... </frameStack>
		 <methodStmts> ... I |-> if_icmpge I2:Int ... </methodStmts>
		 when L1 <Int L2
		 
	rule <pc> I:Int => I2 </pc>
		 <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => . ... </operandStack>
		 <frameMethod> C1:CValue : C2:CValue </frameMethod>
		 <methodNameType> C1 : C2 </methodNameType>
		 <classDecl> C:ClassDecl </classDecl>
		 <frameClass> C </frameClass>
		 <frameStack> ... ListItem((I , C , C1 , C2)) => ListItem((I2 , C , C1 , C2)) ... </frameStack>
		 <methodStmts> ... I |-> if_icmpge I2:Int ... </methodStmts>
		 when L1 >=Int L2
	
	//-------imul-------
	
	rule <pc> I:Int => I +Int 1 </pc>
		 <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => ListItem(L1 *Int L2) ... </operandStack>
		 <frameMethod> C1:CValue : C2:CValue </frameMethod>
		 <methodNameType> C1 : C2 </methodNameType>
		 <classDecl> C:ClassDecl </classDecl>
		 <frameClass> C </frameClass>
		 <frameStack> ... ListItem((I , C , C1 , C2)) => ListItem((I +Int 1 , C , C1 , C2)) ... </frameStack>
		 <methodStmts> ... I |-> imul ... </methodStmts>	
		 
	//-------iinc-------
	
	rule <pc> I:Int => I +Int 3 </pc>
		 <frameMethod> C1:CValue : C2:CValue </frameMethod>
		 <methodNameType> C1 : C2 </methodNameType>
		 <classDecl> C:ClassDecl </classDecl>
		 <frameClass> C </frameClass>
		 <frameStack> ... ListItem((I , C , C1 , C2)) => ListItem((I +Int 3 , C , C1 , C2)) ... </frameStack>
		 <localVarArr> ... I1 |-> (I4:Id , I5:CValue , I6:Int) => I1 |-> (I4 , I5 , I6 +Int I2) ... </localVarArr>
		 <methodStmts> ... I |-> iinc I1:Int , I2:Int ... </methodStmts>	
		 
	//-------goto-------
	
	rule <pc> I:Int => I1 </pc>
		 <frameMethod> C1:CValue : C2:CValue </frameMethod>
		 <methodNameType> C1 : C2 </methodNameType>
		 <classDecl> C:ClassDecl </classDecl>
		 <frameClass> C </frameClass>
		 <frameStack> ... ListItem((I , C , C1 , C2)) => ListItem((I1 , C , C1 , C2)) ... </frameStack>
		 <methodStmts> ... I |-> goto I1:Int ... </methodStmts>
		 
	//-------iadd-------
	
	rule <pc> I:Int => I +Int 1 </pc>
		 <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => ListItem(L1 +Int L2) ... </operandStack>
		 <frameMethod> C1:CValue : C2:CValue </frameMethod>
		 <methodNameType> C1 : C2 </methodNameType>
		 <classDecl> C:ClassDecl </classDecl>
		 <frameClass> C </frameClass>
		 <frameStack> ... ListItem((I , C , C1 , C2)) => ListItem((I +Int 1 , C , C1 , C2)) ... </frameStack>
		 <methodStmts> ... I |-> iadd ... </methodStmts>	
		 
	//-------idiv-------
	
	rule <pc> I:Int => I +Int 1 </pc>
		 <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => ListItem(L1 /Int L2) ... </operandStack>
		 <frameMethod> C1:CValue : C2:CValue </frameMethod>
		 <methodNameType> C1 : C2 </methodNameType>
		 <classDecl> C:ClassDecl </classDecl>
		 <frameClass> C </frameClass>
		 <frameStack> ... ListItem((I , C , C1 , C2)) => ListItem((I +Int 1 , C , C1 , C2)) ... </frameStack>
		 <methodStmts> ... I |-> idiv ... </methodStmts>	
		 
	//-------isub-------
	
	rule <pc> I:Int => I +Int 1 </pc>
		 <operandStack> ... ListItem(L1:Int) ListItem(L2:Int) => ListItem(L1 -Int L2) ... </operandStack>
		 <frameMethod> C1:CValue : C2:CValue </frameMethod>
		 <methodNameType> C1 : C2 </methodNameType>
		 <classDecl> C:ClassDecl </classDecl>
		 <frameClass> C </frameClass>
		 <frameStack> ... ListItem((I , C , C1 , C2)) => ListItem((I +Int 1 , C , C1 , C2)) ... </frameStack>
		 <methodStmts> ... I |-> isub ... </methodStmts>
		 
	//-------ineg-------
	
	rule <pc> I:Int => I +Int 1 </pc>
		 <operandStack> ... ListItem(L1:Int) => ListItem(0 -Int L1) ... </operandStack>
		 <frameMethod> C1:CValue : C2:CValue </frameMethod>
		 <methodNameType> C1 : C2 </methodNameType>
		 <classDecl> C:ClassDecl </classDecl>
		 <frameClass> C </frameClass>
		 <frameStack> ... ListItem((I , C , C1 ,  C2)) => ListItem((I +Int 1 , C , C1 , C2)) ... </frameStack>
		 <methodStmts> ... I |-> ineg ... </methodStmts>
	
	//-------invokestatic-------
		
	rule <pc> I:Int => -1 </pc>
		 <classDecl> C:ClassDecl </classDecl>
		 <frameClass> C </frameClass>
		 <frameMethod> C5:CValue : C6:CValue </frameMethod>
		 <methodNameType> C5 : C6 </methodNameType>
		 <crnt> _ => addframe (C , C3 , C4) </crnt>
		 <frameStack> ... ListItem((I , C , C5 , C6)) => ListItem((I +Int 3 , C , C5 , C6)) ... </frameStack>
		 <cpoolVals> ... C1 |-> C2:CValue . (C3:CValue : C4:CValue) ... </cpoolVals>
		 <methodStmts> ... I |-> invokestatic C1:CIndex ... </methodStmts>
		 
	//-------ireturn & DELETE STACK FRAME-------
	
	rule <pc> I:Int </pc>
		 <methodNameType> C1 : C2 </methodNameType>
		 <classDecl> C:ClassDecl </classDecl>
		 <crnt> _ => ireturn L1 </crnt>
		 <frameStack> ... ListItem((I , C , C1 , C2)) => . ... </frameStack>
		 <methodStmts> ... I |-> ireturn ... </methodStmts>
		 (<frame>
			<localVarArr> _ </localVarArr>
			<operandStack> ... ListItem(L1:Operand) </operandStack>
			<refs>
				<frameClass> C </frameClass>
				<frameMethod> C1:CValue : C2:CValue </frameMethod>
			</refs>
		 </frame> => .)
	
		 
	rule <crnt> ireturn I:Int => . ... </crnt>
		 <operandStack> ... . => ListItem(I) ... </operandStack>
		 <frameMethod> C2:CValue : C3:CValue </frameMethod>
		 <frameClass> C </frameClass>
		 <frameStack> ... ListItem((I2:Int , C:ClassDecl , C2:CValue , C3:CValue)) </frameStack>
		 <pc> _ => I2 </pc>
	
		 
		 
	//---------------ADDING A NEW STACK FRAME-----------------
		 
	rule <crnt> addframe (C:ClassDecl , C2:CValue , C3:CValue) => . ... </crnt>
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
		 <frameStack> ... . => ListItem((0 , C , C2 , C3)) ... </frameStack>
		 <pc> _ => 0 </pc>
		 
		 
	//------------------------------FIELD RULES------------------------------
		 
	rule F1:Fields F2:Fields => F1 ~> F2	[structural]
	
	rule F1:FieldDeclaration F2:FieldFlagsAccess => F1 ~> F2	[structural]
	
	rule (F1:FieldDeclaration F2:FieldFlagsAccess F3:FConstVal) => F1 ~> F2 ~> F3		[structural]
	
	rule <k> F:FieldDeclaration => . ... </k>
		<fields> ... (. => <field>
								<fieldDecl> F </fieldDecl>
								<fieldFlags> . </fieldFlags>
								<constVal> . </constVal>
							</field>) 
				... </fields>
		<crnt> _ => F </crnt>
		
	rule <k> flags : F:FieldFlags => F ... </k>
	
	rule F1:FieldFlag , F2:FieldFlags => F1 ~> F2	[structural]
	
	rule <k> F:FieldFlag => . ... </k>
		 <crnt> F2:FieldDeclaration </crnt>
		 <fieldDecl> F2 </fieldDecl>
		 <fieldFlags> ... . => SetItem(F) ... </fieldFlags>
	
	rule <k> ConstantValue : F:FConstValAtt => . ... </k>
		 <crnt> F2:FieldDeclaration </crnt>
		 <fieldDecl> F2 </fieldDecl>
		 <constVal> _ => F </constVal>	
	
	
	//------------------------------METHOD RULES------------------------------	 
	
	rule M1:Methods M2:Methods => M1 ~> M2		[structural]
	
	rule (M1:MethodDeclaration M2:MethodInfo Code : M4:MethodProperties I:Instructions LineNumberTable : L:LinesNumberTable) => M1 ~> M2 ~> M4 ~> I ~> L		[structural]

	rule (M1:MethodDeclaration M2:MethodInfo Code : M4:MethodProperties I:Instructions LineNumberTable : L:LinesNumberTable LocalVariableTable : L2:LocalVariableTable) => M1 ~> M2 ~> M4 ~> I ~> L ~> L2		[structural]
	
	rule (M1:MethodDeclaration M2:MethodInfo Code : M4:MethodProperties I:Instructions LineNumberTable : L:LinesNumberTable LocalVariableTable : L2:LocalVariableTable StackMapTable : S:StackMapTable) => M1 ~> M2 ~> M4 ~> I ~> L ~> L2 ~> S	[structural]
		
		
	rule <k> (M1:Modifier T:Type I:Id M2:MethodArg ;) => . ... </k>
		<methods> ... (. => <method>
								<methodDecl> M1 T I M2 ; </methodDecl>
								//<methodSig> . </methodSig>
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
		<crnt> _ => M1 T I M2 ; </crnt>	
		
	rule <k> M1:Modifier static T:Type I:Id M2:MethodArg ; => . ... </k>
		<methods> ... (. => <method>
								<methodDecl> M1 static T I M2 ; </methodDecl>
								//<methodSig> . </methodSig>
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
		<crnt> _ => M1 static T I M2 ; </crnt>	
		
	rule <k> M:MainMethod => . ... </k>
		<methods> ... (. => <method>
								<methodDecl> M </methodDecl>
								//<methodSig> . </methodSig>
								<methodNameType> main </methodNameType>
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
		<crnt> _ => M </crnt>


	rule <k> M1:Modifier I:Id M2:MethodArg ; => . ... </k>
		<methods> ... (. => <method>
								<methodDecl> M1 I M2 ; </methodDecl>
								//<methodSig> . </methodSig>
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
		<crnt> _ => M1 I M2 ; </crnt>
	
	rule <k> Signature : C:CValue flags : M:MethodFlags => M ... </k>
		 <crnt> M2:MethodDeclaration </crnt>
		 <methodDecl> M2 </methodDecl>
		 //<methodSig> _ => C </methodSig>
		 <methodNameType> N:CValue => N : C </methodNameType>
	
	rule M1:MethodFlag , M2:MethodFlags => M1 ~> M2		[structural]
	
	rule <k> C:MethodFlag => . ... </k>
		 <crnt> M2:MethodDeclaration </crnt>
		 <methodDecl> M2 </methodDecl>
		 <methodFlags> ... . => SetItem(C) ... </methodFlags>		
			
	rule M1:MethodProperty, M2:MethodProperty, M3:MethodProperty => M1 ~> M2 ~> M3		[structural]
	
	rule <k> P:PropertyType = I:Int => . ... </k>
		 <crnt> M2:MethodDeclaration </crnt>
		 <methodDecl> M2 </methodDecl>
		 <metaInfo> ... . => P |-> I </metaInfo>
		 
	rule I1:Instructions I2:Instructions => I1 ~> I2	[structural]
		 
	rule <k> I:Int : O:InstructionOps => . ... </k>
		 <crnt> M2:MethodDeclaration </crnt>
		 <methodDecl> M2 </methodDecl>
		 <methodStmts> ... . => I |-> O </methodStmts>
		 
	rule L1:LinesNumberTable L2:LinesNumberTable => L1 ~> L2	[structural]
	
	rule <k> line I1:Int : I2:Int => . ... </k>
		 <crnt> M2:MethodDeclaration </crnt>
		 <methodDecl> M2 </methodDecl>
		 <lineNoTbl> ... . => I1 |-> I2 </lineNoTbl>
		 
	rule <k> S:StackMapTable => . ... </k>
		 <crnt> M2:MethodDeclaration </crnt>
		 <methodDecl> M2 </methodDecl>
		 <stackMapTbl> _ => S </stackMapTbl>
		 
	rule <k> T:TableHeader L:LocalVariables => L ... </k>
	
	rule L1:LocalVariables L2:LocalVariables => L1 ~> L2		[structural]
	
	rule <k> (I1:Int I2:Int I3:Int I4:Id I5:CValue) => . ... </k>
		 <crnt> M2:MethodDeclaration </crnt>
		 <methodDecl> M2 </methodDecl>
		 <localVarTbl> ... . => I3 |-> (I1 , I2 , I4 , I5) </localVarTbl>
		 
		 
	//------------------------------CLASS DECLARATION & FLAGS RULES------------------------------
	
	rule <k> C:ClassDecl => . ... </k>
		 <classes> ... (. => <class>
								<classDecl> C </classDecl>
								<classFlags> . </classFlags>
								<cpool>
									<cpoolStmts> . </cpoolStmts>
									<cpoolVals> . </cpoolVals>
								</cpool>
								<methods> . </methods>
								<fields> . </fields>
							 </class>) 
				   ... </classes>
		<crnt> _ => C </crnt>
	
	rule <k> flags : C:ClassFlags => C ... </k>	 
		 
	rule C1:ClassFlag , C2:ClassFlags => C1 ~> C2		[structural]
	
	rule <k> C:ClassFlag => . ... </k>
		 <crnt> C2:ClassDecl </crnt>
		 <classDecl> C2 </classDecl>
		 <classFlags> ... . => SetItem(C) ... </classFlags>		 

	//------------------------------CONSTANT POOL RULES------------------------------
	
	rule C1:CItems C2:CItems => C1 ~> C2		[structural]
	
	rule <k> Constant pool : C:CItems => C ... </k>

	syntax K ::= CType "." CValue
			
	
	rule <k> I:CIndex = C1:CType C2:CValue => . ... </k>
		 <cpoolStmts> ... . => I |-> C1 . C2 </cpoolStmts>
		 <cpoolVals> ... . => I |-> C2 </cpoolVals>	
	
	//Change Class from Utf8
	rule <cpoolStmts> ... I:CIndex |-> U:CType . I2:CValue => I |-> U . I2 ... </cpoolStmts>					//Utf8
		 <cpoolVals> ... I3:CIndex |-> I => I3 |-> I2  ... </cpoolVals>											//Class
		 
	//Change NameAndType first from Utf8
	rule <cpoolStmts> ... I:CIndex |-> U:CType . I2:CValue => I |-> U . I2 ... </cpoolStmts> 					//Utf8
		 <cpoolVals> ... I3:CIndex |-> I : I4:CIndex => I3 |-> I2 : I4 ... </cpoolVals>  						//NameAndType
		 
	//Change NameAndType second from Utf8
	rule <cpoolStmts> ... I:CIndex |-> U:CType . I2:CValue => I |-> U . I2 ... </cpoolStmts>					//Utf8
		 <cpoolVals> ... I3:CIndex |-> I4:CValue : I => I3 |-> I4 : I2 ... </cpoolVals>							//NameAndType
		 
	//Change Methodref/Fieldref first from Class
	rule <cpoolStmts> ... I:CIndex |-> (U:CType . I2:CValue) => I |-> (U . I2) ... </cpoolStmts>					//Class
		 <cpoolVals> ... I3:CIndex |-> (I . I4:CValue) => I3 |-> (I2 . I4) ... </cpoolVals>							//Methodref/Fieldref
		 
	//Change Methodref/Fieldref second->first from Utf8
	rule <cpoolStmts> ... I:CIndex |-> U:CType . I2:CValue => I |-> U . I2 ... </cpoolStmts>					//Utf8
		 <cpoolVals> ... I3:CIndex |-> (I4:CValue . (I : I5:CIndex)) => I3 |-> (I4 . (I2 : I5)) ... </cpoolVals>	//Methodref/Fieldref
	
	//Change Methodref/Fieldref second from NameAndType reference to Utf8 references
	rule <cpoolStmts> ... I:CIndex |-> U:CType . I2:CValue => I |-> U . I2 ... </cpoolStmts>					//NameAndType
		 <cpoolVals> ... I3:CIndex |-> (I4:CValue . I) => I3 |-> (I4 . I2) ... </cpoolVals>							//Methodref/Fieldref
		 
	//Change Methodref/Fieldref second->second from Utf8
	rule <cpoolStmts> ... I:CIndex |-> U:CType . I2:CValue => I |-> U . I2 ... </cpoolStmts>					//Utf8
		 <cpoolVals> ... I3:CIndex |-> (I4:CValue . (I5:CValue : I)) => I3 |-> (I4 . (I5 : I2)) ... </cpoolVals>	//Methodref/Fieldref 		 

endmodule

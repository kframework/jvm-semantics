require "jvm-semantics-classes.k"
require "jvm-semantics-common.k"
require "jvm-semantics-constant-pool.k"
require "jvm-semantics-fields.k"
require "jvm-semantics-instructions-arithmetic.k"
require "jvm-semantics-instructions-control-transfer.k"
require "jvm-semantics-instructions-load-and-store.k"
require "jvm-semantics-instructions-method-invocation-and-return.k"
require "jvm-semantics-instructions-object-creation-and-manipulation.k"
require "jvm-semantics-instructions-operand-stack-management.k"
require "jvm-semantics-instructions-type-conversion.k"
require "jvm-semantics-methods.k"


module JVM
    imports JVM-SEMANTICS-CLASSES
    imports JVM-SEMANTICS-COMMON
    imports JVM-SEMANTICS-CONSTANT-POOL
    imports JVM-SEMANTICS-FIELDS
    imports JVM-SEMANTICS-INSTRUCTIONS-ARITHMETIC
    imports JVM-SEMANTICS-INSTRUCTIONS-CONTROL-TRANSFER
    imports JVM-SEMANTICS-INSTRUCTIONS-LOAD-AND-STORE
    imports JVM-SEMANTICS-INSTRUCTIONS-METHOD-INVOCATION-AND-RETURN
    imports JVM-SEMANTICS-INSTRUCTIONS-OBJECT-CREATION-AND-MANIPULATION
    imports JVM-SEMANTICS-INSTRUCTIONS-OPERAND-STACK-MANAGEMENT
    imports JVM-SEMANTICS-INSTRUCTIONS-TYPE-CONVERSION
    imports JVM-SEMANTICS-METHODS
    imports JVM-SYNTAX
endmodule

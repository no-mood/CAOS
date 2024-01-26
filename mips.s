### MIPS64

# Instruction Set: 32 bit
# Register: 64 bit

## Assembler Directives:
# .data : start of data segment
# .text : start of code segment
# .code : start of code segment (same as .text)
# .org <n> : start address
# .space <n> : leave n empty bytes
# .ascii <s> : enter ascii string
# .asciiz <s> : enters zero terminated ascii string
# .align <n> : align to n-byte boundary
# .byte : byte
# .word : 64-bits
# .word16 : 64-bits
# .word32 : 64-bits
# .double : floating-point number


.data

varA:
.byte 1,2,3,4,5,6,7,8,9,10

varB:
.word 52 # 64 bit


.text

Main:
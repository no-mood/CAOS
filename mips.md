# MIPS64

Instruction Set: 32 bit  
Register: 64 bit

## Assembler Directives:

- `.data` : start of data segment
- `.text` : start of code segment
- `.code` : start of code segment (same as `.text`)
- `.org <n>` : start address
- `.space <n>` : leave n empty bytes
- `.ascii <s>` : enter ASCII string
- `.asciiz <s>` : enters zero-terminated ASCII string
- `.align <n>` : align to n-byte boundary
- `.byte` : byte
- `.word` : 64-bits
- `.word16` : 64-bits
- `.word32` : 64-bits
- `.double` : floating-point number

## Instruction Set

- ### Load and store

  - `lb` : load byte
  - `lbu` : load byte unsigned
  - `sb` : store byte
  - `lh` : load 16-bit half word
  - `lhu` : load 16-bit half word unsigned
  - `sh` : store 16-bit half word
  - `lw` : load 32-bit word
  - `lwu` : load 32-bit word unsigned
  - `sw` : store 32-bit word
  - `ld` : load 64-bit double word
  - `sd` : store 64-bit double word
  - `l.d` : load 64-bit floating-point
  - `s.d` : store 64-bit floating-point

- ### ALU operations

  - `daddi` : (Double) add immediate
  - `daddu` : (Double) add unsigned
  - `daddui` : (Double) add immediate unsigned
  - `andi` : logical and immediate
  - `ori` : logical or immediate
  - `xori` : exclusive or immediate
  - `lui` : load upper half of register immediate
  - `slt` : set less than
  - `dsll` : (Double) shift left logical
  - `srl` ?: shift right logical
  - `sra` ?: shift right arithmetic


- ### Branches and Jumps

  - `j` : jump to address
  - `jr` : jump to address in register
  - `jal` : jump and link to address (call subroutine)
  - `jalr` : jump and link to address in register (call subroutine)
  - `beq` : branch if pair of registers are equal
  - `bne` : branch if pair of registers are not equal
  - `beqz` : branch if register is equal to zero
  - `bnez` : branch if register is not equal to zero

- ### Floating Point

  - `add.d` : add floating-point
  - `sub.d` : subtract floating-point
  - `mul.d` : multiply floating-point
  - `div.d` : divide floating-point
  - `mov.d` : move floating-point

- ### Miscellaneous
  - `movz` : move if register equals zero
  - `movn` : move if register not equal to zero
  - `nop` : no operation

## Instruction Format

- ### I – type instruction: Immediate

  | OPcode | Rs    | Rt    | Immediate |
  | ------ | ----- | ----- | --------- |
  | 6-bit  | 5-bit | 5-bit | 16-bit    |

  - **Field Descriptions:**

    | Field     | Description                                                                                                                                                            |
    | --------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
    | opcode    | 6-bit primary operation code                                                                                                                                           |
    | Rs        | 5-bit specifier for the source register                                                                                                                                |
    | Rt        | 5-bit specifier for the target (source/destination) register                                                                                                           |
    | Immediate | 16-bit signed immediate used for logical operands, arithmetic signed operands, load/store address byte offsets, and PC-relative branch signed instruction displacement |

- ### R – type instruction : Register

| OPcode | Rs  | Rt  | Rd  | Sa  | Function |
| ------ | --- | --- | --- | --- | -------- |
| 6-bit  | 5   | 5   | 5   | 5   | 6-bit    |

- **Field Descriptions:**

  | Field    | Description                                                                      |
  | -------- | -------------------------------------------------------------------------------- |
  | opcode   | 6-bit primary operation code                                                     |
  | Rd       | 5-bit specifier for the destination register                                     |
  | Rs       | 5-bit specifier for the source register                                          |
  | Rt       | 5-bit specifier for the target (source/destination) register                     |
  | Sa       | 5-bit shift amount                                                               |
  | Function | 6-bit function field used to specify functions within the primary opcode SPECIAL |

- ### J – type instruction (Jump)

| OPcode | Offset                         |
| ------ | ------------------------------ |
| 6-bit  | 26-bit (shifted left two bits) |

- **Field Descriptions:**

  | Field  | Description                                                                                   |
  | ------ | --------------------------------------------------------------------------------------------- |
  | opcode | 6-bit primary operation code                                                                  |
  | Offset | 26-bit index shifted left two bits to supply the low-order 28 bits of the jump target address |

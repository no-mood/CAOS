# MIPS64

.data #### Data segment

arrayA:
.byte 1,2,3,4,5,6,7,8,9,10

arrayB:
.byte 1,2,3,4,5,6,7,8,9,10

arrayC:
.space 10 # saving 3 Bytes

minVal: .byte 0
maxVal: .byte 0


palindromeArray:
.byte 2,6,-3,11,9,11,-3,6,2

flag:
.byte 0 # Initialize an 8-bit unsigned variable flag, initially set to 0





.text ## Code segment

Main: ## This is a label, Main label is not mandatory

#jal ArraySumMinMax

jal PalindromeSequence

halt


# End of Main




### Exercise 1.1 with 10 numbers
### arrayC[i] = arrayA[i] + arrayB[i]
### search for max and min
ArraySumMinMax:
    dadd r1, r0, r0 # r1: i = 0
    daddi r2, r0, 10 # r2: N = 10

loop:
    lb r3, arrayA(r1)  # Load a byte from arrayA into r3
    lb r4, arrayB(r1)  # Load the same byte from arrayB into r4
    dadd r5, r3, r4  # Add r3 and r4
    sb r5, arrayC(r1)  # Store the result in arrayC

    daddi r1, r1, 1  # Increment the index
    bne r1, r2, loop  # Branch to loop if i != N

# Find the minimum and maximum values in the vector arrayC

    # Load the first element into r3 and assume it is the minimum and maximum
    lb r3, arrayC(r0)   # r3, min = c[0]
    dadd r4, r3, r0     # r4, max = min

# Loop to find the minimum and maximum
    daddi r1, r0, 1     # r1, i = 1
findLoop:
    lb r5, arrayC(r1)  # r5, value = c[i], Load a byte from arrayC into r5

# Check for minimum:
checkMin:
    slt r6, r5, r3    # if value < min
    beqz r6, checkMax # If r6 remains 0, r3 is the minimum, and we proceed to checkMax
    dadd r3, r5, r0  # Otherwise, r3 takes the value of r5

# Check for maximum:
checkMax:
    slt r6, r4, r5    # if max < value
    beqz r6, checkCounter # Compare r4 and r5 to check if r5 is less than r4
    dadd r4, r5, r0  # r4 takes the value of r5 if r5 is greater

# Continue the loop:
checkCounter:
    daddi r1, r1, 1 # i++
    bne r1, r2, findLoop  # branch to loop if i != N

# Store the minimum and maximum values:
    sb r3, minVal(r0) # Store the minVal
    sb r4, maxVal(r0) # Store the maxVal

jr $ra 
### End Exercise 1.1



### Exercise 1.2 
### check if the content of a N=9 8-bit array corresponds to a palindrome sequence
### If it does, use an 8-bit unsigned variable (flag) to store the result
PalindromeSequence:
daddi r1, r0, 0    # r1, i = 0
daddi r2, r0, 8    # r2, j = N-1
daddi r3, r0, 1   # r3, flag = 1 

# flag = 1
# for( i = 0, j = N-1; i != j; i++, j-- )
# if array[i] == array[N-1]; flag = 0
# break

pLoop:
    lb r4, palindromeArray(r1)  # r4, value1 = array[i]
    lb r5, palindromeArray(r2)  # r5, value2 = array[j]

    bne r4, r5, pSetFalse      # if value1 != value2, set to false

    daddi r1, r1, 1           # i++
    daddi r2, r2, -1          # N--
    bne r1, r2, pLoop 
    j pExit

pSetFalse:
dadd r3, r0, r0 # flag = 0

pExit:
sb r3, flag(r0) # store the flag

jr $ra
### End Exercise 1.2




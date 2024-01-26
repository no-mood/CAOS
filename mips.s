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

.text ## Code segment

Main: ## This is a label, Main label is not mandatory

jal ArraySumMinMax

halt


# End of Main




### Exercise 1.1 with 10 numbers
### arrayC[i] = arrayA[i] + arrayB[i]
### search for max and min
ArraySumMinMax:
    dadd r1, r0, r0 # r1 = 0
    daddi r2, r0, 10 # N = 10

loop:
    lb r3, arrayA(r1)  # Load a byte from arrayA into r3
    lb r4, arrayB(r1)  # Load the same byte from arrayB into r4
    dadd r5, r3, r4  # Add r3 and r4
    sb r5, arrayC(r1)  # Store the result in arrayC

    daddi r1, r1, 1  # Increment the index
    bne r1, r2, loop  # Branch to loop if i != N

# Find the minimum and maximum values in the vector arrayC
# Initialize variables:
    dadd r1, r0, r0     # r1 = 0# vector index
    daddi r2, r2, -1    #r2 = counter, N-1
    dadd r3, r0, r0     # r3 = 0# tempMin
    dadd r4, r0, r0     # r4 = 0# tempMax
    
    # Load the first element into r3 and assume it is the minimum and maximum
    lb r3, arrayC(r1)
    dadd r4, r3, r0

# Loop to find the minimum and maximum
findLoop:
    daddi r1, r1, 1  # Increment the index
    lb r5, arrayC(r1)  # Load a byte from arrayC into r5

# Check for minimum:
checkMin:
    dadd r6, r0, r0  # Flag register
    slt r6, r5, r3    # Compare r5 and r3 to check if r5 is less than r3
    beqz r6, checkMax # If r6 remains 0, r3 is the minimum, and we proceed to checkMax
    dadd r3, r5, r0  # Otherwise, r3 takes the value of r5

# Check for maximum:
checkMax:
    dadd r6, r0, r0  # Flag register
    slt r6, r4, r5    # Compare r4 and r5 to check if r5 is less than r4
    beqz r6, checkCounter
    dadd r4, r5, r0  # r4 takes the value of r5 if r5 is greater

# Continue the loop:
checkCounter:
    daddi r2, r2, -1  # Decrement the loop count
    bnez r2, findLoop  # Branch to findLoop if the loop count is not zero

# Store the minimum and maximum values:
    sb r3, minVal(r0) # Store the minVal
    sb r4, maxVal(r0) # Store the maxVal

jr $ra 
### End Exercise 1.1





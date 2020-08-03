.data

msg:  .asciiz "\t\t\tTic Tac Toe\n"
msg0: .asciiz"\n"
msg1: .asciiz"  "
msg2: .asciiz"Player 1 (X) - Player 2 (O)\n\n"
msg3: .asciiz"Player "
msg4: .asciiz", enter a number : "
msg5: .asciiz" wins "
msg6: .asciiz"\t\t\tGame Draw\n\n "
msg8: .asciiz"\t\t\tPlayer "
msg9: .asciiz"\n\t********************************************************\n\n"
box:  .asciiz "     |"
box0: .asciiz "_____|_____|_____\n"
box1: .asciiz "|"

array: .word '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
array1:.word 'X', 'O'

.text

.globl main

main:

la $t0,array
li $t1,1 #player 1
li $t2,0 #counter
li $t3,0 #register for
li $t4,0
la $t5,array1 #array X or O
li $t6,0 # X or O
li $t7,0
li $t8,0
li $t9,0

li $v0 , 4
la $a0 , msg
syscall

Human:

li $v0 , 4
la $a0 , msg9
syscall

jal board  #calls the function for board

li $v0 , 4
la $a0 , msg2
syscall

jal mode #checks whos turn it is

li $v0 , 4
la $a0 , msg3
syscall

li $v0 , 1
move $a0 , $v1
syscall

li $v0 , 4
la $a0 , msg4
syscall

li $v0,5
syscall
move $t7,$v0

jal change #assigns X and O on the board

move $t6,$v1

#checks if the sign should be placed on board or not
bne $t7,1,select2
lw $t4,4($t0)
bne $t4, '1',select2
sw $t6,4($t0)
b again

select2:
bne $t7,2,select3
lw $t4,8($t0)
bne $t4, '2',select3
sw $t6,8($t0)
b again

select3:
bne $t7,3,select4
lw $t4,12($t0)
bne $t4, '3',select4
sw $t6,12($t0)
b again

select4:
bne $t7,4,select5
lw $t4,16($t0)
bne $t4, '4',select5
sw $t6,16($t0)
b again

select5:
bne $t7,5,select6
lw $t4,20($t0)
bne $t4, '5',select6
sw $t6,20($t0)
b again

select6:
bne $t7,6,select7
lw $t4,24($t0)
bne $t4, '6',select7
sw $t6,24($t0)
b again

select7:
bne $t7,7,select8
lw $t4,28($t0)
bne $t4, '7',select8
sw $t6,28($t0)
b again

select8:
bne $t7,8,select9
lw $t4,32($t0)
bne $t4, '8',select9
sw $t6,32($t0)
b again

select9:
bgt $t7,9,same
blt $t7,1,same
beq $t7,9,here
b same

here:
lw $t4,36($t0)
bne $t4, '9',same
sw $t6,36($t0)

b again

same: #same players turn
sub $t1 $t1,1

again:

jal check #checks who is the winner

move $t2,$v1

add $t1,$t1,1

beq $t2,2,Human

li $v0 , 4
la $a0 , msg9
syscall

jal board	#board Function

jal winner #prints the winner

Exit: #exits the program
li $v0, 10
syscall

board: #prints the board ( board Function )

li $v0 , 4
la $a0 , box
syscall

li $v0 , 4
la $a0 , box
syscall

li $v0 , 4
la $a0 , msg0
syscall

li $v0 , 4
la $a0 , msg1
syscall

lw $t4,4($t0)
li $v0 , 11
move $a0 , $t4
syscall

li $v0 , 4
la $a0 , msg1
syscall

li $v0 , 4
la $a0 , box1
syscall

li $v0 , 4
la $a0 , msg1
syscall

lw $t4,8($t0)
li $v0 , 11
move $a0 , $t4
syscall

li $v0 , 4
la $a0 , msg1
syscall

li $v0 , 4
la $a0 , box1
syscall

li $v0 , 4
la $a0 , msg1
syscall

lw $t4,12($t0)
li $v0 , 11
move $a0 , $t4
syscall

li $v0 , 4
la $a0 , msg0
syscall

li $v0 , 4
la $a0 , box0
syscall

li $v0 , 4
la $a0 , box
syscall

li $v0 , 4
la $a0 , box
syscall

li $v0 , 4
la $a0 , msg0
syscall

li $v0 , 4
la $a0 , msg1
syscall

lw $t4,16($t0)
li $v0 , 11
move $a0 , $t4
syscall

li $v0 , 4
la $a0 , msg1
syscall

li $v0 , 4
la $a0 , box1
syscall

li $v0 , 4
la $a0 , msg1
syscall

lw $t4,20($t0)
li $v0 , 11
move $a0 , $t4
syscall

li $v0 , 4
la $a0 , msg1
syscall

li $v0 , 4
la $a0 , box1
syscall

li $v0 , 4
la $a0 , msg1
syscall

lw $t4,24($t0)
li $v0 , 11
move $a0 , $t4
syscall

li $v0 , 4
la $a0 , msg0
syscall

li $v0 , 4
la $a0 , box0
syscall

li $v0 , 4
la $a0 , box
syscall

li $v0 , 4
la $a0 , box
syscall

li $v0 , 4
la $a0 , msg0
syscall

li $v0 , 4
la $a0 , msg1
syscall

lw $t4,28($t0)
li $v0 , 11
move $a0 , $t4
syscall

li $v0 , 4
la $a0 , msg1
syscall

li $v0 , 4
la $a0 , box1
syscall

li $v0 , 4
la $a0 , msg1
syscall

lw $t4,32($t0)
li $v0 , 11
move $a0 , $t4
syscall

li $v0 , 4
la $a0 , msg1
syscall

li $v0 , 4
la $a0 , box1
syscall

li $v0 , 4
la $a0 , msg1
syscall

lw $t4,36($t0)
li $v0 , 11
move $a0 , $t4
syscall

li $v0 , 4
la $a0 , msg0
syscall

li $v0 , 4
la $a0 , box
syscall

li $v0 , 4
la $a0 , box
syscall

li $v0 , 4
la $a0 , msg0
syscall

li $v0 , 4
la $a0 , msg0
syscall

jr $ra #return

mode: #choses which players turn it is

	div $t1, $t1, 2
	mfhi $t1
	
	beq $t1,1,player1 
	li $t1,2
	move $v1,$t1
	
	jr $ra #return
	
player1:

li $t1,1
move $v1,$t1

jr $ra #return

change: #Applies X and O to the player

beq $t1,1,cX
lw $t6,4($t5)
move $v1,$t6

jr $ra #return

cX:
lw $t6,($t5)
move $v1,$t6

jr $ra #return

check: #checks the winning condition

condition1:
lw $t7,4($t0)
lw $t8,8($t0)
bne $t7,$t8,condition2
lw $t9,12($t0)
bne $t8,$t9,condition2
li $t2,1
move $v1,$t2

jr $ra #return

condition2:
lw $t7,16($t0)
lw $t8,20($t0)
bne $t7,$t8,condition3
lw $t9,24($t0)
bne $t8,$t9,condition3
li $t2,1
move $v1,$t2

jr $ra #return

condition3:
lw $t7,28($t0)
lw $t8,32($t0)
bne $t7,$t8,condition4
lw $t9,36($t0)
bne $t8,$t9,condition4
li $t2,1
move $v1,$t2

jr $ra #return

condition4:
lw $t7,4($t0)
lw $t8,16($t0)
bne $t7,$t8,condition5
lw $t9,28($t0)
bne $t8,$t9,condition5
li $t2,2
move $v1,$t1

jr $ra #return

condition5:
lw $t7,8($t0)
lw $t8,20($t0)
bne $t7,$t8,condition6
lw $t9,32($t0)
bne $t8,$t9,condition6
li $t2,1
move $v1,$t2

jr $ra #return

condition6:
lw $t7,12($t0)
lw $t8,24($t0)
bne $t7,$t8,condition7
lw $t9,36($t0)
bne $t8,$t9,condition7
li $t2,1
move $v1,$t2

jr $ra #return

condition7:
lw $t7,4($t0)
lw $t8,20($t0)
bne $t7,$t8,condition8
lw $t9,36($t0)
bne $t8,$t9,condition8
li $t2,1
move $v1,$t2

jr $ra #return

condition8:
lw $t7,12($t0)
lw $t8,20($t0)
bne $t7,$t8,condition9
lw $t9,28($t0)
bne $t8,$t9,condition9
li $t2,1
move $v1,$t2

jr $ra #return


condition9:

lw $t3,4($t0)
bne $t3,'1',next1
b end

next1:
lw $t3,8($t0)
bne $t3,'2',next2
b end

next2:
lw $t3,12($t0)
bne $t3,'3',next3
b end

next3:
lw $t3,16($t0)
bne $t3,'4',next4
b end

next4:
lw $t3,20($t0)
bne $t3,'5',next5
b end

next5:
lw $t3,24($t0)
bne $t3,'6',next6
b end

next6:
lw $t3,28($t0)
bne $t3,'7',next7
b end

next7:
lw $t3,32($t0)
bne $t3,'8',next8
b end

next8:
lw $t3,36($t0)
bne $t3,'9',next9
b end
next9:
li $v1,0

jr $ra #return


end:
li $v1,2

jr $ra #return

#check ends

winner:

li $v0 , 4
la $a0 , msg9
syscall

beq $t2,1,print



li $v0 , 4
la $a0 , msg6
syscall



jr $ra #return

print:

li $v0 , 4
la $a0 , msg8
syscall

sub $t1,$t1,1

li $v0,1
move $a0,$t1
syscall

li $v0 , 4
la $a0 , msg5
syscall

li $v0 , 4
la $a0 , msg0
syscall

jr $ra #return 
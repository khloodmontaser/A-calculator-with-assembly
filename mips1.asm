.data
first_msg:  .asciiz "please enter two number \n"
choice_msg: .asciiz "choose the operation \n"
op_msg:    .asciiz " \n 1- for + \n 2- for - \n 3- for x \n 4- for % \n"

msg1:.asciiz "\n THE ADDITION = "
msg2:.asciiz "\n THE SUBTRACTION = "
msg3:.asciiz "\n THE MULTIPLICATION = "
msg4:.asciiz "\n THE QOUTIONT = "
msg5:.asciiz "\n THE REMIANDER = "

##############################
.text 
main:
li $v0, 4 #to print a string
la $a0, first_msg
syscall

li $v0, 5 #to read the first integer
syscall 
addi $s0, $v0, 0 #first integer in $s0

li $v0 , 5 #to read the second integer
syscall 
addi $s1, $v0, 0   #second integer in $s1

li $v0, 4 
la $a0, choice_msg #to choose the no.of operation 
syscall

li $v0, 4 #to print a choice msg
la $a0, op_msg
syscall

li $v0, 5 #no.of chosen operation
syscall
##############################
#switch cases 
add $t0, $zero, $v0  #user input in t0    

#case1
addi $t1,$zero, 1              #t1 = 1
beq $t0 ,$t1 ,add_int          #if t0 = t1 = 1 go to add_int 

#case2
addi $t1 $zero, 2              #t1 = 2
beq $t0, $t1 ,sub_int          #if t0 = t1 = t2 go to sub_int

#case3
addi $t1 ,$zero ,3
beq $t0, $t1, mul_int

#case4
addi $t1, $zero ,4
beq $t0, $t1, div_int

# default case
j all_cases
##############################

#add case
add_int:
li $v0,4          #the addition is msg
la $a0, msg1
syscall
       add $a0,$s0,$s1      #a0 = s0+s1
       li $v0, 1            #to print the integer
       syscall
       j exit

#sub_case
sub_int:
li $v0,4
la $a0,msg2
syscall
      sub $a0, $s0, $s1     #a0=s0 - s1
      li $v0,1
      syscall
      j exit

#multiplication part 
mul_int:
li $v0, 4
la $a0, msg3
syscall
           mult $s0, $s1
           li $v0,1
           mfhi $a0       #move from hi register
           syscall
           mflo $a0        #move from lo register
           syscall
           j exit

#division_part
div_int:
li $v0, 4
la $a0, msg4
syscall
        div $s0, $s1
        li $v0, 1
        mflo $a0
        syscall
        #remider
        li $v0,4
        la $a0, msg5
        syscall
        li $v0,1
        mfhi $a0
        syscall
        j exit
###################################
#default_part
all_cases:

#addition
li $v0,4
la $a0, msg1
syscall 
add $a0, $s0, $s1
li $v0,1
syscall 

#subtraction
li $v0, 4
la $a0, msg2
syscall 
sub $a0,$s0,$s1
li $v0,1
syscall 

#multiplcation
li  $v0,4
la $a0,msg3
syscall 
mult $s0, $s1
li $v0,1
mfhi $a0
syscall 
mflo $a0
syscall 

#division
li $v0, 4
la $a0, msg4
syscall 
div $s0, $s1
li $v0 ,1
mflo $a0
syscall 
li $v0,4
la $a0,msg5
syscall 
li $v0,1
mfhi $a0
syscall 

#exit
exit:
li $v0, 10
syscall 





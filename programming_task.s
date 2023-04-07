.text              
# start code here

main:
    la s0,number
    lw s0,0(s0)
    li t0, 1
    #mv t1,a0
    jal fact
     mul a0,a0,s0 
     la s1,result
     sw a0,0(s1)
   

   j write_tohost

fact:     
    addi  sp, sp, -8 
    sw ra, 0(sp)
    sw s0,4(sp)
  

    ble s0, t0, return
    addi s0, s0, -1
    
    jal fact 
     mul a0,a0,s0      
done:
    lw ra,0(sp)
    lw s0,4(sp)
    addi sp, sp, 8
    
    jr ra     
    
 return:
 addi a0,x0,1
    lw ra,0(sp)
    lw s0,4(sp)
    addi sp, sp, 8
    
    jr ra     
    

# end code here


write_tohost:

li x1, 1

sw x1, tohost, t5

j write_tohost

.data 
# start data section here

number: .word 7
result: .word 0


# end data section here

.align 12

.section ".tohost","aw",@progbits;                            

.align 4; .global tohost; tohost: .dword 0;                     

.align 4; .global fromhost; fromhost: .dword 0; 


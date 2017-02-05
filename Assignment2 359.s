
sizeInput:
			sub	sp,	sp,	#4
			mov	r1,	sp
			bl	scanf 
			ldr r3,	[sp,#0] //r3 is usr input
			add	sp,	sp,	#4
			cmp r3,	#3
			b.lt errorSize
			cmp r3,	#9
			b.gt errorSize
			
			
usrInput:
			sub	sp,	sp,	#4
			mov	r1,	sp
			bl	scanf
			ldr	r2,	[sp,#0] //r2 is usr input
			add	sp,	sp,	#4
			cmp	r2,	q
			b.eq	exit
			cmp	r2,	-1
			b.eq printout
			cmp	r2,	0
			b.eq	error
			cmp	r2,	3
			b.gt	error
			
error:
			ldr r0, =errorOutOfBound
			bl 		WriteStringUART
			
errorSize:
			ldr r0,	=errorOutOfRange
			bl		WriteStringUART
			

.section .data             //data section
.align 2                   //align to word boundaries
displayNames:
				.ascii "Creator Names: Michael Verwaayen & Jason Huang /n"
displayOptions:	
				.ascii "1. Square	2. Rectangle	3. Triangle"
Prompt:	
				.ascii "Enter a number"
PromptSize:	
				.ascii "Enter size of the object"
errorOutOfBound:
				.ascii "Invalid number option"
errorOutOfRange:
				.ascii "Number between 3-9 please!"
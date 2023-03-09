		addi	x2,	x0,	5		# x2 = 5				00500113
		addi 	x3,	x0, 13		# x3 = 12				00C00193
		addi 	x7,	x3, -9		# x7 = 3				FF718393
		or		x4, x7, x2		# x4 = 7				0023E233
		xor 	x5,	x3,	x4		# x5 = 11				0041C2B3
		add		x5, x5, x4		# x5 = 18				004282B3
		beq		x5, x7, end 	#						02728863
		slt		x4, x3, x4		# x4 = (12 < 7) = 0		0041A233
		beq		x4, x0, around	# 						00020463
		addi	x5, x0, 0		#						00000293
around:	slt		x4, x7, x2      # x4 = (3 < 5) = 1		0023A233
		add 	x7, x4, x5 		# x7 = 19				005203B3
		sub 	x7, x7, x2 		# x7 = 14				402383B3
		sw 		x7, 84(x3)		# 						0471AA23
		lw 		x2, 96(x0)		# x2 = 14				06002103
		add 	x9, x2, x5		# x9 = 32				005104B3
		jal		x3, end			#						008001EF
		addi 	x2, x0, 1		# 						00100113
end:	add 	x2, x2, x9		# x2 = 46				00910133
		addi	x4, x0, 1		# x4 = 1				00100213
		lui 	x5, 0x80000		# x5 = 0x80000000		800002b7
		slt 	x6, x5, x4		# x6 = 1				0042a333
wrong:	beq		x6,	x0,	wrong 	#						00030063
		lui 	x9, 0xABCDE		# x3 = 0xABCDE000		ABCDE4B7
		add		x2, x2, x9		# x2 = 0xABCDE02E		00910133
		sw		x2, 0x40(x3)	# mem[132] = 0xABCDE02E	0421a023
done	beq		x2, x2, done	# infinite loop			00210063

tp0:     file format elf32-tradbigmips


Disassembly of section .init:

00000878 <_init>:
 878:	3c1c0002 	lui	gp,0x2
 87c:	279c9248 	addiu	gp,gp,-28088
 880:	0399e021 	addu	gp,gp,t9
 884:	27bdffe0 	addiu	sp,sp,-32
 888:	afbc0010 	sw	gp,16(sp)
 88c:	afbf001c 	sw	ra,28(sp)
 890:	8f828094 	lw	v0,-32620(gp)
 894:	10400004 	beqz	v0,8a8 <_init+0x30>
 898:	00000000 	nop
 89c:	8f998094 	lw	t9,-32620(gp)
 8a0:	0320f809 	jalr	t9
 8a4:	00000000 	nop
 8a8:	8fbf001c 	lw	ra,28(sp)
 8ac:	03e00008 	jr	ra
 8b0:	27bd0020 	addiu	sp,sp,32

Disassembly of section .text:

000008c0 <__start>:
     8c0:	03e00025 	move	zero,ra
     8c4:	04110001 	bal	8cc <__start+0xc>
     8c8:	00000000 	nop
     8cc:	3c1c0002 	lui	gp,0x2
     8d0:	279c91f4 	addiu	gp,gp,-28172
     8d4:	039fe021 	addu	gp,gp,ra
     8d8:	0000f825 	move	ra,zero
     8dc:	8f848018 	lw	a0,-32744(gp)
     8e0:	8fa50000 	lw	a1,0(sp)
     8e4:	27a60004 	addiu	a2,sp,4
     8e8:	2401fff8 	li	at,-8
     8ec:	03a1e824 	and	sp,sp,at
     8f0:	27bdffe0 	addiu	sp,sp,-32
     8f4:	8f87801c 	lw	a3,-32740(gp)
     8f8:	8f888020 	lw	t0,-32736(gp)
     8fc:	afa80010 	sw	t0,16(sp)
     900:	afa20014 	sw	v0,20(sp)
     904:	afbd0018 	sw	sp,24(sp)
     908:	8f99808c 	lw	t9,-32628(gp)
     90c:	0320f809 	jalr	t9
     910:	00000000 	nop

00000914 <hlt>:
     914:	1000ffff 	b	914 <hlt>
     918:	00000000 	nop
     91c:	00000000 	nop

00000920 <deregister_tm_clones>:
     920:	3c1c0002 	lui	gp,0x2
     924:	279c91a0 	addiu	gp,gp,-28256
     928:	0399e021 	addu	gp,gp,t9
     92c:	8f848028 	lw	a0,-32728(gp)
     930:	8f828024 	lw	v0,-32732(gp)
     934:	24841ac4 	addiu	a0,a0,6852
     938:	24420003 	addiu	v0,v0,3
     93c:	00441023 	subu	v0,v0,a0
     940:	2c420007 	sltiu	v0,v0,7
     944:	14400005 	bnez	v0,95c <deregister_tm_clones+0x3c>
     948:	8f9980a8 	lw	t9,-32600(gp)
     94c:	13200003 	beqz	t9,95c <deregister_tm_clones+0x3c>
     950:	00000000 	nop
     954:	03200008 	jr	t9
     958:	00000000 	nop
     95c:	03e00008 	jr	ra
     960:	00000000 	nop

00000964 <register_tm_clones>:
     964:	3c1c0002 	lui	gp,0x2
     968:	279c915c 	addiu	gp,gp,-28324
     96c:	0399e021 	addu	gp,gp,t9
     970:	8f848028 	lw	a0,-32728(gp)
     974:	8f858024 	lw	a1,-32732(gp)
     978:	24841ac4 	addiu	a0,a0,6852
     97c:	00a42823 	subu	a1,a1,a0
     980:	00052883 	sra	a1,a1,0x2
     984:	000517c2 	srl	v0,a1,0x1f
     988:	00452821 	addu	a1,v0,a1
     98c:	00052843 	sra	a1,a1,0x1
     990:	10a00005 	beqz	a1,9a8 <register_tm_clones+0x44>
     994:	8f998070 	lw	t9,-32656(gp)
     998:	13200003 	beqz	t9,9a8 <register_tm_clones+0x44>
     99c:	00000000 	nop
     9a0:	03200008 	jr	t9
     9a4:	00000000 	nop
     9a8:	03e00008 	jr	ra
     9ac:	00000000 	nop

000009b0 <__do_global_dtors_aux>:
     9b0:	3c1c0002 	lui	gp,0x2
     9b4:	279c9110 	addiu	gp,gp,-28400
     9b8:	0399e021 	addu	gp,gp,t9
     9bc:	27bdffe0 	addiu	sp,sp,-32
     9c0:	afb00018 	sw	s0,24(sp)
     9c4:	8f908028 	lw	s0,-32728(gp)
     9c8:	afbc0010 	sw	gp,16(sp)
     9cc:	afbf001c 	sw	ra,28(sp)
     9d0:	92021b80 	lbu	v0,7040(s0)
     9d4:	1440000d 	bnez	v0,a0c <__do_global_dtors_aux+0x5c>
     9d8:	8f8280ac 	lw	v0,-32596(gp)
     9dc:	10400005 	beqz	v0,9f4 <__do_global_dtors_aux+0x44>
     9e0:	8f82802c 	lw	v0,-32724(gp)
     9e4:	8f9980ac 	lw	t9,-32596(gp)
     9e8:	0320f809 	jalr	t9
     9ec:	8c440000 	lw	a0,0(v0)
     9f0:	8fbc0010 	lw	gp,16(sp)
     9f4:	8f998030 	lw	t9,-32720(gp)
     9f8:	27390920 	addiu	t9,t9,2336
     9fc:	0411ffc8 	bal	920 <deregister_tm_clones>
     a00:	00000000 	nop
     a04:	24020001 	li	v0,1
     a08:	a2021b80 	sb	v0,7040(s0)
     a0c:	8fbf001c 	lw	ra,28(sp)
     a10:	8fb00018 	lw	s0,24(sp)
     a14:	03e00008 	jr	ra
     a18:	27bd0020 	addiu	sp,sp,32

00000a1c <frame_dummy>:
     a1c:	3c1c0002 	lui	gp,0x2
     a20:	279c90a4 	addiu	gp,gp,-28508
     a24:	0399e021 	addu	gp,gp,t9
     a28:	8f828028 	lw	v0,-32728(gp)
     a2c:	27bdffe0 	addiu	sp,sp,-32
     a30:	2444194c 	addiu	a0,v0,6476
     a34:	afbc0010 	sw	gp,16(sp)
     a38:	afbf001c 	sw	ra,28(sp)
     a3c:	8c820000 	lw	v0,0(a0)
     a40:	14400006 	bnez	v0,a5c <frame_dummy+0x40>
     a44:	8f998078 	lw	t9,-32648(gp)
     a48:	8f998030 	lw	t9,-32720(gp)
     a4c:	8fbf001c 	lw	ra,28(sp)
     a50:	27390964 	addiu	t9,t9,2404
     a54:	1000ffc3 	b	964 <register_tm_clones>
     a58:	27bd0020 	addiu	sp,sp,32
     a5c:	1320fffa 	beqz	t9,a48 <frame_dummy+0x2c>
     a60:	00000000 	nop
     a64:	0320f809 	jalr	t9
     a68:	00000000 	nop
     a6c:	1000fff6 	b	a48 <frame_dummy+0x2c>
     a70:	8fbc0010 	lw	gp,16(sp)
	...

00000a80 <print_version>:
     a80:	3c1c0002 	lui	gp,0x2
     a84:	279c9040 	addiu	gp,gp,-28608
     a88:	0399e021 	addu	gp,gp,t9
     a8c:	27bdffe0 	addiu	sp,sp,-32
     a90:	afbf001c 	sw	ra,28(sp)
     a94:	afbe0018 	sw	s8,24(sp)
     a98:	03a0f025 	move	s8,sp
     a9c:	afbc0010 	sw	gp,16(sp)
     aa0:	8f828030 	lw	v0,-32720(gp)
     aa4:	244416d0 	addiu	a0,v0,5840
     aa8:	8f828098 	lw	v0,-32616(gp)
     aac:	0040c825 	move	t9,v0
     ab0:	0320f809 	jalr	t9
     ab4:	00000000 	nop
     ab8:	8fdc0010 	lw	gp,16(s8)
     abc:	00000000 	nop
     ac0:	03c0e825 	move	sp,s8
     ac4:	8fbf001c 	lw	ra,28(sp)
     ac8:	8fbe0018 	lw	s8,24(sp)
     acc:	27bd0020 	addiu	sp,sp,32
     ad0:	03e00008 	jr	ra
     ad4:	00000000 	nop

00000ad8 <print_help>:
     ad8:	3c1c0002 	lui	gp,0x2
     adc:	279c8fe8 	addiu	gp,gp,-28696
     ae0:	0399e021 	addu	gp,gp,t9
     ae4:	27bdffe0 	addiu	sp,sp,-32
     ae8:	afbf001c 	sw	ra,28(sp)
     aec:	afbe0018 	sw	s8,24(sp)
     af0:	03a0f025 	move	s8,sp
     af4:	afbc0010 	sw	gp,16(sp)
     af8:	8f828030 	lw	v0,-32720(gp)
     afc:	244416d8 	addiu	a0,v0,5848
     b00:	8f828098 	lw	v0,-32616(gp)
     b04:	0040c825 	move	t9,v0
     b08:	0320f809 	jalr	t9
     b0c:	00000000 	nop
     b10:	8fdc0010 	lw	gp,16(s8)
     b14:	00000000 	nop
     b18:	03c0e825 	move	sp,s8
     b1c:	8fbf001c 	lw	ra,28(sp)
     b20:	8fbe0018 	lw	s8,24(sp)
     b24:	27bd0020 	addiu	sp,sp,32
     b28:	03e00008 	jr	ra
     b2c:	00000000 	nop

00000b30 <main>:
     b30:	3c1c0002 	lui	gp,0x2
     b34:	279c8f90 	addiu	gp,gp,-28784
     b38:	0399e021 	addu	gp,gp,t9
     b3c:	27bdffc0 	addiu	sp,sp,-64
     b40:	afbf003c 	sw	ra,60(sp)
     b44:	afbe0038 	sw	s8,56(sp)
     b48:	03a0f025 	move	s8,sp
     b4c:	afbc0018 	sw	gp,24(sp)
     b50:	afc40040 	sw	a0,64(s8)
     b54:	afc50044 	sw	a1,68(s8)
     b58:	8f828030 	lw	v0,-32720(gp)
     b5c:	24421800 	addiu	v0,v0,6144
     b60:	afc2002c 	sw	v0,44(s8)
     b64:	8f828088 	lw	v0,-32632(gp)
     b68:	8c420000 	lw	v0,0(v0)
     b6c:	afc20020 	sw	v0,32(s8)
     b70:	8f828080 	lw	v0,-32640(gp)
     b74:	8c420000 	lw	v0,0(v0)
     b78:	afc20024 	sw	v0,36(s8)
     b7c:	24020001 	li	v0,1
     b80:	a3c20028 	sb	v0,40(s8)
     b84:	1000005e 	b	d00 <main+0x1d0>
     b88:	00000000 	nop
     b8c:	8fc20030 	lw	v0,48(s8)
     b90:	2442ffaa 	addiu	v0,v0,-86
     b94:	2c43001a 	sltiu	v1,v0,26
     b98:	10600056 	beqz	v1,cf4 <main+0x1c4>
     b9c:	00000000 	nop
     ba0:	00021880 	sll	v1,v0,0x2
     ba4:	8f828030 	lw	v0,-32720(gp)
     ba8:	24421820 	addiu	v0,v0,6176
     bac:	00621021 	addu	v0,v1,v0
     bb0:	8c420000 	lw	v0,0(v0)
     bb4:	005c1021 	addu	v0,v0,gp
     bb8:	00400008 	jr	v0
     bbc:	00000000 	nop
     bc0:	8f828034 	lw	v0,-32716(gp)
     bc4:	0040c825 	move	t9,v0
     bc8:	0411ffad 	bal	a80 <print_version>
     bcc:	00000000 	nop
     bd0:	8fdc0018 	lw	gp,24(s8)
     bd4:	00001025 	move	v0,zero
     bd8:	10000079 	b	dc0 <main+0x290>
     bdc:	00000000 	nop
     be0:	8f828038 	lw	v0,-32712(gp)
     be4:	0040c825 	move	t9,v0
     be8:	0411ffbb 	bal	ad8 <print_help>
     bec:	00000000 	nop
     bf0:	8fdc0018 	lw	gp,24(s8)
     bf4:	00001025 	move	v0,zero
     bf8:	10000071 	b	dc0 <main+0x290>
     bfc:	00000000 	nop
     c00:	8f82806c 	lw	v0,-32660(gp)
     c04:	8c430000 	lw	v1,0(v0)
     c08:	8f828030 	lw	v0,-32720(gp)
     c0c:	24451808 	addiu	a1,v0,6152
     c10:	00602025 	move	a0,v1
     c14:	8f8280a4 	lw	v0,-32604(gp)
     c18:	0040c825 	move	t9,v0
     c1c:	0320f809 	jalr	t9
     c20:	00000000 	nop
     c24:	8fdc0018 	lw	gp,24(s8)
     c28:	afc20024 	sw	v0,36(s8)
     c2c:	8fc20024 	lw	v0,36(s8)
     c30:	14400033 	bnez	v0,d00 <main+0x1d0>
     c34:	00000000 	nop
     c38:	8f8280a0 	lw	v0,-32608(gp)
     c3c:	8c420000 	lw	v0,0(v0)
     c40:	00403825 	move	a3,v0
     c44:	2406000f 	li	a2,15
     c48:	24050001 	li	a1,1
     c4c:	8f828030 	lw	v0,-32720(gp)
     c50:	2444180c 	addiu	a0,v0,6156
     c54:	8f82809c 	lw	v0,-32612(gp)
     c58:	0040c825 	move	t9,v0
     c5c:	0320f809 	jalr	t9
     c60:	00000000 	nop
     c64:	8fdc0018 	lw	gp,24(s8)
     c68:	24020001 	li	v0,1
     c6c:	10000054 	b	dc0 <main+0x290>
     c70:	00000000 	nop
     c74:	8f82806c 	lw	v0,-32660(gp)
     c78:	8c430000 	lw	v1,0(v0)
     c7c:	8f828030 	lw	v0,-32720(gp)
     c80:	2445181c 	addiu	a1,v0,6172
     c84:	00602025 	move	a0,v1
     c88:	8f8280a4 	lw	v0,-32604(gp)
     c8c:	0040c825 	move	t9,v0
     c90:	0320f809 	jalr	t9
     c94:	00000000 	nop
     c98:	8fdc0018 	lw	gp,24(s8)
     c9c:	afc20020 	sw	v0,32(s8)
     ca0:	8fc20020 	lw	v0,32(s8)
     ca4:	14400016 	bnez	v0,d00 <main+0x1d0>
     ca8:	00000000 	nop
     cac:	8f8280a0 	lw	v0,-32608(gp)
     cb0:	8c420000 	lw	v0,0(v0)
     cb4:	00403825 	move	a3,v0
     cb8:	2406000f 	li	a2,15
     cbc:	24050001 	li	a1,1
     cc0:	8f828030 	lw	v0,-32720(gp)
     cc4:	2444180c 	addiu	a0,v0,6156
     cc8:	8f82809c 	lw	v0,-32612(gp)
     ccc:	0040c825 	move	t9,v0
     cd0:	0320f809 	jalr	t9
     cd4:	00000000 	nop
     cd8:	8fdc0018 	lw	gp,24(s8)
     cdc:	24020001 	li	v0,1
     ce0:	10000037 	b	dc0 <main+0x290>
     ce4:	00000000 	nop
     ce8:	a3c00028 	sb	zero,40(s8)
     cec:	10000004 	b	d00 <main+0x1d0>
     cf0:	00000000 	nop
     cf4:	24020001 	li	v0,1
     cf8:	10000031 	b	dc0 <main+0x290>
     cfc:	00000000 	nop
     d00:	afa00010 	sw	zero,16(sp)
     d04:	8f828028 	lw	v0,-32728(gp)
     d08:	24471960 	addiu	a3,v0,6496
     d0c:	8fc6002c 	lw	a2,44(s8)
     d10:	8fc50044 	lw	a1,68(s8)
     d14:	8fc40040 	lw	a0,64(s8)
     d18:	8f828090 	lw	v0,-32624(gp)
     d1c:	0040c825 	move	t9,v0
     d20:	0320f809 	jalr	t9
     d24:	00000000 	nop
     d28:	8fdc0018 	lw	gp,24(s8)
     d2c:	afc20030 	sw	v0,48(s8)
     d30:	8fc30030 	lw	v1,48(s8)
     d34:	2402ffff 	li	v0,-1
     d38:	1462ff94 	bne	v1,v0,b8c <main+0x5c>
     d3c:	00000000 	nop
     d40:	93c20028 	lbu	v0,40(s8)
     d44:	1040000a 	beqz	v0,d70 <main+0x240>
     d48:	00000000 	nop
     d4c:	8fc50024 	lw	a1,36(s8)
     d50:	8fc40020 	lw	a0,32(s8)
     d54:	8f82803c 	lw	v0,-32708(gp)
     d58:	0040c825 	move	t9,v0
     d5c:	0411012e 	bal	1218 <base64_encode_file>
     d60:	00000000 	nop
     d64:	8fdc0018 	lw	gp,24(s8)
     d68:	10000008 	b	d8c <main+0x25c>
     d6c:	00000000 	nop
     d70:	8fc50024 	lw	a1,36(s8)
     d74:	8fc40020 	lw	a0,32(s8)
     d78:	8f828040 	lw	v0,-32704(gp)
     d7c:	0040c825 	move	t9,v0
     d80:	04110187 	bal	13a0 <base64_decode_file>
     d84:	00000000 	nop
     d88:	8fdc0018 	lw	gp,24(s8)
     d8c:	8fc40020 	lw	a0,32(s8)
     d90:	8f828074 	lw	v0,-32652(gp)
     d94:	0040c825 	move	t9,v0
     d98:	0320f809 	jalr	t9
     d9c:	00000000 	nop
     da0:	8fdc0018 	lw	gp,24(s8)
     da4:	8fc40024 	lw	a0,36(s8)
     da8:	8f828074 	lw	v0,-32652(gp)
     dac:	0040c825 	move	t9,v0
     db0:	0320f809 	jalr	t9
     db4:	00000000 	nop
     db8:	8fdc0018 	lw	gp,24(s8)
     dbc:	00001025 	move	v0,zero
     dc0:	03c0e825 	move	sp,s8
     dc4:	8fbf003c 	lw	ra,60(sp)
     dc8:	8fbe0038 	lw	s8,56(sp)
     dcc:	27bd0040 	addiu	sp,sp,64
     dd0:	03e00008 	jr	ra
     dd4:	00000000 	nop
	...

00000de0 <octets_to_sextets>:
static unsigned char base64_decoding[256] = {
        INVALID,
        [PADDING_CHAR] = 0,
};

void octets_to_sextets(unsigned const char octets[3], unsigned char sextets[4], int missing_octets) {
     de0:	3c1c0002 	lui	gp,0x2
     de4:	279c8ce0 	addiu	gp,gp,-29472
     de8:	0399e021 	addu	gp,gp,t9
     dec:	27bdfff8 	addiu	sp,sp,-8
     df0:	afbe0004 	sw	s8,4(sp)
     df4:	03a0f025 	move	s8,sp
     df8:	afc40008 	sw	a0,8(s8)
     dfc:	afc5000c 	sw	a1,12(s8)
     e00:	afc60010 	sw	a2,16(s8)
    sextets[0] = base64_encoding[octets[0] >> 2];
     e04:	8fc20008 	lw	v0,8(s8)
     e08:	90420000 	lbu	v0,0(v0)
     e0c:	00021082 	srl	v0,v0,0x2
     e10:	304200ff 	andi	v0,v0,0xff
     e14:	00401825 	move	v1,v0
     e18:	8f828030 	lw	v0,-32720(gp)
     e1c:	244218b0 	addiu	v0,v0,6320
     e20:	00621021 	addu	v0,v1,v0
     e24:	90430000 	lbu	v1,0(v0)
     e28:	8fc2000c 	lw	v0,12(s8)
     e2c:	a0430000 	sb	v1,0(v0)
    sextets[1] = base64_encoding[((octets[0] & 0x03) << 4) | (octets[1] >> 4)];
     e30:	8fc2000c 	lw	v0,12(s8)
     e34:	24420001 	addiu	v0,v0,1
     e38:	8fc30008 	lw	v1,8(s8)
     e3c:	90630000 	lbu	v1,0(v1)
     e40:	00031900 	sll	v1,v1,0x4
     e44:	30630030 	andi	v1,v1,0x30
     e48:	8fc40008 	lw	a0,8(s8)
     e4c:	24840001 	addiu	a0,a0,1
     e50:	90840000 	lbu	a0,0(a0)
     e54:	00042102 	srl	a0,a0,0x4
     e58:	308400ff 	andi	a0,a0,0xff
     e5c:	00642025 	or	a0,v1,a0
     e60:	8f838030 	lw	v1,-32720(gp)
     e64:	246318b0 	addiu	v1,v1,6320
     e68:	00831821 	addu	v1,a0,v1
     e6c:	90630000 	lbu	v1,0(v1)
     e70:	a0430000 	sb	v1,0(v0)
    sextets[2] = base64_encoding[((octets[1] & 0x0f) << 2) | (octets[2] >> 6)];
     e74:	8fc2000c 	lw	v0,12(s8)
     e78:	24420002 	addiu	v0,v0,2
     e7c:	8fc30008 	lw	v1,8(s8)
     e80:	24630001 	addiu	v1,v1,1
     e84:	90630000 	lbu	v1,0(v1)
     e88:	00031880 	sll	v1,v1,0x2
     e8c:	3063003c 	andi	v1,v1,0x3c
     e90:	8fc40008 	lw	a0,8(s8)
     e94:	24840002 	addiu	a0,a0,2
     e98:	90840000 	lbu	a0,0(a0)
     e9c:	00042182 	srl	a0,a0,0x6
     ea0:	308400ff 	andi	a0,a0,0xff
     ea4:	00642025 	or	a0,v1,a0
     ea8:	8f838030 	lw	v1,-32720(gp)
     eac:	246318b0 	addiu	v1,v1,6320
     eb0:	00831821 	addu	v1,a0,v1
     eb4:	90630000 	lbu	v1,0(v1)
     eb8:	a0430000 	sb	v1,0(v0)
    sextets[3] = base64_encoding[octets[2] & 0x3f];
     ebc:	8fc2000c 	lw	v0,12(s8)
     ec0:	24420003 	addiu	v0,v0,3
     ec4:	8fc30008 	lw	v1,8(s8)
     ec8:	24630002 	addiu	v1,v1,2
     ecc:	90630000 	lbu	v1,0(v1)
     ed0:	3064003f 	andi	a0,v1,0x3f
     ed4:	8f838030 	lw	v1,-32720(gp)
     ed8:	246318b0 	addiu	v1,v1,6320
     edc:	00831821 	addu	v1,a0,v1
     ee0:	90630000 	lbu	v1,0(v1)
     ee4:	a0430000 	sb	v1,0(v0)

    if (missing_octets >= 1) sextets[3] = PADDING_CHAR;
     ee8:	8fc20010 	lw	v0,16(s8)
     eec:	18400005 	blez	v0,f04 <octets_to_sextets+0x124>
     ef0:	00000000 	nop
     ef4:	8fc2000c 	lw	v0,12(s8)
     ef8:	24420003 	addiu	v0,v0,3
     efc:	2403003d 	li	v1,61
     f00:	a0430000 	sb	v1,0(v0)
    if (missing_octets == 2) sextets[2] = PADDING_CHAR;
     f04:	8fc30010 	lw	v1,16(s8)
     f08:	24020002 	li	v0,2
     f0c:	14620005 	bne	v1,v0,f24 <octets_to_sextets+0x144>
     f10:	00000000 	nop
     f14:	8fc2000c 	lw	v0,12(s8)
     f18:	24420002 	addiu	v0,v0,2
     f1c:	2403003d 	li	v1,61
     f20:	a0430000 	sb	v1,0(v0)
}
     f24:	00000000 	nop
     f28:	03c0e825 	move	sp,s8
     f2c:	8fbe0004 	lw	s8,4(sp)
     f30:	27bd0008 	addiu	sp,sp,8
     f34:	03e00008 	jr	ra
     f38:	00000000 	nop

00000f3c <sextets_to_octets>:

int sextets_to_octets(unsigned const char sextets[4], unsigned char octets[3]) {
     f3c:	3c1c0002 	lui	gp,0x2
     f40:	279c8b84 	addiu	gp,gp,-29820
     f44:	0399e021 	addu	gp,gp,t9
     f48:	27bdfff8 	addiu	sp,sp,-8
     f4c:	afbe0004 	sw	s8,4(sp)
     f50:	03a0f025 	move	s8,sp
     f54:	afc40008 	sw	a0,8(s8)
     f58:	afc5000c 	sw	a1,12(s8)
    octets[0] = base64_decoding[sextets[0]] << 2 | base64_decoding[sextets[1]] >> 4;
     f5c:	8fc20008 	lw	v0,8(s8)
     f60:	90420000 	lbu	v0,0(v0)
     f64:	00401825 	move	v1,v0
     f68:	8f828028 	lw	v0,-32728(gp)
     f6c:	244219c0 	addiu	v0,v0,6592
     f70:	00621021 	addu	v0,v1,v0
     f74:	90420000 	lbu	v0,0(v0)
     f78:	00021080 	sll	v0,v0,0x2
     f7c:	7c021c20 	seb	v1,v0
     f80:	8fc20008 	lw	v0,8(s8)
     f84:	24420001 	addiu	v0,v0,1
     f88:	90420000 	lbu	v0,0(v0)
     f8c:	00402025 	move	a0,v0
     f90:	8f828028 	lw	v0,-32728(gp)
     f94:	244219c0 	addiu	v0,v0,6592
     f98:	00821021 	addu	v0,a0,v0
     f9c:	90420000 	lbu	v0,0(v0)
     fa0:	00021102 	srl	v0,v0,0x4
     fa4:	304200ff 	andi	v0,v0,0xff
     fa8:	7c021420 	seb	v0,v0
     fac:	00621025 	or	v0,v1,v0
     fb0:	7c021420 	seb	v0,v0
     fb4:	304300ff 	andi	v1,v0,0xff
     fb8:	8fc2000c 	lw	v0,12(s8)
     fbc:	a0430000 	sb	v1,0(v0)
    octets[1] = base64_decoding[sextets[1]] << 4 | base64_decoding[sextets[2]] >> 2;
     fc0:	8fc2000c 	lw	v0,12(s8)
     fc4:	24420001 	addiu	v0,v0,1
     fc8:	8fc30008 	lw	v1,8(s8)
     fcc:	24630001 	addiu	v1,v1,1
     fd0:	90630000 	lbu	v1,0(v1)
     fd4:	00602025 	move	a0,v1
     fd8:	8f838028 	lw	v1,-32728(gp)
     fdc:	246319c0 	addiu	v1,v1,6592
     fe0:	00831821 	addu	v1,a0,v1
     fe4:	90630000 	lbu	v1,0(v1)
     fe8:	00031900 	sll	v1,v1,0x4
     fec:	7c032420 	seb	a0,v1
     ff0:	8fc30008 	lw	v1,8(s8)
     ff4:	24630002 	addiu	v1,v1,2
     ff8:	90630000 	lbu	v1,0(v1)
     ffc:	00602825 	move	a1,v1
    1000:	8f838028 	lw	v1,-32728(gp)
    1004:	246319c0 	addiu	v1,v1,6592
    1008:	00a31821 	addu	v1,a1,v1
    100c:	90630000 	lbu	v1,0(v1)
    1010:	00031882 	srl	v1,v1,0x2
    1014:	306300ff 	andi	v1,v1,0xff
    1018:	7c031c20 	seb	v1,v1
    101c:	00831825 	or	v1,a0,v1
    1020:	7c031c20 	seb	v1,v1
    1024:	306300ff 	andi	v1,v1,0xff
    1028:	a0430000 	sb	v1,0(v0)
    octets[2] = base64_decoding[sextets[2]] << 6 | base64_decoding[sextets[3]];
    102c:	8fc2000c 	lw	v0,12(s8)
    1030:	24420002 	addiu	v0,v0,2
    1034:	8fc30008 	lw	v1,8(s8)
    1038:	24630002 	addiu	v1,v1,2
    103c:	90630000 	lbu	v1,0(v1)
    1040:	00602025 	move	a0,v1
    1044:	8f838028 	lw	v1,-32728(gp)
    1048:	246319c0 	addiu	v1,v1,6592
    104c:	00831821 	addu	v1,a0,v1
    1050:	90630000 	lbu	v1,0(v1)
    1054:	00031980 	sll	v1,v1,0x6
    1058:	7c032420 	seb	a0,v1
    105c:	8fc30008 	lw	v1,8(s8)
    1060:	24630003 	addiu	v1,v1,3
    1064:	90630000 	lbu	v1,0(v1)
    1068:	00602825 	move	a1,v1
    106c:	8f838028 	lw	v1,-32728(gp)
    1070:	246319c0 	addiu	v1,v1,6592
    1074:	00a31821 	addu	v1,a1,v1
    1078:	90630000 	lbu	v1,0(v1)
    107c:	7c031c20 	seb	v1,v1
    1080:	00831825 	or	v1,a0,v1
    1084:	7c031c20 	seb	v1,v1
    1088:	306300ff 	andi	v1,v1,0xff
    108c:	a0430000 	sb	v1,0(v0)

    if (sextets[2] == PADDING_CHAR) return 1;
    1090:	8fc20008 	lw	v0,8(s8)
    1094:	24420002 	addiu	v0,v0,2
    1098:	90430000 	lbu	v1,0(v0)
    109c:	2402003d 	li	v0,61
    10a0:	14620004 	bne	v1,v0,10b4 <sextets_to_octets+0x178>
    10a4:	00000000 	nop
    10a8:	24020001 	li	v0,1
    10ac:	1000000b 	b	10dc <sextets_to_octets+0x1a0>
    10b0:	00000000 	nop
    if (sextets[3] == PADDING_CHAR) return 2;
    10b4:	8fc20008 	lw	v0,8(s8)
    10b8:	24420003 	addiu	v0,v0,3
    10bc:	90430000 	lbu	v1,0(v0)
    10c0:	2402003d 	li	v0,61
    10c4:	14620004 	bne	v1,v0,10d8 <sextets_to_octets+0x19c>
    10c8:	00000000 	nop
    10cc:	24020002 	li	v0,2
    10d0:	10000002 	b	10dc <sextets_to_octets+0x1a0>
    10d4:	00000000 	nop
    return 3;
    10d8:	24020003 	li	v0,3
}
    10dc:	03c0e825 	move	sp,s8
    10e0:	8fbe0004 	lw	s8,4(sp)
    10e4:	27bd0008 	addiu	sp,sp,8
    10e8:	03e00008 	jr	ra
    10ec:	00000000 	nop

000010f0 <build_base64_decoding>:

void build_base64_decoding() {
    10f0:	3c1c0002 	lui	gp,0x2
    10f4:	279c89d0 	addiu	gp,gp,-30256
    10f8:	0399e021 	addu	gp,gp,t9
    10fc:	27bdffe8 	addiu	sp,sp,-24
    1100:	afbe0014 	sw	s8,20(sp)
    1104:	03a0f025 	move	s8,sp
    1108:	afbc0000 	sw	gp,0(sp)
    for (unsigned char i = 0; i < 64; ++i) {
    110c:	a3c00008 	sb	zero,8(s8)
    1110:	1000000f 	b	1150 <build_base64_decoding+0x60>
    1114:	00000000 	nop
        base64_decoding[base64_encoding[i]] = i;
    1118:	93c30008 	lbu	v1,8(s8)
    111c:	8f828030 	lw	v0,-32720(gp)
    1120:	244218b0 	addiu	v0,v0,6320
    1124:	00621021 	addu	v0,v1,v0
    1128:	90420000 	lbu	v0,0(v0)
    112c:	00401825 	move	v1,v0
    1130:	8f828028 	lw	v0,-32728(gp)
    1134:	244219c0 	addiu	v0,v0,6592
    1138:	00621021 	addu	v0,v1,v0
    113c:	93c30008 	lbu	v1,8(s8)
    1140:	a0430000 	sb	v1,0(v0)
    for (unsigned char i = 0; i < 64; ++i) {
    1144:	93c20008 	lbu	v0,8(s8)
    1148:	24420001 	addiu	v0,v0,1
    114c:	a3c20008 	sb	v0,8(s8)
    1150:	93c20008 	lbu	v0,8(s8)
    1154:	2c420040 	sltiu	v0,v0,64
    1158:	1440ffef 	bnez	v0,1118 <build_base64_decoding+0x28>
    115c:	00000000 	nop
    }
}
    1160:	00000000 	nop
    1164:	03c0e825 	move	sp,s8
    1168:	8fbe0014 	lw	s8,20(sp)
    116c:	27bd0018 	addiu	sp,sp,24
    1170:	03e00008 	jr	ra
    1174:	00000000 	nop

00001178 <write_file>:

void write_file(FILE* wfp, unsigned char* output, int size) {
    1178:	3c1c0002 	lui	gp,0x2
    117c:	279c8948 	addiu	gp,gp,-30392
    1180:	0399e021 	addu	gp,gp,t9
    1184:	27bdffd8 	addiu	sp,sp,-40
    1188:	afbf0024 	sw	ra,36(sp)
    118c:	afbe0020 	sw	s8,32(sp)
    1190:	03a0f025 	move	s8,sp
    1194:	afbc0010 	sw	gp,16(sp)
    1198:	afc40028 	sw	a0,40(s8)
    119c:	afc5002c 	sw	a1,44(s8)
    11a0:	afc60030 	sw	a2,48(s8)
    for (int i=0; i < size; i++) {
    11a4:	afc00018 	sw	zero,24(s8)
    11a8:	1000000f 	b	11e8 <write_file+0x70>
    11ac:	00000000 	nop
        fputc(output[i], wfp);
    11b0:	8fc20018 	lw	v0,24(s8)
    11b4:	8fc3002c 	lw	v1,44(s8)
    11b8:	00621021 	addu	v0,v1,v0
    11bc:	90420000 	lbu	v0,0(v0)
    11c0:	8fc50028 	lw	a1,40(s8)
    11c4:	00402025 	move	a0,v0
    11c8:	8f82807c 	lw	v0,-32644(gp)
    11cc:	0040c825 	move	t9,v0
    11d0:	0320f809 	jalr	t9
    11d4:	00000000 	nop
    11d8:	8fdc0010 	lw	gp,16(s8)
    for (int i=0; i < size; i++) {
    11dc:	8fc20018 	lw	v0,24(s8)
    11e0:	24420001 	addiu	v0,v0,1
    11e4:	afc20018 	sw	v0,24(s8)
    11e8:	8fc30018 	lw	v1,24(s8)
    11ec:	8fc20030 	lw	v0,48(s8)
    11f0:	0062102a 	slt	v0,v1,v0
    11f4:	1440ffee 	bnez	v0,11b0 <write_file+0x38>
    11f8:	00000000 	nop
    }
}
    11fc:	00000000 	nop
    1200:	03c0e825 	move	sp,s8
    1204:	8fbf0024 	lw	ra,36(sp)
    1208:	8fbe0020 	lw	s8,32(sp)
    120c:	27bd0028 	addiu	sp,sp,40
    1210:	03e00008 	jr	ra
    1214:	00000000 	nop

00001218 <base64_encode_file>:

void base64_encode_file(FILE *fp, FILE* wfp) {
    1218:	3c1c0002 	lui	gp,0x2
    121c:	279c88a8 	addiu	gp,gp,-30552
    1220:	0399e021 	addu	gp,gp,t9
    1224:	27bdffd0 	addiu	sp,sp,-48
    1228:	afbf002c 	sw	ra,44(sp)
    122c:	afbe0028 	sw	s8,40(sp)
    1230:	03a0f025 	move	s8,sp
    1234:	afbc0010 	sw	gp,16(sp)
    1238:	afc40030 	sw	a0,48(s8)
    123c:	afc50034 	sw	a1,52(s8)
    unsigned char to_encode[3];
    unsigned char encoded[4];
    int read_c;
    int octets_count = 0;
    1240:	afc00018 	sw	zero,24(s8)

    while ((read_c = fgetc(fp)) != EOF) {
    1244:	10000021 	b	12cc <base64_encode_file+0xb4>
    1248:	00000000 	nop
        to_encode[octets_count++] = read_c;
    124c:	8fc20018 	lw	v0,24(s8)
    1250:	24430001 	addiu	v1,v0,1
    1254:	afc30018 	sw	v1,24(s8)
    1258:	8fc3001c 	lw	v1,28(s8)
    125c:	306300ff 	andi	v1,v1,0xff
    1260:	27c40018 	addiu	a0,s8,24
    1264:	00821021 	addu	v0,a0,v0
    1268:	a0430008 	sb	v1,8(v0)
        if (octets_count == 3) {
    126c:	8fc30018 	lw	v1,24(s8)
    1270:	24020003 	li	v0,3
    1274:	14620015 	bne	v1,v0,12cc <base64_encode_file+0xb4>
    1278:	00000000 	nop
            octets_to_sextets(to_encode, encoded, 0);
    127c:	27c30024 	addiu	v1,s8,36
    1280:	27c20020 	addiu	v0,s8,32
    1284:	00003025 	move	a2,zero
    1288:	00602825 	move	a1,v1
    128c:	00402025 	move	a0,v0
    1290:	8f828044 	lw	v0,-32700(gp)
    1294:	0040c825 	move	t9,v0
    1298:	0411fed1 	bal	de0 <octets_to_sextets>
    129c:	00000000 	nop
    12a0:	8fdc0010 	lw	gp,16(s8)
            write_file(wfp, encoded, 4);
    12a4:	27c20024 	addiu	v0,s8,36
    12a8:	24060004 	li	a2,4
    12ac:	00402825 	move	a1,v0
    12b0:	8fc40034 	lw	a0,52(s8)
    12b4:	8f828048 	lw	v0,-32696(gp)
    12b8:	0040c825 	move	t9,v0
    12bc:	0411ffae 	bal	1178 <write_file>
    12c0:	00000000 	nop
    12c4:	8fdc0010 	lw	gp,16(s8)
            octets_count = 0;
    12c8:	afc00018 	sw	zero,24(s8)
    while ((read_c = fgetc(fp)) != EOF) {
    12cc:	8fc40030 	lw	a0,48(s8)
    12d0:	8f828084 	lw	v0,-32636(gp)
    12d4:	0040c825 	move	t9,v0
    12d8:	0320f809 	jalr	t9
    12dc:	00000000 	nop
    12e0:	8fdc0010 	lw	gp,16(s8)
    12e4:	afc2001c 	sw	v0,28(s8)
    12e8:	8fc3001c 	lw	v1,28(s8)
    12ec:	2402ffff 	li	v0,-1
    12f0:	1462ffd6 	bne	v1,v0,124c <base64_encode_file+0x34>
    12f4:	00000000 	nop
        }
    }

    if (octets_count > 0) {
    12f8:	8fc20018 	lw	v0,24(s8)
    12fc:	18400021 	blez	v0,1384 <base64_encode_file+0x16c>
    1300:	00000000 	nop
        if (octets_count == 1) to_encode[1] = 0u;
    1304:	8fc30018 	lw	v1,24(s8)
    1308:	24020001 	li	v0,1
    130c:	14620002 	bne	v1,v0,1318 <base64_encode_file+0x100>
    1310:	00000000 	nop
    1314:	a3c00021 	sb	zero,33(s8)
        if (octets_count <= 2) to_encode[2] = 0u;
    1318:	8fc20018 	lw	v0,24(s8)
    131c:	28420003 	slti	v0,v0,3
    1320:	10400002 	beqz	v0,132c <base64_encode_file+0x114>
    1324:	00000000 	nop
    1328:	a3c00022 	sb	zero,34(s8)
        octets_to_sextets(to_encode, encoded, 3 - octets_count);
    132c:	24030003 	li	v1,3
    1330:	8fc20018 	lw	v0,24(s8)
    1334:	00622023 	subu	a0,v1,v0
    1338:	27c30024 	addiu	v1,s8,36
    133c:	27c20020 	addiu	v0,s8,32
    1340:	00803025 	move	a2,a0
    1344:	00602825 	move	a1,v1
    1348:	00402025 	move	a0,v0
    134c:	8f828044 	lw	v0,-32700(gp)
    1350:	0040c825 	move	t9,v0
    1354:	0411fea2 	bal	de0 <octets_to_sextets>
    1358:	00000000 	nop
    135c:	8fdc0010 	lw	gp,16(s8)
        write_file(wfp, encoded, 4);
    1360:	27c20024 	addiu	v0,s8,36
    1364:	24060004 	li	a2,4
    1368:	00402825 	move	a1,v0
    136c:	8fc40034 	lw	a0,52(s8)
    1370:	8f828048 	lw	v0,-32696(gp)
    1374:	0040c825 	move	t9,v0
    1378:	0411ff7f 	bal	1178 <write_file>
    137c:	00000000 	nop
    1380:	8fdc0010 	lw	gp,16(s8)
    }
}
    1384:	00000000 	nop
    1388:	03c0e825 	move	sp,s8
    138c:	8fbf002c 	lw	ra,44(sp)
    1390:	8fbe0028 	lw	s8,40(sp)
    1394:	27bd0030 	addiu	sp,sp,48
    1398:	03e00008 	jr	ra
    139c:	00000000 	nop

000013a0 <base64_decode_file>:

void base64_decode_file(FILE *fp, FILE* wfp) {
    13a0:	3c1c0002 	lui	gp,0x2
    13a4:	279c8720 	addiu	gp,gp,-30944
    13a8:	0399e021 	addu	gp,gp,t9
    13ac:	27bdffd0 	addiu	sp,sp,-48
    13b0:	afbf002c 	sw	ra,44(sp)
    13b4:	afbe0028 	sw	s8,40(sp)
    13b8:	03a0f025 	move	s8,sp
    13bc:	afbc0010 	sw	gp,16(sp)
    13c0:	afc40030 	sw	a0,48(s8)
    13c4:	afc50034 	sw	a1,52(s8)
    unsigned char to_decode[4];
    unsigned char decoded[3];
    int read_c;
    int sextets_count = 0;
    13c8:	afc00018 	sw	zero,24(s8)

    build_base64_decoding();
    13cc:	8f82804c 	lw	v0,-32692(gp)
    13d0:	0040c825 	move	t9,v0
    13d4:	0411ff46 	bal	10f0 <build_base64_decoding>
    13d8:	00000000 	nop
    13dc:	8fdc0010 	lw	gp,16(s8)

    while ((read_c = fgetc(fp)) != EOF) {
    13e0:	10000039 	b	14c8 <base64_decode_file+0x128>
    13e4:	00000000 	nop
        if (base64_decoding[(unsigned char) read_c] > 63) {
    13e8:	8fc2001c 	lw	v0,28(s8)
    13ec:	304200ff 	andi	v0,v0,0xff
    13f0:	00401825 	move	v1,v0
    13f4:	8f828028 	lw	v0,-32728(gp)
    13f8:	244219c0 	addiu	v0,v0,6592
    13fc:	00621021 	addu	v0,v1,v0
    1400:	90420000 	lbu	v0,0(v0)
    1404:	2c420040 	sltiu	v0,v0,64
    1408:	1440000f 	bnez	v0,1448 <base64_decode_file+0xa8>
    140c:	00000000 	nop
            fprintf(stderr, "Bad encoding: invalid characters\n");
    1410:	8f8280a0 	lw	v0,-32608(gp)
    1414:	8c420000 	lw	v0,0(v0)
    1418:	00403825 	move	a3,v0
    141c:	24060021 	li	a2,33
    1420:	24050001 	li	a1,1
    1424:	8f828030 	lw	v0,-32720(gp)
    1428:	244418f4 	addiu	a0,v0,6388
    142c:	8f82809c 	lw	v0,-32612(gp)
    1430:	0040c825 	move	t9,v0
    1434:	0320f809 	jalr	t9
    1438:	00000000 	nop
    143c:	8fdc0010 	lw	gp,16(s8)
    1440:	1000003b 	b	1530 <base64_decode_file+0x190>
    1444:	00000000 	nop
            return;
        }

        to_decode[sextets_count++] = read_c;
    1448:	8fc20018 	lw	v0,24(s8)
    144c:	24430001 	addiu	v1,v0,1
    1450:	afc30018 	sw	v1,24(s8)
    1454:	8fc3001c 	lw	v1,28(s8)
    1458:	306300ff 	andi	v1,v1,0xff
    145c:	27c40018 	addiu	a0,s8,24
    1460:	00821021 	addu	v0,a0,v0
    1464:	a0430008 	sb	v1,8(v0)
        if (sextets_count == 4) {
    1468:	8fc30018 	lw	v1,24(s8)
    146c:	24020004 	li	v0,4
    1470:	14620015 	bne	v1,v0,14c8 <base64_decode_file+0x128>
    1474:	00000000 	nop
            write_file(wfp, decoded, sextets_to_octets(to_decode, decoded));
    1478:	27c30024 	addiu	v1,s8,36
    147c:	27c20020 	addiu	v0,s8,32
    1480:	00602825 	move	a1,v1
    1484:	00402025 	move	a0,v0
    1488:	8f828050 	lw	v0,-32688(gp)
    148c:	0040c825 	move	t9,v0
    1490:	0411feaa 	bal	f3c <sextets_to_octets>
    1494:	00000000 	nop
    1498:	8fdc0010 	lw	gp,16(s8)
    149c:	00401825 	move	v1,v0
    14a0:	27c20024 	addiu	v0,s8,36
    14a4:	00603025 	move	a2,v1
    14a8:	00402825 	move	a1,v0
    14ac:	8fc40034 	lw	a0,52(s8)
    14b0:	8f828048 	lw	v0,-32696(gp)
    14b4:	0040c825 	move	t9,v0
    14b8:	0411ff2f 	bal	1178 <write_file>
    14bc:	00000000 	nop
    14c0:	8fdc0010 	lw	gp,16(s8)
            sextets_count = 0;
    14c4:	afc00018 	sw	zero,24(s8)
    while ((read_c = fgetc(fp)) != EOF) {
    14c8:	8fc40030 	lw	a0,48(s8)
    14cc:	8f828084 	lw	v0,-32636(gp)
    14d0:	0040c825 	move	t9,v0
    14d4:	0320f809 	jalr	t9
    14d8:	00000000 	nop
    14dc:	8fdc0010 	lw	gp,16(s8)
    14e0:	afc2001c 	sw	v0,28(s8)
    14e4:	8fc3001c 	lw	v1,28(s8)
    14e8:	2402ffff 	li	v0,-1
    14ec:	1462ffbe 	bne	v1,v0,13e8 <base64_decode_file+0x48>
    14f0:	00000000 	nop
        }
    }

    if (sextets_count != 0) {
    14f4:	8fc20018 	lw	v0,24(s8)
    14f8:	1040000d 	beqz	v0,1530 <base64_decode_file+0x190>
    14fc:	00000000 	nop
        fprintf(stderr, "Bad encoding: missing characters\n");
    1500:	8f8280a0 	lw	v0,-32608(gp)
    1504:	8c420000 	lw	v0,0(v0)
    1508:	00403825 	move	a3,v0
    150c:	24060021 	li	a2,33
    1510:	24050001 	li	a1,1
    1514:	8f828030 	lw	v0,-32720(gp)
    1518:	24441918 	addiu	a0,v0,6424
    151c:	8f82809c 	lw	v0,-32612(gp)
    1520:	0040c825 	move	t9,v0
    1524:	0320f809 	jalr	t9
    1528:	00000000 	nop
    152c:	8fdc0010 	lw	gp,16(s8)
    }
}
    1530:	03c0e825 	move	sp,s8
    1534:	8fbf002c 	lw	ra,44(sp)
    1538:	8fbe0028 	lw	s8,40(sp)
    153c:	27bd0030 	addiu	sp,sp,48
    1540:	03e00008 	jr	ra
    1544:	00000000 	nop
	...

00001550 <__libc_csu_init>:
    1550:	3c1c0002 	lui	gp,0x2
    1554:	279c8570 	addiu	gp,gp,-31376
    1558:	0399e021 	addu	gp,gp,t9
    155c:	27bdffc8 	addiu	sp,sp,-56
    1560:	8f998054 	lw	t9,-32684(gp)
    1564:	afbc0010 	sw	gp,16(sp)
    1568:	afb50030 	sw	s5,48(sp)
    156c:	00c0a825 	move	s5,a2
    1570:	afb4002c 	sw	s4,44(sp)
    1574:	00a0a025 	move	s4,a1
    1578:	afb30028 	sw	s3,40(sp)
    157c:	00809825 	move	s3,a0
    1580:	afb20024 	sw	s2,36(sp)
    1584:	afb0001c 	sw	s0,28(sp)
    1588:	afbf0034 	sw	ra,52(sp)
    158c:	0411fcba 	bal	878 <_init>
    1590:	afb10020 	sw	s1,32(sp)
    1594:	8fbc0010 	lw	gp,16(sp)
    1598:	8f908058 	lw	s0,-32680(gp)
    159c:	8f92805c 	lw	s2,-32676(gp)
    15a0:	02509023 	subu	s2,s2,s0
    15a4:	00129083 	sra	s2,s2,0x2
    15a8:	12400009 	beqz	s2,15d0 <__libc_csu_init+0x80>
    15ac:	00008825 	move	s1,zero
    15b0:	8e190000 	lw	t9,0(s0)
    15b4:	26310001 	addiu	s1,s1,1
    15b8:	02a03025 	move	a2,s5
    15bc:	02802825 	move	a1,s4
    15c0:	0320f809 	jalr	t9
    15c4:	02602025 	move	a0,s3
    15c8:	1651fff9 	bne	s2,s1,15b0 <__libc_csu_init+0x60>
    15cc:	26100004 	addiu	s0,s0,4
    15d0:	8fbf0034 	lw	ra,52(sp)
    15d4:	8fb50030 	lw	s5,48(sp)
    15d8:	8fb4002c 	lw	s4,44(sp)
    15dc:	8fb30028 	lw	s3,40(sp)
    15e0:	8fb20024 	lw	s2,36(sp)
    15e4:	8fb10020 	lw	s1,32(sp)
    15e8:	8fb0001c 	lw	s0,28(sp)
    15ec:	03e00008 	jr	ra
    15f0:	27bd0038 	addiu	sp,sp,56

000015f4 <__libc_csu_fini>:
    15f4:	03e00008 	jr	ra
    15f8:	00000000 	nop
    15fc:	00000000 	nop

Disassembly of section .MIPS.stubs:

00001600 <_MIPS_STUBS_>:
    1600:	8f998010 	lw	t9,-32752(gp)
    1604:	03e07825 	move	t7,ra
    1608:	0320f809 	jalr	t9
    160c:	2418001f 	li	t8,31
    1610:	8f998010 	lw	t9,-32752(gp)
    1614:	03e07825 	move	t7,ra
    1618:	0320f809 	jalr	t9
    161c:	2418001d 	li	t8,29
    1620:	8f998010 	lw	t9,-32752(gp)
    1624:	03e07825 	move	t7,ra
    1628:	0320f809 	jalr	t9
    162c:	2418001c 	li	t8,28
    1630:	8f998010 	lw	t9,-32752(gp)
    1634:	03e07825 	move	t7,ra
    1638:	0320f809 	jalr	t9
    163c:	2418001a 	li	t8,26
    1640:	8f998010 	lw	t9,-32752(gp)
    1644:	03e07825 	move	t7,ra
    1648:	0320f809 	jalr	t9
    164c:	24180019 	li	t8,25
    1650:	8f998010 	lw	t9,-32752(gp)
    1654:	03e07825 	move	t7,ra
    1658:	0320f809 	jalr	t9
    165c:	24180017 	li	t8,23
    1660:	8f998010 	lw	t9,-32752(gp)
    1664:	03e07825 	move	t7,ra
    1668:	0320f809 	jalr	t9
    166c:	24180015 	li	t8,21
    1670:	8f998010 	lw	t9,-32752(gp)
    1674:	03e07825 	move	t7,ra
    1678:	0320f809 	jalr	t9
    167c:	24180013 	li	t8,19
	...

Disassembly of section .fini:

00001690 <_fini>:
    1690:	3c1c0002 	lui	gp,0x2
    1694:	279c8430 	addiu	gp,gp,-31696
    1698:	0399e021 	addu	gp,gp,t9
    169c:	27bdffe0 	addiu	sp,sp,-32
    16a0:	afbc0010 	sw	gp,16(sp)
    16a4:	afbf001c 	sw	ra,28(sp)
    16a8:	8fbf001c 	lw	ra,28(sp)
    16ac:	03e00008 	jr	ra
    16b0:	27bd0020 	addiu	sp,sp,32


solver:     file format elf64-x86-64


Disassembly of section .interp:

0000000000000318 <.interp>:
 318:	2f                   	(bad)  
 319:	6c                   	ins    BYTE PTR es:[rdi],dx
 31a:	69 62 36 34 2f 6c 64 	imul   esp,DWORD PTR [rdx+0x36],0x646c2f34
 321:	2d 6c 69 6e 75       	sub    eax,0x756e696c
 326:	78 2d                	js     355 <__abi_tag-0x37>
 328:	78 38                	js     362 <__abi_tag-0x2a>
 32a:	36 2d 36 34 2e 73    	ss sub eax,0x732e3436
 330:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 331:	2e 32 00             	cs xor al,BYTE PTR [rax]

Disassembly of section .note.gnu.property:

0000000000000338 <.note.gnu.property>:
 338:	04 00                	add    al,0x0
 33a:	00 00                	add    BYTE PTR [rax],al
 33c:	20 00                	and    BYTE PTR [rax],al
 33e:	00 00                	add    BYTE PTR [rax],al
 340:	05 00 00 00 47       	add    eax,0x47000000
 345:	4e 55                	rex.WRX push rbp
 347:	00 02                	add    BYTE PTR [rdx],al
 349:	00 00                	add    BYTE PTR [rax],al
 34b:	c0 04 00 00          	rol    BYTE PTR [rax+rax*1],0x0
 34f:	00 03                	add    BYTE PTR [rbx],al
 351:	00 00                	add    BYTE PTR [rax],al
 353:	00 00                	add    BYTE PTR [rax],al
 355:	00 00                	add    BYTE PTR [rax],al
 357:	00 02                	add    BYTE PTR [rdx],al
 359:	80 00 c0             	add    BYTE PTR [rax],0xc0
 35c:	04 00                	add    al,0x0
 35e:	00 00                	add    BYTE PTR [rax],al
 360:	01 00                	add    DWORD PTR [rax],eax
 362:	00 00                	add    BYTE PTR [rax],al
 364:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .note.gnu.build-id:

0000000000000368 <.note.gnu.build-id>:
 368:	04 00                	add    al,0x0
 36a:	00 00                	add    BYTE PTR [rax],al
 36c:	14 00                	adc    al,0x0
 36e:	00 00                	add    BYTE PTR [rax],al
 370:	03 00                	add    eax,DWORD PTR [rax]
 372:	00 00                	add    BYTE PTR [rax],al
 374:	47                   	rex.RXB
 375:	4e 55                	rex.WRX push rbp
 377:	00 71 b4             	add    BYTE PTR [rcx-0x4c],dh
 37a:	4d 91                	rex.WRB xchg r9,rax
 37c:	3a 15 a4 2e 7e a0    	cmp    dl,BYTE PTR [rip+0xffffffffa07e2ea4]        # ffffffffa07e3226 <_end+0xffffffffa07df20e>
 382:	4d 24 f0             	rex.WRB and al,0xf0
 385:	35 51 e9 4c 60       	xor    eax,0x604ce951
 38a:	8d                   	.byte 0x8d
 38b:	83                   	.byte 0x83

Disassembly of section .note.ABI-tag:

000000000000038c <__abi_tag>:
 38c:	04 00                	add    al,0x0
 38e:	00 00                	add    BYTE PTR [rax],al
 390:	10 00                	adc    BYTE PTR [rax],al
 392:	00 00                	add    BYTE PTR [rax],al
 394:	01 00                	add    DWORD PTR [rax],eax
 396:	00 00                	add    BYTE PTR [rax],al
 398:	47                   	rex.RXB
 399:	4e 55                	rex.WRX push rbp
 39b:	00 00                	add    BYTE PTR [rax],al
 39d:	00 00                	add    BYTE PTR [rax],al
 39f:	00 03                	add    BYTE PTR [rbx],al
 3a1:	00 00                	add    BYTE PTR [rax],al
 3a3:	00 02                	add    BYTE PTR [rdx],al
 3a5:	00 00                	add    BYTE PTR [rax],al
 3a7:	00 00                	add    BYTE PTR [rax],al
 3a9:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .gnu.hash:

00000000000003b0 <.gnu.hash>:
 3b0:	02 00                	add    al,BYTE PTR [rax]
 3b2:	00 00                	add    BYTE PTR [rax],al
 3b4:	06                   	(bad)  
 3b5:	00 00                	add    BYTE PTR [rax],al
 3b7:	00 01                	add    BYTE PTR [rcx],al
 3b9:	00 00                	add    BYTE PTR [rax],al
 3bb:	00 06                	add    BYTE PTR [rsi],al
 3bd:	00 00                	add    BYTE PTR [rax],al
 3bf:	00 00                	add    BYTE PTR [rax],al
 3c1:	00 81 00 00 40 00    	add    BYTE PTR [rcx+0x400000],al
 3c7:	01 06                	add    DWORD PTR [rsi],eax
 3c9:	00 00                	add    BYTE PTR [rax],al
 3cb:	00 00                	add    BYTE PTR [rax],al
 3cd:	00 00                	add    BYTE PTR [rax],al
 3cf:	00 b8 2b 6b 15 d1    	add    BYTE PTR [rax-0x2eea94d5],bh
 3d5:	65 ce                	gs (bad) 
 3d7:	6d                   	ins    DWORD PTR es:[rdi],dx

Disassembly of section .dynsym:

00000000000003d8 <.dynsym>:
	...
 3f0:	10 00                	adc    BYTE PTR [rax],al
 3f2:	00 00                	add    BYTE PTR [rax],al
 3f4:	12 00                	adc    al,BYTE PTR [rax]
	...
 406:	00 00                	add    BYTE PTR [rax],al
 408:	65 00 00             	add    BYTE PTR gs:[rax],al
 40b:	00 20                	add    BYTE PTR [rax],ah
	...
 41d:	00 00                	add    BYTE PTR [rax],al
 41f:	00 22                	add    BYTE PTR [rdx],ah
 421:	00 00                	add    BYTE PTR [rax],al
 423:	00 12                	add    BYTE PTR [rdx],dl
	...
 435:	00 00                	add    BYTE PTR [rax],al
 437:	00 81 00 00 00 20    	add    BYTE PTR [rcx+0x20000000],al
	...
 44d:	00 00                	add    BYTE PTR [rax],al
 44f:	00 90 00 00 00 20    	add    BYTE PTR [rax+0x20000000],dl
	...
 465:	00 00                	add    BYTE PTR [rax],al
 467:	00 33                	add    BYTE PTR [rbx],dh
 469:	00 00                	add    BYTE PTR [rax],al
 46b:	00 12                	add    BYTE PTR [rdx],dl
	...
 47d:	00 00                	add    BYTE PTR [rax],al
 47f:	00 01                	add    BYTE PTR [rcx],al
 481:	00 00                	add    BYTE PTR [rax],al
 483:	00 22                	add    BYTE PTR [rdx],ah
	...

Disassembly of section .dynstr:

0000000000000498 <.dynstr>:
 498:	00 5f 5f             	add    BYTE PTR [rdi+0x5f],bl
 49b:	63 78 61             	movsxd edi,DWORD PTR [rax+0x61]
 49e:	5f                   	pop    rdi
 49f:	66 69 6e 61 6c 69    	imul   bp,WORD PTR [rsi+0x61],0x696c
 4a5:	7a 65                	jp     50c <__abi_tag+0x180>
 4a7:	00 5f 5f             	add    BYTE PTR [rdi+0x5f],bl
 4aa:	6c                   	ins    BYTE PTR es:[rdi],dx
 4ab:	69 62 63 5f 73 74 61 	imul   esp,DWORD PTR [rdx+0x63],0x6174735f
 4b2:	72 74                	jb     528 <__abi_tag+0x19c>
 4b4:	5f                   	pop    rdi
 4b5:	6d                   	ins    DWORD PTR es:[rdi],dx
 4b6:	61                   	(bad)  
 4b7:	69 6e 00 5f 5f 73 74 	imul   ebp,DWORD PTR [rsi+0x0],0x74735f5f
 4be:	61                   	(bad)  
 4bf:	63 6b 5f             	movsxd ebp,DWORD PTR [rbx+0x5f]
 4c2:	63 68 6b             	movsxd ebp,DWORD PTR [rax+0x6b]
 4c5:	5f                   	pop    rdi
 4c6:	66 61                	data16 (bad) 
 4c8:	69 6c 00 70 72 69 6e 	imul   ebp,DWORD PTR [rax+rax*1+0x70],0x746e6972
 4cf:	74 
 4d0:	66 00 6c 69 62       	data16 add BYTE PTR [rcx+rbp*2+0x62],ch
 4d5:	63 2e                	movsxd ebp,DWORD PTR [rsi]
 4d7:	73 6f                	jae    548 <__abi_tag+0x1bc>
 4d9:	2e 36 00 47 4c       	cs ss add BYTE PTR [rdi+0x4c],al
 4de:	49                   	rex.WB
 4df:	42                   	rex.X
 4e0:	43 5f                	rex.XB pop r15
 4e2:	32 2e                	xor    ch,BYTE PTR [rsi]
 4e4:	32 2e                	xor    ch,BYTE PTR [rsi]
 4e6:	35 00 47 4c 49       	xor    eax,0x494c4700
 4eb:	42                   	rex.X
 4ec:	43 5f                	rex.XB pop r15
 4ee:	32 2e                	xor    ch,BYTE PTR [rsi]
 4f0:	34 00                	xor    al,0x0
 4f2:	47                   	rex.RXB
 4f3:	4c                   	rex.WR
 4f4:	49                   	rex.WB
 4f5:	42                   	rex.X
 4f6:	43 5f                	rex.XB pop r15
 4f8:	32 2e                	xor    ch,BYTE PTR [rsi]
 4fa:	33 34 00             	xor    esi,DWORD PTR [rax+rax*1]
 4fd:	5f                   	pop    rdi
 4fe:	49 54                	rex.WB push r12
 500:	4d 5f                	rex.WRB pop r15
 502:	64 65 72 65          	fs gs jb 56b <__abi_tag+0x1df>
 506:	67 69 73 74 65 72 54 	imul   esi,DWORD PTR [ebx+0x74],0x4d547265
 50d:	4d 
 50e:	43 6c                	rex.XB ins BYTE PTR es:[rdi],dx
 510:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 511:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 512:	65 54                	gs push rsp
 514:	61                   	(bad)  
 515:	62                   	(bad)  
 516:	6c                   	ins    BYTE PTR es:[rdi],dx
 517:	65 00 5f 5f          	add    BYTE PTR gs:[rdi+0x5f],bl
 51b:	67 6d                	ins    DWORD PTR es:[edi],dx
 51d:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 51e:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 51f:	5f                   	pop    rdi
 520:	73 74                	jae    596 <__abi_tag+0x20a>
 522:	61                   	(bad)  
 523:	72 74                	jb     599 <__abi_tag+0x20d>
 525:	5f                   	pop    rdi
 526:	5f                   	pop    rdi
 527:	00 5f 49             	add    BYTE PTR [rdi+0x49],bl
 52a:	54                   	push   rsp
 52b:	4d 5f                	rex.WRB pop r15
 52d:	72 65                	jb     594 <__abi_tag+0x208>
 52f:	67 69 73 74 65 72 54 	imul   esi,DWORD PTR [ebx+0x74],0x4d547265
 536:	4d 
 537:	43 6c                	rex.XB ins BYTE PTR es:[rdi],dx
 539:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 53a:	6e                   	outs   dx,BYTE PTR ds:[rsi]
 53b:	65 54                	gs push rsp
 53d:	61                   	(bad)  
 53e:	62                   	.byte 0x62
 53f:	6c                   	ins    BYTE PTR es:[rdi],dx
 540:	65                   	gs
	...

Disassembly of section .gnu.version:

0000000000000542 <.gnu.version>:
 542:	00 00                	add    BYTE PTR [rax],al
 544:	02 00                	add    al,BYTE PTR [rax]
 546:	01 00                	add    DWORD PTR [rax],eax
 548:	03 00                	add    eax,DWORD PTR [rax]
 54a:	01 00                	add    DWORD PTR [rax],eax
 54c:	01 00                	add    DWORD PTR [rax],eax
 54e:	04 00                	add    al,0x0
 550:	04 00                	add    al,0x0

Disassembly of section .gnu.version_r:

0000000000000558 <.gnu.version_r>:
 558:	01 00                	add    DWORD PTR [rax],eax
 55a:	03 00                	add    eax,DWORD PTR [rax]
 55c:	3a 00                	cmp    al,BYTE PTR [rax]
 55e:	00 00                	add    BYTE PTR [rax],al
 560:	10 00                	adc    BYTE PTR [rax],al
 562:	00 00                	add    BYTE PTR [rax],al
 564:	00 00                	add    BYTE PTR [rax],al
 566:	00 00                	add    BYTE PTR [rax],al
 568:	75 1a                	jne    584 <__abi_tag+0x1f8>
 56a:	69 09 00 00 04 00    	imul   ecx,DWORD PTR [rcx],0x40000
 570:	44 00 00             	add    BYTE PTR [rax],r8b
 573:	00 10                	add    BYTE PTR [rax],dl
 575:	00 00                	add    BYTE PTR [rax],al
 577:	00 14 69             	add    BYTE PTR [rcx+rbp*2],dl
 57a:	69 0d 00 00 03 00 50 	imul   ecx,DWORD PTR [rip+0x30000],0x50        # 30584 <_end+0x2c56c>
 581:	00 00 00 
 584:	10 00                	adc    BYTE PTR [rax],al
 586:	00 00                	add    BYTE PTR [rax],al
 588:	b4 91                	mov    ah,0x91
 58a:	96                   	xchg   esi,eax
 58b:	06                   	(bad)  
 58c:	00 00                	add    BYTE PTR [rax],al
 58e:	02 00                	add    al,BYTE PTR [rax]
 590:	5a                   	pop    rdx
 591:	00 00                	add    BYTE PTR [rax],al
 593:	00 00                	add    BYTE PTR [rax],al
 595:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .rela.dyn:

0000000000000598 <.rela.dyn>:
 598:	b0 3d                	mov    al,0x3d
 59a:	00 00                	add    BYTE PTR [rax],al
 59c:	00 00                	add    BYTE PTR [rax],al
 59e:	00 00                	add    BYTE PTR [rax],al
 5a0:	08 00                	or     BYTE PTR [rax],al
 5a2:	00 00                	add    BYTE PTR [rax],al
 5a4:	00 00                	add    BYTE PTR [rax],al
 5a6:	00 00                	add    BYTE PTR [rax],al
 5a8:	50                   	push   rax
 5a9:	11 00                	adc    DWORD PTR [rax],eax
 5ab:	00 00                	add    BYTE PTR [rax],al
 5ad:	00 00                	add    BYTE PTR [rax],al
 5af:	00 b8 3d 00 00 00    	add    BYTE PTR [rax+0x3d],bh
 5b5:	00 00                	add    BYTE PTR [rax],al
 5b7:	00 08                	add    BYTE PTR [rax],cl
 5b9:	00 00                	add    BYTE PTR [rax],al
 5bb:	00 00                	add    BYTE PTR [rax],al
 5bd:	00 00                	add    BYTE PTR [rax],al
 5bf:	00 10                	add    BYTE PTR [rax],dl
 5c1:	11 00                	adc    DWORD PTR [rax],eax
 5c3:	00 00                	add    BYTE PTR [rax],al
 5c5:	00 00                	add    BYTE PTR [rax],al
 5c7:	00 08                	add    BYTE PTR [rax],cl
 5c9:	40 00 00             	rex add BYTE PTR [rax],al
 5cc:	00 00                	add    BYTE PTR [rax],al
 5ce:	00 00                	add    BYTE PTR [rax],al
 5d0:	08 00                	or     BYTE PTR [rax],al
 5d2:	00 00                	add    BYTE PTR [rax],al
 5d4:	00 00                	add    BYTE PTR [rax],al
 5d6:	00 00                	add    BYTE PTR [rax],al
 5d8:	08 40 00             	or     BYTE PTR [rax+0x0],al
 5db:	00 00                	add    BYTE PTR [rax],al
 5dd:	00 00                	add    BYTE PTR [rax],al
 5df:	00 d0                	add    al,dl
 5e1:	3f                   	(bad)  
 5e2:	00 00                	add    BYTE PTR [rax],al
 5e4:	00 00                	add    BYTE PTR [rax],al
 5e6:	00 00                	add    BYTE PTR [rax],al
 5e8:	06                   	(bad)  
 5e9:	00 00                	add    BYTE PTR [rax],al
 5eb:	00 01                	add    BYTE PTR [rcx],al
	...
 5f5:	00 00                	add    BYTE PTR [rax],al
 5f7:	00 d8                	add    al,bl
 5f9:	3f                   	(bad)  
 5fa:	00 00                	add    BYTE PTR [rax],al
 5fc:	00 00                	add    BYTE PTR [rax],al
 5fe:	00 00                	add    BYTE PTR [rax],al
 600:	06                   	(bad)  
 601:	00 00                	add    BYTE PTR [rax],al
 603:	00 02                	add    BYTE PTR [rdx],al
	...
 60d:	00 00                	add    BYTE PTR [rax],al
 60f:	00 e0                	add    al,ah
 611:	3f                   	(bad)  
 612:	00 00                	add    BYTE PTR [rax],al
 614:	00 00                	add    BYTE PTR [rax],al
 616:	00 00                	add    BYTE PTR [rax],al
 618:	06                   	(bad)  
 619:	00 00                	add    BYTE PTR [rax],al
 61b:	00 06                	add    BYTE PTR [rsi],al
	...
 625:	00 00                	add    BYTE PTR [rax],al
 627:	00 e8                	add    al,ch
 629:	3f                   	(bad)  
 62a:	00 00                	add    BYTE PTR [rax],al
 62c:	00 00                	add    BYTE PTR [rax],al
 62e:	00 00                	add    BYTE PTR [rax],al
 630:	06                   	(bad)  
 631:	00 00                	add    BYTE PTR [rax],al
 633:	00 04 00             	add    BYTE PTR [rax+rax*1],al
	...
 63e:	00 00                	add    BYTE PTR [rax],al
 640:	f0 3f                	lock (bad) 
 642:	00 00                	add    BYTE PTR [rax],al
 644:	00 00                	add    BYTE PTR [rax],al
 646:	00 00                	add    BYTE PTR [rax],al
 648:	06                   	(bad)  
 649:	00 00                	add    BYTE PTR [rax],al
 64b:	00 05 00 00 00 00    	add    BYTE PTR [rip+0x0],al        # 651 <__abi_tag+0x2c5>
 651:	00 00                	add    BYTE PTR [rax],al
 653:	00 00                	add    BYTE PTR [rax],al
 655:	00 00                	add    BYTE PTR [rax],al
 657:	00 f8                	add    al,bh
 659:	3f                   	(bad)  
 65a:	00 00                	add    BYTE PTR [rax],al
 65c:	00 00                	add    BYTE PTR [rax],al
 65e:	00 00                	add    BYTE PTR [rax],al
 660:	06                   	(bad)  
 661:	00 00                	add    BYTE PTR [rax],al
 663:	00 07                	add    BYTE PTR [rdi],al
	...

Disassembly of section .rela.plt:

0000000000000670 <.rela.plt>:
 670:	c8 3f 00 00          	enter  0x3f,0x0
 674:	00 00                	add    BYTE PTR [rax],al
 676:	00 00                	add    BYTE PTR [rax],al
 678:	07                   	(bad)  
 679:	00 00                	add    BYTE PTR [rax],al
 67b:	00 03                	add    BYTE PTR [rbx],al
	...

Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    rsp,0x8
    1008:	48 8b 05 d9 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fd9]        # 3fe8 <__gmon_start__@Base>
    100f:	48 85 c0             	test   rax,rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   rax
    1016:	48 83 c4 08          	add    rsp,0x8
    101a:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 92 2f 00 00    	push   QWORD PTR [rip+0x2f92]        # 3fb8 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 93 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f93]        # 3fc0 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nop    DWORD PTR [rax]
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	push   0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    103f:	90                   	nop

Disassembly of section .plt.got:

0000000000001040 <printf@plt>:
    1040:	f3 0f 1e fa          	endbr64 
    1044:	f2 ff 25 95 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f95]        # 3fe0 <printf@GLIBC_2.2.5>
    104b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001050 <__cxa_finalize@plt>:
    1050:	f3 0f 1e fa          	endbr64 
    1054:	f2 ff 25 9d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f9d]        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    105b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .plt.sec:

0000000000001060 <__stack_chk_fail@plt>:
    1060:	f3 0f 1e fa          	endbr64 
    1064:	f2 ff 25 5d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f5d]        # 3fc8 <__stack_chk_fail@GLIBC_2.4>
    106b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .text:

0000000000001070 <_start>:
    1070:	f3 0f 1e fa          	endbr64 
    1074:	31 ed                	xor    ebp,ebp
    1076:	49 89 d1             	mov    r9,rdx
    1079:	5e                   	pop    rsi
    107a:	48 89 e2             	mov    rdx,rsp
    107d:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
    1081:	50                   	push   rax
    1082:	54                   	push   rsp
    1083:	45 31 c0             	xor    r8d,r8d
    1086:	31 c9                	xor    ecx,ecx
    1088:	48 8d 3d de 01 00 00 	lea    rdi,[rip+0x1de]        # 126d <main>
    108f:	ff 15 3b 2f 00 00    	call   QWORD PTR [rip+0x2f3b]        # 3fd0 <__libc_start_main@GLIBC_2.34>
    1095:	f4                   	hlt    
    1096:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    109d:	00 00 00 

00000000000010a0 <deregister_tm_clones>:
    10a0:	48 8d 3d 69 2f 00 00 	lea    rdi,[rip+0x2f69]        # 4010 <__TMC_END__>
    10a7:	48 8d 05 62 2f 00 00 	lea    rax,[rip+0x2f62]        # 4010 <__TMC_END__>
    10ae:	48 39 f8             	cmp    rax,rdi
    10b1:	74 15                	je     10c8 <deregister_tm_clones+0x28>
    10b3:	48 8b 05 1e 2f 00 00 	mov    rax,QWORD PTR [rip+0x2f1e]        # 3fd8 <_ITM_deregisterTMCloneTable@Base>
    10ba:	48 85 c0             	test   rax,rax
    10bd:	74 09                	je     10c8 <deregister_tm_clones+0x28>
    10bf:	ff e0                	jmp    rax
    10c1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    10c8:	c3                   	ret    
    10c9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000000010d0 <register_tm_clones>:
    10d0:	48 8d 3d 39 2f 00 00 	lea    rdi,[rip+0x2f39]        # 4010 <__TMC_END__>
    10d7:	48 8d 35 32 2f 00 00 	lea    rsi,[rip+0x2f32]        # 4010 <__TMC_END__>
    10de:	48 29 fe             	sub    rsi,rdi
    10e1:	48 89 f0             	mov    rax,rsi
    10e4:	48 c1 ee 3f          	shr    rsi,0x3f
    10e8:	48 c1 f8 03          	sar    rax,0x3
    10ec:	48 01 c6             	add    rsi,rax
    10ef:	48 d1 fe             	sar    rsi,1
    10f2:	74 14                	je     1108 <register_tm_clones+0x38>
    10f4:	48 8b 05 f5 2e 00 00 	mov    rax,QWORD PTR [rip+0x2ef5]        # 3ff0 <_ITM_registerTMCloneTable@Base>
    10fb:	48 85 c0             	test   rax,rax
    10fe:	74 08                	je     1108 <register_tm_clones+0x38>
    1100:	ff e0                	jmp    rax
    1102:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
    1108:	c3                   	ret    
    1109:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001110 <__do_global_dtors_aux>:
    1110:	f3 0f 1e fa          	endbr64 
    1114:	80 3d f5 2e 00 00 00 	cmp    BYTE PTR [rip+0x2ef5],0x0        # 4010 <__TMC_END__>
    111b:	75 2b                	jne    1148 <__do_global_dtors_aux+0x38>
    111d:	55                   	push   rbp
    111e:	48 83 3d d2 2e 00 00 	cmp    QWORD PTR [rip+0x2ed2],0x0        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1125:	00 
    1126:	48 89 e5             	mov    rbp,rsp
    1129:	74 0c                	je     1137 <__do_global_dtors_aux+0x27>
    112b:	48 8b 3d d6 2e 00 00 	mov    rdi,QWORD PTR [rip+0x2ed6]        # 4008 <__dso_handle>
    1132:	e8 19 ff ff ff       	call   1050 <__cxa_finalize@plt>
    1137:	e8 64 ff ff ff       	call   10a0 <deregister_tm_clones>
    113c:	c6 05 cd 2e 00 00 01 	mov    BYTE PTR [rip+0x2ecd],0x1        # 4010 <__TMC_END__>
    1143:	5d                   	pop    rbp
    1144:	c3                   	ret    
    1145:	0f 1f 00             	nop    DWORD PTR [rax]
    1148:	c3                   	ret    
    1149:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000001150 <frame_dummy>:
    1150:	f3 0f 1e fa          	endbr64 
    1154:	e9 77 ff ff ff       	jmp    10d0 <register_tm_clones>

0000000000001159 <solver>:
    1159:	f3 0f 1e fa          	endbr64 
    115d:	55                   	push   rbp
    115e:	48 89 e5             	mov    rbp,rsp
    1161:	48 83 ec 50          	sub    rsp,0x50
    1165:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    1169:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    1170:	00 00 
    1172:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    1176:	31 c0                	xor    eax,eax
    1178:	48 c7 45 e0 32 00 00 	mov    QWORD PTR [rbp-0x20],0x32
    117f:	00 
    1180:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
    1187:	00 
    1188:	48 8d 45 e0          	lea    rax,[rbp-0x20]
    118c:	48 83 c0 18          	add    rax,0x18
    1190:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    1194:	48 8d 45 e0          	lea    rax,[rbp-0x20]
    1198:	48 83 c0 20          	add    rax,0x20
    119c:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    11a0:	48 8d 45 e0          	lea    rax,[rbp-0x20]
    11a4:	48 83 c0 28          	add    rax,0x28
    11a8:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    11ac:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    11b0:	48 8b 00             	mov    rax,QWORD PTR [rax]
    11b3:	48 8b 4d b8          	mov    rcx,QWORD PTR [rbp-0x48]
    11b7:	48 89 c2             	mov    rdx,rax
    11ba:	48 8d 05 43 0e 00 00 	lea    rax,[rip+0xe43]        # 2004 <_IO_stdin_used+0x4>
    11c1:	48 89 c6             	mov    rsi,rax
    11c4:	48 8d 05 40 0e 00 00 	lea    rax,[rip+0xe40]        # 200b <_IO_stdin_used+0xb>
    11cb:	48 89 c7             	mov    rdi,rax
    11ce:	b8 00 00 00 00       	mov    eax,0x0
    11d3:	ff d1                	call   rcx
    11d5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    11d9:	48 8b 00             	mov    rax,QWORD PTR [rax]
    11dc:	48 8b 4d b8          	mov    rcx,QWORD PTR [rbp-0x48]
    11e0:	48 89 c2             	mov    rdx,rax
    11e3:	48 8d 05 2c 0e 00 00 	lea    rax,[rip+0xe2c]        # 2016 <_IO_stdin_used+0x16>
    11ea:	48 89 c6             	mov    rsi,rax
    11ed:	48 8d 05 17 0e 00 00 	lea    rax,[rip+0xe17]        # 200b <_IO_stdin_used+0xb>
    11f4:	48 89 c7             	mov    rdi,rax
    11f7:	b8 00 00 00 00       	mov    eax,0x0
    11fc:	ff d1                	call   rcx
    11fe:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    1202:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1205:	48 8b 4d b8          	mov    rcx,QWORD PTR [rbp-0x48]
    1209:	48 89 c2             	mov    rdx,rax
    120c:	48 8d 05 07 0e 00 00 	lea    rax,[rip+0xe07]        # 201a <_IO_stdin_used+0x1a>
    1213:	48 89 c6             	mov    rsi,rax
    1216:	48 8d 05 ee 0d 00 00 	lea    rax,[rip+0xdee]        # 200b <_IO_stdin_used+0xb>
    121d:	48 89 c7             	mov    rdi,rax
    1220:	b8 00 00 00 00       	mov    eax,0x0
    1225:	ff d1                	call   rcx
    1227:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    122b:	48 8b 00             	mov    rax,QWORD PTR [rax]
    122e:	48 05 ab 00 00 00    	add    rax,0xab
    1234:	48 8b 4d b8          	mov    rcx,QWORD PTR [rbp-0x48]
    1238:	48 89 c2             	mov    rdx,rax
    123b:	48 8d 05 e3 0d 00 00 	lea    rax,[rip+0xde3]        # 2025 <_IO_stdin_used+0x25>
    1242:	48 89 c6             	mov    rsi,rax
    1245:	48 8d 05 bf 0d 00 00 	lea    rax,[rip+0xdbf]        # 200b <_IO_stdin_used+0xb>
    124c:	48 89 c7             	mov    rdi,rax
    124f:	b8 00 00 00 00       	mov    eax,0x0
    1254:	ff d1                	call   rcx
    1256:	90                   	nop
    1257:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    125b:	64 48 2b 04 25 28 00 	sub    rax,QWORD PTR fs:0x28
    1262:	00 00 
    1264:	74 05                	je     126b <solver+0x112>
    1266:	e8 f5 fd ff ff       	call   1060 <__stack_chk_fail@plt>
    126b:	c9                   	leave  
    126c:	c3                   	ret    

000000000000126d <main>:
    126d:	f3 0f 1e fa          	endbr64 
    1271:	55                   	push   rbp
    1272:	48 89 e5             	mov    rbp,rsp
    1275:	48 83 ec 20          	sub    rsp,0x20
    1279:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
    1280:	00 00 
    1282:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    1286:	31 c0                	xor    eax,eax
    1288:	48 b8 2a 2a 20 6d 61 	movabs rax,0x206e69616d202a2a
    128f:	69 6e 20 
    1292:	48 ba 3d 20 25 70 0a 	movabs rdx,0xa7025203d
    1299:	00 00 00 
    129c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    12a0:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
    12a4:	48 8d 45 e0          	lea    rax,[rbp-0x20]
    12a8:	48 8d 15 be ff ff ff 	lea    rdx,[rip+0xffffffffffffffbe]        # 126d <main>
    12af:	48 89 d6             	mov    rsi,rdx
    12b2:	48 89 c7             	mov    rdi,rax
    12b5:	b8 00 00 00 00       	mov    eax,0x0
    12ba:	e8 81 fd ff ff       	call   1040 <printf@plt>
    12bf:	48 8b 05 1a 2d 00 00 	mov    rax,QWORD PTR [rip+0x2d1a]        # 3fe0 <printf@GLIBC_2.2.5>
    12c6:	48 89 c7             	mov    rdi,rax
    12c9:	e8 8b fe ff ff       	call   1159 <solver>
    12ce:	b8 00 00 00 00       	mov    eax,0x0
    12d3:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    12d7:	64 48 2b 14 25 28 00 	sub    rdx,QWORD PTR fs:0x28
    12de:	00 00 
    12e0:	74 05                	je     12e7 <main+0x7a>
    12e2:	e8 79 fd ff ff       	call   1060 <__stack_chk_fail@plt>
    12e7:	c9                   	leave  
    12e8:	c3                   	ret    

Disassembly of section .fini:

00000000000012ec <_fini>:
    12ec:	f3 0f 1e fa          	endbr64 
    12f0:	48 83 ec 08          	sub    rsp,0x8
    12f4:	48 83 c4 08          	add    rsp,0x8
    12f8:	c3                   	ret    

Disassembly of section .rodata:

0000000000002000 <_IO_stdin_used>:
    2000:	01 00                	add    DWORD PTR [rax],eax
    2002:	02 00                	add    al,BYTE PTR [rax]
    2004:	63 61 6e             	movsxd esp,DWORD PTR [rcx+0x6e]
    2007:	61                   	(bad)  
    2008:	72 79                	jb     2083 <__GNU_EH_FRAME_HDR+0x4f>
    200a:	00 25 31 36 73 3a    	add    BYTE PTR [rip+0x3a733631],ah        # 3a735641 <_end+0x3a731629>
    2010:	20 25 6c 78 0a 00    	and    BYTE PTR [rip+0xa786c],ah        # a9882 <_end+0xa586a>
    2016:	72 62                	jb     207a <__GNU_EH_FRAME_HDR+0x46>
    2018:	70 00                	jo     201a <_IO_stdin_used+0x1a>
    201a:	72 65                	jb     2081 <__GNU_EH_FRAME_HDR+0x4d>
    201c:	74 75                	je     2093 <__GNU_EH_FRAME_HDR+0x5f>
    201e:	72 6e                	jb     208e <__GNU_EH_FRAME_HDR+0x5a>
    2020:	41                   	rex.B
    2021:	64 64 72 00          	fs fs jb 2025 <_IO_stdin_used+0x25>
    2025:	6d                   	ins    DWORD PTR es:[rdi],dx
    2026:	6f                   	outs   dx,DWORD PTR ds:[rsi]
    2027:	64 5f                	fs pop rdi
    2029:	72 65                	jb     2090 <__GNU_EH_FRAME_HDR+0x5c>
    202b:	74 75                	je     20a2 <__GNU_EH_FRAME_HDR+0x6e>
    202d:	72 6e                	jb     209d <__GNU_EH_FRAME_HDR+0x69>
    202f:	41                   	rex.B
    2030:	64 64 72 00          	fs fs jb 2034 <__GNU_EH_FRAME_HDR>

Disassembly of section .eh_frame_hdr:

0000000000002034 <__GNU_EH_FRAME_HDR>:
    2034:	01 1b                	add    DWORD PTR [rbx],ebx
    2036:	03 3b                	add    edi,DWORD PTR [rbx]
    2038:	38 00                	cmp    BYTE PTR [rax],al
    203a:	00 00                	add    BYTE PTR [rax],al
    203c:	06                   	(bad)  
    203d:	00 00                	add    BYTE PTR [rax],al
    203f:	00 ec                	add    ah,ch
    2041:	ef                   	out    dx,eax
    2042:	ff                   	(bad)  
    2043:	ff 6c 00 00          	jmp    FWORD PTR [rax+rax*1+0x0]
    2047:	00 0c f0             	add    BYTE PTR [rax+rsi*8],cl
    204a:	ff                   	(bad)  
    204b:	ff 94 00 00 00 2c f0 	call   QWORD PTR [rax+rax*1-0xfd40000]
    2052:	ff                   	(bad)  
    2053:	ff ac 00 00 00 3c f0 	jmp    FWORD PTR [rax+rax*1-0xfc40000]
    205a:	ff                   	(bad)  
    205b:	ff 54 00 00          	call   QWORD PTR [rax+rax*1+0x0]
    205f:	00 25 f1 ff ff c4    	add    BYTE PTR [rip+0xffffffffc4fffff1],ah        # ffffffffc5002056 <_end+0xffffffffc4ffe03e>
    2065:	00 00                	add    BYTE PTR [rax],al
    2067:	00 39                	add    BYTE PTR [rcx],bh
    2069:	f2 ff                	repnz (bad) 
    206b:	ff e4                	jmp    rsp
    206d:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .eh_frame:

0000000000002070 <__FRAME_END__-0xc8>:
    2070:	14 00                	adc    al,0x0
    2072:	00 00                	add    BYTE PTR [rax],al
    2074:	00 00                	add    BYTE PTR [rax],al
    2076:	00 00                	add    BYTE PTR [rax],al
    2078:	01 7a 52             	add    DWORD PTR [rdx+0x52],edi
    207b:	00 01                	add    BYTE PTR [rcx],al
    207d:	78 10                	js     208f <__GNU_EH_FRAME_HDR+0x5b>
    207f:	01 1b                	add    DWORD PTR [rbx],ebx
    2081:	0c 07                	or     al,0x7
    2083:	08 90 01 00 00 14    	or     BYTE PTR [rax+0x14000001],dl
    2089:	00 00                	add    BYTE PTR [rax],al
    208b:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
    208e:	00 00                	add    BYTE PTR [rax],al
    2090:	e0 ef                	loopne 2081 <__GNU_EH_FRAME_HDR+0x4d>
    2092:	ff                   	(bad)  
    2093:	ff 26                	jmp    QWORD PTR [rsi]
    2095:	00 00                	add    BYTE PTR [rax],al
    2097:	00 00                	add    BYTE PTR [rax],al
    2099:	44 07                	rex.R (bad) 
    209b:	10 00                	adc    BYTE PTR [rax],al
    209d:	00 00                	add    BYTE PTR [rax],al
    209f:	00 24 00             	add    BYTE PTR [rax+rax*1],ah
    20a2:	00 00                	add    BYTE PTR [rax],al
    20a4:	34 00                	xor    al,0x0
    20a6:	00 00                	add    BYTE PTR [rax],al
    20a8:	78 ef                	js     2099 <__GNU_EH_FRAME_HDR+0x65>
    20aa:	ff                   	(bad)  
    20ab:	ff 20                	jmp    QWORD PTR [rax]
    20ad:	00 00                	add    BYTE PTR [rax],al
    20af:	00 00                	add    BYTE PTR [rax],al
    20b1:	0e                   	(bad)  
    20b2:	10 46 0e             	adc    BYTE PTR [rsi+0xe],al
    20b5:	18 4a 0f             	sbb    BYTE PTR [rdx+0xf],cl
    20b8:	0b 77 08             	or     esi,DWORD PTR [rdi+0x8]
    20bb:	80 00 3f             	add    BYTE PTR [rax],0x3f
    20be:	1a 3a                	sbb    bh,BYTE PTR [rdx]
    20c0:	2a 33                	sub    dh,BYTE PTR [rbx]
    20c2:	24 22                	and    al,0x22
    20c4:	00 00                	add    BYTE PTR [rax],al
    20c6:	00 00                	add    BYTE PTR [rax],al
    20c8:	14 00                	adc    al,0x0
    20ca:	00 00                	add    BYTE PTR [rax],al
    20cc:	5c                   	pop    rsp
    20cd:	00 00                	add    BYTE PTR [rax],al
    20cf:	00 70 ef             	add    BYTE PTR [rax-0x11],dh
    20d2:	ff                   	(bad)  
    20d3:	ff 20                	jmp    QWORD PTR [rax]
	...
    20dd:	00 00                	add    BYTE PTR [rax],al
    20df:	00 14 00             	add    BYTE PTR [rax+rax*1],dl
    20e2:	00 00                	add    BYTE PTR [rax],al
    20e4:	74 00                	je     20e6 <__GNU_EH_FRAME_HDR+0xb2>
    20e6:	00 00                	add    BYTE PTR [rax],al
    20e8:	78 ef                	js     20d9 <__GNU_EH_FRAME_HDR+0xa5>
    20ea:	ff                   	(bad)  
    20eb:	ff 10                	call   QWORD PTR [rax]
	...
    20f5:	00 00                	add    BYTE PTR [rax],al
    20f7:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
    20fa:	00 00                	add    BYTE PTR [rax],al
    20fc:	8c 00                	mov    WORD PTR [rax],es
    20fe:	00 00                	add    BYTE PTR [rax],al
    2100:	59                   	pop    rcx
    2101:	f0 ff                	lock (bad) 
    2103:	ff 14 01             	call   QWORD PTR [rcx+rax*1]
    2106:	00 00                	add    BYTE PTR [rax],al
    2108:	00 45 0e             	add    BYTE PTR [rbp+0xe],al
    210b:	10 86 02 43 0d 06    	adc    BYTE PTR [rsi+0x60d4302],al
    2111:	03 0b                	add    ecx,DWORD PTR [rbx]
    2113:	01 0c 07             	add    DWORD PTR [rdi+rax*1],ecx
    2116:	08 00                	or     BYTE PTR [rax],al
    2118:	1c 00                	sbb    al,0x0
    211a:	00 00                	add    BYTE PTR [rax],al
    211c:	ac                   	lods   al,BYTE PTR ds:[rsi]
    211d:	00 00                	add    BYTE PTR [rax],al
    211f:	00 4d f1             	add    BYTE PTR [rbp-0xf],cl
    2122:	ff                   	(bad)  
    2123:	ff                   	(bad)  
    2124:	7c 00                	jl     2126 <__GNU_EH_FRAME_HDR+0xf2>
    2126:	00 00                	add    BYTE PTR [rax],al
    2128:	00 45 0e             	add    BYTE PTR [rbp+0xe],al
    212b:	10 86 02 43 0d 06    	adc    BYTE PTR [rsi+0x60d4302],al
    2131:	02 73 0c             	add    dh,BYTE PTR [rbx+0xc]
    2134:	07                   	(bad)  
    2135:	08 00                	or     BYTE PTR [rax],al
	...

0000000000002138 <__FRAME_END__>:
    2138:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .init_array:

0000000000003db0 <__frame_dummy_init_array_entry>:
    3db0:	50                   	push   rax
    3db1:	11 00                	adc    DWORD PTR [rax],eax
    3db3:	00 00                	add    BYTE PTR [rax],al
    3db5:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .fini_array:

0000000000003db8 <__do_global_dtors_aux_fini_array_entry>:
    3db8:	10 11                	adc    BYTE PTR [rcx],dl
    3dba:	00 00                	add    BYTE PTR [rax],al
    3dbc:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .dynamic:

0000000000003dc0 <_DYNAMIC>:
    3dc0:	01 00                	add    DWORD PTR [rax],eax
    3dc2:	00 00                	add    BYTE PTR [rax],al
    3dc4:	00 00                	add    BYTE PTR [rax],al
    3dc6:	00 00                	add    BYTE PTR [rax],al
    3dc8:	3a 00                	cmp    al,BYTE PTR [rax]
    3dca:	00 00                	add    BYTE PTR [rax],al
    3dcc:	00 00                	add    BYTE PTR [rax],al
    3dce:	00 00                	add    BYTE PTR [rax],al
    3dd0:	0c 00                	or     al,0x0
    3dd2:	00 00                	add    BYTE PTR [rax],al
    3dd4:	00 00                	add    BYTE PTR [rax],al
    3dd6:	00 00                	add    BYTE PTR [rax],al
    3dd8:	00 10                	add    BYTE PTR [rax],dl
    3dda:	00 00                	add    BYTE PTR [rax],al
    3ddc:	00 00                	add    BYTE PTR [rax],al
    3dde:	00 00                	add    BYTE PTR [rax],al
    3de0:	0d 00 00 00 00       	or     eax,0x0
    3de5:	00 00                	add    BYTE PTR [rax],al
    3de7:	00 ec                	add    ah,ch
    3de9:	12 00                	adc    al,BYTE PTR [rax]
    3deb:	00 00                	add    BYTE PTR [rax],al
    3ded:	00 00                	add    BYTE PTR [rax],al
    3def:	00 19                	add    BYTE PTR [rcx],bl
    3df1:	00 00                	add    BYTE PTR [rax],al
    3df3:	00 00                	add    BYTE PTR [rax],al
    3df5:	00 00                	add    BYTE PTR [rax],al
    3df7:	00 b0 3d 00 00 00    	add    BYTE PTR [rax+0x3d],dh
    3dfd:	00 00                	add    BYTE PTR [rax],al
    3dff:	00 1b                	add    BYTE PTR [rbx],bl
    3e01:	00 00                	add    BYTE PTR [rax],al
    3e03:	00 00                	add    BYTE PTR [rax],al
    3e05:	00 00                	add    BYTE PTR [rax],al
    3e07:	00 08                	add    BYTE PTR [rax],cl
    3e09:	00 00                	add    BYTE PTR [rax],al
    3e0b:	00 00                	add    BYTE PTR [rax],al
    3e0d:	00 00                	add    BYTE PTR [rax],al
    3e0f:	00 1a                	add    BYTE PTR [rdx],bl
    3e11:	00 00                	add    BYTE PTR [rax],al
    3e13:	00 00                	add    BYTE PTR [rax],al
    3e15:	00 00                	add    BYTE PTR [rax],al
    3e17:	00 b8 3d 00 00 00    	add    BYTE PTR [rax+0x3d],bh
    3e1d:	00 00                	add    BYTE PTR [rax],al
    3e1f:	00 1c 00             	add    BYTE PTR [rax+rax*1],bl
    3e22:	00 00                	add    BYTE PTR [rax],al
    3e24:	00 00                	add    BYTE PTR [rax],al
    3e26:	00 00                	add    BYTE PTR [rax],al
    3e28:	08 00                	or     BYTE PTR [rax],al
    3e2a:	00 00                	add    BYTE PTR [rax],al
    3e2c:	00 00                	add    BYTE PTR [rax],al
    3e2e:	00 00                	add    BYTE PTR [rax],al
    3e30:	f5                   	cmc    
    3e31:	fe                   	(bad)  
    3e32:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
    3e35:	00 00                	add    BYTE PTR [rax],al
    3e37:	00 b0 03 00 00 00    	add    BYTE PTR [rax+0x3],dh
    3e3d:	00 00                	add    BYTE PTR [rax],al
    3e3f:	00 05 00 00 00 00    	add    BYTE PTR [rip+0x0],al        # 3e45 <_DYNAMIC+0x85>
    3e45:	00 00                	add    BYTE PTR [rax],al
    3e47:	00 98 04 00 00 00    	add    BYTE PTR [rax+0x4],bl
    3e4d:	00 00                	add    BYTE PTR [rax],al
    3e4f:	00 06                	add    BYTE PTR [rsi],al
    3e51:	00 00                	add    BYTE PTR [rax],al
    3e53:	00 00                	add    BYTE PTR [rax],al
    3e55:	00 00                	add    BYTE PTR [rax],al
    3e57:	00 d8                	add    al,bl
    3e59:	03 00                	add    eax,DWORD PTR [rax]
    3e5b:	00 00                	add    BYTE PTR [rax],al
    3e5d:	00 00                	add    BYTE PTR [rax],al
    3e5f:	00 0a                	add    BYTE PTR [rdx],cl
    3e61:	00 00                	add    BYTE PTR [rax],al
    3e63:	00 00                	add    BYTE PTR [rax],al
    3e65:	00 00                	add    BYTE PTR [rax],al
    3e67:	00 aa 00 00 00 00    	add    BYTE PTR [rdx+0x0],ch
    3e6d:	00 00                	add    BYTE PTR [rax],al
    3e6f:	00 0b                	add    BYTE PTR [rbx],cl
    3e71:	00 00                	add    BYTE PTR [rax],al
    3e73:	00 00                	add    BYTE PTR [rax],al
    3e75:	00 00                	add    BYTE PTR [rax],al
    3e77:	00 18                	add    BYTE PTR [rax],bl
    3e79:	00 00                	add    BYTE PTR [rax],al
    3e7b:	00 00                	add    BYTE PTR [rax],al
    3e7d:	00 00                	add    BYTE PTR [rax],al
    3e7f:	00 15 00 00 00 00    	add    BYTE PTR [rip+0x0],dl        # 3e85 <_DYNAMIC+0xc5>
	...
    3e8d:	00 00                	add    BYTE PTR [rax],al
    3e8f:	00 03                	add    BYTE PTR [rbx],al
    3e91:	00 00                	add    BYTE PTR [rax],al
    3e93:	00 00                	add    BYTE PTR [rax],al
    3e95:	00 00                	add    BYTE PTR [rax],al
    3e97:	00 b0 3f 00 00 00    	add    BYTE PTR [rax+0x3f],dh
    3e9d:	00 00                	add    BYTE PTR [rax],al
    3e9f:	00 02                	add    BYTE PTR [rdx],al
    3ea1:	00 00                	add    BYTE PTR [rax],al
    3ea3:	00 00                	add    BYTE PTR [rax],al
    3ea5:	00 00                	add    BYTE PTR [rax],al
    3ea7:	00 18                	add    BYTE PTR [rax],bl
    3ea9:	00 00                	add    BYTE PTR [rax],al
    3eab:	00 00                	add    BYTE PTR [rax],al
    3ead:	00 00                	add    BYTE PTR [rax],al
    3eaf:	00 14 00             	add    BYTE PTR [rax+rax*1],dl
    3eb2:	00 00                	add    BYTE PTR [rax],al
    3eb4:	00 00                	add    BYTE PTR [rax],al
    3eb6:	00 00                	add    BYTE PTR [rax],al
    3eb8:	07                   	(bad)  
    3eb9:	00 00                	add    BYTE PTR [rax],al
    3ebb:	00 00                	add    BYTE PTR [rax],al
    3ebd:	00 00                	add    BYTE PTR [rax],al
    3ebf:	00 17                	add    BYTE PTR [rdi],dl
    3ec1:	00 00                	add    BYTE PTR [rax],al
    3ec3:	00 00                	add    BYTE PTR [rax],al
    3ec5:	00 00                	add    BYTE PTR [rax],al
    3ec7:	00 70 06             	add    BYTE PTR [rax+0x6],dh
    3eca:	00 00                	add    BYTE PTR [rax],al
    3ecc:	00 00                	add    BYTE PTR [rax],al
    3ece:	00 00                	add    BYTE PTR [rax],al
    3ed0:	07                   	(bad)  
    3ed1:	00 00                	add    BYTE PTR [rax],al
    3ed3:	00 00                	add    BYTE PTR [rax],al
    3ed5:	00 00                	add    BYTE PTR [rax],al
    3ed7:	00 98 05 00 00 00    	add    BYTE PTR [rax+0x5],bl
    3edd:	00 00                	add    BYTE PTR [rax],al
    3edf:	00 08                	add    BYTE PTR [rax],cl
    3ee1:	00 00                	add    BYTE PTR [rax],al
    3ee3:	00 00                	add    BYTE PTR [rax],al
    3ee5:	00 00                	add    BYTE PTR [rax],al
    3ee7:	00 d8                	add    al,bl
    3ee9:	00 00                	add    BYTE PTR [rax],al
    3eeb:	00 00                	add    BYTE PTR [rax],al
    3eed:	00 00                	add    BYTE PTR [rax],al
    3eef:	00 09                	add    BYTE PTR [rcx],cl
    3ef1:	00 00                	add    BYTE PTR [rax],al
    3ef3:	00 00                	add    BYTE PTR [rax],al
    3ef5:	00 00                	add    BYTE PTR [rax],al
    3ef7:	00 18                	add    BYTE PTR [rax],bl
    3ef9:	00 00                	add    BYTE PTR [rax],al
    3efb:	00 00                	add    BYTE PTR [rax],al
    3efd:	00 00                	add    BYTE PTR [rax],al
    3eff:	00 1e                	add    BYTE PTR [rsi],bl
    3f01:	00 00                	add    BYTE PTR [rax],al
    3f03:	00 00                	add    BYTE PTR [rax],al
    3f05:	00 00                	add    BYTE PTR [rax],al
    3f07:	00 08                	add    BYTE PTR [rax],cl
    3f09:	00 00                	add    BYTE PTR [rax],al
    3f0b:	00 00                	add    BYTE PTR [rax],al
    3f0d:	00 00                	add    BYTE PTR [rax],al
    3f0f:	00 fb                	add    bl,bh
    3f11:	ff                   	(bad)  
    3f12:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
    3f15:	00 00                	add    BYTE PTR [rax],al
    3f17:	00 01                	add    BYTE PTR [rcx],al
    3f19:	00 00                	add    BYTE PTR [rax],al
    3f1b:	08 00                	or     BYTE PTR [rax],al
    3f1d:	00 00                	add    BYTE PTR [rax],al
    3f1f:	00 fe                	add    dh,bh
    3f21:	ff                   	(bad)  
    3f22:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
    3f25:	00 00                	add    BYTE PTR [rax],al
    3f27:	00 58 05             	add    BYTE PTR [rax+0x5],bl
    3f2a:	00 00                	add    BYTE PTR [rax],al
    3f2c:	00 00                	add    BYTE PTR [rax],al
    3f2e:	00 00                	add    BYTE PTR [rax],al
    3f30:	ff                   	(bad)  
    3f31:	ff                   	(bad)  
    3f32:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
    3f35:	00 00                	add    BYTE PTR [rax],al
    3f37:	00 01                	add    BYTE PTR [rcx],al
    3f39:	00 00                	add    BYTE PTR [rax],al
    3f3b:	00 00                	add    BYTE PTR [rax],al
    3f3d:	00 00                	add    BYTE PTR [rax],al
    3f3f:	00 f0                	add    al,dh
    3f41:	ff                   	(bad)  
    3f42:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
    3f45:	00 00                	add    BYTE PTR [rax],al
    3f47:	00 42 05             	add    BYTE PTR [rdx+0x5],al
    3f4a:	00 00                	add    BYTE PTR [rax],al
    3f4c:	00 00                	add    BYTE PTR [rax],al
    3f4e:	00 00                	add    BYTE PTR [rax],al
    3f50:	f9                   	stc    
    3f51:	ff                   	(bad)  
    3f52:	ff 6f 00             	jmp    FWORD PTR [rdi+0x0]
    3f55:	00 00                	add    BYTE PTR [rax],al
    3f57:	00 03                	add    BYTE PTR [rbx],al
	...

Disassembly of section .got:

0000000000003fb0 <_GLOBAL_OFFSET_TABLE_>:
    3fb0:	c0 3d 00 00 00 00 00 	sar    BYTE PTR [rip+0x0],0x0        # 3fb7 <_GLOBAL_OFFSET_TABLE_+0x7>
	...
    3fc7:	00 30                	add    BYTE PTR [rax],dh
    3fc9:	10 00                	adc    BYTE PTR [rax],al
	...

Disassembly of section .data:

0000000000004000 <__data_start>:
	...

0000000000004008 <__dso_handle>:
    4008:	08 40 00             	or     BYTE PTR [rax+0x0],al
    400b:	00 00                	add    BYTE PTR [rax],al
    400d:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .bss:

0000000000004010 <completed.0>:
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	47                   	rex.RXB
   1:	43                   	rex.XB
   2:	43 3a 20             	rex.XB cmp spl,BYTE PTR [r8]
   5:	28 55 62             	sub    BYTE PTR [rbp+0x62],dl
   8:	75 6e                	jne    78 <__abi_tag-0x314>
   a:	74 75                	je     81 <__abi_tag-0x30b>
   c:	20 31                	and    BYTE PTR [rcx],dh
   e:	31 2e                	xor    DWORD PTR [rsi],ebp
  10:	33 2e                	xor    ebp,DWORD PTR [rsi]
  12:	30 2d 31 75 62 75    	xor    BYTE PTR [rip+0x75627531],ch        # 75627549 <_end+0x75623531>
  18:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  19:	74 75                	je     90 <__abi_tag-0x2fc>
  1b:	31 7e 32             	xor    DWORD PTR [rsi+0x32],edi
  1e:	32 2e                	xor    ch,BYTE PTR [rsi]
  20:	30 34 29             	xor    BYTE PTR [rcx+rbp*1],dh
  23:	20 31                	and    BYTE PTR [rcx],dh
  25:	31 2e                	xor    DWORD PTR [rsi],ebp
  27:	33 2e                	xor    ebp,DWORD PTR [rsi]
  29:	30 00                	xor    BYTE PTR [rax],al

Disassembly of section .debug_aranges:

0000000000000000 <.debug_aranges>:
   0:	2c 00                	sub    al,0x0
   2:	00 00                	add    BYTE PTR [rax],al
   4:	02 00                	add    al,BYTE PTR [rax]
   6:	00 00                	add    BYTE PTR [rax],al
   8:	00 00                	add    BYTE PTR [rax],al
   a:	08 00                	or     BYTE PTR [rax],al
   c:	00 00                	add    BYTE PTR [rax],al
   e:	00 00                	add    BYTE PTR [rax],al
  10:	59                   	pop    rcx
  11:	11 00                	adc    DWORD PTR [rax],eax
  13:	00 00                	add    BYTE PTR [rax],al
  15:	00 00                	add    BYTE PTR [rax],al
  17:	00 90 01 00 00 00    	add    BYTE PTR [rax+0x1],dl
	...

Disassembly of section .debug_info:

0000000000000000 <.debug_info>:
   0:	71 01                	jno    3 <__abi_tag-0x389>
   2:	00 00                	add    BYTE PTR [rax],al
   4:	05 00 01 08 00       	add    eax,0x80100
   9:	00 00                	add    BYTE PTR [rax],al
   b:	00 08                	add    BYTE PTR [rax],cl
   d:	20 00                	and    BYTE PTR [rax],al
   f:	00 00                	add    BYTE PTR [rax],al
  11:	1d 00 00 00 00       	sbb    eax,0x0
  16:	09 00                	or     DWORD PTR [rax],eax
  18:	00 00                	add    BYTE PTR [rax],al
  1a:	59                   	pop    rcx
  1b:	11 00                	adc    DWORD PTR [rax],eax
  1d:	00 00                	add    BYTE PTR [rax],al
  1f:	00 00                	add    BYTE PTR [rax],al
  21:	00 90 01 00 00 00    	add    BYTE PTR [rax+0x1],dl
  27:	00 00                	add    BYTE PTR [rax],al
  29:	00 00                	add    BYTE PTR [rax],al
  2b:	00 00                	add    BYTE PTR [rax],al
  2d:	00 01                	add    BYTE PTR [rcx],al
  2f:	08 07                	or     BYTE PTR [rdi],al
  31:	b5 00                	mov    ch,0x0
  33:	00 00                	add    BYTE PTR [rax],al
  35:	01 04 07             	add    DWORD PTR [rdi+rax*1],eax
  38:	ba 00 00 00 01       	mov    edx,0x1000000
  3d:	01 08                	add    DWORD PTR [rax],ecx
  3f:	c7 00 00 00 01 02    	mov    DWORD PTR [rax],0x2010000
  45:	07                   	(bad)  
  46:	00 00                	add    BYTE PTR [rax],al
  48:	00 00                	add    BYTE PTR [rax],al
  4a:	01 01                	add    DWORD PTR [rcx],eax
  4c:	06                   	(bad)  
  4d:	c9                   	leave  
  4e:	00 00                	add    BYTE PTR [rax],al
  50:	00 01                	add    BYTE PTR [rcx],al
  52:	02 05 0c 01 00 00    	add    al,BYTE PTR [rip+0x10c]        # 164 <__abi_tag-0x228>
  58:	09 04 05 69 6e 74 00 	or     DWORD PTR [rax*1+0x746e69],eax
  5f:	01 08                	add    DWORD PTR [rax],ecx
  61:	05 ec 00 00 00       	add    eax,0xec
  66:	02 f5                	add    dh,ch
  68:	00 00                	add    BYTE PTR [rax],al
  6a:	00 02                	add    BYTE PTR [rdx],al
  6c:	2d 1b 2e 00 00       	sub    eax,0x2e1b
  71:	00 01                	add    BYTE PTR [rcx],al
  73:	01 06                	add    DWORD PTR [rsi],eax
  75:	d0 00                	rol    BYTE PTR [rax],1
  77:	00 00                	add    BYTE PTR [rax],al
  79:	0a 72 00             	or     dh,BYTE PTR [rdx+0x0]
  7c:	00 00                	add    BYTE PTR [rax],al
  7e:	03 79 00             	add    edi,DWORD PTR [rcx+0x0]
  81:	00 00                	add    BYTE PTR [rax],al
  83:	02 f7                	add    dh,bh
  85:	00 00                	add    BYTE PTR [rax],al
  87:	00 03                	add    BYTE PTR [rbx],al
  89:	1b 14 66             	sbb    edx,DWORD PTR [rsi+riz*2]
  8c:	00 00                	add    BYTE PTR [rax],al
  8e:	00 02                	add    BYTE PTR [rdx],al
  90:	13 00                	adc    eax,DWORD PTR [rax]
  92:	00 00                	add    BYTE PTR [rax],al
  94:	01 05 0f 9b 00 00    	add    DWORD PTR [rip+0x9b0f],eax        # 9ba9 <_end+0x5b91>
  9a:	00 03                	add    BYTE PTR [rbx],al
  9c:	a0 00 00 00 0b 58 00 	movabs al,ds:0x580b000000
  a3:	00 00 
  a5:	b0 00                	mov    al,0x0
  a7:	00 00                	add    BYTE PTR [rax],al
  a9:	05 7e 00 00 00       	add    eax,0x7e
  ae:	06                   	(bad)  
  af:	00 0c 05 01 00 00 04 	add    BYTE PTR [rax*1+0x4000001],cl
  b6:	64 01 0c 58          	add    DWORD PTR fs:[rax+rbx*2],ecx
  ba:	00 00                	add    BYTE PTR [rax],al
  bc:	00 c8                	add    al,cl
  be:	00 00                	add    BYTE PTR [rax],al
  c0:	00 05 7e 00 00 00    	add    BYTE PTR [rip+0x7e],al        # 144 <__abi_tag-0x248>
  c6:	06                   	(bad)  
  c7:	00 0d d5 00 00 00    	add    BYTE PTR [rip+0xd5],cl        # 1a2 <__abi_tag-0x1ea>
  cd:	01 15 05 58 00 00    	add    DWORD PTR [rip+0x5805],edx        # 58d8 <_end+0x18c0>
  d3:	00 6d 12             	add    BYTE PTR [rbp+0x12],ch
  d6:	00 00                	add    BYTE PTR [rax],al
  d8:	00 00                	add    BYTE PTR [rax],al
  da:	00 00                	add    BYTE PTR [rax],al
  dc:	7c 00                	jl     de <__abi_tag-0x2ae>
  de:	00 00                	add    BYTE PTR [rax],al
  e0:	00 00                	add    BYTE PTR [rax],al
  e2:	00 00                	add    BYTE PTR [rax],al
  e4:	01 9c f9 00 00 00 04 	add    DWORD PTR [rcx+rdi*8+0x4000000],ebx
  eb:	66 6d                	ins    WORD PTR es:[rdi],dx
  ed:	74 00                	je     ef <__abi_tag-0x29d>
  ef:	16                   	(bad)  
  f0:	07                   	(bad)  
  f1:	f9                   	stc    
  f2:	00 00                	add    BYTE PTR [rax],al
  f4:	00 02                	add    BYTE PTR [rdx],al
  f6:	91                   	xchg   ecx,eax
  f7:	50                   	push   rax
  f8:	00 0e                	add    BYTE PTR [rsi],cl
  fa:	72 00                	jb     fc <__abi_tag-0x290>
  fc:	00 00                	add    BYTE PTR [rax],al
  fe:	09 01                	or     DWORD PTR [rcx],eax
 100:	00 00                	add    BYTE PTR [rax],al
 102:	0f 2e 00             	ucomiss xmm0,DWORD PTR [rax]
 105:	00 00                	add    BYTE PTR [rax],al
 107:	0f 00 10             	lldt   WORD PTR [rax]
 10a:	e5 00                	in     eax,0x0
 10c:	00 00                	add    BYTE PTR [rax],al
 10e:	01 07                	add    DWORD PTR [rdi],eax
 110:	06                   	(bad)  
 111:	59                   	pop    rcx
 112:	11 00                	adc    DWORD PTR [rax],eax
 114:	00 00                	add    BYTE PTR [rax],al
 116:	00 00                	add    BYTE PTR [rax],al
 118:	00 14 01             	add    BYTE PTR [rcx+rax*1],dl
 11b:	00 00                	add    BYTE PTR [rax],al
 11d:	00 00                	add    BYTE PTR [rax],al
 11f:	00 00                	add    BYTE PTR [rax],al
 121:	01 9c 6f 01 00 00 11 	add    DWORD PTR [rdi+rbp*2+0x11000001],ebx
 128:	00 01                	add    BYTE PTR [rcx],al
 12a:	00 00                	add    BYTE PTR [rax],al
 12c:	01 07                	add    DWORD PTR [rdi],eax
 12e:	1a 8f 00 00 00 03    	sbb    cl,BYTE PTR [rdi+0x3000000]
 134:	91                   	xchg   ecx,eax
 135:	a8 7f                	test   al,0x7f
 137:	04 6d                	add    al,0x6d
 139:	73 67                	jae    1a2 <__abi_tag-0x1ea>
 13b:	00 08                	add    BYTE PTR [rax],cl
 13d:	07                   	(bad)  
 13e:	f9                   	stc    
 13f:	00 00                	add    BYTE PTR [rax],al
 141:	00 02                	add    BYTE PTR [rdx],al
 143:	91                   	xchg   ecx,eax
 144:	50                   	push   rax
 145:	07                   	(bad)  
 146:	ae                   	scas   al,BYTE PTR es:[rdi]
 147:	00 00                	add    BYTE PTR [rax],al
 149:	00 09                	add    BYTE PTR [rcx],cl
 14b:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 14c:	01 00                	add    DWORD PTR [rax],eax
 14e:	00 03                	add    BYTE PTR [rbx],al
 150:	91                   	xchg   ecx,eax
 151:	b8 7f 04 72 62       	mov    eax,0x6272047f
 156:	70 00                	jo     158 <__abi_tag-0x234>
 158:	0a 0c 6f             	or     cl,BYTE PTR [rdi+rbp*2]
 15b:	01 00                	add    DWORD PTR [rax],eax
 15d:	00 02                	add    BYTE PTR [rdx],al
 15f:	91                   	xchg   ecx,eax
 160:	40 07                	rex (bad) 
 162:	da 00                	fiadd  DWORD PTR [rax]
 164:	00 00                	add    BYTE PTR [rax],al
 166:	0b 6f 01             	or     ebp,DWORD PTR [rdi+0x1]
 169:	00 00                	add    BYTE PTR [rax],al
 16b:	02 91 48 00 03 83    	add    dl,BYTE PTR [rcx-0x7cfcffb8]
 171:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .debug_abbrev:

0000000000000000 <.debug_abbrev>:
   0:	01 24 00             	add    DWORD PTR [rax+rax*1],esp
   3:	0b 0b                	or     ecx,DWORD PTR [rbx]
   5:	3e 0b 03             	ds or  eax,DWORD PTR [rbx]
   8:	0e                   	(bad)  
   9:	00 00                	add    BYTE PTR [rax],al
   b:	02 16                	add    dl,BYTE PTR [rsi]
   d:	00 03                	add    BYTE PTR [rbx],al
   f:	0e                   	(bad)  
  10:	3a 0b                	cmp    cl,BYTE PTR [rbx]
  12:	3b 0b                	cmp    ecx,DWORD PTR [rbx]
  14:	39 0b                	cmp    DWORD PTR [rbx],ecx
  16:	49 13 00             	adc    rax,QWORD PTR [r8]
  19:	00 03                	add    BYTE PTR [rbx],al
  1b:	0f 00 0b             	str    WORD PTR [rbx]
  1e:	21 08                	and    DWORD PTR [rax],ecx
  20:	49 13 00             	adc    rax,QWORD PTR [r8]
  23:	00 04 34             	add    BYTE PTR [rsp+rsi*1],al
  26:	00 03                	add    BYTE PTR [rbx],al
  28:	08 3a                	or     BYTE PTR [rdx],bh
  2a:	21 01                	and    DWORD PTR [rcx],eax
  2c:	3b 0b                	cmp    ecx,DWORD PTR [rbx]
  2e:	39 0b                	cmp    DWORD PTR [rbx],ecx
  30:	49 13 02             	adc    rax,QWORD PTR [r10]
  33:	18 00                	sbb    BYTE PTR [rax],al
  35:	00 05 05 00 49 13    	add    BYTE PTR [rip+0x13490005],al        # 13490040 <_end+0x1348c028>
  3b:	00 00                	add    BYTE PTR [rax],al
  3d:	06                   	(bad)  
  3e:	18 00                	sbb    BYTE PTR [rax],al
  40:	00 00                	add    BYTE PTR [rax],al
  42:	07                   	(bad)  
  43:	34 00                	xor    al,0x0
  45:	03 0e                	add    ecx,DWORD PTR [rsi]
  47:	3a 21                	cmp    ah,BYTE PTR [rcx]
  49:	01 3b                	add    DWORD PTR [rbx],edi
  4b:	0b 39                	or     edi,DWORD PTR [rcx]
  4d:	21 0c 49             	and    DWORD PTR [rcx+rcx*2],ecx
  50:	13 02                	adc    eax,DWORD PTR [rdx]
  52:	18 00                	sbb    BYTE PTR [rax],al
  54:	00 08                	add    BYTE PTR [rax],cl
  56:	11 01                	adc    DWORD PTR [rcx],eax
  58:	25 0e 13 0b 03       	and    eax,0x30b130e
  5d:	1f                   	(bad)  
  5e:	1b 1f                	sbb    ebx,DWORD PTR [rdi]
  60:	11 01                	adc    DWORD PTR [rcx],eax
  62:	12 07                	adc    al,BYTE PTR [rdi]
  64:	10 17                	adc    BYTE PTR [rdi],dl
  66:	00 00                	add    BYTE PTR [rax],al
  68:	09 24 00             	or     DWORD PTR [rax+rax*1],esp
  6b:	0b 0b                	or     ecx,DWORD PTR [rbx]
  6d:	3e 0b 03             	ds or  eax,DWORD PTR [rbx]
  70:	08 00                	or     BYTE PTR [rax],al
  72:	00 0a                	add    BYTE PTR [rdx],cl
  74:	26 00 49 13          	es add BYTE PTR [rcx+0x13],cl
  78:	00 00                	add    BYTE PTR [rax],al
  7a:	0b 15 01 27 19 49    	or     edx,DWORD PTR [rip+0x49192701]        # 49192781 <_end+0x4918e769>
  80:	13 01                	adc    eax,DWORD PTR [rcx]
  82:	13 00                	adc    eax,DWORD PTR [rax]
  84:	00 0c 2e             	add    BYTE PTR [rsi+rbp*1],cl
  87:	01 3f                	add    DWORD PTR [rdi],edi
  89:	19 03                	sbb    DWORD PTR [rbx],eax
  8b:	0e                   	(bad)  
  8c:	3a 0b                	cmp    cl,BYTE PTR [rbx]
  8e:	3b 05 39 0b 27 19    	cmp    eax,DWORD PTR [rip+0x19270b39]        # 19270bcd <_end+0x1926cbb5>
  94:	49 13 3c 19          	adc    rdi,QWORD PTR [r9+rbx*1]
  98:	01 13                	add    DWORD PTR [rbx],edx
  9a:	00 00                	add    BYTE PTR [rax],al
  9c:	0d 2e 01 3f 19       	or     eax,0x193f012e
  a1:	03 0e                	add    ecx,DWORD PTR [rsi]
  a3:	3a 0b                	cmp    cl,BYTE PTR [rbx]
  a5:	3b 0b                	cmp    ecx,DWORD PTR [rbx]
  a7:	39 0b                	cmp    DWORD PTR [rbx],ecx
  a9:	49 13 11             	adc    rdx,QWORD PTR [r9]
  ac:	01 12                	add    DWORD PTR [rdx],edx
  ae:	07                   	(bad)  
  af:	40 18 7c 19 01       	sbb    BYTE PTR [rcx+rbx*1+0x1],dil
  b4:	13 00                	adc    eax,DWORD PTR [rax]
  b6:	00 0e                	add    BYTE PTR [rsi],cl
  b8:	01 01                	add    DWORD PTR [rcx],eax
  ba:	49 13 01             	adc    rax,QWORD PTR [r9]
  bd:	13 00                	adc    eax,DWORD PTR [rax]
  bf:	00 0f                	add    BYTE PTR [rdi],cl
  c1:	21 00                	and    DWORD PTR [rax],eax
  c3:	49 13 2f             	adc    rbp,QWORD PTR [r15]
  c6:	0b 00                	or     eax,DWORD PTR [rax]
  c8:	00 10                	add    BYTE PTR [rax],dl
  ca:	2e 01 3f             	cs add DWORD PTR [rdi],edi
  cd:	19 03                	sbb    DWORD PTR [rbx],eax
  cf:	0e                   	(bad)  
  d0:	3a 0b                	cmp    cl,BYTE PTR [rbx]
  d2:	3b 0b                	cmp    ecx,DWORD PTR [rbx]
  d4:	39 0b                	cmp    DWORD PTR [rbx],ecx
  d6:	27                   	(bad)  
  d7:	19 11                	sbb    DWORD PTR [rcx],edx
  d9:	01 12                	add    DWORD PTR [rdx],edx
  db:	07                   	(bad)  
  dc:	40 18 7c 19 01       	sbb    BYTE PTR [rcx+rbx*1+0x1],dil
  e1:	13 00                	adc    eax,DWORD PTR [rax]
  e3:	00 11                	add    BYTE PTR [rcx],dl
  e5:	05 00 03 0e 3a       	add    eax,0x3a0e0300
  ea:	0b 3b                	or     edi,DWORD PTR [rbx]
  ec:	0b 39                	or     edi,DWORD PTR [rcx]
  ee:	0b 49 13             	or     ecx,DWORD PTR [rcx+0x13]
  f1:	02 18                	add    bl,BYTE PTR [rax]
  f3:	00 00                	add    BYTE PTR [rax],al
	...

Disassembly of section .debug_line:

0000000000000000 <.debug_line>:
   0:	8f 00                	pop    QWORD PTR [rax]
   2:	00 00                	add    BYTE PTR [rax],al
   4:	05 00 08 00 41       	add    eax,0x41000800
   9:	00 00                	add    BYTE PTR [rax],al
   b:	00 01                	add    BYTE PTR [rcx],al
   d:	01 01                	add    DWORD PTR [rcx],eax
   f:	fb                   	sti    
  10:	0e                   	(bad)  
  11:	0d 00 01 01 01       	or     eax,0x1010100
  16:	01 00                	add    DWORD PTR [rax],eax
  18:	00 00                	add    BYTE PTR [rax],al
  1a:	01 00                	add    DWORD PTR [rax],eax
  1c:	00 01                	add    BYTE PTR [rcx],al
  1e:	01 01                	add    DWORD PTR [rcx],eax
  20:	1f                   	(bad)  
  21:	03 09                	add    ecx,DWORD PTR [rcx]
  23:	00 00                	add    BYTE PTR [rax],al
  25:	00 1f                	add    BYTE PTR [rdi],bl
  27:	00 00                	add    BYTE PTR [rax],al
  29:	00 42 00             	add    BYTE PTR [rdx+0x0],al
  2c:	00 00                	add    BYTE PTR [rax],al
  2e:	02 01                	add    al,BYTE PTR [rcx]
  30:	1f                   	(bad)  
  31:	02 0f                	add    cl,BYTE PTR [rdi]
  33:	05 00 00 00 00       	add    eax,0x0
  38:	00 00                	add    BYTE PTR [rax],al
  3a:	00 00                	add    BYTE PTR [rax],al
  3c:	00 00                	add    BYTE PTR [rax],al
  3e:	4f 00 00             	rex.WRXB add BYTE PTR [r8],r8b
  41:	00 01                	add    BYTE PTR [rcx],al
  43:	57                   	push   rdi
  44:	00 00                	add    BYTE PTR [rax],al
  46:	00 01                	add    BYTE PTR [rcx],al
  48:	66 00 00             	data16 add BYTE PTR [rax],al
  4b:	00 02                	add    BYTE PTR [rdx],al
  4d:	05 20 00 09 02       	add    eax,0x2090020
  52:	59                   	pop    rcx
  53:	11 00                	adc    DWORD PTR [rax],eax
  55:	00 00                	add    BYTE PTR [rax],al
  57:	00 00                	add    BYTE PTR [rax],al
  59:	00 18                	add    BYTE PTR [rax],bl
  5b:	f2 05 07 e5 05 0c    	repnz add eax,0xc05e507
  61:	f3 bb bb 05 02 bd    	repz mov ebx,0xbd0205bb
  67:	02 29                	add    ch,BYTE PTR [rcx]
  69:	13 02                	adc    eax,DWORD PTR [rdx]
  6b:	29 13                	sub    DWORD PTR [rbx],edx
  6d:	05 28 02 29 13       	add    eax,0x13290228
  72:	05 02 74 05 01       	add    eax,0x1057402
  77:	02 28                	add    ch,BYTE PTR [rax]
  79:	14 05                	adc    al,0x5
  7b:	0c 08                	or     al,0x8
  7d:	68 ba 05 07 e5       	push   0xffffffffe50705ba
  82:	05 02 08 ad 08       	add    eax,0x8ad0802
  87:	9f                   	lahf   
  88:	05 09 e5 05 01       	add    eax,0x105e509
  8d:	59                   	pop    rcx
  8e:	02 16                	add    dl,BYTE PTR [rsi]
  90:	00 01                	add    BYTE PTR [rcx],al
  92:	01                   	.byte 0x1

Disassembly of section .debug_str:

0000000000000000 <.debug_str>:
   0:	73 68                	jae    6a <__abi_tag-0x322>
   2:	6f                   	outs   dx,DWORD PTR ds:[rsi]
   3:	72 74                	jb     79 <__abi_tag-0x313>
   5:	20 75 6e             	and    BYTE PTR [rbp+0x6e],dh
   8:	73 69                	jae    73 <__abi_tag-0x319>
   a:	67 6e                	outs   dx,BYTE PTR ds:[esi]
   c:	65 64 20 69 6e       	gs and BYTE PTR fs:[rcx+0x6e],ch
  11:	74 00                	je     13 <__abi_tag-0x379>
  13:	70 72                	jo     87 <__abi_tag-0x305>
  15:	69 6e 74 66 5f 70 74 	imul   ebp,DWORD PTR [rsi+0x74],0x74705f66
  1c:	72 5f                	jb     7d <__abi_tag-0x30f>
  1e:	74 00                	je     20 <__abi_tag-0x36c>
  20:	47                   	rex.RXB
  21:	4e 55                	rex.WRX push rbp
  23:	20 43 31             	and    BYTE PTR [rbx+0x31],al
  26:	37                   	(bad)  
  27:	20 31                	and    BYTE PTR [rcx],dh
  29:	31 2e                	xor    DWORD PTR [rsi],ebp
  2b:	33 2e                	xor    ebp,DWORD PTR [rsi]
  2d:	30 20                	xor    BYTE PTR [rax],ah
  2f:	2d 6d 74 75 6e       	sub    eax,0x6e75746d
  34:	65 3d 67 65 6e 65    	gs cmp eax,0x656e6567
  3a:	72 69                	jb     a5 <__abi_tag-0x2e7>
  3c:	63 20                	movsxd esp,DWORD PTR [rax]
  3e:	2d 6d 61 72 63       	sub    eax,0x6372616d
  43:	68 3d 78 38 36       	push   0x3638783d
  48:	2d 36 34 20 2d       	sub    eax,0x2d203436
  4d:	67 20 2d 66 61 73 79 	and    BYTE PTR [eip+0x79736166],ch        # 797361ba <_end+0x797321a2>
  54:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  55:	63 68 72             	movsxd ebp,DWORD PTR [rax+0x72]
  58:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  59:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  5a:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  5b:	75 73                	jne    d0 <__abi_tag-0x2bc>
  5d:	2d 75 6e 77 69       	sub    eax,0x69776e75
  62:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  63:	64 2d 74 61 62 6c    	fs sub eax,0x6c626174
  69:	65 73 20             	gs jae 8c <__abi_tag-0x300>
  6c:	2d 66 73 74 61       	sub    eax,0x61747366
  71:	63 6b 2d             	movsxd ebp,DWORD PTR [rbx+0x2d]
  74:	70 72                	jo     e8 <__abi_tag-0x2a4>
  76:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  77:	74 65                	je     de <__abi_tag-0x2ae>
  79:	63 74 6f 72          	movsxd esi,DWORD PTR [rdi+rbp*2+0x72]
  7d:	2d 73 74 72 6f       	sub    eax,0x6f727473
  82:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  83:	67 20 2d 66 73 74 61 	and    BYTE PTR [eip+0x61747366],ch        # 617473f0 <_end+0x617433d8>
  8a:	63 6b 2d             	movsxd ebp,DWORD PTR [rbx+0x2d]
  8d:	63 6c 61 73          	movsxd ebp,DWORD PTR [rcx+riz*2+0x73]
  91:	68 2d 70 72 6f       	push   0x6f72702d
  96:	74 65                	je     fd <__abi_tag-0x28f>
  98:	63 74 69 6f          	movsxd esi,DWORD PTR [rcx+rbp*2+0x6f]
  9c:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  9d:	20 2d 66 63 66 2d    	and    BYTE PTR [rip+0x2d666366],ch        # 2d666409 <_end+0x2d6623f1>
  a3:	70 72                	jo     117 <__abi_tag-0x275>
  a5:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  a6:	74 65                	je     10d <__abi_tag-0x27f>
  a8:	63 74 69 6f          	movsxd esi,DWORD PTR [rcx+rbp*2+0x6f]
  ac:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  ad:	00 63 61             	add    BYTE PTR [rbx+0x61],ah
  b0:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  b1:	61                   	(bad)  
  b2:	72 79                	jb     12d <__abi_tag-0x25f>
  b4:	00 6c 6f 6e          	add    BYTE PTR [rdi+rbp*2+0x6e],ch
  b8:	67 20 75 6e          	and    BYTE PTR [ebp+0x6e],dh
  bc:	73 69                	jae    127 <__abi_tag-0x265>
  be:	67 6e                	outs   dx,BYTE PTR ds:[esi]
  c0:	65 64 20 69 6e       	gs and BYTE PTR fs:[rcx+0x6e],ch
  c5:	74 00                	je     c7 <__abi_tag-0x2c5>
  c7:	75 6e                	jne    137 <__abi_tag-0x255>
  c9:	73 69                	jae    134 <__abi_tag-0x258>
  cb:	67 6e                	outs   dx,BYTE PTR ds:[esi]
  cd:	65 64 20 63 68       	gs and BYTE PTR fs:[rbx+0x68],ah
  d2:	61                   	(bad)  
  d3:	72 00                	jb     d5 <__abi_tag-0x2b7>
  d5:	6d                   	ins    DWORD PTR es:[rdi],dx
  d6:	61                   	(bad)  
  d7:	69 6e 00 72 65 74 75 	imul   ebp,DWORD PTR [rsi+0x0],0x75746572
  de:	72 6e                	jb     14e <__abi_tag-0x23e>
  e0:	41                   	rex.B
  e1:	64 64 72 00          	fs fs jb e5 <__abi_tag-0x2a7>
  e5:	73 6f                	jae    156 <__abi_tag-0x236>
  e7:	6c                   	ins    BYTE PTR es:[rdi],dx
  e8:	76 65                	jbe    14f <__abi_tag-0x23d>
  ea:	72 00                	jb     ec <__abi_tag-0x2a0>
  ec:	6c                   	ins    BYTE PTR es:[rdi],dx
  ed:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  ee:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  ef:	67 20 69 6e          	and    BYTE PTR [ecx+0x6e],ch
  f3:	74 00                	je     f5 <__abi_tag-0x297>
  f5:	5f                   	pop    rdi
  f6:	5f                   	pop    rdi
  f7:	75 69                	jne    162 <__abi_tag-0x22a>
  f9:	6e                   	outs   dx,BYTE PTR ds:[rsi]
  fa:	74 36                	je     132 <__abi_tag-0x25a>
  fc:	34 5f                	xor    al,0x5f
  fe:	74 00                	je     100 <__abi_tag-0x28c>
 100:	66 70 74             	data16 jo 177 <__abi_tag-0x215>
 103:	72 00                	jb     105 <__abi_tag-0x287>
 105:	70 72                	jo     179 <__abi_tag-0x213>
 107:	69 6e 74 66 00 73 68 	imul   ebp,DWORD PTR [rsi+0x74],0x68730066
 10e:	6f                   	outs   dx,DWORD PTR ds:[rsi]
 10f:	72 74                	jb     185 <__abi_tag-0x207>
 111:	20 69 6e             	and    BYTE PTR [rcx+0x6e],ch
 114:	74 00                	je     116 <__abi_tag-0x276>

Disassembly of section .debug_line_str:

0000000000000000 <.debug_line_str>:
   0:	73 6f                	jae    71 <__abi_tag-0x31b>
   2:	6c                   	ins    BYTE PTR es:[rdi],dx
   3:	76 65                	jbe    6a <__abi_tag-0x322>
   5:	72 2e                	jb     35 <__abi_tag-0x357>
   7:	63 00                	movsxd eax,DWORD PTR [rax]
   9:	2f                   	(bad)  
   a:	68 6f 6d 65 2f       	push   0x2f656d6f
   f:	6a 61                	push   0x61
  11:	63 6b 2f             	movsxd ebp,DWORD PTR [rbx+0x2f]
  14:	6c                   	ins    BYTE PTR es:[rdi],dx
  15:	61                   	(bad)  
  16:	62 73 2f 6c 61       	(bad)
  1b:	62                   	(bad)  
  1c:	30 34 00             	xor    BYTE PTR [rax+rax*1],dh
  1f:	2f                   	(bad)  
  20:	75 73                	jne    95 <__abi_tag-0x2f7>
  22:	72 2f                	jb     53 <__abi_tag-0x339>
  24:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [rsi+0x63],0x6564756c
  2b:	2f                   	(bad)  
  2c:	78 38                	js     66 <__abi_tag-0x326>
  2e:	36 5f                	ss pop rdi
  30:	36 34 2d             	ss xor al,0x2d
  33:	6c                   	ins    BYTE PTR es:[rdi],dx
  34:	69 6e 75 78 2d 67 6e 	imul   ebp,DWORD PTR [rsi+0x75],0x6e672d78
  3b:	75 2f                	jne    6c <__abi_tag-0x320>
  3d:	62                   	(bad)  
  3e:	69 74 73 00 2f 75 73 	imul   esi,DWORD PTR [rbx+rsi*2+0x0],0x7273752f
  45:	72 
  46:	2f                   	(bad)  
  47:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [rsi+0x63],0x6564756c
  4e:	00 74 79 70          	add    BYTE PTR [rcx+rdi*2+0x70],dh
  52:	65 73 2e             	gs jae 83 <__abi_tag-0x309>
  55:	68 00 73 74 64       	push   0x64747300
  5a:	69 6e 74 2d 75 69 6e 	imul   ebp,DWORD PTR [rsi+0x74],0x6e69752d
  61:	74 6e                	je     d1 <__abi_tag-0x2bb>
  63:	2e 68 00 73 74 64    	cs push 0x64747300
  69:	69                   	.byte 0x69
  6a:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  6b:	2e                   	cs
  6c:	68                   	.byte 0x68
	...

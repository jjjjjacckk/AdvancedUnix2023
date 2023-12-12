quick_sort:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-40], rdi
        mov     DWORD PTR [rbp-44], esi
        mov     eax, DWORD PTR [rbp-44]
        cdqe
        sal     rax, 3
        lea     rdx, [rax-8]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-16], rax
        mov     DWORD PTR [rbp-4], 0
        mov     DWORD PTR [rbp-8], 0
        jmp     .L2
.L4:
        mov     eax, DWORD PTR [rbp-8]
        cdqe
        lea     rdx, [0+rax*8]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     rax, QWORD PTR [rax]
        cmp     QWORD PTR [rbp-16], rax
        jle     .L3
        mov     eax, DWORD PTR [rbp-8]
        cdqe
        lea     rdx, [0+rax*8]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-32], rax
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        lea     rdx, [0+rax*8]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     edx, DWORD PTR [rbp-8]
        movsx   rdx, edx
        lea     rcx, [0+rdx*8]
        mov     rdx, QWORD PTR [rbp-40]
        add     rdx, rcx
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rdx], rax
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        lea     rdx, [0+rax*8]
        mov     rax, QWORD PTR [rbp-40]
        add     rdx, rax
        mov     rax, QWORD PTR [rbp-32]
        mov     QWORD PTR [rdx], rax
        add     DWORD PTR [rbp-4], 1
.L3:
        add     DWORD PTR [rbp-8], 1
.L2:
        mov     eax, DWORD PTR [rbp-44]
        sub     eax, 1
        cmp     DWORD PTR [rbp-8], eax
        jl      .L4
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        lea     rdx, [0+rax*8]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-24], rax
        mov     eax, DWORD PTR [rbp-44]
        cdqe
        sal     rax, 3
        lea     rdx, [rax-8]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     edx, DWORD PTR [rbp-4]
        movsx   rdx, edx
        lea     rcx, [0+rdx*8]
        mov     rdx, QWORD PTR [rbp-40]
        add     rdx, rcx
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rdx], rax
        mov     eax, DWORD PTR [rbp-44]
        cdqe
        sal     rax, 3
        lea     rdx, [rax-8]
        mov     rax, QWORD PTR [rbp-40]
        add     rdx, rax
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rdx], rax
        cmp     DWORD PTR [rbp-4], 1
        jle     .L5
        mov     edx, DWORD PTR [rbp-4]
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, edx
        mov     rdi, rax
        call    quick_sort
.L5:
        mov     eax, DWORD PTR [rbp-44]
        sub     eax, DWORD PTR [rbp-4]
        cmp     eax, 2
        jle     .L6
        mov     eax, DWORD PTR [rbp-44]
        sub     eax, DWORD PTR [rbp-4]
        lea     edx, [rax-1]
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        add     rax, 1
        lea     rcx, [0+rax*8]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rcx
        mov     esi, edx
        mov     rdi, rax
        call    quick_sort
.L6:
        nop
        leave
        ret
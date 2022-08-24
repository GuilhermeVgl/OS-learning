;;kernel.asm
bits 32		
section .text

        align 4         
        dd 0x1BADB002             ;define palavra duplicada. geralmente 4bytes ou 32bits em um x86
        dd 0x00                   ;flag  
        dd - (0x1BADB002 + 0x00)  ;verificação de soma. m+f+c há de ser zero

global start
extern kmain    ;kmain definido no arquivo C

start:
        cli         ;limpar flag interrompida
        call kmain  ;chama um procedural
        hlt         ;parar o processador
; post2d.asm - Mini editor: INT 16h + B800h

ORG 100h

section .data

fila equ 12
col_ini equ 0
atributo equ 0Fh

section .text

start:

    ; Segmento de video
    mov ax, 0B800h
    mov es, ax

    ; columna actual
    mov dl, col_ini

.leer:

    ; Leer tecla
    mov ah, 00h
    int 16h

    ; ENTER?
    cmp al, 0Dh
    je .fin

    ; Ignorar teclas extendidas
    or al, al
    jz .leer

    ; Guardar caracter
    mov bl, al

    ; offset = (fila*80 + col)*2

    movzx bx, dl

    mov ax, fila
    imul ax, 80

    add ax, bx

    shl ax, 1

    mov di, ax

    ; Recuperar caracter
    mov al, bl

    ; Escribir caracter
    mov byte [es:di], al
    mov byte [es:di+1], atributo

    ; siguiente columna
    inc dl

    ; evitar salir del borde
    cmp dl, 80
    jl .leer

    mov dl, col_ini
    jmp .leer

.fin:

    mov ah, 4Ch
    xor al, al
    int 21h
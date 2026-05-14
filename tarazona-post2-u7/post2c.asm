; post2c.asm - Limpiar pantalla con REP STOSW en B800h

ORG 100h

section .text

start:

    ; Segmento de video
    mov ax, 0B800h
    mov es, ax

    ; AX = atributo + espacio
    ; AH = atributo
    ; AL = caracter

    mov ax, 1720h

    ; Inicio de pantalla
    xor di, di

    ; 80x25 = 2000 caracteres
    mov cx, 2000

    ; Avanzar hacia adelante
    cld

    ; Llenar pantalla
    rep stosw

    ; fila=12 col=30
    ; offset = (12*80+30)*2 = 1980

    mov di, 1980

    mov si, titulo

.bucle:

    lodsb

    or al, al
    jz .fin

    mov ah, 0Fh

    stosw

    jmp .bucle

.fin:

    mov ah, 07h
    int 21h

    mov ah, 4Ch
    xor al, al
    int 21h

titulo db "HOLA DESDE B800h",0
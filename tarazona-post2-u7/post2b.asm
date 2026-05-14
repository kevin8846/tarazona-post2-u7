; post2b.asm - Escritura directa en B800h

ORG 100h

section .text

start:

    ; Apuntar ES al segmento de video
    mov ax, 0B800h
    mov es, ax

    ; fila=10, col=35
    mov di, 1670

    mov byte [es:di], 48h
    mov byte [es:di+1], 0Fh

    ; fila=11, col=35
    mov di, 1830

    mov byte [es:di], 4Fh
    mov byte [es:di+1], 0Eh

    ; fila=12, col=35
    mov di, 1990

    mov byte [es:di], 4Ch
    mov byte [es:di+1], 0Ah

    ; fila=13, col=35
    mov di, 2150

    mov byte [es:di], 41h
    mov byte [es:di+1], 0Ch

    ; Esperar tecla
    mov ah, 07h
    int 21h

    ; Salir
    mov ah, 4Ch
    xor al, al
    int 21h
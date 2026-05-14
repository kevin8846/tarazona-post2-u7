# PostContenido 2 - Unidad 7


Laboratorio desarrollado en ensamblador x86 usando NASM y DOSBox.

## Contenido

- Lectura de teclado con INT 16h
- Manejo de scan codes
- Escritura directa en memoria de video B800h
- Uso de atributos de color
- Limpieza de pantalla con REP STOSW
- Mini editor de texto

## Archivos

- post2a.asm
- post2b.asm
- post2c.asm
- post2d.asm

## Ejecución

Compilar:

```bash
nasm -f bin archivo.asm -o archivo.com
```

Ejecutar:

```bash
archivo.com
```

## Resultados

Los programas permiten:
- Capturar teclas y scan codes
- Escribir directamente en memoria de video
- Manipular colores en pantalla
- Limpiar la pantalla usando REP STOSW
- Crear un mini editor básico

## Herramientas utilizadas

- DOSBox
- NASM
- Ensamblador x86 16 bits
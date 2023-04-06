	PROCESSOR 18f45k50
        #include "cabecera.inc"
        PSECT principal, class=CODE, reloc=2,abs


principal:
    ORG 0000H
    goto configuro
    ORG 0020H

configuro:
      clrf TRISB
      clrf TRISD
loop:
        ;programa de usuario
        movlw 0A5H
        movwf LATB
        movlw 5AH
        movwf LATD
        end principal


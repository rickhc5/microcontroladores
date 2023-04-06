    PROCESSOR 18F45K50
    #include "cabecera.inc"
    banksel TRISB
    bcf TRISB, 4     ; RB4 is output

   
    C equ 262
    D equ 294
    E equ 330
    F equ 349
    G equ 392
    A equ 440
    B equ 494
    H equ 0   ; rest note
    Tempo equ 100   ; adjust to change playback speed

Notes:
    dw C, Tempo/4
    dw E, Tempo/4
    dw G, Tempo/4
    dw H, Tempo/4
    dw A, Tempo/4
    dw H, Tempo/4
    dw G, Tempo/2
    dw E, Tempo/2
    dw C, Tempo/4
    dw E, Tempo/4
    dw G, Tempo/4
    dw H, Tempo/4
    dw A, Tempo/4
    dw H, Tempo/4
    dw G, Tempo/2
    dw E, Tempo/2
Main:
    banksel PORTB    ; select port B
    movlw 0x10       ; set bit 4 high (buzzer on)
    movwf PORTB      ; output to port B
    call Delay       ; delay for note duration
    banksel PORTB    ; select port B
    movlw 0x00       ; set bit 4 low (buzzer off)
    movwf PORTB      ; output to port B
    call Delay       ; delay for pause between notes
    incf FSR         ; point to next note in lookup table
    goto Main        ; repeat loop
Delay:
    movlw 0x0F       ; delay loop count (adjust for desired delay)
Delay_Loop:
    decfsz WREG, 1   ; decrement delay counter
    goto Delay_Loop  ; loop until counter reaches zero
    return
    end Main




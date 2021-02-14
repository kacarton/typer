; ------------------------------------------------------
;|                 Ó¢ÎÄ´ò×ÖÁ·Ï°Èí¼þ2.0                  |
;|³ÌÐòÉè¼Æ£ºÅí¹ú»Ô 1999-2003                            |
;|https://github.com/kacarton                           |
;|Emial:kacarton@msn.com                                |
;|                                                      |
;|TODO:½Ó¹Üint 24h£¬ÐÞ¸Ä´íÎóÌáÊ¾·½Ê½                    |
;|     ÊµÏÖÆäËü¸÷Ä£¿é¹¦ÄÜ                               |
; ------------------------------------------------------

.286
STACK SEGMENT
    DW 1024 DUP(0)
    top_of_stack LABEL WORD
STACK ENDS

DATA SEGMENT
    main_window_title_color  EQU 01001111b
    main_window_title_char   EQU 20h
    main_window_color        EQU 00001111b
    main_window_bg_char      EQU 177d
    main_window_bottom_color EQU 11100101b  ;01110111b  ;11100111b
    main_window_bottom_char  EQU 20h
    ;Menu_COLOR EQU 00101000b
    ;Menu_BORDER_COLOR EQU 00100110b
    ;Menu_SHADOW_COLOR EQU 7
    ;Menu_HIGHLIGHT_COLOR EQU 10000111b
    ;Menu_COLOR EQU 00111001b
    ;Menu_BORDER_COLOR EQU 00110111b
    ;Menu_SHADOW_COLOR EQU 7
    ;Menu_HIGHLIGHT_COLOR EQU 00000111b
    menu_color EQU 11100101b
    menu_border_color EQU 11101101b
    menu_shadow_color EQU 7
    menu_highlight_color EQU 01101111b

    promptbox_color EQU 11100101b
    promptbox_border_color EQU 11101101b

    msgbox_color EQU 01110001b
    msgbox_title_color EQU 11101000b
    msgbox_warrning_color EQU 01001111b
    msgbox_button_hotkey_color EQU 00000100b
    msgbox_button_selected_color EQU 11110000b
    msgbox_button_unselected_color EQU 01110000b
    msgbox_button_shadow_color EQU 00000000b

    msgboxbuttonswidth DB 5+2, 11+8, 11+5, 11+11, 17+17, 0
    msgboxbuttonstable DW 0, msgboxbuttonokdata, 1, msgboxbuttonokcanceldata,   ;°´Å¥Êý£¬Êý¾ÝµØÖ·
                          1, msgboxbuttonyesnodata, 1, msgboxbuttonretrycanceldata,
                          2, msgboxbuttonretryignorecanceldata
    msgboxbuttonokdata       DW 0100h
    msgboxbuttonokcanceldata DW 0100h, 0001h, 0000h, 0101h  ;OKÑ¡ÖÐ£¬CancelÎ´Ñ¡ÖÐ£¬OKÎ´Ñ¡ÖÐ£¬CancelÑ¡ÖÐ
    msgboxbuttonyesnodata    DW 0102h, 0003h, 0002h, 0103h
    msgboxbuttonretrycanceldata DW 0104h, 0001h, 0004h, 0101h
    msgboxbuttonretryignorecanceldata DW 0104h, 0005h, 0001h, 0004h, 0105h, 0001h, 0004h, 0005h, 0101h
    msgboxbuttonselected DB 0, 0, 0, 0, 1, 0, 2, 3, 2, 4, 1, 4, 4, 5, 1
    msgboxbuttonshotkey DB 'OC', 0FFh, 'YN', 0FFh, 'RC', 0FFh, 'RIC'

    msgboxbtntexts DW msgboxbtntextok, msgboxbtntextcancel,
                      msgboxbtntextyes, msgboxbtntextno,
                      msgboxbtntextretry, msgboxbtntextignore, 0
    msgboxbtntextok DB '  &OK  ',0
    msgboxbtntextcancel DB '  &Cancel  ', 0
    msgboxbtntextyes DB '  &Yes  ', 0
    msgboxbtntextno DB '  &No  ', 0
    msgboxbtntextretry DB '  &Retry  ', 0
    msgboxbtntextignore DB '  &Ignore  ', 0

    msgfeaturecomingtitle DB 'Feature Coming', 0
    msgfeaturecomingtext DB 'This feature will be realize soon.', 0Dh, 'Please visit my website for the latest updates.', 0

    mainwintitle DB 'TYPER 2.0', 0
    copyrights DB 'Copyright (C) Conch 1999-2003. All rights reserved. https://github.com/kacarton', 0
    aboutmsgtitle DB 'About TYPER 2.0', 0
    aboutmsgtext DB 'Thank you for using TYPER 2.0!', 0Dh, ' ', 0Dh,
                    'Designed and developed by Conch 1999-2003.', 0Dh,
                    'All rights reserved.', 0Dh, ' ', 0Dh,
                    'Email:kacarton@msn.com', 0Dh,
                    'https://github.com/kacarton', 0
    endingtitle       DB '²²²²²²²²²±±±±±±±±°°°°°   Thank you for using TYPER 2.0!   °°°°°±±±±±±±±²²²²²²²²²', 0
    endinginformation DB 'The TYPER 2.0 was designed and developed by Conch. All rights reserved.', 0Dh
                      DB 'Please visit https://github.com/kacarton for the latest updates and information.', 0Dh
                      DB 'To report bugs, please visit my online message board or email kacarton@sohu.com', 0Dh, 0Dh
                      DB 'Limitations on Reverse Engineering, Decompilation, and Disassembly. You may not reverse engineer, decompile, '
                      DB 'or disassemble the SOFTWARE PRODUCT, except and only to the extent that such activity is expressly permitted by applicable law notwithstanding this limitation.', 0
    mainmenu DW FEATURECOMING, menufreetyping,
                FEATURECOMING, menuexcercises,
                SHOWTESTMENU,  menutest,
                FEATURECOMING, menugame,
                FEATURECOMING, menuoptions,
                SHOWABOUT,     menuabout,
                0FFFFh,        menuexit,
                0, 0
    menufreetyping DB 'Free typing', 0
    menuexcercises DB 'Excercises', 0
    menutest       DB 'Test', 0
    menugame       DB 'Game', 0
    menuoptions    DB 'Options', 0
    menuabout      DB 'About', 0
    menuexit       DB 'Exit', 0

    testingmenu DW SHOWTESTTIMEMENU, menutesttime,
                   SHOWTESTKEYSETMENU, menutestkeysetp,
                   TESTING, menuteststart,
                   0, 0
    menutesttime  DB 'Test time: '
    mnutesttimedigit DB ' 3 Min', 0
    menutestkeysetp DB 'Key set: Practice', 0
    menutestkeyseta DB 'Key set: All keys', 0
    menutestkeysetk DB 'Key set:   Keypad', 0
    menuteststart DB '  ¯¯¯ Start ®®® ', 0

    testtimemenu DW SETTESTTIME, menutesttime1,
                    SETTESTTIME, menutesttime2,
                    SETTESTTIME, menutesttime3,
                    SETTESTTIME, menutesttime4,
                    SETTESTTIME, menutesttime5,
                    SETTESTTIME, menutesttime6,
                    0, 0
    menutesttime1 DB ' 1 Min', 0
    menutesttime2 DB ' 2 Min', 0
    menutesttime3 DB ' 3 Min', 0
    menutesttime4 DB ' 5 Min', 0
    menutesttime5 DB ' 8 Min', 0
    menutesttime6 DB '10 Min', 0

    testtimetable  DB 1, 2, 3, 5, 8, 10d, 0
    testtime DB 3
    testtickremain DD 0
    testtickcount DW 0
    testremaintime DB '  0:00', 0
    testkeyset DB 0
    intestingflag DB 0
    typetotal DW 0
    typewrong DW 0
    wrongmodify DW 0
    typerate DW 0
    totalstring DB 5 DUP(' '), 0
    wrongstring DB 5 DUP(' '), 0
    ratestring  DB 5 DUP(' '), 0
    ratiostring DB 5 DUP(' '), 0

    testkeysetmenu DW SETTESTKEYSET, menutestkeyset1,
                      SETTESTKEYSET, menutestkeyset2,
                      SETTESTKEYSET, menutestkeyset3,
                      0, 0
    menutestkeyset1 DB 'Practice', 0
    menutestkeyset2 DB 'All keys', 0
    menutestkeyset3 DB 'Keypad', 0

    testdatafiles DW testfilep, testfilea, testfilek, 0
    testfilep DB 'tstpract.dat', 0
    testfilea DB 'tstalkey.dat', 0
    testfilek DB 'tstkeypd.dat', 0

    test_window_color EQU 7
    test_window_title_color EQU 70h
    test_window_prompt_color EQU 10000101b
    test_window_alert_color EQU 00000100b
    testwintitle DB 'TYPER 2.0 - Test', 0

    testwinframe DB 1, 0, 0, 1, 'É',
                    1, 1, 0, 78d, 'Í',
                    1, 79, 1, 1, '»',
                    2, 0, 1, 22d, 'º',
                    24d, 0, 0, 1, 'È',
                    24d, 1, 0, 78d, 'Í',
                    24d, 79d, 0, 1, '¼',
                    2, 79d, 1, 22d, 'º'
                 DB 7, 0, 0, 1, 'Ì',
                    7, 1, 0, 78d, 'Í',
                    7, 79d, 0, 1, '¹',
                    1, 31d, 0, 1, 'Ñ',
                    2, 31d, 1, 5, '³',
                    7, 31d, 0, 1, 'Ï',
                    1, 54d, 0, 1, 'Ñ',
                    2, 54d, 1, 5, '³',
                    7, 54d, 0, 1, 'Ï'
                 DB 3, 31d, 0, 1, 'Ã',
                    3, 32d, 0, 47d, 'Ä',
                    3, 79d, 0, 1, '¶',
                    5, 31d, 0, 1, 'Ã',
                    5, 32d, 0, 47d, 'Ä',
                    5, 79d, 0, 1, '¶'
                 DB 3, 54d, 0, 1, 'Å',
                    5, 54d, 0, 1, 'Å',
                    0FFh

    keyboard DB ' a s d f g h j k l ;', 0dh,
                'ÚÄÂÄÂÄÂÄÂÄÂÄÂÄÂÄÂÄÂÄ¿', 0dh,
                'ÀÂÁÂÁÂÁÂÁÂÁÂÁÂÁÂÁÂÁÂÁ¿', 0dh,
                ' ÀÂÁÂÁÂÁÂÁÂÁÂÁÂÁÂÁÂÁÂÁ¿', 0dh,
                '  ÀÄÁÄÁÄÁÄÁÄÁÄÁÄÁÄÁÄÁÄÙ', 0
    logo DB '  ÜÜÜÜ  ÜÜÜÜÜÜÜÜÜÜ ', 0dh,
            '   ÞÝÞÜÜÝÛÜÛÞÜ ÞÜÜÝ', 0dh,
            '   ÞÝ ÞÝ Û  ÞÜÜÞ ßÜ', 0dh,
            0Dh,
            ' Design & Programming', 0dh,
            '    by PengGuohui.', 0dh,
            '      1999-2-25.', 0
    testwinmarkinfo DB 'Total:    0 char     ³ Key set:         ', 0dh, 0dh
                    DB 'Worng:    0 char     ³ Remain time:      ', 0dh, 0dh
                    DB 'Rate :    0 char/min ³ Correct ratio:       %', 0

    menuframedata DB ?, ?, 0, 1, 'É',
                     ?, ?, 0, ?, 'Í',
                     ?, ?, 1, 1, '»',
                     ?, ?, 1, ?, 'º',
                     ?, ?, 0, 1, 'È',
                     ?, ?, 0, ?, 'Í',
                     ?, ?, 0, 1, '¼',
                     ?, ?, 1, ?, 'º', 0FFh

    promptboxframedata DB 11, ?, 0, 1, 'É',
                          11, ?, 0, ?, 'Í',
                          11, ?, 1, 1, '»',
                          12, ?, 1, 1, 'º',
                          13, ?, 0, 1, 'È',
                          13, ?, 0, ?, 'Í',
                          13, ?, 0, 1, '¼',
                          12, ?, 1, 1, 'º', 0FFh

    file_min_length EQU 1024d
    buffer_size EQU 2048d
    min_text_length EQU 1000d

    filehandle DW 0
    buffer DB buffer_size DUP(0)

    loading DB 'Loading....', 0
    loaddatatitle DB 'Loading data', 0
    msgpresskey DB 'Press SPACE BAR to start', 0
    fileopenerror DB 'Could open data file!', 0Dh, 'Do you want to try again?', 0
    filenotexist DB 'Data file not fould.', 0ah, '$'
    filesmall DB 'Data file less than 1KB.', 0ah, '$'
    filereaderror DB 'Could not read data file!', 0
    fileillegal DB 'Data file is include too much illegal characters,', 0Dh, 'Test can not continue!', 0
    msgtestquit DB 'Are you sure want to abort this test?', 0
    msgtestquittitle DB 'Abort test', 0
    msgtestend DB 'Do you want to try again?', 0
    msgtestendtitle DB 'Test finish', 0
    quitmsg DB 'Are you sure want to exit?', 0
    quitmsgboxtitle DB 'Exit', 0

    oldint24 DD 0

    exitcode DB 0

DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA, ES:DATA, SS:STACK

    ;»æÖÆ×Ö·û´®£¨Ê¹ÓÃÔ­Î»ÖÃÑÕÉ«£©
    ;     al£º0£º×ó¶ÔÆë£»1£º¾ÓÖÐ¶ÔÆë£»2£ºÓÒ¶ÔÆë
    ;[ds:bx]£º×Ö·û´®µØÖ·£¬×Ö·û´®ÒÔ0½áÊø
    ;     dh£º¶¥µãX×ø±ê
    ;     dl£ºÏîµãY×ø±ê
    DRAWTEXT PROC NEAR
        PUSH ES
        PUSH DS
        PUSHA
        MOV SI, BX
        CMP AL, 0
        JE DT_ALIGN_LEFT
        MOV DI, BX
        PUSH DS
        POP ES
        PUSH AX
        MOV AL, 0
        MOV CX, 0FFFFh
        REPNE SCASB
        INC CX
        INC CX
        SUB CX, 0FFFFh
        POP AX
        CMP AL, 1
        JNE DT_ALIGN_RIGHT
    DT_ALIGN_CENTER:
        SAR CX, 1
    DT_ALIGN_RIGHT:
        ADD DL, CL
    DT_ALIGN_LEFT:
        MOV AX, 0B800h
        MOV ES, AX
        XOR AX, AX
        MOV AL, DH
        MOV BX, 160d
        MUL BL
        MOV DH, 0
        SHL DL, 1
        ADD AX, DX
        MOV DI, AX
        CLD
    LOOP_DT:
        LODSB
        CMP AL, 0
        JE DT_END
        STOSB
        INC DI
        JMP LOOP_DT
    DT_END:
        POPA
        POP DS
        POP ES
        RET
    DRAWTEXT ENDP

    DRAW_TEXT MACRO x, y, string, ALIGN
        MOV AX, ALIGN
        MOV BX, OFFSET string
        MOV DX, ((x SHL 8) OR y)
        CALL DRAWTEXT
    ENDM

    DRAWMAINWINDOW PROC NEAR
        PUSH ES
        PUSH DS
        PUSHA
        MOV AX, 0B800h
        MOV ES, AX
        MOV AX, 0
        MOV DI, AX
        MOV AH, main_window_title_color
        MOV AL, main_window_title_char
        MOV CX, 80d
        REP STOSW
        MOV AH, main_window_color
        MOV AL, main_window_bg_char
        MOV CX, 23*80
        REP STOSW
        MOV AH, main_window_bottom_color
        MOV AL, main_window_bottom_char
        MOV CX, 80d
        REP STOSW
        MOV AX, 0
        STOSW           ;±ØÐëÔÚ25*80*2µÄÎ»ÖÃÌîÈë0£¬·ñÔòSaveScreen¡¢RestorLastScrrnº¯Êý¹¤×÷²»Õý³£
        DRAW_TEXT 0, 39, mainwintitle, 1
        DRAW_TEXT 24, 0, copyrights, 0
        POPA
        POP DS
        POP ES
        RET
    DRAWMAINWINDOW ENDP

    ;»æÖÆ¿ò¼Ü
    ;Èë¿Ú²ÎÊý£º
    ;     ah£º×Ö·ûÑÕÉ«
    ;   [bx]£º»æÍ¼Êý¾ÝµØÖ·
    ;Êý¾Ý¸ñÊ½£ºX,Y,·½Ïò(0ºáÏò¡¢1×ÝÏò),¼ÆÊý,×Ö·û£¬µ±X=0FFH±íÊ¾½áÊø
    DRAWFRAME PROC NEAR
        PUSH ES
        PUSH DS
        PUSHA
        PUSH AX
        MOV AX, 0B800h
        MOV ES, AX
    LOOP_DF1:
        XOR AX,AX
        MOV AL, [BX]
        CMP AL, 0FFh
        JE DF_END
        MOV DL, 160d
        MUL DL
        PUSH AX
        MOV AL, [BX+1]
        SHL AL, 1
        MOV AH, 0
        POP DX
        ADD AX, DX
        MOV DI, AX
        MOV AL, [BX+2]
        CMP AL, 0
        JNE DRAW_2
        XOR CX, CX
        MOV CL, [BX+3]
        POP AX
        PUSH AX
        MOV AL, [BX+4]
        CMP CX, 1
        JNE MULTI_CHAR1
        STOSW
        ADD BX, 5
        JMP LOOP_DF1
    MULTI_CHAR1:
        REP STOSW
        ADD BX, 5
        JMP LOOP_DF1
    DRAW_2:
        XOR CX, CX
        MOV CL, [BX+3]
        POP AX
        PUSH AX
        MOV AL, [BX+4]
        CMP CX, 1
        JNE MULTI_CHAR2
        STOSW
        ADD BX, 5
        JMP LOOP_DF1
    MULTI_CHAR2:
        STOSW
        ADD DI, 158d
        DEC CX
        CMP CX, 0
        JNE MULTI_CHAR2
        ADD BX, 5
        JMP LOOP_DF1
    DF_END:
        POP AX
        POPA
        POP DS
        POP ES
        RET
    DRAWFRAME ENDP

    DRAW_FRAME MACRO color, strings
        MOV AH, color
        MOV BX, OFFSET strings
        CALL DRAWFRAME
    ENDM

    ;»æÖÆ¶àÐÐÎÄ±¾
    ;Èë¿Ú²ÎÊý£º
    ;     ah£º×Ö·ûÑÕÉ«
    ;[ds:bx]£º×Ö·û´®µØÖ·
    ;     dh£º¶¥µãX×ø±ê
    ;     dl£ºÏîµãY×ø±ê
    ;×Ö·û´®¸ñÊ½£º0dh±íÊ¾»»ÐÐ£¬×Ö·û´®ÒÔ0½áÊø
    DRAWMULTILINETEXT PROC NEAR
        PUSH ES
        PUSH DS
        PUSHA
        PUSH AX
        MOV SI, BX
        MOV AX, 0B800h
        MOV ES, AX
        XOR AX, AX
        MOV BX, AX
        MOV AL, DH
        MOV BX, 160d
        MUL BL
        MOV BL, DL
        SHL BL, 1
        ADD AX, BX
        POP BX
        PUSH AX
        MOV DI, AX
        CLD
    LOOP_DMLT1:
        LODSB
        CMP AL, 0
        JE DMLT_END
        CMP AL, 0Dh
        JE DMLT_NEXT_LINE
        MOV AH, BH
        STOSW
        JMP LOOP_DMLT1
    DMLT_NEXT_LINE:
        POP AX
        ADD AX, 160d
        MOV DI, AX
        PUSH AX
        JMP LOOP_DMLT1
    DMLT_END:
        POP AX
        POPA
        POP DS
        POP ES
        RET
    DRAWMULTILINETEXT ENDP

    DRAW_MULTI_LINE_TEXT MACRO color, strings, x, y
        MOV AH, color
        MOV BX, OFFSET strings
        MOV DX, ((x SHL 8) OR y)
        CALL DRAWMULTILINETEXT
    ENDM

    ;»æÖÆÏûÏ¢ÎÄ±¾£¨¶àÐÐ£©
    ;Èë¿Ú²ÎÊý£º
    ;[ds:bx]£º×Ö·û´®µØÖ·
    ;     cl£ºµ¥ÐÐ×î´ó×Ö·ûÊý
    ;     dx£ºXY×ø±ê
    ;×Ö·û´®¸ñÊ½£º0dh±íÊ¾»»ÐÐ£¬×Ö·û´®ÒÔ0½áÊø
    DRAWTEXTINMSGBOX PROC NEAR
        PUSH ES
        PUSH DS
        PUSHA
        MOV SI, BX
        MOV AX, 0B800h
        MOV ES, AX
        XOR AX, AX
        MOV BX, AX
        MOV AL, DH
        MOV BX, 160d
        MUL BL
        MOV BL, DL
        SHL BL, 1
        ADD AX, BX
        MOV DI, AX
        PUSH DI
        CLD
        MOV CH, 0
        PUSH CX
    DTIMB_DRAW_TEXT:
        LODSB
        OR AL, AL
        JZ DTIMB_END
        CMP AL, 0Dh
        JE DTIMB_NEXT_LINE
        STOSB
        INC DI
        LOOP DTIMB_DRAW_TEXT
    DTIMB_NEXT_LINE:
        POP CX
        POP DI
        ADD DI, 160d
        PUSH DI
        PUSH CX
        CMP [SI], BYTE PTR 0Dh
        JE DTIMB_TRIM
        CMP [SI], BYTE PTR ' '
        JNE DTIMB_DRAW_TEXT
    DTIMB_TRIM:
        INC SI
        JMP DTIMB_DRAW_TEXT
    DTIMB_END:
        POP DI
        POP CX
        POPA
        POP DS
        POP ES
        RET
    DRAWTEXTINMSGBOX ENDP

    DRAW_TEXT_IN_MSGBOX MACRO x, y, text, maxcharperline
        MOV BX, OFFSET text
        MOV CH, 0
        MOV CL, maxcharperline
        MOV DX, ((x SHL 8) OR y)
        CALL DRAWTEXTINMSGBOX
    ENDM

    ;È·¶¨MsgBoxµÄ¿íºÍ¸ß
    ;Èë¿Ú²ÎÊý£º
    ; [ds:bx]£º×Ö·û´®µØÖ·
    ;      dl£º°´Å¥ÀàÐÍ£º0£ºOK£»1£ºOKCancel£»2£ºYESNO£»3£ºRetryCancel£»4£ºRetryIgnoreCancel
    ;×Ö·û´®¸ñÊ½£º0dh±íÊ¾»»ÐÐ£¬×Ö·û´®ÒÔ0½áÊø
    ;·µ»ØÊý¾Ý:
    ;      ax£ººáÏò×Ö·û¿í¶È     ;80*25Ä£Ê½ah¹Ì¶¨Îª0
    ;      cx£º×ÝÏò¸ß¶È£¨ÐÐÊý£© ;80*25Ä£Ê½ch¹Ì¶¨Îª0
    DETECTMSGBOXWIDTHANDHEIGHT PROC NEAR
        PUSH ES
        PUSH DS
        PUSH BX
        PUSH DX
        MOV AX, 0
        MOV CX, 0
        MOV DX, 5
    DMBWAH_CMP1:
        CMP [BX], BYTE PTR 0
        JE DMBWAH_STR_END
        CMP [BX], BYTE PTR 0Dh
        JNE DMBWAH_CMP2
        INC DX
        INC BX
        CMP AX, CX
        JGE DMBWAH_CMP1
        MOV AX, CX
        MOV CX, 0
        JMP DMBWAH_CMP1
    DMBWAH_CMP2:
        INC CX
        CMP [BX], BYTE PTR ' '
        JNE DMBWAH_CMP4
        CMP CX, 80*2/3
        JB DMBWAH_CMP3
        INC DX
        DEC CX
        CMP AX, CX
        JGE DMBWAH_CMP3
        MOV AX, CX
        MOV CX, 0
    DMBWAH_CMP3:
        INC BX
        JMP DMBWAH_CMP1
    DMBWAH_CMP4:
        CMP CX, 80*3/4
        JNG DMBWAH_CMP3
        INC DX
        CMP AX, CX
        JGE DMBWAH_CMP5
        MOV AX, CX
    DMBWAH_CMP5:
        MOV CX, 0
        INC BX
        JMP DMBWAH_CMP1

    DMBWAH_STR_END:
        CMP AX, CX
        JGE DMBWAH_REVISE
        MOV AX, CX
    DMBWAH_REVISE:
        ADD AX, 2
        MOV CX, DX
        MOV DX, AX
        POP AX
        PUSH DX
        ;al£º°´Å¥ÀàÐÍ£º0£ºOK£»1£ºOKCancel£»2£ºYESNO£»3£ºRetryCancel£»4£ºRetryIgnoreCancel
        MOV BX, OFFSET msgboxbuttonswidth
        MOV AH, 0
        XLAT
        ADD AL, 2
        CMP AX, DX
        JBE DMBWAH_END
        MOV DX, AX
    DMBWAH_END:
        MOV AX, DX
        POP DX
        POP BX
        POP DS
        POP ES
        RET
    DETECTMSGBOXWIDTHANDHEIGHT ENDP

    DETECT_MSGBOX_WIDTHANDHEIGHT MACRO msg, buttontype
        MOV BX, OFFSET msg
        MOV DL, buttontype
        CALL DETECTMSGBOXWIDTHANDHEIGHT
    ENDM

    ;»æÖÆµ¥¸ö°´Å¥
    ;Èë¿Ú²ÎÊý£º
    ;      ah£ºÊÇ·ñÑ¡ÖÐ
    ;      al£º°´Å¥ÀàÐÍ£º0£ºOK£»1£ºCancel£»2£ºYES£»3£ºNO£»4£ºRetry£»5£ºIgnore
    ;      dx£ºXY×ø±ê
    ;Íê³Éºó£¬dlÖµ±ä´ó£¨¸ù¾Ý°´Å¥ÀàÐÍ²»Í¬£©
    DRAWBUTTON PROC NEAR
        PUSH ES
        PUSH DS
        PUSHA
        PUSH AX
        MOV AX, 0B800h
        MOV ES, AX
        MOV AX, SEG msgboxbtntexts
        MOV DS, AX
        XOR AX, AX
        MOV AL, DH
        MOV CX, 160d
        MUL CL
        PUSH DX
        MOV DH, 0
        SHL DL, 1
        ADD AX, DX
        MOV DI, AX
        POP DX
        MOV SI, OFFSET msgboxbtntexts
        POP AX
        PUSH DI
        MOV CL, AL
        SHL CL, 1
        ADD SI, CX
        MOV SI, [SI]
        MOV CH, AH
        MOV CL, 0
        CLD
    DB_DRAW_BTN:
        CMP CH, 0
        JE DB_BTN_UNSELECTED
        MOV AH, msgbox_button_selected_color
        JMP DB_GET_TEXT
    DB_BTN_UNSELECTED:
        MOV AH, msgbox_button_unselected_color
    DB_GET_TEXT:
        LODSB
        CMP AL, 0
        JE DB_DRAW_SHADOW
        CMP AL, '&'
        JNE DB_TEXT_OUT
        AND AH, 0F0h
        OR AH, msgbox_button_hotkey_color
        LODSB
        STOSW
        INC DL
        INC CL
        JMP DB_DRAW_BTN

    DB_TEXT_OUT:
        STOSW
        INC DL
        INC CL
        JMP DB_DRAW_BTN
    DB_DRAW_SHADOW:
        MOV AH, ES:[DI+1]
        AND AH, 0F0h
        OR AH, msgbox_button_shadow_color
        MOV AL, 'Ü'
        STOSW
        POP DI
        ADD DI, 162d
        MOV AL, 'ß'
        MOV CH, 0
        REP STOSW
        MOV BP, SP
        MOV [BP+10], DL
        POPA
        POP DS
        POP ES
        RET
    DRAWBUTTON ENDP

    ;»æÖÆÏûÏ¢¶Ô»°¿ò°´Å¥
    ;Èë¿Ú²ÎÊý£º
    ;      ah£ºÑ¡ÖÐµÄ°´Å¥
    ;      al£º°´Å¥ÀàÐÍ£º0£ºOK£»1£ºOKCancel£»2£ºYESNO£»3£ºRetryCancel£»4£ºRetryIgnoreCancel
    ;      cx£º¶Ô»°¿ò¿í¶ÈÖµ
    ;      dx£º°´Å¥ËùÔÚÐÐXY×ø±ê
    DRAWMSGBOXBUTTONS PROC NEAR
        PUSH ES
        PUSH DS
        PUSHA
        PUSH AX

        MOV AH, 0
        MOV BX, OFFSET msgboxbuttonswidth
        XLAT
        SUB CX, AX
        SHR CX, 1
        ADD DL, CL          ;dx:µÚÒ»¸ö°´Å¥XY×ø±ê

        POP AX
        PUSH AX
        MOV BX, OFFSET msgboxbuttonstable
        MOV AH, 0
        SHL AX, 2
        ADD BX, AX
        POP AX
        CMP AH, [BX]
        JBE DMBB_GET_BTN_DATA
        MOV AH, [BX]
    DMBB_GET_BTN_DATA:
        MOV CX, [BX]
        INC CX
        MOV BX, [BX+2]
        MOV AL, AH
        MOV AH, 0
        MUL CL
        SHL AX, 1
        ADD BX, AX

    LOOP_DMBB:
        MOV AX, [BX]
        CALL DRAWBUTTON
        ADD BX, 2
        ADD DL, 2
        LOOP LOOP_DMBB

        POPA
        POP DS
        POP ES
        RET
    DRAWMSGBOXBUTTONS ENDP

    ;ÏÔÊ¾ÏûÏ¢¶Ô»°¿ò
    ;Èë¿Ú²ÎÊý£º
    ;      ah£º¶Ô»°¿òÀàÐÍ£º0£ºÆÕÍ¨¶Ô»°¿ò£»1£º¾¯¸æ¶Ô»°¿ò
    ;      al£º°´Å¥ÀàÐÍ£º0£ºOK£»1£ºOKCancel£»2£ºYESNO£»3£ºRetryCancel£»4£ºRetryIgnoreCancel
    ; [ds:bx]£ºÏûÏ¢ÎÄ±¾µØÖ·
    ;×Ö·û´®¸ñÊ½£º0dh±íÊ¾»»ÐÐ£¬×Ö·û´®ÒÔ0½áÊø
    ;      ch£º¶Ô»°¿òµ¯³öÊ±Ä¬ÈÏÑ¡ÖÐµÄ°´Å¥
    ;      cl£ºÓÃ»§°´ESC¼ü´¥·¢µÄ°´Å¥
    ; [ds:dx]£ºTitleÎÄ±¾µØÖ·£¬µ¥ÐÐÒÔ0½áÊø
    ;·µ»ØÊý¾Ý:
    ;      ax£ºÓÃ»§µã»÷µÄ°´Å¥£º0£ºOK£»1£ºCancel£»2£ºYES£»3£ºNO£»4£ºRetry£»5£ºIgnore
    MSGBOX PROC NEAR
        PUSH DS
        PUSH ES
        PUSHA       ;Í¨ÓÃ¼Ä´æÆ÷ÈëÕ»Ë³Ðò£ºAX¡úCX¡úDX¡úBX¡úSP¡úBP¡úSI¡úDI
        MOV BP, SP
        SUB BP, 2   ;[bp+16]:ax, [bp+14]:cx, [bp+12]:dx, [bp+10]:bx
        PUSH 0      ;   [bp]:Width
        PUSH 0      ; [bp-2]:height
        PUSH 0      ; [bp-4]:XY×ø±ê

        MOV DL, AL
        CALL DETECTMSGBOXWIDTHANDHEIGHT
        MOV [BP], AX
        MOV [BP-2], CX
        MOV DX, 80d
        SUB DX, AX
        SHR DX, 1
        MOV BX, 24d
        SUB BX, CX
        SHR BX, 1
        PUSH BX
        MOV AH, BL
        MOV AL, DL
        MOV [BP-4], AX
        POP AX
        INC CX
        INC CX
        CALL SAVESCREEN

    MB_DRAW:
        MOV CX, [BP-4]  ;cx:top,left
        MOV DX, CX      ;dx:bottom,right
        ADD DH, BYTE PTR [BP-2]
        ADD DL, BYTE PTR [BP]
        CMP [BP+17], BYTE PTR 0
        JNE MB_WARRNINGBOX1
        MOV BH, msgbox_color    ;bh:color
        JMP MB_CLEAR_WINDOW
    MB_WARRNINGBOX1:
        MOV BH, msgbox_warrning_color
    MB_CLEAR_WINDOW:
        MOV AX, 0600h
        INT 10h         ;clear window
        PUSH DX
        MOV DH, CH
        MOV BH, msgbox_title_color
        INT 10h
        POP DX
        MOV AH, menu_shadow_color
        CALL DRAWSHADOW

        MOV AX, [BP]
        SHR AX, 1
        ADD CL, AL
        MOV DX, CX
        MOV BX, [BP+12]
        MOV AX, 1
        CALL DRAWTEXT
        MOV BX, [BP+10]
        MOV CX, [BP]
        SUB CX, 2
        MOV DX, [BP-4]
        INC DH
        INC DH
        INC DL
        CALL DRAWTEXTINMSGBOX

        MOV BX, OFFSET msgboxbuttonstable
        MOV AH, 0
        MOV AL, [BP+16]
        SHL AX, 2
        ADD BX, AX
        MOV CX, [BX]
        PUSH CX         ;°´Å¥×î´óÖµ
        MOV AH, [BP+15] ;Ñ¡ÖÐµÄ°´Å¥
        MOV AL, [BP+16] ;°´Å¥ÀàÐÍ
        CMP AH, CL
        JNG MB_BTN_CHKED
        MOV AH, CL
        MOV [BP+16], AL
    MB_BTN_CHKED:
        PUSH AX
    MB_DRAW_BUTTONS:
        MOV CX, [BP]    ;Width
        MOV DX, [BP-4]  ;XY×ø±ê
        ADD DH, [BP-2]
        DEC DH
        INC DL
        CALL DRAWMSGBOXBUTTONS

    MB_GETKEY:
        XOR AX, AX
        INT 16h
        CMP [BP+16], BYTE PTR 0
        JE MB_ENTERKEY
        CMP AX, 4B00h
        JE MB_LEFTKEY
        CMP AX, 4D00h
        JE MB_RIGHTKEY
        CMP AX, 0F09h
        JE MB_TABKEY
        CMP AX, 1C0Dh
        JE MB_ENTERKEY
        CMP AX, 3920h   ;space
        JE MB_ENTERKEY
        CMP AX, 011Bh
        JE MB_ESCKEY
        AND AL, 11011111b
        MOV CL, AL
        MOV DI, OFFSET msgboxbuttonshotkey
        MOV AX, SEG msgboxbuttonshotkey
        MOV ES, AX
        POP AX
        PUSH AX
        DEC AL
        MOV DH, 0
        MOV DL, AL
        SHL DX, 1
        ADD DL, AL
        ADD DI, DX
        MOV BX, DI
        MOV AL, CL
        MOV CX, 3
        REPNZ SCASB
        JNZ MB_GETKEY
        DEC DI
        SUB DI, BX
        MOV BX, DI
        POP AX
        POP CX
        PUSH CX
        CMP BL, CL
        JNG MB_BTN_CHKED2
        MOV BL, CL
    MB_BTN_CHKED2:
        MOV AH, BL
        PUSH AX
        JMP MB_RETURN

    MB_LEFTKEY:
        POP AX
        CMP AH, 0
        JG MB_LEFTKEY1
        POP CX
        PUSH CX
        MOV AH, CL
        JMP MB_LEFTKEY2
    MB_LEFTKEY1:
        DEC AH
    MB_LEFTKEY2:
        PUSH AX
        JMP MB_DRAW_BUTTONS

    MB_TABKEY:
    MB_RIGHTKEY:
        POP AX
        POP CX
        PUSH CX
        CMP AH, CL
        JB MB_RIGHTKEY1
        MOV AH, 0
        JMP MB_RIGHTKEY2
    MB_RIGHTKEY1:
        INC AH
    MB_RIGHTKEY2:
        PUSH AX
        JMP MB_DRAW_BUTTONS

    MB_ESCKEY:
        POP AX
        MOV AH, [BP+14]
        PUSH AX
    MB_ENTERKEY:
    MB_RETURN:
        POP AX
        POP CX
        MOV BX, OFFSET msgboxbuttonselected
        MOV CH, 0
        MOV CL, AL
        SHL CL, 1
        ADD CL, AL
        ADD BX, CX
        MOV CL, AH
        ADD BX, CX
        MOV AL, [BX]
        MOV AH, 0
        MOV [BP+16], AX

        CALL RESTORELASTSCREEN
        POP AX
        POP AX
        POP AX
        POPA
        POP ES
        POP DS
        RET
    MSGBOX ENDP

    ;±£´æÆÁÄ»ÇøÓò
    ;Èë¿Ú²ÎÊý£º
    ;     ax£ºÆðÊ¼ÐÐ
    ;     cx£ºÒª±£´æµÄÐÐÊý
    ;Êý¾Ý±£´æ¸ñÊ½£º×Ü×Ö½ÚÊý-2, »Ø´æµÄÆðÊ¼µØÖ·, ÆÁÄ»±¸·ÝÊý¾Ý£»×Ü×Ö½ÚÊýÎª0±íÊ¾Á´±í½áÊø
    SAVESCREEN PROC NEAR
        PUSH ES
        PUSH DS
        PUSHA
        MOV DL, 160d
        MUL DL
        MOV SI, AX
        MOV AX, 0B800h
        MOV DS, AX
        MOV ES, AX
        MOV AX, CX
        MUL DL
        MOV CX, AX
        MOV BX, 25*80*2
    SS_SEEK1:
        MOV AX, DS:[BX]
        CMP AX, 0
        JE SAVE_SCREEN1
        ADD BX, DS:[BX]
        ADD BX, 4
        JMP SS_SEEK1
    SAVE_SCREEN1:
        MOV DS:[BX], CX
        MOV DS:[BX+2], SI
        ADD BX, 4
        MOV DI, BX
        CLD
        REP MOVSB
        XOR AX, AX
        STOSW
        POPA
        POP DS
        POP ES
        RET
    SAVESCREEN ENDP

    SAVE_SCREEN MACRO line, count
        MOV AX, line
        MOV CX, count
        CALL SAVESCREEN
    ENDM

    ;»Ö¸´×î½ü±£´æµÄÆÁÄ»ÇøÓò
    ;Ã»ÓÐÈë¿Ú²ÎÊý
    RESTORELASTSCREEN PROC NEAR
        PUSH ES
        PUSH DS
        PUSHA
        MOV AX, 0B800h
        MOV DS, AX
        MOV ES, AX
        MOV BX, 25*80*2
        MOV AX, DS:[BX]
        CMP AX, 0
        JE RLS_END
    RLS_SEEK1:
        PUSH BX
        ADD BX, DS:[BX]
        ADD BX, 4
        MOV AX, DS:[BX]
        CMP AX, 0
        JE RLS_SEEKED
        POP AX
        JMP RLS_SEEK1
    RLS_SEEKED:
        POP BX
        MOV SI, BX
        INC SI
        INC SI
        INC SI
        INC SI
        MOV CX, [BX]
        MOV DI, [BX+2]
        CLD
        REP MOVSB
        XOR AX, AX
        MOV [BX], AX
    RLS_END:
        POPA
        POP DS
        POP ES
        RET
    RESTORELASTSCREEN ENDP

    RESTORE_LAST_SCREEN MACRO
        CALL RESTORELASTSCREEN
    ENDM

    ;¼ÆËã²Ëµ¥Ïî×î´ó×Ö·û¿í¶È¼°²Ëµ¥ÏîÊý
    ;Èë¿Ú²ÎÊý£º
    ; ds:[bx]£º²Ëµ¥ÏîÊý¾ÝµØÖ·£»Êý¾Ý¸ñÊ½£º[Ñ¡ÖÐ´ËÏîÄ¿ºóµ÷ÓÃµÄÄ£¿éµØÖ·],[²Ëµ¥ÎÄ±¾µØÖ·£¨ÒÔ0½áÎ²£©]£»´ËÁ½ÏîÍ¬Ê±Îª0±íÊ¾½áÊø
    ;·µ»ØÊý¾Ý:
    ;      ax£ººáÏò×î´ó×Ö·û¿í¶È
    ;      cx£º²Ëµ¥ÏîÊý£¨×ÝÏòÊýÄ¿£©
    GETITEMSLENGTH PROC NEAR
        PUSH DS
        PUSH ES
        PUSH BX
        PUSH DX
        XOR AX, AX
        MOV CX, AX
        PUSH AX
        PUSH CX
        PUSH DS
        POP ES
    LOOP_GIL1:
        MOV AX, [BX]
        MOV DX, [BX+2]
        CMP AX, 0
        JNE GIL_SCANSTR
        CMP DX, 0
        JE GIL_END
   GIL_SCANSTR:
        MOV DI, DX
        MOV AX, 0
        MOV CX, 0FFFFh
        REPNE SCASB
        MOV AX, DI
        DEC AX          ;scasb¼´Ê¹µÚÒ»¸ö×Ö·ûÆ¥Åä£¬diÒ²»áÔö1
        SUB AX, DX
        POP CX
        CMP AX, CX
        JNG GIL_INCITEMCOUNT
        MOV CX, AX
    GIL_INCITEMCOUNT:
        POP AX
        INC AX
        PUSH AX
        PUSH CX
        ADD BX, 4
        JMP LOOP_GIL1
    GIL_END:
        POP AX
        POP CX
        POP DX
        POP BX
        POP ES
        POP DS
        RET
    GETITEMSLENGTH ENDP

    ;»æÖÆ²Ëµ¥ÄÚÈÝ
    ;Èë¿Ú²ÎÊý£º
    ;      ax£ºµÚÒ»¸öÎÄ±¾Êä³öµÄX,Y×ø±ê
    ; ds:[bx]£º²Ëµ¥ÏîÊý¾ÝµØÖ·£»Êý¾Ý¸ñÊ½£º[Ñ¡ÖÐ´ËÏîÄ¿ºóµ÷ÓÃµÄÄ£¿éµØÖ·],[²Ëµ¥ÎÄ±¾µØÖ·£¨ÒÔ0½áÎ²£©]£»´ËÁ½ÏîÍ¬Ê±Îª0±íÊ¾½áÊø
    ;ÎÞ·µ»ØÊý¾Ý
    DRAWMENUITEMS PROC NEAR
        PUSH ES
        PUSH DS
        PUSHA
        PUSH AX
        MOV AX, 0B800h
        MOV ES, AX
        POP AX
        MOV CX, AX
        MOV DL, 160d
        MOV AL, AH
        MOV AH, 0
        MUL DL
        MOV DX, AX
        XOR AX, AX
        MOV AL, CL
        SHL AL, 1
        ADD AX, DX
        MOV DI, AX
        PUSH AX
    LOOP_DMI1:
        MOV AX, [BX]
        MOV DX, [BX+2]
        CMP AX, 0
        JNE DMI_DRAWSTR1
        CMP DX, 0
        JE DMI_END
    DMI_DRAWSTR1:
        MOV SI, DX
    DMI_DRAWSTR2:
        LODSB
        CMP AL, 0
        JE DMI_NEWITEM
        STOSB
        INC DI
        JMP DMI_DRAWSTR2
    DMI_NEWITEM:
        ADD BX, 4
        POP AX
        ADD AX, 160d
        MOV DI, AX
        PUSH AX
        JMP LOOP_DMI1
    DMI_END:
        POP AX
        POPA
        POP DS
        POP ES
        RET
    DRAWMENUITEMS ENDP

    ;»æÖÆÒõÓ°
    ;Èë¿Ú²ÎÊý£º
    ;     ah£ºÒõÓ°ÑÕÉ«
    ;     cx£º²Ëµ¥×óÉÏ½ÇX,Y×ø±ê
    ;     dx£º²Ëµ¥ÓÒÏÂ½ÇX,Y×ø±ê
    DRAWSHADOW PROC NEAR
        PUSH ES
        PUSH DS
        PUSHA
        ADD CX, 0101h
        ADD DX, 0101h
        SHL CL, 1
        SHL DL, 1
        PUSH AX
        MOV AX, 0B800h
        MOV ES, AX
        XOR AX, AX
        MOV AL, CH
        MOV BX, 160d
        MUL BL
        MOV BL, DL
        ADD AX, BX
        INC AX
        MOV DI, AX
        MOV AH, CH
        MOV AL, DH
        SUB AL, AH
        POP BX
        PUSH CX
        MOV CX, AX
        MOV CH, 0
        MOV AL, BH
        CLD
    LOOP_DS1:
        STOSB
        ADD DI, 159d
        LOOP LOOP_DS1
        POP CX
        PUSH AX
        XOR AX, AX
        MOV AL, DH
        MOV BX, 160d
        MUL BL
        MOV BL, CL
        ADD AX, BX
        INC AX
        MOV DI, AX
        MOV AH, CL
        MOV AL, DL
        SUB AL, AH
        MOV AH, 0
        SHR AX, 1
        INC AX      ;X,YÓÉ0¿ªÊ¼£¬ÐèÔö1
        MOV CX, AX
        POP AX
    LOOP_DS2:
        STOSB
        INC DI
        LOOP LOOP_DS2
        POPA
        POP DS
        POP ES
        RET
    DRAWSHADOW ENDP

    ;»æÖÆ²Ëµ¥Ñ¡ÖÐÏî
    ;Èë¿Ú²ÎÊý£º
    ;     ax£ºµ±Ç°Ñ¡ÖÐÏî£¬Ñ¡ÖÐÏîÑÕÉ«
    ;     bx£º²Ëµ¥ÖÐµÚÒ»¸öÎÄ±¾µÄX,Y×ø±ê
    ;     cx£º²Ëµ¥¿í¶È
    ;ÎÞ·µ»ØÊý¾Ý
    DRAWMENUSELECTED PROC NEAR
        PUSH ES
        PUSH DS
        PUSHA
        PUSH CX
        MOV CX, AX
        MOV AX, 0B800h
        MOV ES, AX
        XOR AX, AX
        MOV AL, BH
        ADD AL, CH
        MOV DX, 160d
        MUL DL
        MOV DX, AX
        XOR AX, AX
        MOV AL, BL
        SHL AL, 1
        ADD AX, DX
        INC AX
        MOV DI, AX
        MOV AX, CX
        POP CX
    LOOP_DMS:
        STOSB
        INC DI
        LOOP LOOP_DMS
        POPA
        POP DS
        POP ES
        RET
    DRAWMENUSELECTED ENDP

    ;ÏÔÊ¾²Ëµ¥
    ;Èë¿Ú²ÎÊý£º
    ;ss:[sp+2]£º²Ëµ¥ÑÕÉ«,±ß¿òÑÕÉ«
    ;ss:[sp+4]£ºµ±Ç°Ñ¡ÖÐÏî£¬Ñ¡ÖÐÏîÑÕÉ«
    ;ss:[sp+6]£ºÏÔÊ¾Î»ÖÃXY×ø±ê
    ;ss:[sp+8]£º²Ëµ¥ÏîÊý¾ÝµØÖ·
    ;Êý¾Ý¸ñÊ½£º[Ñ¡ÖÐºóµ÷ÓÃµÄÄ£¿éµØÖ·],[²Ëµ¥ÎÄ±¾µØÖ·£¨ÒÔ0½áÎ²£©]£»
    ;          Ä£¿éµØÖ·Îª0FFFFH±íÊ¾Ñ¡ÖÐ´ËÏîºó½áÊø²Ëµ¥·µ»Ø£»´ËÁ½ÏîÍ¬Ê±0Îª±íÊ¾Êý¾Ýµ½´Ë½áÊø
    ;ÎÞ·µ»ØÊý¾Ý
    SHOWMENU PROC NEAR
        PUSH 0
        PUSH 0
        PUSH DS
        PUSH ES
        PUSHA
        MOV BP, SP
        ADD BP, 24d
        MOV BX, [BP+8]
        CALL GETITEMSLENGTH  ;ax:Width, cx:count
        MOV [BP-2], AX
        MOV [BP-4], CX

        MOV AX, [BP+6]  ;XY×ø±ê
        MOV AL, AH
        MOV AH, 0
        INC CX
        INC CX
        INC CX
        CALL SAVESCREEN

    SM_DRAW:
        MOV AX, [BP-2]
        MOV CX, [BP-4]
        MOV DL, AL
        INC DL
        MOV DH, CL
        INC DH
        MOV AX, [BP+6]   ;XY×ø±ê
        ADD DL, AL
        ADD DH, AH       ;dx:bottom,right
        MOV CX, AX       ;cx:top,left
        MOV BX, [BP+2]   ;bh:color
        MOV AX, 0600h
        INT 10h          ;clear window
        MOV AH, menu_shadow_color
        CALL DRAWSHADOW

        MOV DX, [BP-2]
        MOV CX, [BP-4]
        MOV AX, [BP+6]
        MOV BX, OFFSET menuframedata
        MOV [BX], AH
        MOV [BX+5], AH
        MOV [BX+10], AH
        INC AH
        MOV [BX+15], AH
        MOV [BX+35], AH
        ADD AH, CL
        MOV [BX+20], AH
        MOV [BX+25], AH
        MOV [BX+30], AH
        MOV [BX+1], AL
        MOV [BX+16], AL
        MOV [BX+21], AL
        INC AL
        MOV [BX+6], AL
        MOV [BX+26], AL
        ADD AL, DL
        MOV [BX+11], AL
        MOV [BX+31], AL
        MOV [BX+36], AL
        MOV [BX+8], DL
        MOV [BX+28], DL
        MOV [BX+18], CL
        MOV [BX+38], CL
        MOV AH, [BP+2]
        CALL DRAWFRAME

        MOV AX, [BP+6]
        ADD AX, 0101h
        MOV BX, [BP+8]
        CALL DRAWMENUITEMS

        MOV DL, [BP+5]
    SM_DRAWSELECTED:
        MOV AH, DL
        MOV AL, [BP+4]
        MOV BX, [BP+6]
        ADD BX, 0101h
        MOV CX, [BP-2]
        CALL DRAWMENUSELECTED
    SM_GETKEY:
        XOR AX, AX
        INT 16h
        CMP AX, 5000h
        JE SM_DOWNKEY
        CMP AX, 4800h
        JE SM_UPKEY
        CMP AX, 1C0Dh
        JE SM_ENTERKEY
        CMP AX, 3920h   ;space
        JE SM_ENTERKEY
        CMP AX, 011Bh
        JE SM_ESCKEY
        JMP SM_GETKEY
    SM_DOWNKEY:
        MOV AL, [BP+3]
        MOV AH, DL
        MOV CX, [BP-2]
        CALL DRAWMENUSELECTED
        MOV AX, [BP-4]
        DEC AX
        CMP DL, AL
        JB SM_DOWNKEY1
        MOV DX, 0
        JMP SM_DRAWSELECTED
    SM_DOWNKEY1:
        INC DL
        JMP SM_DRAWSELECTED
    SM_UPKEY:
        MOV AL, [BP+3]
        MOV AH, DL
        MOV CX, [BP-2]
        CALL DRAWMENUSELECTED
        CMP DL, 0
        JG SM_UPKEY1
        MOV DX, [BP-4]
        DEC DX
        JMP SM_DRAWSELECTED
    SM_UPKEY1:
        DEC DL
        JMP SM_DRAWSELECTED
    SM_ENTERKEY:
        MOV BX, [BP+8]
        XOR AX, AX
        MOV AL, DL
        SHL AL, 2
        ADD BX, AX
        MOV BX, [BX]
        CMP BX, 0FFFFh
        JE SM_RETURN
        MOV DH, 0
        PUSH DX
        CALL BX
        POP DX
        JC SM_REDRAW
        CMP DX, 0FFFFh
        JE SM_RETURN
        JMP SM_DRAWSELECTED
    SM_REDRAW:
        MOV BX, [BP+8]
        CALL GETITEMSLENGTH  ;ax:Width, cx:count
        MOV [BP-2], AX
        ;mov [bp-4], cx
        MOV [BP+5], DL
        JMP SM_DRAW
    SM_ESCKEY:
    SM_RETURN:
        CALL RESTORELASTSCREEN
        MOV AX, [BP]
        MOV [BP-4], AX
        POPA
        POP ES
        POP DS
        RET 12
    SHOWMENU ENDP

    SHOW_MENU MACRO menucolor, bordercolor, hightlightcolor, selected, top, left, menudata
        PUSH ES
        PUSH DS
        PUSHA
        MOV AX, SEG menudata
        MOV DS, AX
        PUSH OFFSET menudata
        PUSH ((top SHL 8) OR left)
        PUSH ((selected SHL 8) OR hightlightcolor)
        PUSH ((menucolor SHL 8) OR bordercolor)
        CALL SHOWMENU
        POPA
        POP DS
        POP ES
    ENDM

    ;Òþ²Ø¹â±ê
    HIDE_CURSOR MACRO
        MOV AH, 1
        MOV BH, 0
        MOV CX, 2020h
        INT 10h
    ENDM

    ;ÏÔÊ¾¹â±ê
    SHOW_CURSOR MACRO
        MOV AH, 1
        MOV BH, 0
        MOV CX, 0D0Eh
        INT 10h
    ENDM

    ;¹â±êµ½Ö¸¶¨X,YÎ»ÖÃ
    GOTOXY MACRO x_0_24, y_0_79 ;;Set Cursor to X,Y
        MOV AH, 2
        MOV BH, 0
        MOV DX, ((x_0_24 SHL 8) OR y_0_79)
        INT 10h
    ENDM

    ;Çå³ý´°¿ÚÄÚÈÝ
    ;²ÎÊý£º
    ;color£º´°¿ÚÐÂÑÕÉ«
    ;top, left, buttom, right  £º´°¿Ú×óÉÏ½Ç¼°ÓÒÏÂ½Ç×ø±ê
    CLEAR_WINDOW MACRO color, top, left, bottom, right
        MOV AX, 0600h
        MOV BH, color
        MOV CX, ((top SHL 8) OR left)
        MOV DX, ((bottom SHL 8) OR right)
        INT 10h
    ENDM

    PRINT_STRING$ MACRO string$ ;;Print String$ at curror locate.
        ;mov ax SEG string$
        ;mov ds, ax
        LEA DX, string$
        MOV AH, 9
        INT 21h
    ENDM

    PRINT$_AT_XY MACRO x,y,string$
        GOTOXY x,y
        PRINT_STRING$ string$
    ENDM

    ;½«¶þ½øÖÆ×ª»»³ÉÊ®½øÖÆ×Ö·û´®
    ;Èë¿Ú²ÎÊý£º
    ;     ax£ºÒª×ª»»µÄÄÚÈÝ
    ;ds:[bx]£º×ª»»ºó×Ö·û´®±£´æµÄÎ»ÖÃ
    ;     cx£º×ª»»µÄÎ»Êý£¨³¤¶È£©
    ;½áÊøºóds:[bx]ÎªÒÑ×ª»»×Ö·û´®
    BIN2STRING PROC NEAR
        PUSHA
        CMP CX, 0
        JE B2S_BACK
        PUSH AX
        PUSH CX
        MOV AL, ' '
    LOOP_B2S1:
        MOV [BX], AL    ;Fill space char
        INC BX
        LOOP LOOP_B2S1
        POP CX
        POP AX
    LOOP_B2S2:
        XOR DX, DX
        PUSH CX
        MOV CX, 10d
        DIV CX
        POP CX
        ADD DL, 30h
        DEC BX
        MOV [BX], DL
        OR AX, AX
        JZ B2S_BACK
        LOOP LOOP_B2S2
    B2S_BACK:
        POPA
        RET
    BIN2STRING ENDP

    BIN_TO_STRING MACRO bin_int, dec_str, str_len
        MOV AX, bin_int
        MOV BX, OFFSET dec_str
        MOV CX, str_len
        CALL BIN2STRING
    ENDM

    ;ÐÅÏ¢ÌáÊ¾´°
    ;²»±£´æÆÁÄ»ÐÅÏ¢£¬²»×Ô¶¯ÏûÒþ
    ;Èë¿Ú²ÎÊý£º
    ;ds:[bx]£ºÌáÊ¾ÄÚÈÝ£¨µ¥ÐÐ£¬×î´ó74×Ö·û£©
    PROMPTBOX PROC NEAR
        PUSH ES
        PUSHA
        MOV DI, BX
        PUSH DS
        POP ES
        MOV AX, 0
        MOV CX, 0FFFFh
        REPNE SCASB
        DEC DI
        SUB DI, BX
        MOV DX, DI
        ADD DX, 4
        MOV DI, BX
        MOV BX, OFFSET promptboxframedata
        MOV [BX+8], DL
        MOV [BX+28], DL
        SHR DL, 1
        INC DL
        MOV AL, 39d     ;80/2
        SUB AL, DL
        MOV [BX+1], AL
        MOV [BX+16], AL
        MOV [BX+21], AL
        MOV CL, AL
        INC AL
        MOV [BX+6], AL
        MOV [BX+26], AL
        MOV AL, 39d
        ADD AL, DL
        MOV [BX+11], AL
        MOV [BX+31], AL
        MOV [BX+36], AL
        MOV DL, AL
        MOV AX, 0600h
        MOV BH, promptbox_color
        MOV CH, 11d
        MOV DH, 13d
        INT 10h         ;clear
        MOV AH, promptbox_border_color
        MOV BX, OFFSET promptboxframedata
        CALL DRAWFRAME
        MOV AX, 1
        MOV BX, DI
        MOV DX, ((12 SHL 8) OR 39)
        CALL DRAWTEXT
        POPA
        POP ES
        RET
    PROMPTBOX ENDP

    PROMPTBOX_SHOW MACRO text
        ;push ds
        PUSH AX
        ;push bx
        PUSH CX
        SAVE_SCREEN 11, 3
        ;mov ax, seg text
        ;mov ds, ax
        MOV BX, OFFSET text
        CALL PROMPTBOX
        POP CX
        ;pop bx
        POP AX
        ;pop ds
    ENDM

    PROMPTBOX_HIDE MACRO
        RESTORE_LAST_SCREEN
    ENDM

    EXIT_WITH_CODE MACRO exit_code
        MOV AH, 4Ch
        MOV AL, exit_code
        INT 21h
    ENDM

    EXIT MACRO
        MOV AH, 4Ch
        MOV AL, exitcode
        INT 21h
    ENDM

    open_file_read EQU 0
    open_file_write EQU 1
    open_file_readwrite EQU 2

    OPEN_FILE MACRO file_name, read_write_mode
        MOV AX, SEG file_name
        MOV DS, AX
        LEA DX, file_name
        MOV AX, (3D00h OR read_write_mode)
        INT 21h
    ENDM

    CLOSE_FILE MACRO file_handle
        MOV BX, file_handle
        MOV AH, 3Eh
        INT 21h
    ENDM

    SEEK_FILE MACRO file_handle, offset_high, offset_low
        MOV AX, AX, 4200h   ;al:seek mode(0,1,2)
        MOV BX, file_handle
        MOV CX, offset_high
        MOV DX, offset_low
        INT 21h             ;return value:DX:AX=Offset value after seek, OR ax=error code(CF flag is set)
    ENDM

    ;Ëæ»ú¶ÁÈ¡ÎÄ¼þµ½»º³åÇø£¬²¢¸ñÊ½»¯»º³åÇø
    RANDOMREADFILETOBUFFER PROC NEAR
        PUSH ES
        PUSH DS
        PUSHA

        XOR AX, AX
        INT 1Ah             ;random(Time)
        MOV BX, DX
        MOV AX, 2
        INT 1Ah
        MOV DH, BL
        AND DH, DL
        AND DX, 1FFFh
        XOR CX, CX

        MOV BX, filehandle
        MOV AX, 4200h
        INT 21h             ;file seek
        MOV CX, buffer_size
        LEA DX, buffer
    LOOP_RRFTB1:
        MOV AH, 3Fh
        INT 21h             ;read file
        JC RRFTB_READFILE_ERROR
        CMP AX, CX
        JE RRFTB_FORMAT_BUFFER
        SUB CX, AX
        PUSH CX
        PUSH AX
        XOR DX, DX
        XOR CX, CX
        MOV AX, 4200h
        INT 21h
        POP AX
        POP CX
        LEA DX, buffer
        ADD DX, AX
        JMP LOOP_RRFTB1

    RRFTB_FORMAT_BUFFER:
        MOV AX, SEG buffer
        MOV DS, AX
        MOV ES, AX
        LEA DI, buffer
        MOV SI, DI
        MOV CX, buffer_size
    LOOP_RRFTB_FB1:
        LODSB
        CMP AL, 127
        JGE RRFTB_RELOAD
        CMP AL, 32d
        JNB RRFTB_STORE_BACK

    CMP_ENTER_CHAR:
        CMP AL, 0Dh
        JNE RRFTB_RELOAD
        STOSB
    RECMP_ENTER_CHAR:
        CMP [SI+1], AL
        JE CLEAR_ENTER_CHAR
        CMP BYTE PTR [SI+1], 0Ah
        JNE RRFTB_RELOAD
    CLEAR_ENTER_CHAR:
        INC SI
        LOOP RECMP_ENTER_CHAR
        JMP CMP_BUFFER_FULL

    RRFTB_STORE_BACK:
        STOSB
    RRFTB_RELOAD:
        LOOP LOOP_RRFTB_FB1

        MOV DX, DI
        LEA AX, buffer
        XCHG DI, AX
        SUB AX, DI
        CMP AX, min_text_length
        JB RRFTB_FORMAT_BUFFER_ERROR

    CMP_BUFFER_FULL:
        CMP AX, buffer_size
        JGE RRFTB_END
        MOV CX, buffer_size
        SUB CX, AX
        LEA DX, buffer
        ADD DX, AX
        JMP LOOP_RRFTB1

    RRFTB_READFILE_ERROR:
        PUSH CX
        PUSH DX
        MOV AX, 0103h
        MOV BX, OFFSET filereaderror
        MOV CX, 1
        MOV DX, OFFSET loaddatatitle
        CALL MSGBOX
        POP DX
        POP CX
        CMP AX, 4
        JE LOOP_RRFTB1
        STC
        JMP RRFTB_BAK

    RRFTB_FORMAT_BUFFER_ERROR:
        MOV AX, 0100h
        MOV BX, OFFSET fileillegal
        MOV CX, 0
        MOV DX, OFFSET loaddatatitle
        CALL MSGBOX
        STC
        JMP RRFTB_BAK

    RRFTB_END:
        CLC
    RRFTB_BAK:
        POPA
        POP DS
        POP ES
        RET
    RANDOMREADFILETOBUFFER ENDP

    ;Display ending information
    SAY_GOODBYE MACRO
        CLEAR_WINDOW 7, 0, 0, 24, 79
        DRAW_MULTI_LINE_TEXT 70h, endingtitle, 0, 0
        DRAW_MULTI_LINE_TEXT 7, endinginformation, 1, 0
    ENDM

    MAIN PROC FAR   ;********Program start here ***************
    BEGIN:
        CLD
        MOV AX, STACK
        MOV SS, AX
        MOV SP, OFFSET top_of_stack
        MOV AX, SEG keyboard
        MOV DS, AX
        MOV ES, AX
        MOV AX, 3
        INT 10h
        MOV AX, 1003h
        XOR BL, BL
        INT 10h
        HIDE_CURSOR

    DRAW_MAIN_WIN:
        CALL DRAWMAINWINDOW
        SHOW_MENU menu_color, menu_border_color, menu_highlight_color, 0, 2, 3, mainmenu
        CALL GRAYWINDOW
        MOV AX, 2
        MOV BX, OFFSET quitmsg
        MOV CX, 0101h
        MOV DX, OFFSET quitmsgboxtitle
        CALL MSGBOX
        CMP AX, 3
        JE DRAW_MAIN_WIN

        SAY_GOODBYE
        SHOW_CURSOR
        GOTOXY 10, 0
        EXIT

        JNC TEST_LENGTH
        PRINT_STRING$ filenotexist
        EXIT_WITH_CODE 1
    TEST_LENGTH:
        MOV filehandle, AX
        MOV BX, AX
        XOR CX, CX
        XOR DX, DX
        MOV AX, 4202h
        INT 21h
        OR DX, DX
        JNZ READ_FILE
        CMP AX, file_min_length
        JNB READ_FILE
        CLOSE_FILE filehandle
        PRINT_STRING$ filesmall
        EXIT_WITH_CODE 2
    READ_FILE:
;        call randomreadfile
;        jnc clear_screen
        CLOSE_FILE filehandle
        EXIT_WITH_CODE 3
        ;close_file filehandle

    MAIN ENDP

    SHOWTESTMENU PROC NEAR
        SHOW_MENU menu_color, menu_border_color, menu_highlight_color, 2, 2, 18, testingmenu
        STC
        RET
    SHOWTESTMENU ENDP

    SHOWTESTTIMEMENU PROC NEAR
        ;Show_Menu MENU_COLOR, MENU_BORDER_COLOR, MENU_HIGHLIGHT_COLOR, 0, 2, 36, TestTimeMenu
        PUSH ES
        PUSH DS
        PUSHA
        MOV AX, SEG testtimemenu
        MOV DS, AX
        PUSH OFFSET testtimemenu
        PUSH (0200h OR 38d)         ;((top SHL 8) OR left)
        MOV AL, testtime
        MOV BX, 0
    LOOP_STTM:
        CMP testtimetable[BX], BYTE PTR 0
        JE STTM_RESET_TO_0
        CMP AL, testtimetable[BX]
        JE STTM_FOUND
        INC BX
        JMP LOOP_STTM
    STTM_RESET_TO_0:
        MOV BX, 0
    STTM_FOUND:
        MOV AH, BL
        MOV AL, menu_highlight_color;((Selected SHL 8) OR HIGHTLIGHTCOLOR)
        PUSH AX
        PUSH ((menu_color SHL 8) OR menu_border_color)
        CALL SHOWMENU
        POPA
        POP DS
        POP ES
        STC
        RET
    SHOWTESTTIMEMENU ENDP

    SETTESTTIME PROC NEAR
        PUSH BP
        MOV BP, SP
        PUSH ES
        PUSH DS
        PUSHA
        MOV AX, SEG testtimetable
        MOV DS, AX
        MOV BX, OFFSET testtimetable
        MOV AX, [BP+4]
        MOV AH, 0
        XLAT
        MOV testtime, AL
        MOV AH, 0
        MOV BX, OFFSET mnutesttimedigit
        MOV CX, 2
        CALL BIN2STRING
        MOV AX, 0FFFFh
        MOV [BP+4], AX
        POPA
        POP DS
        POP ES
        POP BP
        CLC
        RET
    SETTESTTIME ENDP

    SHOWTESTKEYSETMENU PROC NEAR
        ;Show_Menu MENU_COLOR, MENU_BORDER_COLOR, MENU_HIGHLIGHT_COLOR, 0, 2, 36, TestLevelMenu
        PUSH ES
        PUSH DS
        PUSHA
        MOV AX, SEG testkeysetmenu
        MOV DS, AX
        PUSH OFFSET testkeysetmenu
        PUSH (0200h OR 38d)
        MOV AH, testkeyset
        MOV AL, menu_highlight_color;
        PUSH AX
        PUSH ((menu_color SHL 8) OR menu_border_color)
        CALL SHOWMENU
        POPA
        POP DS
        POP ES
        STC
        RET
    SHOWTESTKEYSETMENU ENDP

    SETTESTKEYSET PROC NEAR
        PUSH BP
        MOV BP, SP
        PUSH ES
        PUSH DS
        PUSHA
        MOV AX, [BP+4]
        MOV BX, OFFSET testkeyset
        MOV [BX], AL
        MOV BX, OFFSET testingmenu+6
        OR AL, AL
        JNZ STL2
    STL1:
        MOV [BX], OFFSET menutestkeysetp
        JMP STL_END
    STL2:
        CMP AL, 1
        JNE STL3
        MOV [BX], OFFSET menutestkeyseta
        JMP STL_END
    STL3:
        CMP AL, 2
        JNE STL4
        MOV [BX], OFFSET menutestkeysetk
        JMP STL_END
    STL4:
        MOV [BX], OFFSET menutestkeysetp
        MOV BX, OFFSET testkeyset
        MOV [BX], BYTE PTR 0
    STL_END:
        MOV AX, 0FFFFh
        MOV [BP+4], AX
        POPA
        POP DS
        POP ES
        POP BP
        CLC
        RET
    SETTESTKEYSET ENDP

    FEATURECOMING PROC NEAR
        PUSH AX
        PUSH BX
        PUSH DX
        MOV AX, 0
        MOV BX, OFFSET msgfeaturecomingtext
        MOV DX, OFFSET msgfeaturecomingtitle
        CALL MSGBOX
        POP DX
        POP BX
        POP AX
        RET
    FEATURECOMING ENDP

    ;ÏÔÊ¾AboutBox
    SHOWABOUT PROC NEAR
        PUSH AX
        PUSH BX
        PUSH DX
        MOV AX, 0
        MOV BX, OFFSET aboutmsgtext
        MOV DX, OFFSET aboutmsgtitle
        CALL MSGBOX
        POP DX
        POP BX
        POP AX
        RET
    SHOWABOUT ENDP

    ;½«²âÊÔ·ÖÖÓÊý»»Ëã³ÉTickCountÖµ
    SETTICKCOUNT MACRO
        XOR AX, AX
        MOV AL, testtime
        MOV BX, 10920d      ;18.2*10*60 À©´ó10Î»·½±ãÔËËã
        MUL BX
        MOV WORD PTR testtickremain, AX
        MOV WORD PTR testtickremain+2, DX
        MOV WORD PTR testtickcount, 0
    ENDM

    ;»æÖÆ²âÊÔÊ£ÓàÊ±¼ä
    ;ÎÞÈë¿Ú²ÎÊý
    ;ÎÞ·µ»ØÖµ
    DRAWREMAINTIME PROC NEAR
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        MOV AX, WORD PTR testtickremain
        MOV DX, WORD PTR testtickremain+2
        OR DX, DX
        JNZ DRT_TICK_TO_TIMESTR
        CMP AX, 1820d
        JNE DRT_TICK_TO_TIMESTR
        PUSH AX
        PUSH DX
        CLEAR_WINDOW test_window_alert_color, 4, 74d, 4, 77d
        POP DX
        POP AX
    DRT_TICK_TO_TIMESTR:
        MOV BX, 10920d      ;18.2*10*60
        DIV BX
        PUSH AX
        MOV AX, DX
        MOV BL, 182d        ;18.2*10
        DIV BL
        MOV AH, 0
        MOV BX, 10d
        DIV BL
        ADD AX, 3030h
        MOV BX, OFFSET testremaintime+5
        MOV [BX], AH
        MOV [BX-1], AL
        POP AX
        MOV BX, OFFSET testremaintime
        MOV CX, 3
        CALL BIN2STRING
        MOV AX, 2
        MOV DX, (400h OR 77d)
        CALL DRAWTEXT
        POP DX
        POP CX
        POP BX
        POP AX
        RET
    DRAWREMAINTIME ENDP

    ;»æÖÆ²âÊÔ´°¿Ú
    ;ÎÞÈë¿Ú²ÎÊý
    ;ÎÞ·µ»ØÖµ
    DRAWTESTWINDOW PROC NEAR
        PUSH ES
        PUSH DS
        PUSHA
        CLEAR_WINDOW test_window_color, 0, 0, 23d, 79d
        DRAW_FRAME test_window_color, testwinframe
        DRAW_MULTI_LINE_TEXT test_window_color, keyboard, 2, 4
        ;Draw_Multi_Line_Text TEST_WINDOW_COLOR, Logo, 1, 27
        DRAW_MULTI_LINE_TEXT test_window_color, testwinmarkinfo, 2, 33
        CLEAR_WINDOW test_window_title_color, 0, 0, 0, 79d
        DRAW_TEXT 0, 40, testwintitle, 1
        CALL DRAWTESTKEYSET
        SETTICKCOUNT
        CALL DRAWREMAINTIME
        POPA
        POP DS
        POP ES
        RET
    DRAWTESTWINDOW ENDP

    ;»æÖÆTest´°¿ÚKeysetÖµ
    ;ÎÞÈë¿Ú²ÎÊý
    ;ÎÞ·µ»ØÖµ
    DRAWTESTKEYSET PROC NEAR
        PUSH AX
        PUSH BX
        PUSH DX
        XOR AX, AX
        MOV AL, testkeyset
        SHL AX, 2
        MOV BX, OFFSET testkeysetmenu
        ADD BX, AX
        MOV BX, [BX+2]
        MOV AX, 2
        MOV DX, (200h OR 77d)
        CALL DRAWTEXT
        POP DX
        POP BX
        POP AX
        RET
    DRAWTESTKEYSET ENDP

    TESTSHOWMARK PROC NEAR
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        BIN_TO_STRING typetotal, totalstring, 5
        BIN_TO_STRING typewrong, wrongstring, 5
        CMP typewrong, 0
        JNE TSM_COMPUTE_RATIO
        BIN_TO_STRING 100d, ratiostring, 5
        JMP TSM_SHOW
    TSM_COMPUTE_RATIO:
        MOV WORD PTR ratiostring, '  '
        MOV WORD PTR ratiostring+2, '  '
        MOV BYTE PTR ratiostring+4, ' '
        MOV AX, typetotal
        SUB AX, typewrong
        MOV BX, 100d
        MUL BX
        CMP typetotal, 0
        JE TSM_SHOW
        DIV typetotal
        AAM
        PUSH AX
        MOV AX, DX
        MUL BX
        DIV typetotal
        AAM
        MOV BX, 4
        OR AX, AX
        JZ TSM_COMPUTE_RATIO2
        OR AL, AL
        JZ TSM_COMPUTE_RATIO1
        ADD AL, 30h
        MOV ratiostring[BX], AL
        DEC BX
    TSM_COMPUTE_RATIO1:
        ADD AH, 30h
        MOV ratiostring[BX], AH
        DEC BX
        MOV BYTE PTR ratiostring[BX], '.'
        DEC BX
    TSM_COMPUTE_RATIO2:
        POP AX
        ADD AL, 30h
        MOV ratiostring[BX], AL
        DEC BX
        OR AH, AH
        JZ TSM_SHOW
        ADD AH, 30h
        MOV ratiostring[BX], AH

    TSM_SHOW:
        DRAW_TEXT 2, 43d, totalstring, 2
        DRAW_TEXT 4, 43d, wrongstring, 2
        DRAW_TEXT 6, 76d, ratiostring, 2
        POP DX
        POP CX
        POP BX
        POP AX
        RET
    TESTSHOWMARK ENDP

    TESTSHOWRATE PROC NEAR
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        MOV AX, testtickcount
        MOV BX, 182d        ;10Ãë
        DIV BL              ;char/min = totaltype/second*60 = totaltype*6/(second/10)
        OR AH, AH
        JNZ TSR_BACK
        OR AL, AL
        JZ TSR_BACK
        PUSH AX
        MOV AX, typetotal
        MOV BX, 6
        MUL BX
        POP BX
        DIV BX
        MOV typerate, AX
        BIN_TO_STRING typerate, ratestring, 5
        DRAW_TEXT 6, 43d, ratestring, 2
    TSR_BACK:
        POP DX
        POP CX
        POP BX
        POP AX
        RET
    TESTSHOWRATE ENDP

    ;»æÖÆ»º³åÇøÎÄ±¾µ½²âÊÔ´°ÌåÖÐ
    ;Èë¿Ú²ÎÊý£º
    ;ds:[si]£ºÎÄ±¾»º³åÇøµØÖ·
    DRAWBUFFERTOTESTWIN PROC NEAR
        PUSH ES
        PUSHA
        CLEAR_WINDOW test_window_color, 8, 1, 23d, 78d
        MOV AX, 0B800h
        MOV ES, AX
        MOV DI, 8*80*2+4
        PUSH DI
        MOV CX, 76d
    LOOP_DBTTW:
        CMP SI, (OFFSET buffer)+buffer_size
        JBE DBTTW_LOAD_CHAR
        LEA SI, buffer
    DBTTW_LOAD_CHAR:
        LODSB
        CMP AL, 0Dh
        JE DBTTW_DRAW_ENTER_CHAR
        STOSB
        INC DI
        LOOP LOOP_DBTTW
        JMP DBTTW_TEST_END

    DBTTW_DRAW_ENTER_CHAR:
        MOV AX, 0504h
        STOSW
    DBTTW_TEST_END:
        CMP DI, 22*160d
        JG DBTTW_END
        MOV CX, 76d
        POP DI
        ADD DI, 320d
        PUSH DI
        JMP LOOP_DBTTW

    DBTTW_END:
        POP di
        MOV DI, 9*80*2+4
        MOV AL, 30d
        STOSB
        POPA
        POP ES
        RET
    DRAWBUFFERTOTESTWIN ENDP

    TESTING PROC NEAR
        PUSH ES
        PUSH DS
        PUSHA
    TESTING_BEGIN:
        PROMPTBOX_SHOW loading
        MOV AH, 0
        MOV AL, testkeyset
        SHL AX, 1
        MOV BX, OFFSET testdatafiles
        ADD BX, AX
        MOV DX, [BX]
    TESTING_OPEN_FILE:
        MOV AX, (3D00h OR open_file_read)
        INT 21h         ;open file for read
        JC TESTING_OPEN_FILE_ERROR
        MOV filehandle, AX
        CALL RANDOMREADFILETOBUFFER
        JC TESTING_READ_FILE_ERROR
        CLOSE_FILE filehandle
        PROMPTBOX_HIDE
        MOV typetotal, 0
        MOV typewrong, 0
        MOV typerate, 0
        CALL DRAWTESTWINDOW
        MOV SI, OFFSET buffer
        CALL DRAWBUFFERTOTESTWIN
        CLEAR_WINDOW test_window_prompt_color, 24d, 0, 24d, 79d
        DRAW_TEXT 24d, 39d, msgpresskey, 1
    TESTING_STANDBY:
        XOR AX, AX
        INT 16h
        CMP AX, 011Bh
        JE TESTING_END
        CMP AL, ' '
        JNE TESTING_STANDBY
        DRAW_FRAME test_window_color, testwinframe
        PUSH DS
        MOV AX, SEG oldint8
        MOV DS, AX
        MOV AX, 3508h
        INT 21h
        MOV WORD PTR oldint8, BX
        MOV WORD PTR oldint8+2, ES
        MOV AX, SEG NEWINT8TIMER
        MOV DS, AX
        MOV DX, OFFSET NEWINT8TIMER
        MOV AX, 2508h
        INT 21h
        POP DS
        CALL DOTEST
        PUSH DS
        MOV AX, SEG oldint8
        MOV DS, AX
        MOV DX, WORD PTR oldint8
        MOV AX, WORD PTR oldint8+2
        MOV DS, AX
        MOV AX, 2508h
        INT 21h
        POP DS
        CALL TESTSHOWRATE
        MOV AX, WORD PTR testtickremain
        ADD AX, WORD PTR testtickremain+2
        JNZ TESTING_END
        MOV AX, 2
        MOV BX, OFFSET msgtestend
        MOV CX, 1
        MOV DX, OFFSET msgtestendtitle
        CALL MSGBOX
        CMP AX, 2
        JE TESTING_BEGIN

    TESTING_END:
        CALL DRAWMAINWINDOW
        MOV BP, SP
        MOV AX, 0FFFFh
        MOV [BP+22], AX
        CLC
    TESTING_BACK:
        POPA
        POP DS
        POP ES
        RET

    TESTING_OPEN_FILE_ERROR:
        PUSH DX
        MOV AX, 0103h
        MOV BX, OFFSET fileopenerror
        MOV CX, 1
        MOV DX, OFFSET loaddatatitle
        CALL MSGBOX
        POP DX
        CMP AX, 4       ;Retry
        JE TESTING_OPEN_FILE
        PROMPTBOX_HIDE
        STC
        JMP TESTING_BACK

    TESTING_READ_FILE_ERROR:
        PROMPTBOX_HIDE
        CLOSE_FILE filehandle
        STC
        JMP TESTING_BACK
    TESTING ENDP

    DOTEST PROC NEAR
        PUSH ES
        PUSHA
        LEA SI, buffer
        MOV AX, 0B800h
        MOV ES, AX
        MOV intestingflag, BYTE PTR 1
   DOTEST_RESET_POINT:
        MOV DI, 9*80*2+4
        PUSH DI
        MOV CX, 76d

    LOOP_DOTEST:
        MOV BYTE PTR ES:[DI], 30d
        MOV AX, WORD PTR testtickremain
        ADD AX, WORD PTR testtickremain+2
        JZ DOTEST_END
        CMP SI, (OFFSET buffer)+buffer_size
        JBE DOTEST_CHK_KEY
        LEA SI, buffer
    DOTEST_CHK_KEY:
        MOV AH, 1
        INT 16h
        JZ DOTEST_SHOW_REMAINTIME
        MOV AX, 0
        INT 16h
        CMP AX, 011Bh       ;ESC
        JE DOTEST_ASK_FOR_QUIT
        INC typetotal
        DEC CX
        MOV BX, AX
        LODSB
        MOV BH, AL
        MOV AH, test_window_color
        MOV AL, 250d
        CMP BH, BL
        JE DOTEST_SHOW_CHAR
    DOTEST_TYPE_ERROR:
        INC typewrong
        CMP BL, ' '         ;space
        JNE DOTEST_CMP_WRONG1
        MOV AL, 22d
        JMP DOTEST_SHOW_CHAR
    DOTEST_CMP_WRONG1:
        CMP BL, 0Dh         ;enter
        JNE DOTEST_CMP_WRONG2
        MOV AL, 4
        JMP DOTEST_SHOW_CHAR
    DOTEST_CMP_WRONG2:
        CMP BL, 9           ;tab
        JNE DOTEST_CMP_WRONG3
        MOV AL, 29d
        JMP DOTEST_SHOW_CHAR
    DOTEST_CMP_WRONG3:
        CMP BL, 8           ;backspace
        JNE DOTEST_CMP_WRONG4
        MOV AL, 27d
        JMP DOTEST_SHOW_CHAR
    DOTEST_CMP_WRONG4:
        OR BL, BL
        JZ DOTEST_CMP_WRONG5
        MOV AL, BL
        JMP DOTEST_SHOW_CHAR
    DOTEST_CMP_WRONG5:
        MOV AL, 254d
        JMP DOTEST_SHOW_CHAR

    DOTEST_SHOW_CHAR:
        STOSW
        CMP BH, 0Dh
        JNE DOTEST_SHOW_MARK
    DOTEST_NEW_LINE:
        POP DI
        ADD DI, 320d
        PUSH DI
        MOV CX, 76d
        JMP DOTEST_SHOW_MARK

    DOTEST_SHOW_MARK:
        CALL TESTSHOWMARK
    DOTEST_SHOW_REMAINTIME:
        CALL DRAWREMAINTIME
        CALL TESTSHOWRATE
        OR CX, CX
        JNZ DOTEST_NEW_PAGE
        POP DI
        ADD DI, 320d
        PUSH DI
        MOV CX, 76d
    DOTEST_NEW_PAGE:
        CMP DI, 22*160d
        JB LOOP_DOTEST
        CALL DRAWBUFFERTOTESTWIN
        POP DI
        JMP DOTEST_RESET_POINT

    DOTEST_ASK_FOR_QUIT:
        MOV intestingflag, 0
        PUSH CX
        MOV AX, 2
        MOV BX, OFFSET msgtestquit
        MOV CX, 0101h
        MOV DX, OFFSET msgtestquittitle
        CALL MSGBOX
        POP CX
        CMP AX, 2       ;YES
        JE DOTEST_END
        MOV intestingflag, 1
        JMP LOOP_DOTEST

    DOTEST_END:
        MOV intestingflag, 0
        POP DI
        POPA
        POP ES
        RET
    DOTEST ENDP

    GRAYWINDOW PROC NEAR
        PUSH ES
        PUSH DS
        PUSHA
        MOV AX, 0B800h
        MOV DS, AX
        MOV ES, AX
        MOV SI, 0
        MOV DI, 0
        MOV CX, 25*80
        CLD
    LOOP_GW:
        LODSW
        MOV AH, 10000111b
        STOSW
        LOOP LOOP_GW
        POPA
        POP DS
        POP ES
        RET
    GRAYWINDOW ENDP

    oldint8 DD 0
    NEWINT8TIMER PROC FAR
        PUSHF
        CLI
        PUSH DS
        PUSHA
        MOV AX, SEG intestingflag
        MOV DS, AX
        CMP intestingflag, 1
        JNZ NI8T_END
        MOV AX, WORD PTR testtickremain
        ADD AX, WORD PTR testtickremain+2
        JZ NI8T_END
        SUB WORD PTR testtickremain, 10
        SBB WORD PTR testtickremain+2, 0
        INC testtickcount
    NI8T_END:
        POPA
        POP DS
        POPF
        JMP CS:[oldint8]
    NEWINT8TIMER ENDP

CODE ENDS
    END MAIN


;;; Scheme translation of WSL code
(define (/foreach-wsl2wsl-1 //Depth //A/S_/Type)
 (let ((/__/O/K 1))
  (set! /__/O/K (@New_Match  /%const__wsl2wsl__1 (@I) /__/O/K))
  (cond
   ((= /__/O/K 1)
    (@Delete)))))

(define (/foreach-wsl2wsl-2 //Depth //A/S_/Type)
 (cond
  ((and (= (@ST (@I)) //T_/String) (@Starts_With? (@V (@I)) "hex 0x"))
   (@Paste_Over (@Make //T_/Expn_/Pseudo (substr (@V (@I)) 4) '())))))

(define /%const__wsl2wsl__1 (@Make 101 '() (list (@Make 9 (@Make_Name "GOBACK") '()) (@Make 10 '() '()) (@Make 12 '() (list (@Make 501 (@Make_Name "os") '()))))))
;
;==========================================================================
;FermaT Transformation System
;Copyright (C) 2001 Software Migrations Limited.
;Email: martin@gkc.org.uk
;
;This program is free software; you can redistribute it and/or modify
;it under the terms of the GNU General Public License as published by
;the Free Software Foundation; either version 3 of the License, or
;(at your option) any later version.
;
;This program is distributed in the hope that it will be useful,
;but WITHOUT ANY WARRANTY; without even the implied warranty of
;MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;GNU General Public License for more details.
;
;You should have received a copy of the GNU General Public License
;along with this program.  If not, see <http://www.gnu.org/licenses/>.
;==========================================================================
; ----------------------------------------------------------------------- 
;                           WSL Pretty Printer                            
;                                                                         
; The procedure @PP_Item(I, indent, Filename) takes a WSL program         
; (a statement sequence), an identation value, and a filename             
; and generates a WSL source file.                                        
; ----------------------------------------------------------------------- 
; For HTML hide this many comments or more: 
(set! //P/P_/Hide_/Comments 3)
; Save the current program in the given file: 
(define (@Checkpoint /file)
 (cond
  ((not (equal? /file ""))
   (display-list "Saving to file: " /file)))
 (@PP_Item (@Program) 80 /file))

(set! //H/T/M/L 0)
(set! //Base_/Name "")
(set! //Margin_/Link "")
(set! //In_/Details 0)
(set! //In_/Comment 0)
(set! //Skip_/Newline 0)
(define (@PP_Item //I /width //Filename)
 (let ((//Text_/Width-save //Text_/Width)
       (//Max_/Indent-save //Max_/Indent)
       (//Big_/Indent-save //Big_/Indent)
       (/row_no-save /row_no)
       (/col_no-save /col_no)
       (//Output_/Port-save //Output_/Port)
       (/len (string-length //Filename))
       (/registers (@Make_Set (my-map @Make_Name (list "r0" "r1" "r2" "r3" "r4" "r5" "r6" "r7" "r8" "r9" "r10" "r11" "r12" "r13" "r14" "r15"))))
       (//Keywords-save //Keywords)
       (//Max_/Split_/Line-save //Max_/Split_/Line)
       (//F/C_/Business-save //F/C_/Business)
       (//F/C_/Business_/End-save //F/C_/Business_/End)
       (//F/C_/Tech-save //F/C_/Tech)
       (//F/C_/Tech_/End-save //F/C_/Tech_/End)
       (//F/C_/Newline-save //F/C_/Newline)
       (//F/C_/Turn_/On-save //F/C_/Turn_/On)
       (//F/C_/Turn_/Off-save //F/C_/Turn_/Off)
       (/nbsp-save /nbsp)
       (/struct_p (@Make_Name "struct_p"))
       (/str ""))
  (set! //Text_/Width (quotient (* (abs /width) 2) 3))
  (set! //Max_/Indent 0)
  (set! //Big_/Indent 0)
  (set! /row_no 1)
  (set! /col_no 0)
  (set! //Output_/Port '())
  (set! //Keywords (list "IF" "THEN" "ELSIF" "ELSE" "FI" "WHILE" "DO" "OD" "BEGIN" "WHERE" "END" "PROC"))
  (set! //Max_/Split_/Line 65)
  (set! //F/C_/Business "")
  (set! //F/C_/Business_/End "")
  (set! //F/C_/Tech "<!--")
  (set! //F/C_/Tech_/End "-->")
  (set! //F/C_/Newline "")
  (set! //F/C_/Turn_/On "TURN ON")
  (set! //F/C_/Turn_/Off "TURN OFF")
  (set! /nbsp " ")
  (let ((//Qry_/P/P_/Size-save //Qry_/P/P_/Size)
        (//Qry_/P/P_/String-save //Qry_/P/P_/String)
        (//Qry_/P/P/H_/String-save //Qry_/P/P/H_/String)
        (//P/P_/N/L_/Types-save //P/P_/N/L_/Types)
        (//P/P_/O/L_/Types-save //P/P_/O/L_/Types)
        (//H/T/M/L_/Header "<HTML>
<HEAD>
<link rel='stylesheet' type='text/css' href='PrettyWSL.css'>
</HEAD>
<BODY>")
        (//H/T/M/L_/Footer "</BODY></HTML>")
        (//Printing-save //Printing)
        (//Data //Data_/File)
        (//Data_/Names-save //Data_/Names)
        (//Data_/Lengths-save //Data_/Lengths)
        (//Data_/Origlen-save //Data_/Origlen)
        (//Data_/Repeats-save //Data_/Repeats)
        (//Data_/Fields-save //Data_/Fields)
        (//Data_/Types-save //Data_/Types)
        (//Data_/Values-save //Data_/Values)
        (//Init_/Types-save //Init_/Types)
        (//Init_/Values-save //Init_/Values)
        (//Init_/String-save //Init_/String)
        (//Equ_/Symbol-save //Equ_/Symbol)
        (//D/S/E/C/T_/Tag-save //D/S/E/C/T_/Tag)
        (//Comment-save //Comment)
        (//Orig_/Name-save //Orig_/Name)
        (//C/I/C/S_/Maps-save //C/I/C/S_/Maps)
        (//Symbol_/Equ-save //Symbol_/Equ))
   (set! //Qry_/P/P_/Size (@Make_Name (string-append "Qry_PP_Size_" (@String //Text_/Width))))
   (set! //Qry_/P/P_/String (@Make_Name "Qry_PP_String"))
   (set! //Qry_/P/P/H_/String (@Make_Name "Qry_PPH_String"))
   (set! //P/P_/N/L_/Types (@Make_Set (list //T_/Comment //T_/Proc)))
   (set! //P/P_/O/L_/Types (@Make_Set (list //T_/Equal //T_/Not_/Equal //T_/Less //T_/Greater //T_/Less_/Eq //T_/Greater_/Eq //T_/In //T_/Not_/In //T_/X_/B/Funct_/Call //T_/X_/Funct_/Call)))
   (set! //Printing 1)
   (set! //Data_/Names (hash-table))
   (set! //Data_/Lengths (hash-table))
   (set! //Data_/Origlen (hash-table))
   (set! //Data_/Repeats (hash-table))
   (set! //Data_/Fields (hash-table))
   (set! //Data_/Types (hash-table))
   (set! //Data_/Values (hash-table))
   (set! //Init_/Types (hash-table))
   (set! //Init_/Values (hash-table))
   (set! //Init_/String (hash-table))
   (set! //Equ_/Symbol (hash-table))
   (set! //D/S/E/C/T_/Tag (hash-table))
   (set! //Comment (hash-table))
   (set! //Orig_/Name (hash-table))
   (set! //C/I/C/S_/Maps (hash-table))
   (set! //Symbol_/Equ (hash-table))
   (cond
    ((> /width 0)
     (set! //Max_/Indent (- /width //Text_/Width))
     (set! //Big_/Indent (+ (quotient //Max_/Indent 2) 1)))
    (#t
     (set! //Max_/Indent //Omega)
     (set! //Big_/Indent 10)))
   (cond
    ((equal? //Filename "")
     (set! //Output_/Port //Standard_/Output_/Port))
    (#t
     (set! //Output_/Port (@Open_Output_File //Filename))))
   (cond
    ((and (> /len 5) (equal? (substr //Filename (- /len 5) 5) ".html"))
     (set! //H/T/M/L 1)
     (set! //Base_/Name (substr //Filename 0 (- /len 5)))
     ; Check for LL file and rename WSL symbols to Orig_Name  
     (cond
      ((equal? //Data "")
       (set! //Data (string-append //Base_/Name ".ll"))))
     (cond
      ((@File_Exists? //Data)
       (let ((/-result- (@Load_File  //Data //Data_/Names //Data_/Lengths //Data_/Origlen //Data_/Repeats //Data_/Fields //Data_/Types //Data_/Values //Init_/Types //Init_/Values //Init_/String //Equ_/Symbol //D/S/E/C/T_/Tag //Comment //Orig_/Name //C/I/C/S_/Maps)))
        (set! //Data_/Names (car /-result-)) (set! /-result- (cdr /-result-))
        (set! //Data_/Lengths (car /-result-)) (set! /-result- (cdr /-result-))
        (set! //Data_/Origlen (car /-result-)) (set! /-result- (cdr /-result-))
        (set! //Data_/Repeats (car /-result-)) (set! /-result- (cdr /-result-))
        (set! //Data_/Fields (car /-result-)) (set! /-result- (cdr /-result-))
        (set! //Data_/Types (car /-result-)) (set! /-result- (cdr /-result-))
        (set! //Data_/Values (car /-result-)) (set! /-result- (cdr /-result-))
        (set! //Init_/Types (car /-result-)) (set! /-result- (cdr /-result-))
        (set! //Init_/Values (car /-result-)) (set! /-result- (cdr /-result-))
        (set! //Init_/String (car /-result-)) (set! /-result- (cdr /-result-))
        (set! //Equ_/Symbol (car /-result-)) (set! /-result- (cdr /-result-))
        (set! //D/S/E/C/T_/Tag (car /-result-)) (set! /-result- (cdr /-result-))
        (set! //Comment (car /-result-)) (set! /-result- (cdr /-result-))
        (set! //Orig_/Name (car /-result-)) (set! /-result- (cdr /-result-))
        (set! //C/I/C/S_/Maps (car /-result-)) (set! /-result- (cdr /-result-))))
      (#t
       (display-list "Warning: data file `" //Data "' not found!")))
     (for-in /equ (@Hash_Keys //Equ_/Symbol) 
      (puthash //Symbol_/Equ (gethash //Equ_/Symbol /equ) (union-n (gethash //Symbol_/Equ (gethash //Equ_/Symbol /equ)) (list /equ))))
     (@PH (@WS_Replace "'" //Quote //H/T/M/L_/Header))
     (@Edit)
     (@New_Program //I)
     (@Foreach_Statement /foreach-wsl2wsl-1 0 (@AS_Type) 0)
     (cond
      ((null? (@Program))
       (@New_Program (@Skips))))
     ; Hex strings: 
     (@Foreach_Expn /foreach-wsl2wsl-2 0 (@AS_Type) 0)
     (cond
      ((null? (@Program))
       (@New_Program (@Skips))))
     (@FC_Business_Tech_Process //Orig_/Name 0)
     (set! //I (@Program))
     (@Undo_Edit)
     (@PPH //I 0 0)
     (@PH //H/T/M/L_/Footer))
    (#t
     (set! //H/T/M/L 0)
     ; Check if renaming is needed 
     (cond
      ((and (< /width 0) (> (my-index "." //Filename) 0))
       (set! //Base_/Name (substr //Filename 0 (my-index "." //Filename)))
       (set! //Data (string-append //Base_/Name ".ll"))
       (cond
        ((@File_Exists? //Data)
         (display-list "Loading data file: " //Data)
         (let ((/-result- (@Load_File  //Data //Data_/Names //Data_/Lengths //Data_/Origlen //Data_/Repeats //Data_/Fields //Data_/Types //Data_/Values //Init_/Types //Init_/Values //Init_/String //Equ_/Symbol //D/S/E/C/T_/Tag //Comment //Orig_/Name //C/I/C/S_/Maps)))
          (set! //Data_/Names (car /-result-)) (set! /-result- (cdr /-result-))
          (set! //Data_/Lengths (car /-result-)) (set! /-result- (cdr /-result-))
          (set! //Data_/Origlen (car /-result-)) (set! /-result- (cdr /-result-))
          (set! //Data_/Repeats (car /-result-)) (set! /-result- (cdr /-result-))
          (set! //Data_/Fields (car /-result-)) (set! /-result- (cdr /-result-))
          (set! //Data_/Types (car /-result-)) (set! /-result- (cdr /-result-))
          (set! //Data_/Values (car /-result-)) (set! /-result- (cdr /-result-))
          (set! //Init_/Types (car /-result-)) (set! /-result- (cdr /-result-))
          (set! //Init_/Values (car /-result-)) (set! /-result- (cdr /-result-))
          (set! //Init_/String (car /-result-)) (set! /-result- (cdr /-result-))
          (set! //Equ_/Symbol (car /-result-)) (set! /-result- (cdr /-result-))
          (set! //D/S/E/C/T_/Tag (car /-result-)) (set! /-result- (cdr /-result-))
          (set! //Comment (car /-result-)) (set! /-result- (cdr /-result-))
          (set! //Orig_/Name (car /-result-)) (set! /-result- (cdr /-result-))
          (set! //C/I/C/S_/Maps (car /-result-)) (set! /-result- (cdr /-result-))))
        (#t
         (display-list "Warning: data file `" //Data "' not found!")))
       (@Edit)
       (@New_Program //I)
       (@FC_Rename //Orig_/Name)
       (set! //I (@Program))
       (@Undo_Edit)))
     (@PP //I 0 0)))
   (@PL "")
   (set! //H/T/M/L 0)
   (cond
    ((not (equal? //Filename ""))
     (@Close_Output_Port //Output_/Port)))
   (set! //Qry_/P/P_/Size //Qry_/P/P_/Size-save)
   (set! //Qry_/P/P_/String //Qry_/P/P_/String-save)
   (set! //Qry_/P/P/H_/String //Qry_/P/P/H_/String-save)
   (set! //P/P_/N/L_/Types //P/P_/N/L_/Types-save)
   (set! //P/P_/O/L_/Types //P/P_/O/L_/Types-save)
   (set! //Printing //Printing-save)
   (set! //Data_/Names //Data_/Names-save)
   (set! //Data_/Lengths //Data_/Lengths-save)
   (set! //Data_/Origlen //Data_/Origlen-save)
   (set! //Data_/Repeats //Data_/Repeats-save)
   (set! //Data_/Fields //Data_/Fields-save)
   (set! //Data_/Types //Data_/Types-save)
   (set! //Data_/Values //Data_/Values-save)
   (set! //Init_/Types //Init_/Types-save)
   (set! //Init_/Values //Init_/Values-save)
   (set! //Init_/String //Init_/String-save)
   (set! //Equ_/Symbol //Equ_/Symbol-save)
   (set! //D/S/E/C/T_/Tag //D/S/E/C/T_/Tag-save)
   (set! //Comment //Comment-save)
   (set! //Orig_/Name //Orig_/Name-save)
   (set! //C/I/C/S_/Maps //C/I/C/S_/Maps-save)
   (set! //Symbol_/Equ //Symbol_/Equ-save))
  (set! //Text_/Width //Text_/Width-save)
  (set! //Max_/Indent //Max_/Indent-save)
  (set! //Big_/Indent //Big_/Indent-save)
  (set! /row_no /row_no-save)
  (set! /col_no /col_no-save)
  (set! //Output_/Port //Output_/Port-save)
  (set! //Keywords //Keywords-save)
  (set! //Max_/Split_/Line //Max_/Split_/Line-save)
  (set! //F/C_/Business //F/C_/Business-save)
  (set! //F/C_/Business_/End //F/C_/Business_/End-save)
  (set! //F/C_/Tech //F/C_/Tech-save)
  (set! //F/C_/Tech_/End //F/C_/Tech_/End-save)
  (set! //F/C_/Newline //F/C_/Newline-save)
  (set! //F/C_/Turn_/On //F/C_/Turn_/On-save)
  (set! //F/C_/Turn_/Off //F/C_/Turn_/Off-save)
  (set! /nbsp /nbsp-save)))

; Print String and Print Line routines -- similar to @WS and @WL, but they 
; keep track of col_no and row_no 
(define (@PS /x)
 (cond
  ((string? /x)
   (set! /col_no (+ /col_no (string-length /x)))
   (cond
    ((= //Printing 1)
     (@Write /x //Output_/Port))))
  (#t
   (set! /col_no (+ /col_no (string-length (wsl-ref /x 1))))
   (cond
    ((= //Printing 0)
     #t)
    ((= //H/T/M/L 0)
     (@Write (wsl-ref /x 1) //Output_/Port))
    (#t
     (@Write (wsl-ref /x 2) //Output_/Port))))))

(define (@PL /x)
 (set! //In_/Comment 0)
 (set! /col_no 0)
 (set! /row_no (+ /row_no 1))
 (cond
  ((= //Printing 1)
   (cond
    ((= //Skip_/Newline 1)
     (@PS /x)
     (set! //Skip_/Newline 0))
    ((string? /x)
     (@Write_Line /x //Output_/Port))
    ((= //H/T/M/L 0)
     (@Write_Line (wsl-ref /x 1) //Output_/Port))
    (#t
     (@Write_Line (wsl-ref /x 2) //Output_/Port))))))

; Print HTML tag without updating col_no 
(define (@PH /str)
 (cond
  ((= //Printing 1)
   (@Write /str //Output_/Port))))

; Set up tables for a typical infix operator: 
(define (@PP_Infix /type-par /op-par /prec-par)
 (let ((/prec-save /prec)
       (/op-save /op)
       (/type-save /type))
  (set! /prec /prec-par)
  (set! /op /op-par)
  (set! /type /type-par)
  (vector-set! //P/P_/Type (- /type 1) //Type_/Infix)
  (vector-set! //P/P_/Opening (- /type 1) "(")
  (vector-set! //P/P_/Operator (- /type 1) (string-append (string-append " " /op) " "))
  (vector-set! //P/P_/Operator1 (- /type 1) "")
  (vector-set! //P/P_/Operator2 (- /type 1) (string-append /op " "))
  (vector-set! //P/P_/Sub_/Indent (- /type 1) (+ (vector-ref //P/P_/Indent (- /type 1)) (string-length (vector-ref //P/P_/Operator2 (- /type 1)))))
  (vector-set! //P/P_/Closing (- /type 1) ")")
  (vector-set! //P/P_/Prec (- /type 1) /prec)
  #t
  (set! /prec /prec-save)
  (set! /op /op-save)
  (set! /type /type-save)))

; Set up tables for a typical function-like expression or condition: 
(define (@PP_Funct /type-par /op-par)
 (let ((/op-save /op)
       (/type-save /type))
  (set! /op /op-par)
  (set! /type /type-par)
  (vector-set! //P/P_/Type (- /type 1) //Type_/Infix)
  (vector-set! //P/P_/Opening (- /type 1) (string-append /op "("))
  (vector-set! //P/P_/Indent (- /type 1) (string-length (vector-ref //P/P_/Opening (- /type 1))))
  (vector-set! //P/P_/Sub_/Indent (- /type 1) (vector-ref //P/P_/Indent (- /type 1)))
  (vector-set! //P/P_/Operator (- /type 1) ", ")
  (vector-set! //P/P_/Operator1 (- /type 1) ",")
  (vector-set! //P/P_/Operator2 (- /type 1) "")
  (vector-set! //P/P_/Closing (- /type 1) ")")
  #t
  (set! /op /op-save)
  (set! /type /type-save)))

; Set up tables for a typical proc call with VAR parameters (if split = 1): 
(define (@PP_Call /type-par /open-par /op1-par /split-par)
 (let ((/split-save /split)
       (/op1-save /op1)
       (/open-save /open)
       (/type-save /type))
  (set! /split /split-par)
  (set! /op1 /op1-par)
  (set! /open /open-par)
  (set! /type /type-par)
  (vector-set! //P/P_/Type (- /type 1) //Type_/Split)
  (vector-set! //P/P_/Split (- /type 1) /split)
  (vector-set! //P/P_/Opening (- /type 1) /open)
  (cond
   ((= /split 1)
    (vector-set! //P/P_/Operator (- /type 1) (list (string-append /op1 "(") " VAR "))
    (vector-set! //P/P_/Operator1 (- /type 1) (list (string-append /op1 "(") ""))
    (vector-set! //P/P_/Operator2 (- /type 1) (list "" "VAR ")))
   (#t
    (vector-set! //P/P_/Operator (- /type 1) (list (string-append /op1 "(")))
    (vector-set! //P/P_/Operator1 (- /type 1) (list (string-append /op1 "(")))
    (vector-set! //P/P_/Operator2 (- /type 1) (list ""))))
  (vector-set! //P/P_/Closing (- /type 1) ")")
  #t
  (set! /split /split-save)
  (set! /op1 /op1-save)
  (set! /open /open-save)
  (set! /type /type-save)))

; Set up tables for a typical Simple type: 
(define (@PP_Simple /type-par /opening /closing)
 (let ((/type-save /type))
  (set! /type /type-par)
  (vector-set! //P/P_/Type (- /type 1) //Type_/Simple)
  (vector-set! //P/P_/Opening (- /type 1) /opening)
  (vector-set! //P/P_/Closing (- /type 1) /closing)
  #t
  (set! /type /type-save)))

; Set up tables for a FILL type: 
(define (@PP_Fill /type-par /keyword)
 (let ((/type-save /type))
  (set! /type /type-par)
  (vector-set! //P/P_/Type (- /type 1) //Type_/Infix)
  (vector-set! //P/P_/Opening (- /type 1) (string-append (string-append "FILL " /keyword) " "))
  (vector-set! //P/P_/Indent (- /type 1) (string-length (vector-ref //P/P_/Opening (- /type 1))))
  (vector-set! //P/P_/Sub_/Indent (- /type 1) (vector-ref //P/P_/Indent (- /type 1)))
  (vector-set! //P/P_/Operator (- /type 1) "")
  (vector-set! //P/P_/Operator1 (- /type 1) "")
  (vector-set! //P/P_/Operator2 (- /type 1) "")
  (vector-set! //P/P_/Closing (- /type 1) " ENDFILL")
  #t
  (set! /type /type-save)))

; Backslash any Backslash or Quote characters in the string 
; (so the parser will parse it correctly) 
(define (@Fix_Quotes /str)
 (let ((/n1 (my-index //Quote /str 0))
       (/n2 (my-index //Backslash /str 0)))
  (if (equal? /n1 /n2) /str (if (< /n1 0) (concat (concat (concat (substr /str 0 /n2) //Backslash) //Backslash) (@Fix_Quotes (substr /str (+ /n2 1)))) (if (< /n2 0) (concat (concat (concat (substr /str 0 /n1) //Backslash) //Quote) (@Fix_Quotes (substr /str (+ /n1 1)))) (if (< /n1 /n2) (concat (concat (concat (substr /str 0 /n1) //Backslash) //Quote) (@Fix_Quotes (substr /str (+ /n1 1)))) (concat (concat (concat (substr /str 0 /n2) //Backslash) //Backslash) (@Fix_Quotes (substr /str (+ /n2 1))))))))))

(define (@QQ /str)
 
 (concat (concat //Quote (@Fix_Quotes /str)) //Quote))

; Compute the size required by the given item and return the result as a pair: 
; <lines, chars> where 'chars' is the number of characters on the last line. 
; 'chars' is needed so that we can check if any surrounding 'closing' keywords 
; need to be moved to the next line 
; Note that the size is independent of the current indentation. 
; Note also that we don't actually build a string until we know that 
; it will fit on one line 
; For expressions and conditions, the size may depend on the parent precidence 
; since this determines whether parentheses are needed. 
; Note that the Expressions item in an Aref is printed differently to elsewhere: 
; in the form [e1][e2][e3]... 
; Take a list of pairs of strings and return the pair of strings 
; formed by concatenating corresponding elements in each pair: 
(define (@Pairs //L)
 
 (if (null? //L) //L (if (= (gen-length //L) 1) (car //L) (if (null? (wsl-ref //L 1)) (@Pairs (cdr //L)) (@Pairs (cons (list (concat (wsl-ref (wsl-ref //L 1) 1) (wsl-ref (wsl-ref //L 2) 1)) (concat (wsl-ref (wsl-ref //L 1) 2) (wsl-ref (wsl-ref //L 2) 2))) (cdr (cdr //L))))))))

(define (@PP_Size //I /parent_prec)
 (let ((//Printing-save //Printing)
       (/row_no-save /row_no)
       (/col_no-save /col_no)
       (funct-result '()))
  (set! //Printing 0)
  (set! /row_no 1)
  (set! /col_no 0)
  (@PP //I 0 /parent_prec)
  (set! funct-result (list /row_no /col_no))
  (set! //Printing //Printing-save)
  (set! /row_no /row_no-save)
  (set! /col_no /col_no-save)
  funct-result))

(define (@PPH_Size //I /parent_prec)
 (let ((//Printing-save //Printing)
       (/row_no-save /row_no)
       (/col_no-save /col_no)
       (funct-result '()))
  (set! //Printing 0)
  (set! /row_no 1)
  (set! /col_no 0)
  (@PPH //I 0 /parent_prec)
  (set! funct-result (list /row_no /col_no))
  (set! //Printing //Printing-save)
  (set! /row_no /row_no-save)
  (set! /col_no /col_no-save)
  funct-result))

(define (@PPH //I /indent /parent_prec)
 (cond
  ((equal? (vector-ref //P/P_/Type (- (@ST //I) 1)) //Type_/Simple)
   (@PS (@H_Open (vector-ref //P/P_/Opening (- (@ST //I) 1))))
   (@PS (@Fix_Quotes (@Value_String //I)))
   (@PS (@H_Close (vector-ref //P/P_/Closing (- (@ST //I) 1)))))
  ((= //Printing 1)
   (@PPH_Calc //I /indent /parent_prec))
  (#t
   ; We only want the size, so check for a stored size 
   (let ((//Prev (@Dtable_Get //I //Qry_/P/P_/Size)))
    (cond
     ((and (not (null? //Prev)) (equal? /parent_prec (car (@Dtable_Value_Part //Prev))))
      (set! //Prev (cdr (@Dtable_Value_Part //Prev)))
      (cond
       ((= (wsl-ref //Prev 1) 1)
        (set! /col_no (+ /col_no (wsl-ref //Prev 2))))
       (#t
        (set! /row_no (- (+ /row_no (wsl-ref //Prev 1)) 1))
        (set! /col_no (wsl-ref //Prev 2)))))
     (#t
      (let ((/row_save /row_no)
            (/col_save /col_no)
            (/new '()))
       (@PPH_Calc //I /indent /parent_prec)
       (cond
        ((equal? /row_no /row_save)
         (set! /new (list /parent_prec 1 (- /col_no /col_save))))
        (#t
         (set! /new (list /parent_prec (+ (- /row_no /row_save) 1) /col_no))))
       (@Dtable_Put //I //Qry_/P/P_/Size /new))))))))

(define (@PP //I /indent /parent_prec)
 (cond
  ((equal? (vector-ref //P/P_/Type (- (@ST //I) 1)) //Type_/Simple)
   (@PS (concat (concat (vector-ref //P/P_/Opening (- (@ST //I) 1)) (@Fix_Quotes (@Value_String //I))) (vector-ref //P/P_/Closing (- (@ST //I) 1)))))
  ((= //Printing 1)
   (@PP_Calc //I /indent /parent_prec))
  (#t
   ; We only want the size, so check for a stored size 
   (let ((//Prev (@Dtable_Get //I //Qry_/P/P_/Size)))
    (cond
     ((and (not (null? //Prev)) (equal? /parent_prec (car (@Dtable_Value_Part //Prev))))
      (set! //Prev (cdr (@Dtable_Value_Part //Prev)))
      (cond
       ((= (wsl-ref //Prev 1) 1)
        (set! /col_no (+ /col_no (wsl-ref //Prev 2))))
       (#t
        (set! /row_no (- (+ /row_no (wsl-ref //Prev 1)) 1))
        (set! /col_no (wsl-ref //Prev 2)))))
     (#t
      (let ((/row_save /row_no)
            (/col_save /col_no)
            (/new '()))
       (@PP_Calc //I /indent /parent_prec)
       (cond
        ((equal? /row_no /row_save)
         (set! /new (list /parent_prec 1 (- /col_no /col_save))))
        (#t
         (set! /new (list /parent_prec (+ (- /row_no /row_save) 1) /col_no))))
       (@Dtable_Put //I //Qry_/P/P_/Size /new))))))))

(define (@PPH_Calc //I /indent /parent_prec)
 ; Check if item will fit on one line 
 ; -- first we compute the sizes of the components: 
 (let ((//S/T-save //S/T))
  (set! //S/T (@ST //I))
  (let ((/type-save /type)
        (/prec-save /prec)
        (/size-save /size)
        (/chars 0)
        (/lines 0)
        (/pair "")
        (/sizes-save /sizes)
        (/comp-save /comp)
        (/one_line 1)
        (/open-save /open)
        (/close-save /close)
        (/op-save /op)
        (/op1-save /op1)
        (/op2-save /op2)
        (/comps-save /comps)
        (/split-save /split)
        (/opening "")
        (/sub_indent-save /sub_indent)
        (/sub2_indent-save /sub2_indent)
        (/last/L 0)
        (/save_comps '()))
   (set! /type (vector-ref //P/P_/Type (- //S/T 1)))
   (set! /prec (vector-ref //P/P_/Prec (- //S/T 1)))
   (set! /size (@Size //I))
   (set! /sizes '())
   (set! /comp '())
   (set! /open (vector-ref //P/P_/Opening (- //S/T 1)))
   (set! /close (vector-ref //P/P_/Closing (- //S/T 1)))
   (set! /op (vector-ref //P/P_/Operator (- //S/T 1)))
   (set! /op1 (vector-ref //P/P_/Operator1 (- //S/T 1)))
   (set! /op2 (vector-ref //P/P_/Operator2 (- //S/T 1)))
   (set! /comps (@Components //I))
   (set! /split (vector-ref //P/P_/Split (- //S/T 1)))
   (set! /sub_indent (+ /indent (vector-ref //P/P_/Indent (- (@ST //I) 1))))
   (set! /sub2_indent (+ /indent (vector-ref //P/P_/Sub_/Indent (- (@ST //I) 1))))
   (let ((/open/L-save /open/L)
         (/close/L (string-length /close)))
    (set! /open/L (string-length /open))
    (set! /chars (@Value_Length //I))
    (cond
     ((equal? /type //Type_/Split)
      (cond
       ((or (= (@ST (car /comps)) //T_/Name) (= (@ST (car /comps)) //T_/Name_/Pat_/One) (= (@ST (car /comps)) //T_/Name_/Var_/One))
        (set! /chars (@Value_Length (car /comps))))
       ((= (@ST (car /comps)) //T_/Name_/Var_/One)
        (set! /chars (car (@PPH_Size (car /comps) /parent_prec)))))
      (let ((/-result- (@Split_Preprocess  //S/T /op /op1 /op2 /split /comps /size /close)))
       (set! /op (car /-result-)) (set! /-result- (cdr /-result-))
       (set! /op1 (car /-result-)) (set! /-result- (cdr /-result-))
       (set! /op2 (car /-result-)) (set! /-result- (cdr /-result-))
       (set! /split (car /-result-)) (set! /-result- (cdr /-result-))
       (set! /comps (car /-result-)) (set! /-result- (cdr /-result-))
       (set! /size (car /-result-)) (set! /-result- (cdr /-result-))
       (set! /close (car /-result-)) (set! /-result- (cdr /-result-)))))
    (set! /save_comps /comps)
    ; Components of a non-assoc operator must be bracketed, 
    ; so artificially increase my precidence: 
    (cond
     ((member //S/T //P/P_/Non_/Assoc_/Ops)
      (set! /prec (+ //P/P_/Prec_/Increment /prec))))
    (for-in /comp /comps 
     (begin
      (set! /sizes (cons (@PPH_Size /comp /prec) /sizes))
      (set! /lines (+ /lines (wsl-ref (wsl-ref /sizes 1) 1)))
      (set! /chars (+ /chars (wsl-ref (wsl-ref /sizes 1) 2)))
      (cond
       ((> (wsl-ref (wsl-ref /sizes 1) 1) 1)
        (set! /one_line 0)))))
    (set! /sizes (reverse /sizes))
    (cond
     ((> /chars //Text_/Width)
      (set! /one_line 0)))
    ; Check for types which must be on a line by themselves: 
    (cond
     ((and (= /one_line 1) (not (null? (intersection-n (@Stat_Types //I) //P/P_/N/L_/Types))))
      (set! /one_line 0)))
    (cond
     ((member (@ST //I) //P/P_/O/L_/Types)
      (set! /one_line 1)))
    (cond
     ((= /one_line 0)
      (@PPH_N_Lines //I /indent /parent_prec))
     (#t
      (let ((//Prev (@Dtable_Get //I //Qry_/P/P/H_/String)))
       (cond
        ((and (not (null? //Prev)) (equal? /parent_prec (car (@Dtable_Value_Part //Prev))))
         (set! /pair (car (cdr (@Dtable_Value_Part //Prev)))))
        (#t
         (set! /pair (@PPH_1_Line //I /parent_prec))
         (@Dtable_Put //I //Qry_/P/P/H_/String (list /parent_prec /pair)))))
      (cond
       ((or (<= (string-length (wsl-ref /pair 1)) //Text_/Width) (member (@ST //I) //P/P_/O/L_/Types))
        (@PS /pair))
       (#t
        (set! /comps /save_comps)
        (@PPH_N_Lines //I /indent /parent_prec)))))
    (set! /open/L /open/L-save))
   (set! /type /type-save)
   (set! /prec /prec-save)
   (set! /size /size-save)
   (set! /sizes /sizes-save)
   (set! /comp /comp-save)
   (set! /open /open-save)
   (set! /close /close-save)
   (set! /op /op-save)
   (set! /op1 /op1-save)
   (set! /op2 /op2-save)
   (set! /comps /comps-save)
   (set! /split /split-save)
   (set! /sub_indent /sub_indent-save)
   (set! /sub2_indent /sub2_indent-save))
  (set! //S/T //S/T-save)))

(define (@PP_Calc //I /indent /parent_prec)
 ; Check if item will fit on one line 
 ; -- first we compute the sizes of the components: 
 (let ((//S/T-save //S/T))
  (set! //S/T (@ST //I))
  (let ((/type-save /type)
        (/prec-save /prec)
        (/size-save /size)
        (/chars 0)
        (/lines 0)
        (/str "")
        (/sizes-save /sizes)
        (/comp-save /comp)
        (/one_line 1)
        (/open-save /open)
        (/close-save /close)
        (/op-save /op)
        (/op1-save /op1)
        (/op2-save /op2)
        (/comps-save /comps)
        (/split-save /split)
        (/opening "")
        (/sub_indent-save /sub_indent)
        (/sub2_indent-save /sub2_indent)
        (/last/L 0)
        (/save_comps '()))
   (set! /type (vector-ref //P/P_/Type (- //S/T 1)))
   (set! /prec (vector-ref //P/P_/Prec (- //S/T 1)))
   (set! /size (@Size //I))
   (set! /sizes '())
   (set! /comp '())
   (set! /open (vector-ref //P/P_/Opening (- //S/T 1)))
   (set! /close (vector-ref //P/P_/Closing (- //S/T 1)))
   (set! /op (vector-ref //P/P_/Operator (- //S/T 1)))
   (set! /op1 (vector-ref //P/P_/Operator1 (- //S/T 1)))
   (set! /op2 (vector-ref //P/P_/Operator2 (- //S/T 1)))
   (set! /comps (@Components //I))
   (set! /split (vector-ref //P/P_/Split (- //S/T 1)))
   (set! /sub_indent (+ /indent (vector-ref //P/P_/Indent (- (@ST //I) 1))))
   (set! /sub2_indent (+ /indent (vector-ref //P/P_/Sub_/Indent (- (@ST //I) 1))))
   (let ((/open/L-save /open/L)
         (/close/L (string-length /close)))
    (set! /open/L (string-length /open))
    (set! /chars (@Value_Length //I))
    (cond
     ((equal? /type //Type_/Split)
      (cond
       ((or (= (@ST (car /comps)) //T_/Name) (= (@ST (car /comps)) //T_/Name_/Pat_/One) (= (@ST (car /comps)) //T_/Name_/Var_/One))
        (set! /chars (@Value_Length (car /comps))))
       ((= (@ST (car /comps)) //T_/Name_/Var_/One)
        (set! /chars (car (@PP_Size (car /comps) /parent_prec)))))
      (let ((/-result- (@Split_Preprocess  //S/T /op /op1 /op2 /split /comps /size /close)))
       (set! /op (car /-result-)) (set! /-result- (cdr /-result-))
       (set! /op1 (car /-result-)) (set! /-result- (cdr /-result-))
       (set! /op2 (car /-result-)) (set! /-result- (cdr /-result-))
       (set! /split (car /-result-)) (set! /-result- (cdr /-result-))
       (set! /comps (car /-result-)) (set! /-result- (cdr /-result-))
       (set! /size (car /-result-)) (set! /-result- (cdr /-result-))
       (set! /close (car /-result-)) (set! /-result- (cdr /-result-)))))
    (set! /save_comps /comps)
    ; Components of a non-assoc operator must be bracketed, 
    ; so artificially increase my precidence: 
    (cond
     ((member //S/T //P/P_/Non_/Assoc_/Ops)
      (set! /prec (+ //P/P_/Prec_/Increment /prec))))
    (for-in /comp /comps 
     (begin
      (set! /sizes (cons (@PP_Size /comp /prec) /sizes))
      (set! /lines (+ /lines (wsl-ref (wsl-ref /sizes 1) 1)))
      (set! /chars (+ /chars (wsl-ref (wsl-ref /sizes 1) 2)))
      (cond
       ((> (wsl-ref (wsl-ref /sizes 1) 1) 1)
        (set! /one_line 0)))))
    (set! /sizes (reverse /sizes))
    (cond
     ((> /chars //Text_/Width)
      (set! /one_line 0)))
    (cond
     ((= /one_line 0)
      (@PP_N_Lines //I /indent /parent_prec))
     (#t
      (let ((//Prev (@Dtable_Get //I //Qry_/P/P_/String)))
       (cond
        ((and (not (null? //Prev)) (equal? /parent_prec (car (@Dtable_Value_Part //Prev))))
         (set! /str (car (cdr (@Dtable_Value_Part //Prev)))))
        (#t
         (set! /str (@PP_1_Line //I /parent_prec))
         (@Dtable_Put //I //Qry_/P/P_/String (list /parent_prec /str)))))
      (cond
       ((<= (string-length /str) //Text_/Width)
        (@PS /str))
       (#t
        (set! /comps /save_comps)
        (@PP_N_Lines //I /indent /parent_prec)))))
    (set! /open/L /open/L-save))
   (set! /type /type-save)
   (set! /prec /prec-save)
   (set! /size /size-save)
   (set! /sizes /sizes-save)
   (set! /comp /comp-save)
   (set! /open /open-save)
   (set! /close /close-save)
   (set! /op /op-save)
   (set! /op1 /op1-save)
   (set! /op2 /op2-save)
   (set! /comps /comps-save)
   (set! /split /split-save)
   (set! /sub_indent /sub_indent-save)
   (set! /sub2_indent /sub2_indent-save))
  (set! //S/T //S/T-save)))

; Note that @PP_1_Line doesn't itself store the string in the dbase 
; -- this avoids unnecessarily saving lots of small strings. 
; Note also that we need to return the whole string and then print it 
; (rather than printing the bits), so that we can store the whole string 
; in the dbase table. 
; Set up the variables, then call @PP_1_Line 
(define (@PPH_1 //I /parent_prec)
 (let ((//Prev (@Dtable_Get //I //Qry_/P/P/H_/String))
       (//S/T-save //S/T)
       (//R '())
       (funct-result '()))
  (set! //S/T (@ST //I))
  (cond
   ((and (not (null? //Prev)) (equal? /parent_prec (car (@Dtable_Value_Part //Prev))))
    (set! //R (car (cdr (@Dtable_Value_Part //Prev)))))
   (#t
    (let ((/type-save /type)
          (/prec-save /prec)
          (/size-save /size)
          (/open-save /open)
          (/close-save /close)
          (/op-save /op)
          (/op1-save /op1)
          (/op2-save /op2)
          (/comps-save /comps)
          (/split-save /split))
     (set! /type (vector-ref //P/P_/Type (- //S/T 1)))
     (set! /prec (vector-ref //P/P_/Prec (- //S/T 1)))
     (set! /size (@Size //I))
     (set! /open (vector-ref //P/P_/Opening (- //S/T 1)))
     (set! /close (vector-ref //P/P_/Closing (- //S/T 1)))
     (set! /op (vector-ref //P/P_/Operator (- //S/T 1)))
     (set! /op1 (vector-ref //P/P_/Operator1 (- //S/T 1)))
     (set! /op2 (vector-ref //P/P_/Operator2 (- //S/T 1)))
     (set! /comps (@Components //I))
     (set! /split (vector-ref //P/P_/Split (- //S/T 1)))
     (let ((/open/L-save /open/L)
           (/close/L (string-length /close)))
      (set! /open/L (string-length /open))
      (cond
       ((equal? /type //Type_/Split)
        (let ((/-result- (@Split_Preprocess  //S/T /op /op1 /op2 /split /comps /size /close)))
         (set! /op (car /-result-)) (set! /-result- (cdr /-result-))
         (set! /op1 (car /-result-)) (set! /-result- (cdr /-result-))
         (set! /op2 (car /-result-)) (set! /-result- (cdr /-result-))
         (set! /split (car /-result-)) (set! /-result- (cdr /-result-))
         (set! /comps (car /-result-)) (set! /-result- (cdr /-result-))
         (set! /size (car /-result-)) (set! /-result- (cdr /-result-))
         (set! /close (car /-result-)) (set! /-result- (cdr /-result-)))))
      (set! //R (@PPH_1_Line //I /parent_prec))
      (@Dtable_Put //I //Qry_/P/P/H_/String (list /parent_prec //R))
      (set! /open/L /open/L-save))
     (set! /type /type-save)
     (set! /prec /prec-save)
     (set! /size /size-save)
     (set! /open /open-save)
     (set! /close /close-save)
     (set! /op /op-save)
     (set! /op1 /op1-save)
     (set! /op2 /op2-save)
     (set! /comps /comps-save)
     (set! /split /split-save))))
  (set! funct-result //R)
  (set! //S/T //S/T-save)
  funct-result))

(define (@PP_1 //I /parent_prec)
 (let ((//Prev (@Dtable_Get //I //Qry_/P/P_/String))
       (//S/T-save //S/T)
       (//R "")
       (funct-result '()))
  (set! //S/T (@ST //I))
  (cond
   ((and (not (null? //Prev)) (equal? /parent_prec (car (@Dtable_Value_Part //Prev))))
    (set! //R (car (cdr (@Dtable_Value_Part //Prev)))))
   (#t
    (let ((/type-save /type)
          (/prec-save /prec)
          (/size-save /size)
          (/open-save /open)
          (/close-save /close)
          (/op-save /op)
          (/op1-save /op1)
          (/op2-save /op2)
          (/comps-save /comps)
          (/split-save /split))
     (set! /type (vector-ref //P/P_/Type (- //S/T 1)))
     (set! /prec (vector-ref //P/P_/Prec (- //S/T 1)))
     (set! /size (@Size //I))
     (set! /open (vector-ref //P/P_/Opening (- //S/T 1)))
     (set! /close (vector-ref //P/P_/Closing (- //S/T 1)))
     (set! /op (vector-ref //P/P_/Operator (- //S/T 1)))
     (set! /op1 (vector-ref //P/P_/Operator1 (- //S/T 1)))
     (set! /op2 (vector-ref //P/P_/Operator2 (- //S/T 1)))
     (set! /comps (@Components //I))
     (set! /split (vector-ref //P/P_/Split (- //S/T 1)))
     (let ((/open/L-save /open/L)
           (/close/L (string-length /close)))
      (set! /open/L (string-length /open))
      (cond
       ((equal? /type //Type_/Split)
        (let ((/-result- (@Split_Preprocess  //S/T /op /op1 /op2 /split /comps /size /close)))
         (set! /op (car /-result-)) (set! /-result- (cdr /-result-))
         (set! /op1 (car /-result-)) (set! /-result- (cdr /-result-))
         (set! /op2 (car /-result-)) (set! /-result- (cdr /-result-))
         (set! /split (car /-result-)) (set! /-result- (cdr /-result-))
         (set! /comps (car /-result-)) (set! /-result- (cdr /-result-))
         (set! /size (car /-result-)) (set! /-result- (cdr /-result-))
         (set! /close (car /-result-)) (set! /-result- (cdr /-result-)))))
      (set! //R (@PP_1_Line //I /parent_prec))
      (@Dtable_Put //I //Qry_/P/P_/String (list /parent_prec //R))
      (set! /open/L /open/L-save))
     (set! /type /type-save)
     (set! /prec /prec-save)
     (set! /size /size-save)
     (set! /open /open-save)
     (set! /close /close-save)
     (set! /op /op-save)
     (set! /op1 /op1-save)
     (set! /op2 /op2-save)
     (set! /comps /comps-save)
     (set! /split /split-save))))
  (set! funct-result //R)
  (set! //S/T //S/T-save)
  funct-result))

(set! /space (list " " " "))
; Surround the given string with the given span class, excluding spaces: 
(define (@H_SPAN /class-par /str)
 (let ((/class-save /class)
       (/p1 0)
       (/p2 (- (string-length /str) 1))
       (//R /str)
       (/nospan "()[],")
       (funct-result '()))
  (set! /class /class-par)
  (cond
   ((> /p2 0)
    (while (and (< /p1 /p2) (equal? (substr /str /p1 1) " ")) 
     (set! /p1 (+ /p1 1)))
    (while (and (< /p1 /p2) (equal? (substr /str /p2 1) " ")) 
     (set! /p2 (- /p2 1)))
    (cond
     ((and (< /p1 /p2) (member (substr /str /p1 (+ (- /p2 /p1) 1)) //Keywords))
      (set! /class "KEY")))
    (cond
     ((> /p1 /p2)
      ; str is all spaces 
     )
     ((and (equal? /p1 /p2) (>= (my-index (substr /str /p1 1) /nospan) 0))
      ; no span tags needed around this character 
     )
     (#t
      (set! //R (concat (string-append (concat (string-append (concat (string-append (substr /str 0 /p1) "<SPAN class='") /class) "'>") (@HTML (substr /str /p1 (+ (- /p2 /p1) 1)))) "</SPAN>") (substr /str (+ /p2 1))))))))
  (set! funct-result //R)
  (set! /class /class-save)
  funct-result))

(define (@H_Open /str)
 
 (list /str (@H_SPAN "OPEN" /str)))

(define (@H_Close /str)
 
 (list /str (@H_SPAN "CLOSE" /str)))

(define (@H_Op /str)
 
 (list /str (@H_SPAN "OPER" /str)))

(define (@H_Str /str)
 (let ((//R (@Fix_Quotes /str)))
  (list //R (if (@Spaces? /str) /str (string-append (string-append "<SPAN class='STRING'>" (@HTML /str)) "</SPAN>")))))

(define (@HTML /str)
 
 (if (equal? /str "") /str (if (equal? (substr /str 0 1) "<") (string-append "&lt;" (@HTML (substr /str 1))) (if (equal? (substr /str 0 1) ">") (string-append "&gt;" (@HTML (substr /str 1))) (if (equal? (substr /str 0 1) "&") (string-append "&amp;" (@HTML (substr /str 1))) (if (equal? (substr /str 0 1) //Quote) (string-append "&quot;" (@HTML (substr /str 1))) (concat (substr /str 0 1) (@HTML (substr /str 1)))))))))

; Return a pair of strings containing the value of the given item: 
(define (@H_Value //I)
 (let ((//S/T-save //S/T)
       (/str "")
       (//R '())
       (funct-result '()))
  (set! //S/T (@ST //I))
  (cond
   ((not (@Has_Value_Type? //S/T))
    (set! //R (list "" "")))
   ((= //S/T //T_/String)
    (set! //R (@H_Str (@V //I))))
   ((= //S/T //T_/Comment)
    (error "@H_Value called on a comment!"))
   ((or (= //S/T //T_/Number) (= //S/T //T_/Exit))
    (set! /str (@String (@V //I)))
    (set! //R (list /str /str)))
   ((= //S/T //T_/Name)
    (set! /str (@H_Rename (@V //I)))
    (set! //R (list /str (@H_SPAN "NAME" /str))))
   ((= //S/T //T_/Call)
    (set! /str (@H_Rename (@V //I)))
    (set! //R (list /str (@H_SPAN "CALL" /str))))
   ((or (= //S/T //T_/Variable) (= //S/T //T_/Var_/Lvalue) (= //S/T //T_/Primed_/Var))
    (set! /str (@H_Rename (@V //I)))
    (set! //R (list /str (@H_SPAN "VARIABLE" /str))))
   ((@Any_Pattern_Type? //S/T)
    (set! /str (@N_String (@V //I)))
    (set! //R (list /str /str)))
   ((or (= //S/T //T_/Expn_/Pseudo) (= //S/T //T_/Lvalue_/Pseudo) (= //S/T //T_/Cond_/Pseudo) (= //S/T //T_/Stat_/Pseudo))
    ; NB: Quotes should already be fixed in the string: 
    (set! /str (@V //I))
    (set! //R (list /str /str)))
   (#t
    (@Print_WSL //I "")
    (error "Unexpected type in @H_Value")))
  (set! funct-result //R)
  (set! //S/T //S/T-save)
  funct-result))

(define (@H_Rename /name)
 
 (if (null? (gethash //Orig_/Name /name)) (@N_String /name) (@HTML (@N_String (gethash //Orig_/Name /name)))))

; If the item has a name as first component, then return its value as a string, 
; otherwise return the empty string. 
(define (@H_Name_Value //I)
 (let ((//S/T-save //S/T)
       (/str "")
       (//R '())
       (funct-result '()))
  (set! //S/T '())
  (cond
   ((@Cs? //I)
    (set! //S/T (@ST (@Get_n //I 1)))
    (cond
     ((= //S/T //T_/Name)
      (set! /str (@N_String (@V (@Get_n //I 1))))
      (set! //R (list /str (@H_SPAN "NAME" /str))))
     ((= //S/T //T_/Name_/Pat_/One)
      (set! /str (string-append "~?" (@N_String (@V (@Get_n //I 1)))))
      (set! //R (list /str /str)))
     ((= //S/T //T_/Name_/Var_/One)
      (set! /str (string-append "~?=" (@N_String (@V (@Get_n //I 1)))))
      (set! //R (list /str /str)))
     ((= //S/T //T_/Name_/Int_/One)
      (set! /str (string-append (string-append "~?(" (car (@PPH_1 (@Get_n (@Get_n //I 1) 1) 0))) ")"))
      (set! //R (list /str /str)))
     (#t
      (set! //R (list "" "")))))
   (#t
    (set! //R (list "" ""))))
  (set! funct-result //R)
  (set! //S/T //S/T-save)
  funct-result))

; Operators split over a line: 
(define (@PP_NL /op1-par /sub_indent-par /op2-par)
 (let ((/op2-save /op2)
       (/sub_indent-save /sub_indent)
       (/op1-save /op1))
  (set! /op2 /op2-par)
  (set! /sub_indent /sub_indent-par)
  (set! /op1 /op1-par)
  (cond
   ((= //In_/Comment 1)
    (@PS "<SPAN class='CO'>")
    (@PL (@H_Op /op1))
    (@PP_Indent /sub_indent)
    (@PS (@H_Op /op2))
    (@PS "</SPAN>")
    (set! //In_/Comment 0))
   (#t
    (@PL (@H_Op /op1))
    (@PP_Indent /sub_indent)
    (@PS (@H_Op /op2))))
  (set! /op2 /op2-save)
  (set! /sub_indent /sub_indent-save)
  (set! /op1 /op1-save)))

(define (@H_Comment_Orig //I)
 (let ((/line "")
       (/str ""))
  (cond
   ((@H_FermaT? //I)
    (set! /line (substr (@V //I) 9 8))
    (set! /class "COF")
    (set! /str (string-append (concat (string-append (string-append (concat (string-append (concat (string-append (string-append (string-append "<A NAME=" (@QQ /line)) "></A>") "<A HREF=") (@QQ (concat (string-append (string-append "source/" //Base_/Name) "-asm.htm#") /line))) " TARGET=") (@QQ "_blank")) "> ") "<SPAN class='COF'>") (@WS_Replace " " /nbsp (@HTML (substr (@V //I) 0 17)))) "</SPAN></A>")))
   (#t
    (set! /str (@WS_Replace " " /nbsp (@HTML (@V //I))))))
  (string-append (string-append "<SPAN class='CO'>" /str) "</SPAN>")))

(define (@PPH_Comment //I)
 (let ((/line "")
       (/str "")
       (/arrow "&#8594;"))
  (cond
   ((@H_FermaT? //I)
    (cond
     ((= //Printing 1)
      (set! /line (substr (@V //I) 9 8))
      (set! //Margin_/Link (string-append (concat (string-append (concat (string-append (concat (string-append (string-append (string-append "<A NAME=" (@QQ /line)) "></A>") "<A HREF=") (@QQ (concat (string-append (string-append "source/" //Base_/Name) "-asm.htm#") /line))) " style=") (@QQ "text-decoration:none")) ">") /arrow) "</A>")))))
   (#t
    (cond
     ((= //Printing 1)
      (set! //In_/Comment 1)))
    (@PS (string-append (string-append "<SPAN class='CO'>" (@WS_Replace " " /nbsp (@HTML (@V //I)))) "</SPAN>"))))))

(define (@PPH_1_Line //I /parent_prec)
 (let ((//R '()))
  (cond
   ((and (= (@ST //I) //T_/Proc_/Call) (= (@Size (@Get_n //I 2)) 0) (= (@Size (@Get_n //I 3)) 0))
    (let ((/str (@PP_1 (@Get_n //I 1) /parent_prec)))
     (set! //R (list /str (string-append (string-append (concat (string-append (string-append "<A HREF=" (@QQ (string-append "#" (@N_String (@V (@Get_n //I 1)))))) ">") /str) "</A>") "()")))))
   ((and (= (@ST //I) //T_/String) (@Starts_With? (@V //I) "hex 0x"))
    (set! //R (@H_Str (substr (@V //I) 4))))
   ((equal? /type //Type_/Simple)
    (set! //R (@Pairs (list (@H_Open /open) (@H_Value //I) (@H_Close /close)))))
   ((equal? /type //Type_/Prefix)
    (cond
     ((@Cs? (@Get_n //I 1))
      (set! //R (@Pairs (list (@H_Op /op) (@H_Open /open) (@PPH_1 (@Get_n //I 1) /prec) (@H_Close /close)))))
     (#t
      (set! //R (@Pairs (list (@H_Op /op) (@PPH_1 (@Get_n //I 1) /prec)))))))
   ((equal? /type //Type_/Infix)
    (cond
     ((and (= //S/T //T_/Sequence) (= (@Size (@Get_n //I 1)) 0))
      (set! //R (@Pairs (list (@H_Open /open) /space (@H_Close /close)))))
     (#t
      ; Components of a non-assoc operator must be bracketed, 
      ; so artificially increase my precidence: 
      (let ((/new_prec /prec))
       (cond
        ((member //S/T //P/P_/Non_/Assoc_/Ops)
         (set! /new_prec (+ //P/P_/Prec_/Increment /prec))))
       (cond
        ((or (= /prec 0) (< /prec /parent_prec) (and (equal? /prec //Prec_/And) (equal? /parent_prec //Prec_/Or)))
         (set! //R (@Pairs (list (@H_Open /open) (@PPH_Join /comps /op /new_prec) (@H_Close /close)))))
        (#t
         (set! //R (@PPH_Join /comps /op /new_prec))))))))
   ((equal? /type //Type_/Split)
    (set! //R (@Pairs (list (@H_Open /open) (@H_Name_Value //I))))
    (let ((/op_1 '()))
     (for-in /op_1 /op 
      (begin
       (set! //R (@Pairs (list //R (@H_Op /op_1) (@PPH_1 (car /comps) /prec))))
       (set! /comps (cdr /comps)))))
    (set! //R (@Pairs (list //R (@H_Close /close)))))
   ((equal? /type //Type_/Ifmatch)
    (set! //R (@Pairs (list (@H_Open /open) (@PPH_1 (@Get_n //I 1) /prec))))
    (set! //R (@Pairs (list //R (@H_Op (wsl-ref /op 1)) (@PPH_1 (@Get_n //I 2) /prec))))
    ; Check if there is an ELSE clause 
    (cond
     ((and (= (@Size (@Get_n //I 3)) 1) (= (@ST (@Get_n //I 3)) //T_/Skip))
      #t)
     (#t
      (set! //R (@Pairs (list //R (@H_Op (wsl-ref /op 2)) (@PPH_1 (@Get_n //I 3) /prec))))))
    (set! //R (@Pairs (list //R (@H_Close /close)))))
   ((= //S/T //T_/Cond)
    (set! //R (@H_Open /open))
    (let ((//B '())
          (//S '()))
     (while (not (null? /comps)) 
      (begin
       ; Check for T_Guarded_Pat_XXX types (0 or 1 components): 
       (cond
        ((< (@Size (car /comps)) 2)
         (set! //R (@Pairs (list //R (@PPH_1 (car /comps) /prec))))
         (set! /comps (cdr /comps)))
        (#t
         (set! //B (@Get_n (car /comps) 1))
         (set! //S (@Get_n (car /comps) 2))
         (set! /comps (cdr /comps))
         (cond
          ((and (null? /comps) (= (@ST //B) //T_/True))
           (cond
            ((and (= (@Size //S) 1) (= (@ST (@Get_n //S 1)) //T_/Skip))
             #t)
            (#t
             (set! //R (@Pairs (list //R (@H_Op (wsl-ref /op 3)) (@PPH_1 //S /prec)))))))
          (#t
           (set! //R (@Pairs (list //R (@PPH_1 //B /prec) (@H_Op (wsl-ref /op 1)) (@PPH_1 //S /prec))))))))
       (cond
        ((and (not (null? /comps)) (or (not (null? (cdr /comps))) (< (@Size (car /comps)) 2) (not (= (@ST (@Get_n (car /comps) 1)) //T_/True))))
         (set! //R (@Pairs (list //R (@H_Op (wsl-ref /op 2)))))))))
     (set! //R (@Pairs (list //R (@H_Close /close))))))
   ((= //S/T //T_/Assignment)
    ; v := e  OR  < v1 := e1, v2 := e2 > 
    (cond
     ((= /size 1)
      (set! //R (@PPH_1 (@Get_n //I 1) /prec)))
     (#t
      (set! //R (@PPH_1 (@Make //T_/Assigns '() /comps) /prec)))))
   ((or (= //S/T //T_/Aref) (= //S/T //T_/Aref_/Lvalue))
    ; a[c1][c2] 
    (set! //R (@Pairs (list (@PPH_1 (@Get_n //I 1) /prec) (@H_Open /open) (@PPH_Join (@Cs (@Get_n //I 2)) /op /prec) (@H_Close /close)))))
   ((or (= //S/T //T_/Struct) (= //S/T //T_/Struct_/Lvalue))
    ; This is special because the second component comes first: 
    ; comp.name 
    (set! //R (@Pairs (list (@PPH_1 (@Get_n //I 2) /prec) (@H_Op /op) (@H_Value (@Get_n //I 1))))))
   ((= //S/T //T_/Where)
    ; BEGIN sts WHERE defns END 
    (set! //R (@Pairs (list (@H_Open /open) /space (@PPH_1 (@Get_n //I 1) /prec) /space (@H_Op /op) /space (@PPH_1 (@Get_n //I 2) /prec) /space (@H_Close /close)))))
   (#t
    (display-list (string-append (concat (string-append (string-append "UNRECOGNISED TYPE 3: " (@Type_Name (@ST //I))) "(") (@ST //I)) ")"))))
  //R))

(define (@PP_1_Line //I /parent_prec)
 (let ((//R ""))
  (cond
   ((= (@ST //I) //T_/String)
    (set! //R (concat (concat /open (@Fix_Quotes (@Value_String //I))) /close)))
   ((equal? /type //Type_/Simple)
    (set! //R (concat (concat /open (@Value_String //I)) /close)))
   ((equal? /type //Type_/Prefix)
    (cond
     ((@Cs? (@Get_n //I 1))
      (set! //R (concat (concat (concat /op /open) (@PP_1 (@Get_n //I 1) /prec)) /close)))
     (#t
      (set! //R (concat /op (@PP_1 (@Get_n //I 1) /prec))))))
   ((equal? /type //Type_/Infix)
    (cond
     ((and (= //S/T //T_/Sequence) (= (@Size (@Get_n //I 1)) 0))
      (set! //R (concat (string-append /open " ") /close)))
     (#t
      ; Components of a non-assoc operator must be bracketed, 
      ; so artificially increase my precidence: 
      (let ((/new_prec /prec))
       (cond
        ((member //S/T //P/P_/Non_/Assoc_/Ops)
         (set! /new_prec (+ //P/P_/Prec_/Increment /prec))))
       (cond
        ((or (= /prec 0) (< /prec /parent_prec))
         (set! //R (concat (concat /open (@PP_Join /comps /op /new_prec)) /close)))
        (#t
         (set! //R (@PP_Join /comps /op /new_prec))))))))
   ((equal? /type //Type_/Split)
    (set! //R (concat /open (@Name_Value //I)))
    (let ((/op_1 '()))
     (for-in /op_1 /op 
      (begin
       (set! //R (concat (concat //R /op_1) (@PP_1 (car /comps) /prec)))
       (set! /comps (cdr /comps)))))
    (set! //R (concat //R /close)))
   ((equal? /type //Type_/Ifmatch)
    (set! //R (concat /open (@PP_1 (@Get_n //I 1) /prec)))
    (set! //R (concat (concat //R (wsl-ref /op 1)) (@PP_1 (@Get_n //I 2) /prec)))
    ; Check if there is an ELSE clause 
    (cond
     ((and (= (@Size (@Get_n //I 3)) 1) (= (@ST (@Get_n //I 3)) //T_/Skip))
      #t)
     (#t
      (set! //R (concat (concat //R (wsl-ref /op 2)) (@PP_1 (@Get_n //I 3) /prec)))))
    (set! //R (concat //R /close)))
   ((= //S/T //T_/Cond)
    (set! //R /open)
    (let ((//B '())
          (//S '()))
     (while (not (null? /comps)) 
      (begin
       ; Check for T_Guarded_Pat_XXX types (0 or 1 components): 
       (cond
        ((< (@Size (car /comps)) 2)
         (set! //R (concat //R (@PP_1 (car /comps) /prec)))
         (set! /comps (cdr /comps)))
        (#t
         (set! //B (@Get_n (car /comps) 1))
         (set! //S (@Get_n (car /comps) 2))
         (set! /comps (cdr /comps))
         (cond
          ((and (null? /comps) (= (@ST //B) //T_/True))
           (cond
            ((and (= (@Size //S) 1) (= (@ST (@Get_n //S 1)) //T_/Skip))
             #t)
            (#t
             (set! //R (concat (concat //R (wsl-ref /op 3)) (@PP_1 //S /prec))))))
          (#t
           (set! //R (concat (concat (concat //R (@PP_1 //B /prec)) (wsl-ref /op 1)) (@PP_1 //S /prec)))))))
       (cond
        ((and (not (null? /comps)) (or (not (null? (cdr /comps))) (< (@Size (car /comps)) 2) (not (= (@ST (@Get_n (car /comps) 1)) //T_/True))))
         (set! //R (concat //R (wsl-ref /op 2)))))))
     (set! //R (concat //R /close))))
   ((= //S/T //T_/Assignment)
    ; v := e  OR  < v1 := e1, v2 := e2 > 
    (cond
     ((= /size 1)
      (set! //R (@PP_1 (@Get_n //I 1) /prec)))
     (#t
      (set! //R (@PP_1 (@Make //T_/Assigns '() /comps) /prec)))))
   ((or (= //S/T //T_/Aref) (= //S/T //T_/Aref_/Lvalue))
    ; a[c1][c2] 
    (set! //R (concat (concat (concat (@PP_1 (@Get_n //I 1) /prec) /open) (@PP_Join (@Cs (@Get_n //I 2)) /op /prec)) /close)))
   ((or (= //S/T //T_/Struct) (= //S/T //T_/Struct_/Lvalue))
    ; This is special because the second component comes first: 
    ; comp.name 
    (set! //R (concat (concat (@PP_1 (@Get_n //I 2) /prec) /op) (@N_String (@V (@Get_n //I 1))))))
   ((= //S/T //T_/Where)
    ; BEGIN sts WHERE defns END 
    (set! //R (concat (string-append (concat (string-append (concat (string-append (concat (string-append /open " ") (@PP_1 (@Get_n //I 1) /prec)) " ") /op) " ") (@PP_1 (@Get_n //I 2) /prec)) " ") /close)))
   (#t
    (display-list (string-append (concat (string-append (string-append "UNRECOGNISED TYPE 3: " (@Type_Name (@ST //I))) "(") (@ST //I)) ")"))))
  //R))

; Print the item on several lines, at the given indent. 
; Cursor starts at the indent level on the first line. 
; Cursor finishes at the end of printing on the last line. 
(define (@PPH_N_Lines //I /indent /parent_prec)
 (let ((/last/L 0)
       (/last '()))
  ; lastL is the length of the last line of the last component: 
  (set! /last/L (car (cdr (last-1 /sizes))))
  (cond
   ((or (= (@ST //I) //T_/Comment) (= (@ST //I) //T_/Proc_/Call))
    (@PS (@PPH_1_Line //I 0)))
   ((equal? /type //Type_/Simple)
    (@PS (@H_Open /open))
    (@PS (@Fix_Quotes (@Value_String //I)))
    (@PS (@H_Close /close)))
   ((equal? /type //Type_/Prefix)
    (cond
     ((@Cs? (@Get_n //I 1))
      ; Include the brackets 
      (@PS (@H_Op /op))
      (@PS (@H_Open /open))
      (@PPH (@Get_n //I 1) /sub2_indent /prec)
      (@PS (@H_Close /close)))
     (#t
      (@PS (@H_Op /op))
      (@PPH (@Get_n //I 1) /sub2_indent /prec))))
   ((equal? /type //Type_/Infix)
    ; Each component goes on a new line 
    ; Components of a non-assoc operator must be bracketed, 
    ; so artificially increase my precidence: 
    (let ((/new_prec /prec))
     (cond
      ((member //S/T //P/P_/Non_/Assoc_/Ops)
       (set! /new_prec (+ //P/P_/Prec_/Increment /prec))))
     (cond
      ((or (= /prec 0) (< /prec /parent_prec) (and (equal? /prec //Prec_/And) (equal? /parent_prec //Prec_/Or)))
       ; Include the brackets 
       (@PS (@H_Open /open))
       ; Check if the first item will fit within the indent 
       (cond
        ((and (= (wsl-ref (wsl-ref /sizes 1) 1) 1) (<= (+ (wsl-ref (wsl-ref /sizes 1) 2) /open/L) (- /sub_indent /indent)))
         (@PS (@PPH_1 (car /comps) /new_prec))
         (@PS (@H_Op /op))
         (set! /comps (cdr /comps)))))
      (#t
       ; Check if the first item will fit within the indent 
       (cond
        ((and (= (wsl-ref (wsl-ref /sizes 1) 1) 1) (<= (wsl-ref (wsl-ref /sizes 1) 2) (- /sub_indent /indent)))
         (@PS (@PPH_1 (car /comps) /new_prec))
         (@PS (@H_Op /op))
         (set! /comps (cdr /comps))))))
     (while (not (null? /comps)) 
      (begin
       ; Check for a section of comment statements: 
       (cond
        ((= (@ST (car /comps)) //T_/Comment)
         ; Take out op1 (= ';') for comments: 
         (set! /comps (@PPH_Comments  "" /sub_indent /op2 /comps)))
        (#t
         (cond
          ((and (= (@ST (car /comps)) //T_/A_/Proc_/Call) (member //T/P/F_name (@Assigned (car /comps))))
           (@PPH_TPF (car /comps) /sub2_indent /prec))
          (#t
           (@PPH (car /comps) /sub2_indent /prec)))
         (set! /last (car /comps))
         (set! /comps (cdr /comps))
         (while (and (not (null? /comps)) (@H_FermaT? (car /comps))) 
          (begin
           (@PPH_Comment (car /comps))
           (set! /comps (cdr /comps))))
         (cond
          ((>= (@H_Count_Comments /comps) //P/P_/Hide_/Comments)
           (cond
            ((not (= (@ST /last) //T_/Comment))
             (@PS /op1))))
          ((and (not (null? /comps)) (= (@ST (car /comps)) //T_/Proc))
           (@PL (list "" "")))
          ((not (null? /comps))
           (@PP_NL /op1 /sub_indent /op2)))))))
     (cond
      ((or (= /prec 0) (< /prec /parent_prec) (and (equal? /prec //Prec_/And) (equal? /parent_prec //Prec_/Or)))
       (@PP_Close /last/L /prec /indent /sub2_indent /close)))))
   ((equal? /type //Type_/Split)
    (cond
     ((= (@ST //I) //T_/Proc)
      (@PH "<HR>")
      (@PP_Indent /indent)
      (@PH (string-append (string-append "<A NAME=" (@QQ (@N_String (@V (@Get_n //I 1))))) ">"))))
    ; Check if the split items will fit on the first line 
    (let ((/chars1 0)
          (/i 0))
     (set! /chars1 (+ /open/L (@Name_Length //I)))
     (for /i 1 /split 1 
      (begin
       (cond
        ((> (wsl-ref (wsl-ref /sizes /i) 1) 1)
         (set! /chars1 (+ //Text_/Width 1))))
       (set! /chars1 (+ /chars1 (string-length (wsl-ref /op /i)) (wsl-ref (wsl-ref /sizes /i) 2)))))
     (cond
      ((<= /chars1 //Text_/Width)
       ; All the first section goes on one line 
       ; No newline if this is short. 
       (@PS (@H_Open /open))
       (@PS (@H_Name_Value //I))
       (for /i 1 /split 1 
        (begin
         (@PS (@H_Op (wsl-ref /op /i)))
         (@PS (@PPH_1 (wsl-ref /comps /i) /prec))))
       (cond
        ((< /split /size)
         (cond
          ((and (= (@ST //I) //T_/Proc) (>= (@H_Count_Comments (@Cs (@Get_n //I 4))) //P/P_/Hide_/Comments))
           (@PS (@H_Op (wsl-ref /op (+ /split 1)))))
          ((> /chars1 (- /sub_indent /indent))
           (cond
            ((and (= (@ST (wsl-ref /comps (+ /split 1))) //T_/Statements) (@H_FermaT? (@Get_n (wsl-ref /comps (+ /split 1)) 1)))
             (@PPH_Comment (@Get_n (wsl-ref /comps (+ /split 1)) 1))))
           (@PP_NL (wsl-ref /op1 (+ /split 1)) /sub_indent (wsl-ref /op2 (+ /split 1))))
          (#t
           (@PS (@H_Op (wsl-ref /op (+ /split 1)))))))))
      (#t
       ; Split the first section on each component 
       ; Check if open+val+op[1] needs to go on a separate line 
       (set! /chars1 (+ /open/L (@Name_Length //I) (string-length (wsl-ref /op 1))))
       (@PS (@H_Open /open))
       (@PS (@H_Name_Value //I))
       (cond
        ((<= /chars1 //Big_/Indent)
         ; First item goes on the first line: 
         (set! /sub3_indent (+ /indent /chars1))
         (@PS (@H_Op (wsl-ref /op 1)))
         (cond
          ((> /split 0)
           (@PPH (wsl-ref /comps 1) (+ /sub3_indent (string-length (wsl-ref /op 1))) /prec))))
        (#t
         ; First item starts on the next line: 
         (set! /sub3_indent /sub2_indent)
         (@PP_NL (wsl-ref /op1 1) /sub3_indent (wsl-ref /op2 1))
         (cond
          ((> /split 0)
           (@PPH (wsl-ref /comps 1) (+ /sub3_indent (string-length (wsl-ref /op2 1))) /prec)))))
       ; Remaining items in the first section each go on a new line 
       (for /i 2 /split 1 
        (begin
         (@PP_NL (wsl-ref /op1 /i) /sub3_indent (wsl-ref /op2 /i))
         (@PPH (wsl-ref /comps /i) (+ /sub3_indent (string-length (wsl-ref /op2 /i))) /prec)))
       (cond
        ((< /split /size)
         (@PP_NL (wsl-ref /op1 (+ /split 1)) /sub_indent (wsl-ref /op2 (+ /split 1)))))))
     (cond
      ((= (@ST //I) //T_/Proc)
       (@PH "</A>")))
     ; Print the items after the split, each on a separate line: 
     (for /i (+ /split 1) /size 1 
      (begin
       (@PPH (wsl-ref /comps /i) /sub2_indent /prec)
       (cond
        ((< /i /size)
         (@PP_NL (wsl-ref /op1 (+ /i 1)) /sub_indent (wsl-ref /op2 (+ /i 1)))))))
     (@PP_Close /last/L /prec /indent /sub2_indent /close)))
   ((equal? /type //Type_/Ifmatch)
    ; Each component goes on a separate line, 
    ; but check if we need a line for the ELSE clause 
    (@PS (@H_Open /open))
    (@PPH (@Get_n //I 1) (+ /indent /open/L) /prec)
    (@PP_NL (wsl-ref /op1 1) /sub_indent (wsl-ref /op2 1))
    (@PPH (@Get_n //I 2) /sub2_indent /prec)
    (cond
     ((and (= (@Size (@Get_n //I 3)) 1) (= (@ST (@Get_n //I 3)) //T_/Skip))
      (set! /last/L (wsl-ref (wsl-ref /sizes 2) 2)))
     (#t
      (@PP_NL (wsl-ref /op1 2) /sub_indent (wsl-ref /op2 2))
      (@PPH (@Get_n //I 3) /sub2_indent /prec)))
    (@PP_Close /last/L /prec /indent /sub2_indent /close))
   ((= //S/T //T_/Cond)
    ; Split on each THEN/ELSE: 
    (@PS (@H_Open /open))
    (let ((//B '())
          (//S '())
          (/sub3_indent-save /sub3_indent))
     (set! /sub3_indent (+ /indent /open/L))
     (while (not (null? /comps)) 
      (begin
       ; Check for T_Guarded_Pat_XXX types (0 or 1 components): 
       (cond
        ((< (@Size (car /comps)) 2)
         (@PPH (car /comps) /sub3_indent /prec)
         (set! /comps (cdr /comps)))
        (#t
         (set! //B (@Get_n (car /comps) 1))
         (set! //S (@Get_n (car /comps) 2))
         (set! /comps (cdr /comps))
         (cond
          ((and (null? /comps) (= (@ST //B) //T_/True))
           (cond
            ((and (= (@Size //S) 1) (= (@ST (@Get_n //S 1)) //T_/Skip))
             #t)
            (#t
             (@PP_NL (wsl-ref /op1 3) /sub_indent (wsl-ref /op2 3))
             (@PPH //S /sub2_indent /prec))))
          (#t
           (@PPH //B /sub3_indent /prec)
           (@PP_NL (wsl-ref /op1 1) /sub_indent (wsl-ref /op2 1))
           (@PPH //S /sub2_indent /prec)))))
       (cond
        ((and (not (null? /comps)) (or (not (null? (cdr /comps))) (< (@Size (car /comps)) 2) (not (= (@ST (@Get_n (car /comps) 1)) //T_/True))))
         (@PP_NL (wsl-ref /op1 2) /indent (wsl-ref /op2 2))
         (set! /sub3_indent (+ /indent (string-length (wsl-ref /op2 2))))))))
     (@PP_Close (car (cdr (@PPH_Size //S /prec))) /prec /indent /sub2_indent /close)
     (set! /sub3_indent /sub3_indent-save)))
   ((= //S/T //T_/Assignment)
    ; v := e  OR  < v1 := e1, v2 := e2 > 
    (cond
     ((= /size 1)
      (@PPH (@Get_n //I 1) /indent /prec))
     (#t
      ; Print the assigns 
      (@PPH (@Make //T_/Assigns '() /comps) /indent /prec))))
   ((or (= //S/T //T_/Aref) (= //S/T //T_/Aref_/Lvalue))
    ; a[x][y] 
    (@PPH (@Get_n //I 1) /indent /prec)
    (@PS /open)
    ; Check if comp1+opening will fit inside the indent: 
    (cond
     ((and (= (wsl-ref (wsl-ref /sizes 1) 1) 1) (<= (+ (wsl-ref (wsl-ref /sizes 1) 2) /open/L) (- /sub_indent /indent)))
      (set! /sub_indent (+ /indent (wsl-ref (wsl-ref /sizes 1) 2)))
      (set! /sub2_indent (+ /indent (wsl-ref (wsl-ref /sizes 1) 2) /open/L)))
     (#t
      (@PL (list "" ""))
      (@PP_Indent /sub2_indent)))
    (set! /comps (@Cs (@Get_n //I 2)))
    (set! /last/L (car (cdr (@PPH_Size (last-1 /comps) /prec))))
    (while (not (null? /comps)) 
     (begin
      (@PPH (car /comps) /sub2_indent /prec)
      (set! /comps (cdr /comps))
      (cond
       ((not (null? /comps))
        (@PP_NL /op1 /sub_indent /op2)))))
    (@PP_Close /last/L /prec /indent /sub2_indent /close))
   ((or (= //S/T //T_/Struct) (= //S/T //T_/Struct_/Lvalue))
    ; comp.name 
    (@PPH (@Get_n //I 2) /sub2_indent /prec)
    (@PP_NL "" /sub_indent /op)
    (@PS (@H_Value (@Get_n //I 1))))
   ((= //S/T //T_/Where)
    ; BEGIN stats WHERE defs END 
    (@PL (@H_Open /open))
    (@PP_Indent /sub2_indent)
    (@PPH (@Get_n //I 1) /sub2_indent /prec)
    (@PL (list "" ""))
    (cond
     (#f
      (@PL (list "" ""))
      (@PP_Indent /sub_indent)
      (@PL (@H_Op /op))
      (@PP_Indent /sub2_indent)))
    (@PPH (@Get_n //I 2) /sub2_indent /prec)
    (@PL (list "" ""))
    (@PP_Indent /sub_indent)
    (@PS (@H_Close /close)))
   (#t
    (display-list (string-append (concat (string-append (string-append "UNRECOGNISED TYPE 4: " (@Type_Name (@ST //I))) "(") (@ST //I)) ")"))))))

(define (@PP_N_Lines //I /indent /parent_prec)
 (let ((/last/L 0))
  ; lastL is the length of the last line of the last component: 
  (set! /last/L (car (cdr (last-1 /sizes))))
  (cond
   ((= (@ST //I) //T_/String)
    (@PS (concat (concat /open (@Fix_Quotes (@Value_String //I))) /close)))
   ((equal? /type //Type_/Simple)
    (@PS (concat (concat /open (@Value_String //I)) /close)))
   ((equal? /type //Type_/Prefix)
    (cond
     ((@Cs? (@Get_n //I 1))
      ; Include the brackets 
      (@PS /op)
      (@PS /open)
      (@PP (@Get_n //I 1) /sub2_indent /prec)
      (@PS /close))
     (#t
      (@PS /op)
      (@PP (@Get_n //I 1) /sub2_indent /prec))))
   ((equal? /type //Type_/Infix)
    ; Each component goes on a new line 
    ; Components of a non-assoc operator must be bracketed, 
    ; so artificially increase my precidence: 
    (let ((/new_prec /prec))
     (cond
      ((member //S/T //P/P_/Non_/Assoc_/Ops)
       (set! /new_prec (+ //P/P_/Prec_/Increment /prec))))
     (cond
      ((or (= /prec 0) (< /prec /parent_prec))
       ; Include the brackets 
       (@PS /open)
       ; Check if the first item will fit within the indent 
       (cond
        ((and (= (wsl-ref (wsl-ref /sizes 1) 1) 1) (<= (+ (wsl-ref (wsl-ref /sizes 1) 2) /open/L) (- /sub_indent /indent)))
         (@PS (@PP_1 (car /comps) /new_prec))
         (@PS /op)
         (set! /comps (cdr /comps)))))
      (#t
       ; Check if the first item will fit within the indent 
       (cond
        ((and (= (wsl-ref (wsl-ref /sizes 1) 1) 1) (<= (wsl-ref (wsl-ref /sizes 1) 2) (- /sub_indent /indent)))
         (@PS (@PP_1 (car /comps) /new_prec))
         (@PS /op)
         (set! /comps (cdr /comps))))))
     (while (not (null? /comps)) 
      (begin
       (@PP (car /comps) /sub2_indent /prec)
       (set! /comps (cdr /comps))
       (cond
        ((not (null? /comps))
         (@PL /op1)
         (@PP_Indent /sub_indent)
         (@PS /op2)))))
     (cond
      ((or (= /prec 0) (< /prec /parent_prec))
       (@PP_Close /last/L /prec /indent /sub2_indent /close)))))
   ((equal? /type //Type_/Split)
    ; Check if the split items will fit on the first line 
    (let ((/chars1 0)
          (/i 0))
     (set! /chars1 (+ /open/L (@Name_Length //I)))
     (for /i 1 /split 1 
      (begin
       (cond
        ((> (wsl-ref (wsl-ref /sizes /i) 1) 1)
         (set! /chars1 (+ //Text_/Width 1))))
       (set! /chars1 (+ /chars1 (string-length (wsl-ref /op /i)) (wsl-ref (wsl-ref /sizes /i) 2)))))
     (cond
      ((<= /chars1 //Text_/Width)
       ; All the first section goes on one line 
       ; No newline if this is short. 
       (@PS /open)
       (@PS (@Name_Value //I))
       (for /i 1 /split 1 
        (@PS (concat (wsl-ref /op /i) (@PP_1 (wsl-ref /comps /i) /prec))))
       (cond
        ((< /split /size)
         (cond
          ((> /chars1 (- /sub_indent /indent))
           (@PL (wsl-ref /op1 (+ /split 1)))
           (@PP_Indent /sub_indent)
           (@PS (wsl-ref /op2 (+ /split 1))))
          (#t
           (@PS (wsl-ref /op (+ /split 1))))))))
      (#t
       ; Split the first section on each component 
       ; Check if open+val+op[1] needs to go on a separate line 
       (set! /chars1 (+ /open/L (@Name_Length //I) (string-length (wsl-ref /op 1))))
       (@PS /open)
       (@PS (@Name_Value //I))
       (cond
        ((<= /chars1 //Big_/Indent)
         ; First item goes on the first line: 
         (set! /sub3_indent (+ /indent /chars1))
         (@PS (wsl-ref /op 1))
         (cond
          ((> /split 0)
           (@PP (wsl-ref /comps 1) (+ /sub3_indent (string-length (wsl-ref /op 1))) /prec))))
        (#t
         ; First item starts on the next line: 
         (set! /sub3_indent /sub2_indent)
         (@PL (wsl-ref /op1 1))
         (@PP_Indent /sub3_indent)
         (@PS (wsl-ref /op2 1))
         (cond
          ((> /split 0)
           (@PP (wsl-ref /comps 1) (+ /sub3_indent (string-length (wsl-ref /op2 1))) /prec)))))
       ; Remaining items in the first section each go on a new line 
       (for /i 2 /split 1 
        (begin
         (@PL (wsl-ref /op1 /i))
         (@PP_Indent /sub3_indent)
         (@PS (wsl-ref /op2 /i))
         (@PP (wsl-ref /comps /i) (+ /sub3_indent (string-length (wsl-ref /op2 /i))) /prec)))
       (cond
        ((< /split /size)
         (@PL (wsl-ref /op1 (+ /split 1)))
         (@PP_Indent /sub_indent)
         (@PS (wsl-ref /op2 (+ /split 1)))))))
     ; Print the items after the split, each on a separate line: 
     (for /i (+ /split 1) /size 1 
      (begin
       (@PP (wsl-ref /comps /i) /sub2_indent /prec)
       (cond
        ((< /i /size)
         (@PL (wsl-ref /op1 (+ /i 1)))
         (@PP_Indent /sub_indent)
         (@PS (wsl-ref /op2 (+ /i 1)))))))
     (@PP_Close /last/L /prec /indent /sub2_indent /close)))
   ((equal? /type //Type_/Ifmatch)
    ; Each component goes on a separate line, 
    ; but check if we need a line for the ELSE clause 
    (@PS /open)
    (@PP (@Get_n //I 1) (+ /indent /open/L) /prec)
    (@PL (wsl-ref /op1 1))
    (@PP_Indent /sub_indent)
    (@PS (wsl-ref /op2 1))
    (@PP (@Get_n //I 2) /sub2_indent /prec)
    (cond
     ((and (= (@Size (@Get_n //I 3)) 1) (= (@ST (@Get_n //I 3)) //T_/Skip))
      (set! /last/L (wsl-ref (wsl-ref /sizes 2) 2)))
     (#t
      (@PL (wsl-ref /op1 2))
      (@PP_Indent /sub_indent)
      (@PS (wsl-ref /op2 2))
      (@PP (@Get_n //I 3) /sub2_indent /prec)))
    (@PP_Close /last/L /prec /indent /sub2_indent /close))
   ((= //S/T //T_/Cond)
    ; Split on each THEN/ELSE: 
    (@PS /open)
    (let ((//B '())
          (//S '())
          (/sub3_indent-save /sub3_indent))
     (set! /sub3_indent (+ /indent /open/L))
     (while (not (null? /comps)) 
      (begin
       ; Check for T_Guarded_Pat_XXX types (0 or 1 components): 
       (cond
        ((< (@Size (car /comps)) 2)
         (@PP (car /comps) /sub3_indent /prec)
         (set! /comps (cdr /comps)))
        (#t
         (set! //B (@Get_n (car /comps) 1))
         (set! //S (@Get_n (car /comps) 2))
         (set! /comps (cdr /comps))
         (cond
          ((and (null? /comps) (= (@ST //B) //T_/True))
           (cond
            ((and (= (@Size //S) 1) (= (@ST (@Get_n //S 1)) //T_/Skip))
             #t)
            (#t
             (@PL (wsl-ref /op1 3))
             (@PP_Indent /sub_indent)
             (@PS (wsl-ref /op2 3))
             (@PP //S /sub2_indent /prec))))
          (#t
           (@PP //B /sub3_indent /prec)
           (@PL (wsl-ref /op1 1))
           (@PP_Indent /sub_indent)
           (@PS (wsl-ref /op2 1))
           (@PP //S /sub2_indent /prec)))))
       (cond
        ((and (not (null? /comps)) (or (not (null? (cdr /comps))) (< (@Size (car /comps)) 2) (not (= (@ST (@Get_n (car /comps) 1)) //T_/True))))
         (@PL (wsl-ref /op1 2))
         (@PP_Indent /indent)
         (@PS (wsl-ref /op2 2))
         (set! /sub3_indent (+ /indent (string-length (wsl-ref /op2 2))))))))
     (@PP_Close (car (cdr (@PP_Size //S /prec))) /prec /indent /sub2_indent /close)
     (set! /sub3_indent /sub3_indent-save)))
   ((= //S/T //T_/Assignment)
    ; v := e  OR  < v1 := e1, v2 := e2 > 
    (cond
     ((= /size 1)
      (@PP (@Get_n //I 1) /indent /prec))
     (#t
      ; Print the assigns 
      (@PP (@Make //T_/Assigns '() /comps) /indent /prec))))
   ((or (= //S/T //T_/Aref) (= //S/T //T_/Aref_/Lvalue))
    ; a[x][y] 
    (@PP (@Get_n //I 1) /indent /prec)
    (@PS /open)
    ; Check if comp1+opening will fit inside the indent: 
    (cond
     ((and (= (wsl-ref (wsl-ref /sizes 1) 1) 1) (<= (+ (wsl-ref (wsl-ref /sizes 1) 2) /open/L) (- /sub_indent /indent)))
      (set! /sub_indent (+ /indent (wsl-ref (wsl-ref /sizes 1) 2)))
      (set! /sub2_indent (+ /indent (wsl-ref (wsl-ref /sizes 1) 2) /open/L)))
     (#t
      (@PL "")
      (@PP_Indent /sub2_indent)))
    (set! /comps (@Cs (@Get_n //I 2)))
    (set! /last/L (car (cdr (@PP_Size (last-1 /comps) /prec))))
    (while (not (null? /comps)) 
     (begin
      (@PP (car /comps) /sub2_indent /prec)
      (set! /comps (cdr /comps))
      (cond
       ((not (null? /comps))
        (@PL /op1)
        (@PP_Indent /sub_indent)
        (@PS /op2)))))
    (@PP_Close /last/L /prec /indent /sub2_indent /close))
   ((or (= //S/T //T_/Struct) (= //S/T //T_/Struct_/Lvalue))
    ; comp.name 
    (@PP (@Get_n //I 2) /sub2_indent /prec)
    (@PL "")
    (@PP_Indent /sub_indent)
    (@PS (concat /op (@N_String (@V (@Get_n //I 1))))))
   ((= //S/T //T_/Where)
    ; BEGIN stats WHERE defs END 
    (@PL /open)
    (@PP_Indent /sub2_indent)
    (@PP (@Get_n //I 1) /sub2_indent /prec)
    (@PL "")
    (@PP_Indent /sub_indent)
    (@PL /op)
    (@PP_Indent /sub2_indent)
    (@PP (@Get_n //I 2) /sub2_indent /prec)
    (@PL "")
    (@PP_Indent /sub_indent)
    (@PS /close))
   (#t
    (display-list (string-append (concat (string-append (string-append "UNRECOGNISED TYPE 4: " (@Type_Name (@ST //I))) "(") (@ST //I)) ")"))))))

; Check if the closing string needs to go on a new line: 
; Have just printed `chars' at indent `sub_indent', if there is enough space 
; for `closing' then print it, otherwise start a new line and print `closing' 
; at indent `indent'. In the latter case, strip an initial space from `closing' 
(define (@PP_Close /chars /prec-par /indent /sub_indent-par /closing)
 (let ((/sub_indent-save /sub_indent)
       (/prec-save /prec))
  (set! /sub_indent /sub_indent-par)
  (set! /prec /prec-par)
  (let ((/len (string-length /closing)))
   (cond
    ((and (= //H/T/M/L 1) (or (equal? /closing " FI") (equal? /closing " OD") (equal? /closing " END")))
     ; Put on next line for HTML: 
     (@PL (list "" ""))
     (@PP_Indent /indent)
     (@PS (@H_Close (substr /closing 1))))
    ((or (<= /len 1) (and (<= (+ (- /sub_indent /indent) /chars /len) //Text_/Width) (equal? //Margin_/Link "")))
     (@PS (@H_Close /closing)))
    (#t
     (set! //In_/Details 0)
     (@PL (list "" ""))
     (@PP_Indent /indent)
     (cond
      ((and (> /len 0) (equal? (substr /closing 0 1) " "))
       (@PS (@H_Close (substr /closing 1))))
      (#t
       (@PS (@H_Close /closing)))))))
  (set! /sub_indent /sub_indent-save)
  (set! /prec /prec-save)))

; Print the appropriate number of indentation spaces: 
(define (@PP_Indent /indent)
 (cond
  ((= //H/T/M/L 0)
   (@PS (substr //Spaces 0 (modulo /indent //Max_/Indent))))
  (#t
   (set! /col_no (+ /col_no /indent))
   (cond
    ((and (not (equal? //Margin_/Link "")) (= //In_/Details 0) (= //Printing 1))
     (@PH //Margin_/Link)
     (set! //Margin_/Link ""))
    (#t
     (@PH /nbsp))
    (#t
     ; Version for variable-width fonts: 
     (@PH (string-append (string-append "<span style=" (@QQ "color: white")) ">&#8594;</span>"))))
   (for /i 1 /indent 1 
    (@PH /nbsp)))))

; Is this item a FermaT comment? 
(define (@H_FermaT? //I)
 
 (and (= (@ST //I) //T_/Comment) (> (string-length (@V //I)) 17) (equal? (substr (@V //I) 0 9) "<FermaT> ")))

; Pretty-print one or more HTML comments at the start of comps, one per line: 
(define (@PPH_Comments /op1-par /sub_indent-par /op2-par /comps-par)
 (let ((/comps-save /comps)
       (/op2-save /op2)
       (/sub_indent-save /sub_indent)
       (/op1-save /op1)
       (funct-result '()))
  (set! /comps /comps-par)
  (set! /op2 /op2-par)
  (set! /sub_indent /sub_indent-par)
  (set! /op1 /op1-par)
  (let ((/n 0)
        (/comments '())
        (/indent_str ""))
   (while (and (not (null? /comps)) (= (@ST (car /comps)) //T_/Comment)) 
    (begin
     (cond
      ((@H_FermaT? (car /comps))
       (@PPH_Comment (car /comps)))
      (#t
       (set! /comments (cons (car /comps) /comments))))
     (set! /comps (cdr /comps))))
   (set! /n (gen-length /comments))
   (cond
    ((= /n 0)
     ; There were only FermaT comments 
    )
    (#t
     ; Put any FermaT comment link after the comments, not on the first comment! 
     (set! //In_/Details 1)
     (cond
      ((>= /n //P/P_/Hide_/Comments)
       (set! //In_/Details 1)
       (set! /indent_str "")
       (for /i 1 (- /sub_indent 1) 1 
        (set! /indent_str (concat /indent_str /nbsp)))
       (@PH (string-append (string-append (concat (string-append (string-append "<BR><DETAILS class='CO'><SUMMARY>" /indent_str) "===== ") (@String /n)) " Comments hidden (click to expand)") " =====</SUMMARY>"))
       (@PP_Indent /sub_indent)
       (@PS (@H_Op /op2))))
     (set! /comments (reverse /comments))
     (while (not (null? /comments)) 
      (begin
       (@PPH_Comment (car /comments))
       (set! /comments (cdr /comments))
       (cond
        ((not (null? /comments))
         (@PP_NL /op1 /sub_indent /op2)))))
     (cond
      ((and (>= /n //P/P_/Hide_/Comments) (not (null? /comps)))
       (@PL (@H_Op /op1))
       (@PH "</DETAILS>")
       (set! //In_/Details 0)
       (set! //In_/Comment 0)
       (@PP_Indent /sub_indent)
       (@PS (@H_Op /op2)))
      ((and (>= /n //P/P_/Hide_/Comments) (null? /comps))
       ; We have to put a newline here at the end of the list 
       ; so suppress the newline which would start the next section: 
       (@PH "</DETAILS>")
       (set! //In_/Details 0)
       (set! //In_/Comment 0)
       (cond
        ((= //Printing 1)
         (set! //Skip_/Newline 1))))
      ((not (null? /comps))
       (set! //In_/Details 0)
       (@PP_NL /op1 /sub_indent /op2))
      (#t
       (set! //In_/Details 0))))))
  (set! funct-result /comps)
  (set! /comps /comps-save)
  (set! /op2 /op2-save)
  (set! /sub_indent /sub_indent-save)
  (set! /op1 /op1-save)
  funct-result))

; Count the number of normal comments at the start of comps 
(define (@H_Count_Comments /comps-par)
 (let ((/comps-save /comps)
       (/n 0)
       (funct-result '()))
  (set! /comps /comps-par)
  (while (and (not (null? /comps)) (= (@ST (car /comps)) //T_/Comment)) 
   (begin
    (cond
     ((not (@H_FermaT? (car /comps)))
      (set! /n (+ /n 1))))
    (set! /comps (cdr /comps))))
  (set! funct-result /n)
  (set! /comps /comps-save)
  funct-result))

; Pretty-print the given components on one line, with the given operator: 
(define (@PPH_Join /comps-par /op-par /prec-par)
 (let ((/prec-save /prec)
       (/op-save /op)
       (/comps-save /comps)
       (//R (list "" ""))
       (funct-result '()))
  (set! /prec /prec-par)
  (set! /op /op-par)
  (set! /comps /comps-par)
  (while (not (null? /comps)) 
   (begin
    (set! //R (@Pairs (list //R (@PPH_1 (car /comps) /prec))))
    (set! /comps (cdr /comps))
    (cond
     ((not (null? /comps))
      (set! //R (@Pairs (list //R (@H_Op /op))))))))
  (set! funct-result //R)
  (set! /prec /prec-save)
  (set! /op /op-save)
  (set! /comps /comps-save)
  funct-result))

; Current item is a !P which is a TPF macro 
(define (@PPH_TPF //I /indent /prec-par)
 (let ((/prec-save /prec))
  (set! /prec /prec-par)
  (let ((/open-save /open)
        (/close-save /close))
   (set! /open "<SPAN class='TPF'>")
   (set! /close "</SPAN>")
   (@PH /open)
   (@PS (@HTML (@N_String (@V (@Get_n //I 1)))))
   (cond
    ((and (equal? (@V (@Get_n //I 1)) (@Make_Name "SENDA")) (> (@Size (@Get_n //I 2)) 0) (= (@ST (@Get_n (@Get_n //I 2) 1)) //T_/String) (@Starts_With? (@V (@Get_n (@Get_n //I 2) 1)) "MSG='"))
     (@PS (string-append " " (substr (@V (@Get_n (@Get_n //I 2) 1)) 4))))
    ((>= (@Size (@Get_n //I 2)) 1)
     (@PS " ")
     (@PS (@HTML (@PP_1 (@Get_n (@Get_n //I 2) 1) /prec)))))
   (@PH /close)
   ; Check for a descriptive string: 
   (for-in /comp (@Cs (@Get_n //I 2)) 
    (begin
     (cond
      ((and (= (@ST /comp) //T_/String) (@Starts_With? (@V /comp) "CALL={"))
       (@PL (list "" ""))
       (@PP_Indent /indent)
       (@PH /open)
       (@PH (@HTML (substr (@V /comp) 5)))
       (@PH /close)))
     (cond
      ((and (= (@ST /comp) //T_/String) (@Starts_With? (@V /comp) "DESC={"))
       (@PL (list "" ""))
       (@PP_Indent /indent)
       (@PH /open)
       (@PH (@HTML (substr (@V /comp) 5)))
       (@PH /close)))))
   (set! /open /open-save)
   (set! /close /close-save))
  (set! /prec /prec-save)))

(define (@PP_Join /comps-par /op-par /prec-par)
 (let ((/prec-save /prec)
       (/op-save /op)
       (/comps-save /comps)
       (//R "")
       (funct-result '()))
  (set! /prec /prec-par)
  (set! /op /op-par)
  (set! /comps /comps-par)
  (while (not (null? /comps)) 
   (begin
    (set! //R (concat //R (@PP_1 (car /comps) /prec)))
    (set! /comps (cdr /comps))
    (cond
     ((not (null? /comps))
      (set! //R (concat //R /op))))))
  (set! funct-result //R)
  (set! /prec /prec-save)
  (set! /op /op-save)
  (set! /comps /comps-save)
  funct-result))

; Pre-process a split item to delete empty lvalues (and the corresponding op) 
; This applies to 2nd and subsequent elements only 
; For MW Proc/Funct calls, also delete first element (if empty) 
; This omits the brackets in @I etc. 
; Also, delete an initial T_Name from the comps list. 
(define (@Split_Preprocess //S/T-par /op-par /op1-par /op2-par /split-par /comps-par /size-par /close-par)
 (let ((/close-save /close)
       (/size-save /size)
       (/comps-save /comps)
       (/split-save /split)
       (/op2-save /op2)
       (/op1-save /op1)
       (/op-save /op)
       (//S/T-save //S/T)
       (funct-result '()))
  (set! /close /close-par)
  (set! /size /size-par)
  (set! /comps /comps-par)
  (set! /split /split-par)
  (set! /op2 /op2-par)
  (set! /op1 /op1-par)
  (set! /op /op-par)
  (set! //S/T //S/T-par)
  (let ((/i 0)
        (/n 0))
   (cond
    ((or (= (@ST (car /comps)) //T_/Name) (= (@ST (car /comps)) //T_/Name_/Pat_/One) (= (@ST (car /comps)) //T_/Name_/Int_/One) (= (@ST (car /comps)) //T_/Name_/Var_/One))
     (set! /comps (cdr /comps))
     (set! /size (- /size 1))))
   (for /i 2 (gen-length /comps) 1 
    (cond
     ((and (= (@ST (wsl-ref /comps /i)) //T_/Lvalues) (= (@Size (wsl-ref /comps /i)) 0))
      (set! /n /i))))
   (cond
    ((> /n 0)
     (set! /op (concat (@Sub_Seg /op 1 (- /n 1)) (@Final_Seg /op (+ /n 1))))
     (set! /op1 (concat (@Sub_Seg /op1 1 (- /n 1)) (@Final_Seg /op1 (+ /n 1))))
     (set! /op2 (concat (@Sub_Seg /op2 1 (- /n 1)) (@Final_Seg /op2 (+ /n 1))))
     (set! /comps (concat (@Sub_Seg /comps 1 (- /n 1)) (@Final_Seg /comps (+ /n 1))))
     (set! /size (- /size 1))
     (cond
      ((<= /n /split)
       (set! /split (- /split 1))))))
   (cond
    ((and (member //S/T //P/P_/No_/Parentheses) (= /size 1) (= (@Size (car /comps)) 0))
     ; Remove the ()s 
     (wsl-set! /op "" 1)
     (wsl-set! /op1 "" 1)
     (wsl-set! /op2 "" 1)
     (set! /close ""))))
  (set! funct-result (list /op /op1 /op2 /split /comps /size /close))
  (set! /close /close-save)
  (set! /size /size-save)
  (set! /comps /comps-save)
  (set! /split /split-save)
  (set! /op2 /op2-save)
  (set! /op1 /op1-save)
  (set! /op /op-save)
  (set! //S/T //S/T-save)
  funct-result))

; Initialisation section: (was @PP_Init): 
(let ((/type-save /type))
 (set! /type 0)
 (set! //Spaces "                                                             ")
 (set! //Spaces (concat (concat (concat //Spaces //Spaces) //Spaces) //Spaces))
 ; The different types of layout: 
 (set! //Type_/Special 0)
 ; Special case code for each specific type. 
 (set! //Type_/Simple 1)
 ; Just print the Opening string, plus the value (if any), plus the Closing 
 (set! //Type_/Prefix 2)
 ; Opening Operator comp1 Closing 
 ; A Type_Prefix item only has one component. 
 (set! //Type_/Infix 3)
 ; Opening comp1 Operator comp2 ... Closing 
 ; If we have to split onto several lines, then Operator1 goes 
 ; at the end of one line and Operator2 at the beginning of the next. 
 (set! //Type_/Split 4)
 ; possibly split the item into two parts (if first part fits on one line) 
 ; opening+value+op1+comp1+op2+comp2+...+opN+compN+closing 
 ; Eg if split = 1 and first part fits on one line: 
 ; opening+value+op1+comp1+op2 
 ;    comp2+...+opN+compN+closing 
 ; The Split types have a fixed number of components, the PP_Operator 
 ; arrays contain a list of operators (one per component) 
 (set! //Type_/Ifmatch 5)
 ; Opening comp1 op1 comp2 op2 comp3 Closing 
 ; If comp3 is a single SKIP, then the ELSE comp3 may be omitted. 
 (set! //P/P_/Type (make-vector-eval 1999 0))
 ; For Type_Infix, the default values: 
 (set! //P/P_/Opening (make-vector-eval 1999 ""))
 (set! //P/P_/Indent (make-vector-eval 1999 2))
 (set! //P/P_/Sub_/Indent (make-vector-eval 1999 2))
 (set! //P/P_/Split (make-vector-eval 1999 0))
 (set! //P/P_/Operator (make-vector-eval 1999 ""))
 (set! //P/P_/Operator1 (make-vector-eval 1999 ""))
 (set! //P/P_/Operator2 (make-vector-eval 1999 ""))
 (set! //P/P_/Closing (make-vector-eval 1999 ""))
 (set! //P/P_/Prec (make-vector-eval 1999 0))
 ; PP_Indent is the indentation for each operator, 
 ; PP_Sub_Indent is the indentation for each sub-component. 
 ; Data for each type: 
 (vector-set! //P/P_/Type (- //T_/Statements 1) //Type_/Infix)
 (vector-set! //P/P_/Operator (- //T_/Statements 1) "; ")
 (vector-set! //P/P_/Operator1 (- //T_/Statements 1) ";")
 (vector-set! //P/P_/Indent (- //T_/Statements 1) 0)
 (vector-set! //P/P_/Sub_/Indent (- //T_/Statements 1) 0)
 (vector-set! //P/P_/Type (- //T_/Expressions 1) //Type_/Infix)
 (vector-set! //P/P_/Operator (- //T_/Expressions 1) ", ")
 (vector-set! //P/P_/Operator1 (- //T_/Expressions 1) ",")
 (vector-set! //P/P_/Indent (- //T_/Expressions 1) 0)
 (vector-set! //P/P_/Sub_/Indent (- //T_/Expressions 1) 0)
 (vector-set! //P/P_/Type (- //T_/Lvalues 1) //Type_/Infix)
 (vector-set! //P/P_/Operator (- //T_/Lvalues 1) ", ")
 (vector-set! //P/P_/Operator1 (- //T_/Lvalues 1) ",")
 ; The assignment statement is special, all other assigns include the <...> 
 (vector-set! //P/P_/Type (- //T_/Assigns 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Assigns 1) "< ")
 (vector-set! //P/P_/Operator (- //T_/Assigns 1) ", ")
 (vector-set! //P/P_/Operator1 (- //T_/Assigns 1) ",")
 (vector-set! //P/P_/Closing (- //T_/Assigns 1) " >")
 (vector-set! //P/P_/Type (- //T_/Definitions 1) //Type_/Infix)
 (vector-set! //P/P_/Operator (- //T_/Definitions 1) " ")
 (vector-set! //P/P_/Operator1 (- //T_/Definitions 1) "")
 (vector-set! //P/P_/Indent (- //T_/Definitions 1) 0)
 (vector-set! //P/P_/Sub_/Indent (- //T_/Definitions 1) 0)
 (vector-set! //P/P_/Type (- //T_/Assign 1) //Type_/Infix)
 (vector-set! //P/P_/Operator (- //T_/Assign 1) " := ")
 (vector-set! //P/P_/Operator1 (- //T_/Assign 1) "")
 (vector-set! //P/P_/Operator2 (- //T_/Assign 1) ":= ")
 (vector-set! //P/P_/Sub_/Indent (- //T_/Assign 1) 5)
 ; Note that the -> operators are spaced to the same size as a THEN 
 (vector-set! //P/P_/Type (- //T_/Guarded 1) //Type_/Infix)
 (vector-set! //P/P_/Operator (- //T_/Guarded 1) "  ->  ")
 (vector-set! //P/P_/Operator2 (- //T_/Guarded 1) "  -> ")
 (@PP_Simple //T_/Abort "ABORT" "")
 (@PP_Simple //T_/Skip "SKIP" "")
 (@PP_Simple //T_/True "TRUE" "")
 (@PP_Simple //T_/False "FALSE" "")
 (@PP_Simple //T_/Hash_/Table "HASH_TABLE" "")
 (@PP_Simple //T_/Expn_/Place "$Expn$" "")
 (@PP_Simple //T_/Var_/Place "$Var$" "")
 (@PP_Simple //T_/Cond_/Place "$Condition$" "")
 (@PP_Simple //T_/Stat_/Place "$Statement$" "")
 (@PP_Simple //T_/Expn_/Pseudo "" "")
 (@PP_Simple //T_/Lvalue_/Pseudo "" "")
 (@PP_Simple //T_/Stat_/Pseudo "" "")
 (@PP_Simple //T_/Cond_/Pseudo "" "")
 (for-in /type (list //T_/Stat_/Pat_/One //T_/Expn_/Pat_/One //T_/Cond_/Pat_/One //T_/Defn_/Pat_/One //T_/Lvalue_/Pat_/One //T_/Assign_/Pat_/One //T_/Guarded_/Pat_/One //T_/Action_/Pat_/One //T_/Name_/Pat_/One) 
  (begin
   (vector-set! //P/P_/Type (- /type 1) //Type_/Simple)
   (vector-set! //P/P_/Opening (- /type 1) "~?")))
 (for-in /type (list //T_/Stat_/Pat_/Many //T_/Expn_/Pat_/Many //T_/Cond_/Pat_/Many //T_/Defn_/Pat_/Many //T_/Lvalue_/Pat_/Many //T_/Assign_/Pat_/Many //T_/Guarded_/Pat_/Many //T_/Action_/Pat_/Many) 
  (begin
   (vector-set! //P/P_/Type (- /type 1) //Type_/Simple)
   (vector-set! //P/P_/Opening (- /type 1) "~+")))
 (for-in /type (list //T_/Stat_/Pat_/Any //T_/Expn_/Pat_/Any //T_/Cond_/Pat_/Any //T_/Defn_/Pat_/Any //T_/Lvalue_/Pat_/Any //T_/Assign_/Pat_/Any //T_/Guarded_/Pat_/Any //T_/Action_/Pat_/Any) 
  (begin
   (vector-set! //P/P_/Type (- /type 1) //Type_/Simple)
   (vector-set! //P/P_/Opening (- /type 1) "~*")))
 (for-in /type (list //T_/Stat_/Var_/One //T_/Expn_/Var_/One //T_/Cond_/Var_/One //T_/Defn_/Var_/One //T_/Lvalue_/Var_/One //T_/Assign_/Var_/One //T_/Guarded_/Var_/One //T_/Action_/Var_/One //T_/Name_/Var_/One) 
  (begin
   (vector-set! //P/P_/Type (- /type 1) //Type_/Simple)
   (vector-set! //P/P_/Opening (- /type 1) "~?=")))
 (for-in /type (list //T_/Stat_/Var_/Any //T_/Expn_/Var_/Any //T_/Cond_/Var_/Any //T_/Defn_/Var_/Any //T_/Lvalue_/Var_/Any //T_/Assign_/Var_/Any //T_/Guarded_/Var_/Any //T_/Action_/Var_/Any) 
  (begin
   (vector-set! //P/P_/Type (- /type 1) //Type_/Simple)
   (vector-set! //P/P_/Opening (- /type 1) "~*=")))
 (for-in /type (list //T_/Stat_/Int_/One //T_/Expn_/Int_/One //T_/Cond_/Int_/One //T_/Defn_/Int_/One //T_/Lvalue_/Int_/One //T_/Assign_/Int_/One //T_/Guarded_/Int_/One //T_/Action_/Int_/One //T_/Name_/Int_/One) 
  (@PP_Funct /type "~?"))
 (for-in /type (list //T_/Stat_/Int_/Any //T_/Expn_/Int_/Any //T_/Cond_/Int_/Any //T_/Defn_/Int_/Any //T_/Lvalue_/Int_/Any //T_/Assign_/Int_/Any //T_/Guarded_/Int_/Any //T_/Action_/Int_/Any) 
  (@PP_Funct /type "~*"))
 ; Simple function-like types: opening+value+?(comp1 VAR comp2) 
 ; Split on the VAR (if there are two components) 
 ; If there is one component, split = 0 
 (@PP_Call //T_/Print "PRINT" "" 0)
 (@PP_Call //T_/Prinflush "PRINFLUSH" "" 0)
 (@PP_Call //T_/Error "ERROR" "" 0)
 (@PP_Call //T_/A_/Proc_/Call "!P " "" 1)
 (@PP_Call //T_/Proc_/Call "" "" 1)
 (@PP_Call //T_/M/W_/Proc_/Call "" "" 1)
 (@PP_Call //T_/X_/Proc_/Call "!XP " "" 0)
 (@PP_Call //T_/X_/Funct_/Call "!XF " "" 0)
 (@PP_Call //T_/M/W_/Funct_/Call "" "" 0)
 (@PP_Call //T_/Funct_/Call "" "" 0)
 (@PP_Call //T_/X_/B/Funct_/Call "!XC " "" 0)
 (@PP_Call //T_/M/W_/B/Funct_/Call "" "" 0)
 (@PP_Call //T_/B/Funct_/Call "" "" 0)
 (vector-set! //P/P_/Type (- //T_/Assert 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Assert 1) "{")
 (vector-set! //P/P_/Closing (- //T_/Assert 1) "}")
 (vector-set! //P/P_/Indent (- //T_/Assert 1) 1)
 (vector-set! //P/P_/Sub_/Indent (- //T_/Assert 1) 1)
 ; The assignment statement omits the <...> if there is one assign: 
 (vector-set! //P/P_/Type (- //T_/Assignment 1) //Type_/Special)
 (vector-set! //P/P_/Type (- //T_/A_/S 1) //Type_/Split)
 (vector-set! //P/P_/Split (- //T_/A_/S 1) 0)
 (vector-set! //P/P_/Opening (- //T_/A_/S 1) "ACTIONS ")
 (vector-set! //P/P_/Operator (- //T_/A_/S 1) (list ": "))
 (vector-set! //P/P_/Operator1 (- //T_/A_/S 1) (list ":"))
 (vector-set! //P/P_/Operator2 (- //T_/A_/S 1) (list ""))
 (vector-set! //P/P_/Closing (- //T_/A_/S 1) " ENDACTIONS")
 (vector-set! //P/P_/Type (- //T_/Actions 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Actions 1) "")
 (vector-set! //P/P_/Operator (- //T_/Actions 1) " ")
 (vector-set! //P/P_/Indent (- //T_/Actions 1) 0)
 (vector-set! //P/P_/Sub_/Indent (- //T_/Actions 1) 0)
 (vector-set! //P/P_/Closing (- //T_/Actions 1) "")
 (vector-set! //P/P_/Type (- //T_/Action 1) //Type_/Split)
 (vector-set! //P/P_/Split (- //T_/Action 1) 0)
 (vector-set! //P/P_/Operator (- //T_/Action 1) (list " == "))
 (vector-set! //P/P_/Operator1 (- //T_/Action 1) (list " =="))
 (vector-set! //P/P_/Operator2 (- //T_/Action 1) (list ""))
 (vector-set! //P/P_/Closing (- //T_/Action 1) " END")
 (vector-set! //P/P_/Type (- //T_/Map 1) //Type_/Split)
 (vector-set! //P/P_/Split (- //T_/Map 1) 0)
 (vector-set! //P/P_/Opening (- //T_/Map 1) (string-append "MAP(" //Quote))
 (vector-set! //P/P_/Operator (- //T_/Map 1) (list (string-append //Quote ", ")))
 (vector-set! //P/P_/Operator1 (- //T_/Map 1) (list (string-append //Quote ",")))
 (vector-set! //P/P_/Operator2 (- //T_/Map 1) (list ""))
 (vector-set! //P/P_/Closing (- //T_/Map 1) ")")
 (vector-set! //P/P_/Type (- //T_/Reduce 1) //Type_/Split)
 (vector-set! //P/P_/Opening (- //T_/Reduce 1) (string-append "REDUCE(" //Quote))
 (vector-set! //P/P_/Split (- //T_/Reduce 1) 0)
 (vector-set! //P/P_/Operator (- //T_/Reduce 1) (list (string-append //Quote ", ")))
 (vector-set! //P/P_/Operator1 (- //T_/Reduce 1) (list (string-append //Quote ",")))
 (vector-set! //P/P_/Operator2 (- //T_/Reduce 1) (list ""))
 (vector-set! //P/P_/Closing (- //T_/Reduce 1) ")")
 (vector-set! //P/P_/Type (- //T_/Maphash 1) //Type_/Split)
 (vector-set! //P/P_/Split (- //T_/Maphash 1) 0)
 (vector-set! //P/P_/Opening (- //T_/Maphash 1) (string-append "MAPHASH(" //Quote))
 (vector-set! //P/P_/Operator (- //T_/Maphash 1) (list (string-append //Quote ", ")))
 (vector-set! //P/P_/Operator1 (- //T_/Maphash 1) (list (string-append //Quote ",")))
 (vector-set! //P/P_/Operator2 (- //T_/Maphash 1) (list ""))
 (vector-set! //P/P_/Closing (- //T_/Maphash 1) ")")
 (vector-set! //P/P_/Type (- //T_/Puthash 1) //Type_/Split)
 (vector-set! //P/P_/Split (- //T_/Puthash 1) 2)
 (vector-set! //P/P_/Opening (- //T_/Puthash 1) "")
 (vector-set! //P/P_/Operator (- //T_/Puthash 1) (list "" ".(" ") := "))
 (vector-set! //P/P_/Operator1 (- //T_/Puthash 1) (list "" ".(" ")"))
 (vector-set! //P/P_/Operator2 (- //T_/Puthash 1) (list "" "" ":= "))
 (vector-set! //P/P_/Closing (- //T_/Puthash 1) "")
 (@PP_Simple //T_/Call "CALL " "")
 (@PP_Simple //T_/Comment (string-append "C:" //Quote) //Quote)
 (vector-set! //P/P_/Type (- //T_/Cond 1) //Type_/Special)
 (vector-set! //P/P_/Opening (- //T_/Cond 1) "IF ")
 (vector-set! //P/P_/Operator (- //T_/Cond 1) (list " THEN " " ELSIF " " ELSE "))
 (vector-set! //P/P_/Operator1 (- //T_/Cond 1) (list "" "" ""))
 (vector-set! //P/P_/Operator2 (- //T_/Cond 1) (list "THEN " "ELSIF " "ELSE "))
 (vector-set! //P/P_/Sub_/Indent (- //T_/Cond 1) 7)
 (vector-set! //P/P_/Closing (- //T_/Cond 1) " FI")
 (vector-set! //P/P_/Type (- //T_/D_/If 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/D_/If 1) "D_IF ")
 (vector-set! //P/P_/Operator (- //T_/D_/If 1) " [] ")
 (vector-set! //P/P_/Operator2 (- //T_/D_/If 1) "[] ")
 (vector-set! //P/P_/Sub_/Indent (- //T_/D_/If 1) 5)
 (vector-set! //P/P_/Closing (- //T_/D_/If 1) " FI")
 (vector-set! //P/P_/Type (- //T_/D_/Do 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/D_/Do 1) "D_DO ")
 (vector-set! //P/P_/Operator (- //T_/D_/Do 1) " [] ")
 (vector-set! //P/P_/Operator2 (- //T_/D_/Do 1) "[] ")
 (vector-set! //P/P_/Sub_/Indent (- //T_/D_/Do 1) 5)
 (vector-set! //P/P_/Closing (- //T_/D_/Do 1) " OD")
 (@PP_Simple //T_/Exit "EXIT(" ")")
 (vector-set! //P/P_/Type (- //T_/For 1) //Type_/Split)
 (vector-set! //P/P_/Split (- //T_/For 1) 4)
 (vector-set! //P/P_/Opening (- //T_/For 1) "FOR ")
 (vector-set! //P/P_/Operator (- //T_/For 1) (list "" " := " " TO " " STEP " " DO "))
 (vector-set! //P/P_/Operator1 (- //T_/For 1) (list "" " := " "" "" " DO"))
 (vector-set! //P/P_/Operator2 (- //T_/For 1) (list "" "" "TO " "STEP " ""))
 (vector-set! //P/P_/Closing (- //T_/For 1) " OD")
 (vector-set! //P/P_/Type (- //T_/For_/In 1) //Type_/Split)
 (vector-set! //P/P_/Split (- //T_/For_/In 1) 2)
 (vector-set! //P/P_/Opening (- //T_/For_/In 1) "FOR ")
 (vector-set! //P/P_/Operator (- //T_/For_/In 1) (list "" " IN " " DO "))
 (vector-set! //P/P_/Operator1 (- //T_/For_/In 1) (list "" " IN " " DO"))
 (vector-set! //P/P_/Operator2 (- //T_/For_/In 1) (list "" "" ""))
 (vector-set! //P/P_/Closing (- //T_/For_/In 1) " OD")
 ; FOREACH types 
 (vector-set! //P/P_/Type (- //T_/Foreach_/Stat 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Foreach_/Stat 1) "FOREACH Statement DO ")
 (vector-set! //P/P_/Closing (- //T_/Foreach_/Stat 1) " OD")
 (vector-set! //P/P_/Type (- //T_/Foreach_/N/A/S 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Foreach_/N/A/S 1) "FOREACH NAS DO ")
 (vector-set! //P/P_/Closing (- //T_/Foreach_/N/A/S 1) " OD")
 (vector-set! //P/P_/Type (- //T_/Foreach_/Stats 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Foreach_/Stats 1) "FOREACH Statements DO ")
 (vector-set! //P/P_/Closing (- //T_/Foreach_/Stats 1) " OD")
 (vector-set! //P/P_/Type (- //T_/Foreach_/T/S 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Foreach_/T/S 1) "FOREACH Terminal Statement DO ")
 (vector-set! //P/P_/Closing (- //T_/Foreach_/T/S 1) " OD")
 (vector-set! //P/P_/Type (- //T_/Foreach_/T/Ss 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Foreach_/T/Ss 1) "FOREACH Terminal Statements DO ")
 (vector-set! //P/P_/Closing (- //T_/Foreach_/T/Ss 1) " OD")
 (vector-set! //P/P_/Type (- //T_/Foreach_/S/T/S 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Foreach_/S/T/S 1) "FOREACH STS DO ")
 (vector-set! //P/P_/Closing (- //T_/Foreach_/S/T/S 1) " OD")
 (vector-set! //P/P_/Type (- //T_/Foreach_/Cond 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Foreach_/Cond 1) "FOREACH Condition DO ")
 (vector-set! //P/P_/Closing (- //T_/Foreach_/Cond 1) " OD")
 (vector-set! //P/P_/Type (- //T_/Foreach_/Expn 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Foreach_/Expn 1) "FOREACH Expression DO ")
 (vector-set! //P/P_/Closing (- //T_/Foreach_/Expn 1) " OD")
 (vector-set! //P/P_/Type (- //T_/Foreach_/Lvalue 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Foreach_/Lvalue 1) "FOREACH Lvalue DO ")
 (vector-set! //P/P_/Closing (- //T_/Foreach_/Lvalue 1) " OD")
 (vector-set! //P/P_/Type (- //T_/Foreach_/Variable 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Foreach_/Variable 1) "FOREACH Variable DO ")
 (vector-set! //P/P_/Closing (- //T_/Foreach_/Variable 1) " OD")
 (vector-set! //P/P_/Type (- //T_/Foreach_/Global_/Var 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Foreach_/Global_/Var 1) "FOREACH Global Variable DO ")
 (vector-set! //P/P_/Closing (- //T_/Foreach_/Global_/Var 1) " OD")
 ; ATEACH types 
 (vector-set! //P/P_/Type (- //T_/Ateach_/Stat 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Ateach_/Stat 1) "ATEACH Statement DO ")
 (vector-set! //P/P_/Closing (- //T_/Ateach_/Stat 1) " OD")
 (vector-set! //P/P_/Type (- //T_/Ateach_/N/A/S 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Ateach_/N/A/S 1) "ATEACH NAS DO ")
 (vector-set! //P/P_/Closing (- //T_/Ateach_/N/A/S 1) " OD")
 (vector-set! //P/P_/Type (- //T_/Ateach_/Stats 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Ateach_/Stats 1) "ATEACH Statements DO ")
 (vector-set! //P/P_/Closing (- //T_/Ateach_/Stats 1) " OD")
 (vector-set! //P/P_/Type (- //T_/Ateach_/T/S 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Ateach_/T/S 1) "ATEACH Terminal Statement DO ")
 (vector-set! //P/P_/Closing (- //T_/Ateach_/T/S 1) " OD")
 (vector-set! //P/P_/Type (- //T_/Ateach_/T/Ss 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Ateach_/T/Ss 1) "ATEACH Terminal Statements DO ")
 (vector-set! //P/P_/Closing (- //T_/Ateach_/T/Ss 1) " OD")
 (vector-set! //P/P_/Type (- //T_/Ateach_/S/T/S 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Ateach_/S/T/S 1) "ATEACH STS DO ")
 (vector-set! //P/P_/Closing (- //T_/Ateach_/S/T/S 1) " OD")
 (vector-set! //P/P_/Type (- //T_/Ateach_/Cond 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Ateach_/Cond 1) "ATEACH Condition DO ")
 (vector-set! //P/P_/Closing (- //T_/Ateach_/Cond 1) " OD")
 (vector-set! //P/P_/Type (- //T_/Ateach_/Expn 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Ateach_/Expn 1) "ATEACH Expression DO ")
 (vector-set! //P/P_/Closing (- //T_/Ateach_/Expn 1) " OD")
 (vector-set! //P/P_/Type (- //T_/Ateach_/Lvalue 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Ateach_/Lvalue 1) "ATEACH Lvalue DO ")
 (vector-set! //P/P_/Closing (- //T_/Ateach_/Lvalue 1) " OD")
 (vector-set! //P/P_/Type (- //T_/Ateach_/Variable 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Ateach_/Variable 1) "ATEACH Variable DO ")
 (vector-set! //P/P_/Closing (- //T_/Ateach_/Variable 1) " OD")
 (vector-set! //P/P_/Type (- //T_/Ateach_/Global_/Var 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Ateach_/Global_/Var 1) "ATEACH Global Variable DO ")
 (vector-set! //P/P_/Closing (- //T_/Ateach_/Global_/Var 1) " OD")
 (vector-set! //P/P_/Type (- //T_/Floop 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Floop 1) "DO ")
 (vector-set! //P/P_/Closing (- //T_/Floop 1) " OD")
 (vector-set! //P/P_/Indent (- //T_/Floop 1) 3)
 (vector-set! //P/P_/Sub_/Indent (- //T_/Floop 1) 3)
 (vector-set! //P/P_/Type (- //T_/Join 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Join 1) "JOIN ")
 (vector-set! //P/P_/Operator (- //T_/Join 1) ", ")
 (vector-set! //P/P_/Operator1 (- //T_/Join 1) ",")
 (vector-set! //P/P_/Closing (- //T_/Join 1) " ENDJOIN")
 (@PP_Funct //T_/Pop "POP")
 (@PP_Funct //T_/Push "PUSH")
 (vector-set! //P/P_/Type (- //T_/Where 1) //Type_/Special)
 (vector-set! //P/P_/Opening (- //T_/Where 1) "BEGIN")
 (vector-set! //P/P_/Operator (- //T_/Where 1) "WHERE")
 (vector-set! //P/P_/Operator1 (- //T_/Where 1) "WHERE")
 (vector-set! //P/P_/Closing (- //T_/Where 1) "END")
 (vector-set! //P/P_/Indent (- //T_/Where 1) 0)
 (vector-set! //P/P_/Sub_/Indent (- //T_/Where 1) 2)
 (vector-set! //P/P_/Type (- //T_/Var 1) //Type_/Split)
 (vector-set! //P/P_/Split (- //T_/Var 1) 1)
 (vector-set! //P/P_/Opening (- //T_/Var 1) "VAR ")
 (vector-set! //P/P_/Operator (- //T_/Var 1) (list "" ": "))
 (vector-set! //P/P_/Operator1 (- //T_/Var 1) (list "" ":"))
 (vector-set! //P/P_/Operator2 (- //T_/Var 1) (list "" ""))
 (vector-set! //P/P_/Closing (- //T_/Var 1) " ENDVAR")
 (vector-set! //P/P_/Indent (- //T_/Var 1) 0)
 (vector-set! //P/P_/Sub_/Indent (- //T_/Var 1) 0)
 (vector-set! //P/P_/Type (- //T_/While 1) //Type_/Split)
 (vector-set! //P/P_/Split (- //T_/While 1) 1)
 (vector-set! //P/P_/Opening (- //T_/While 1) "WHILE ")
 (vector-set! //P/P_/Operator (- //T_/While 1) (list "" " DO "))
 (vector-set! //P/P_/Operator1 (- //T_/While 1) (list "" " DO"))
 (vector-set! //P/P_/Operator2 (- //T_/While 1) (list "" ""))
 (vector-set! //P/P_/Closing (- //T_/While 1) " OD")
 (vector-set! //P/P_/Type (- //T_/Spec 1) //Type_/Split)
 (vector-set! //P/P_/Split (- //T_/Spec 1) 1)
 (vector-set! //P/P_/Opening (- //T_/Spec 1) "SPEC <")
 (vector-set! //P/P_/Operator (- //T_/Spec 1) (list "" ">: "))
 (vector-set! //P/P_/Operator1 (- //T_/Spec 1) (list "" ">:"))
 (vector-set! //P/P_/Operator2 (- //T_/Spec 1) (list "" ""))
 (vector-set! //P/P_/Closing (- //T_/Spec 1) " ENDSPEC")
 (vector-set! //P/P_/Indent (- //T_/Spec 1) 0)
 (vector-set! //P/P_/Sub_/Indent (- //T_/Spec 1) 0)
 (vector-set! //P/P_/Type (- //T_/Forall 1) //Type_/Split)
 (vector-set! //P/P_/Split (- //T_/Forall 1) 1)
 (vector-set! //P/P_/Opening (- //T_/Forall 1) "FORALL <")
 (vector-set! //P/P_/Operator (- //T_/Forall 1) (list "" ">: "))
 (vector-set! //P/P_/Operator1 (- //T_/Forall 1) (list "" ">:"))
 (vector-set! //P/P_/Operator2 (- //T_/Forall 1) (list "" ""))
 (vector-set! //P/P_/Closing (- //T_/Forall 1) " END")
 (vector-set! //P/P_/Indent (- //T_/Forall 1) 0)
 (vector-set! //P/P_/Sub_/Indent (- //T_/Forall 1) 0)
 (vector-set! //P/P_/Type (- //T_/Exists 1) //Type_/Split)
 (vector-set! //P/P_/Split (- //T_/Exists 1) 1)
 (vector-set! //P/P_/Opening (- //T_/Exists 1) "EXISTS <")
 (vector-set! //P/P_/Operator (- //T_/Exists 1) (list "" ">: "))
 (vector-set! //P/P_/Operator1 (- //T_/Exists 1) (list "" ">:"))
 (vector-set! //P/P_/Operator2 (- //T_/Exists 1) (list "" ""))
 (vector-set! //P/P_/Closing (- //T_/Exists 1) " END")
 (vector-set! //P/P_/Indent (- //T_/Exists 1) 0)
 (vector-set! //P/P_/Sub_/Indent (- //T_/Exists 1) 0)
 (vector-set! //P/P_/Type (- //T_/M/W_/Proc 1) //Type_/Split)
 (vector-set! //P/P_/Split (- //T_/M/W_/Proc 1) 2)
 (vector-set! //P/P_/Opening (- //T_/M/W_/Proc 1) "MW_PROC ")
 (vector-set! //P/P_/Operator (- //T_/M/W_/Proc 1) (list "(" " VAR " ") == "))
 (vector-set! //P/P_/Operator1 (- //T_/M/W_/Proc 1) (list "(" "" ") =="))
 (vector-set! //P/P_/Operator2 (- //T_/M/W_/Proc 1) (list "" "VAR " ""))
 (vector-set! //P/P_/Closing (- //T_/M/W_/Proc 1) " END")
 (vector-set! //P/P_/Type (- //T_/M/W_/Funct 1) //Type_/Split)
 (vector-set! //P/P_/Split (- //T_/M/W_/Funct 1) 1)
 (vector-set! //P/P_/Opening (- //T_/M/W_/Funct 1) "MW_FUNCT ")
 (vector-set! //P/P_/Operator (- //T_/M/W_/Funct 1) (list "(" ") == VAR " ": " "; ("))
 (vector-set! //P/P_/Operator1 (- //T_/M/W_/Funct 1) (list "(" ") ==" ":" ";"))
 (vector-set! //P/P_/Operator2 (- //T_/M/W_/Funct 1) (list "" "VAR " "" "("))
 (vector-set! //P/P_/Closing (- //T_/M/W_/Funct 1) ") END")
 (vector-set! //P/P_/Type (- //T_/M/W_/B/Funct 1) //Type_/Split)
 (vector-set! //P/P_/Split (- //T_/M/W_/B/Funct 1) 1)
 (vector-set! //P/P_/Opening (- //T_/M/W_/B/Funct 1) "MW_BFUNCT ")
 (vector-set! //P/P_/Operator (- //T_/M/W_/B/Funct 1) (list "(" ") == VAR " ": " "; ("))
 (vector-set! //P/P_/Operator1 (- //T_/M/W_/B/Funct 1) (list "(" ") ==" ":" ";"))
 (vector-set! //P/P_/Operator2 (- //T_/M/W_/B/Funct 1) (list "" "VAR " "" "("))
 (vector-set! //P/P_/Closing (- //T_/M/W_/B/Funct 1) ") END")
 (vector-set! //P/P_/Type (- //T_/Proc 1) //Type_/Split)
 (vector-set! //P/P_/Split (- //T_/Proc 1) 2)
 (vector-set! //P/P_/Opening (- //T_/Proc 1) "PROC ")
 (vector-set! //P/P_/Operator (- //T_/Proc 1) (list "(" " VAR " ") == "))
 (vector-set! //P/P_/Operator1 (- //T_/Proc 1) (list "(" "" ") =="))
 (vector-set! //P/P_/Operator2 (- //T_/Proc 1) (list "" "VAR " ""))
 (vector-set! //P/P_/Closing (- //T_/Proc 1) " END")
 (vector-set! //P/P_/Type (- //T_/Funct 1) //Type_/Split)
 (vector-set! //P/P_/Split (- //T_/Funct 1) 1)
 (vector-set! //P/P_/Opening (- //T_/Funct 1) "FUNCT ")
 (vector-set! //P/P_/Operator (- //T_/Funct 1) (list "(" ") == VAR " ": " "; ("))
 (vector-set! //P/P_/Operator1 (- //T_/Funct 1) (list "(" ") ==" ":" ";"))
 (vector-set! //P/P_/Operator2 (- //T_/Funct 1) (list "" "VAR " "" "("))
 (vector-set! //P/P_/Closing (- //T_/Funct 1) ") END")
 (vector-set! //P/P_/Type (- //T_/B/Funct 1) //Type_/Split)
 (vector-set! //P/P_/Split (- //T_/B/Funct 1) 1)
 (vector-set! //P/P_/Opening (- //T_/B/Funct 1) "BFUNCT ")
 (vector-set! //P/P_/Operator (- //T_/B/Funct 1) (list "(" ") == VAR " ": " "; ("))
 (vector-set! //P/P_/Operator1 (- //T_/B/Funct 1) (list "(" ") ==" ":" ";"))
 (vector-set! //P/P_/Operator2 (- //T_/B/Funct 1) (list "" "VAR " "" "("))
 (vector-set! //P/P_/Closing (- //T_/B/Funct 1) ") END")
 (for-in /type (list //T_/Ifmatch_/Stat //T_/Ifmatch_/Expn //T_/Ifmatch_/Cond //T_/Ifmatch_/Defn //T_/Ifmatch_/Lvalue //T_/Ifmatch_/Assign //T_/Ifmatch_/Guarded //T_/Ifmatch_/Action //T_/Ifmatch_/Stats //T_/Ifmatch_/Expns //T_/Ifmatch_/Lvalues //T_/Ifmatch_/Assigns //T_/Ifmatch_/Defns) 
  (begin
   (vector-set! //P/P_/Type (- /type 1) //Type_/Ifmatch)
   (vector-set! //P/P_/Operator (- /type 1) (list " THEN " " ELSE "))
   (vector-set! //P/P_/Operator1 (- /type 1) (list "" ""))
   (vector-set! //P/P_/Operator2 (- /type 1) (list "THEN " "ELSE "))
   (vector-set! //P/P_/Closing (- /type 1) " ENDMATCH")))
 (vector-set! //P/P_/Opening (- //T_/Ifmatch_/Stat 1) "IFMATCH Statement ")
 (vector-set! //P/P_/Opening (- //T_/Ifmatch_/Expn 1) "IFMATCH Expression ")
 (vector-set! //P/P_/Opening (- //T_/Ifmatch_/Cond 1) "IFMATCH Condition ")
 (vector-set! //P/P_/Opening (- //T_/Ifmatch_/Defn 1) "IFMATCH Definition ")
 (vector-set! //P/P_/Opening (- //T_/Ifmatch_/Lvalue 1) "IFMATCH Lvalue ")
 (vector-set! //P/P_/Opening (- //T_/Ifmatch_/Assign 1) "IFMATCH Assign ")
 (vector-set! //P/P_/Opening (- //T_/Ifmatch_/Guarded 1) "IFMATCH Guarded ")
 (vector-set! //P/P_/Opening (- //T_/Ifmatch_/Action 1) "IFMATCH Action ")
 (vector-set! //P/P_/Opening (- //T_/Ifmatch_/Stats 1) "IFMATCH Statements ")
 (vector-set! //P/P_/Opening (- //T_/Ifmatch_/Expns 1) "IFMATCH Expressions ")
 (vector-set! //P/P_/Opening (- //T_/Ifmatch_/Lvalues 1) "IFMATCH Lvalues ")
 (vector-set! //P/P_/Opening (- //T_/Ifmatch_/Assigns 1) "IFMATCH Assigns ")
 (vector-set! //P/P_/Opening (- //T_/Ifmatch_/Defns 1) "IFMATCH Definitions ")
 (@PP_Simple //T_/Number "" "")
 (@PP_Simple //T_/Name "" "")
 (@PP_Simple //T_/String //Quote //Quote)
 (@PP_Simple //T_/Variable "" "")
 (@PP_Simple //T_/Var_/Lvalue "" "")
 (@PP_Simple //T_/Primed_/Var "" "'")
 (vector-set! //P/P_/Type (- //T_/Gethash 1) //Type_/Infix)
 (vector-set! //P/P_/Operator (- //T_/Gethash 1) ".(")
 (vector-set! //P/P_/Operator2 (- //T_/Gethash 1) ".(")
 (vector-set! //P/P_/Closing (- //T_/Gethash 1) ")")
 (vector-set! //P/P_/Type (- //T_/Sequence 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Sequence 1) "<")
 (vector-set! //P/P_/Operator (- //T_/Sequence 1) ", ")
 (vector-set! //P/P_/Operator1 (- //T_/Sequence 1) ",")
 (vector-set! //P/P_/Closing (- //T_/Sequence 1) ">")
 (vector-set! //P/P_/Indent (- //T_/Sequence 1) 1)
 (vector-set! //P/P_/Sub_/Indent (- //T_/Sequence 1) 1)
 (vector-set! //P/P_/Type (- //T_/Aref 1) //Type_/Special)
 (vector-set! //P/P_/Opening (- //T_/Aref 1) "[")
 (vector-set! //P/P_/Operator (- //T_/Aref 1) "][")
 (vector-set! //P/P_/Operator1 (- //T_/Aref 1) "]")
 (vector-set! //P/P_/Operator2 (- //T_/Aref 1) "[")
 (vector-set! //P/P_/Closing (- //T_/Aref 1) "]")
 (vector-set! //P/P_/Sub_/Indent (- //T_/Aref 1) 3)
 (vector-set! //P/P_/Type (- //T_/Aref_/Lvalue 1) //Type_/Special)
 (vector-set! //P/P_/Opening (- //T_/Aref_/Lvalue 1) "[")
 (vector-set! //P/P_/Operator (- //T_/Aref_/Lvalue 1) "][")
 (vector-set! //P/P_/Operator1 (- //T_/Aref_/Lvalue 1) "]")
 (vector-set! //P/P_/Operator2 (- //T_/Aref_/Lvalue 1) "[")
 (vector-set! //P/P_/Closing (- //T_/Aref_/Lvalue 1) "]")
 (vector-set! //P/P_/Sub_/Indent (- //T_/Aref_/Lvalue 1) 3)
 (vector-set! //P/P_/Type (- //T_/Sub_/Seg 1) //Type_/Split)
 (vector-set! //P/P_/Split (- //T_/Sub_/Seg 1) 1)
 (vector-set! //P/P_/Opening (- //T_/Sub_/Seg 1) "")
 (vector-set! //P/P_/Operator (- //T_/Sub_/Seg 1) (list "" "[" ".."))
 (vector-set! //P/P_/Operator1 (- //T_/Sub_/Seg 1) (list "" "" ""))
 (vector-set! //P/P_/Operator2 (- //T_/Sub_/Seg 1) (list "" "[" ".."))
 (vector-set! //P/P_/Closing (- //T_/Sub_/Seg 1) "]")
 (vector-set! //P/P_/Type (- //T_/Sub_/Seg_/Lvalue 1) //Type_/Split)
 (vector-set! //P/P_/Split (- //T_/Sub_/Seg_/Lvalue 1) 1)
 (vector-set! //P/P_/Opening (- //T_/Sub_/Seg_/Lvalue 1) "")
 (vector-set! //P/P_/Operator (- //T_/Sub_/Seg_/Lvalue 1) (list "" "[" ".."))
 (vector-set! //P/P_/Operator1 (- //T_/Sub_/Seg_/Lvalue 1) (list "" "" ""))
 (vector-set! //P/P_/Operator2 (- //T_/Sub_/Seg_/Lvalue 1) (list "" "[" ".."))
 (vector-set! //P/P_/Closing (- //T_/Sub_/Seg_/Lvalue 1) "]")
 (vector-set! //P/P_/Type (- //T_/Rel_/Seg 1) //Type_/Split)
 (vector-set! //P/P_/Split (- //T_/Rel_/Seg 1) 1)
 (vector-set! //P/P_/Opening (- //T_/Rel_/Seg 1) "")
 (vector-set! //P/P_/Operator (- //T_/Rel_/Seg 1) (list "" "[" ", "))
 (vector-set! //P/P_/Operator1 (- //T_/Rel_/Seg 1) (list "" "" ","))
 (vector-set! //P/P_/Operator2 (- //T_/Rel_/Seg 1) (list "" "[" ""))
 (vector-set! //P/P_/Closing (- //T_/Rel_/Seg 1) "]")
 (vector-set! //P/P_/Type (- //T_/Rel_/Seg_/Lvalue 1) //Type_/Split)
 (vector-set! //P/P_/Split (- //T_/Rel_/Seg_/Lvalue 1) 1)
 (vector-set! //P/P_/Opening (- //T_/Rel_/Seg_/Lvalue 1) "")
 (vector-set! //P/P_/Operator (- //T_/Rel_/Seg_/Lvalue 1) (list "" "[" ", "))
 (vector-set! //P/P_/Operator1 (- //T_/Rel_/Seg_/Lvalue 1) (list "" "" ","))
 (vector-set! //P/P_/Operator2 (- //T_/Rel_/Seg_/Lvalue 1) (list "" "[" ""))
 (vector-set! //P/P_/Closing (- //T_/Rel_/Seg_/Lvalue 1) "]")
 (vector-set! //P/P_/Type (- //T_/Final_/Seg 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Final_/Seg 1) "")
 (vector-set! //P/P_/Operator (- //T_/Final_/Seg 1) "[")
 (vector-set! //P/P_/Operator1 (- //T_/Final_/Seg 1) "")
 (vector-set! //P/P_/Operator2 (- //T_/Final_/Seg 1) "[")
 (vector-set! //P/P_/Closing (- //T_/Final_/Seg 1) "..]")
 (vector-set! //P/P_/Type (- //T_/Final_/Seg_/Lvalue 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Final_/Seg_/Lvalue 1) "")
 (vector-set! //P/P_/Operator (- //T_/Final_/Seg_/Lvalue 1) "[")
 (vector-set! //P/P_/Operator1 (- //T_/Final_/Seg_/Lvalue 1) "")
 (vector-set! //P/P_/Operator2 (- //T_/Final_/Seg_/Lvalue 1) "[")
 (vector-set! //P/P_/Closing (- //T_/Final_/Seg_/Lvalue 1) "..]")
 (vector-set! //P/P_/Type (- //T_/Mem 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Mem 1) "@[")
 (vector-set! //P/P_/Operator (- //T_/Mem 1) ", ")
 (vector-set! //P/P_/Operator1 (- //T_/Mem 1) ",")
 (vector-set! //P/P_/Closing (- //T_/Mem 1) "]")
 (vector-set! //P/P_/Indent (- //T_/Mem 1) 2)
 (vector-set! //P/P_/Sub_/Indent (- //T_/Mem 1) 2)
 (vector-set! //P/P_/Type (- //T_/Mem_/Lvalue 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Mem_/Lvalue 1) "@[")
 (vector-set! //P/P_/Operator (- //T_/Mem_/Lvalue 1) ", ")
 (vector-set! //P/P_/Operator1 (- //T_/Mem_/Lvalue 1) ",")
 (vector-set! //P/P_/Closing (- //T_/Mem_/Lvalue 1) "]")
 (vector-set! //P/P_/Indent (- //T_/Mem_/Lvalue 1) 2)
 (vector-set! //P/P_/Sub_/Indent (- //T_/Mem_/Lvalue 1) 2)
 (vector-set! //P/P_/Type (- //T_/Mem_/Seg 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Mem_/Seg 1) "@[")
 (vector-set! //P/P_/Operator (- //T_/Mem_/Seg 1) "..")
 (vector-set! //P/P_/Operator1 (- //T_/Mem_/Seg 1) "..")
 (vector-set! //P/P_/Closing (- //T_/Mem_/Seg 1) "]")
 (vector-set! //P/P_/Indent (- //T_/Mem_/Seg 1) 2)
 (vector-set! //P/P_/Sub_/Indent (- //T_/Mem_/Seg 1) 2)
 (vector-set! //P/P_/Type (- //T_/Mem_/Seg_/Lvalue 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Mem_/Seg_/Lvalue 1) "@[")
 (vector-set! //P/P_/Operator (- //T_/Mem_/Seg_/Lvalue 1) "..")
 (vector-set! //P/P_/Operator1 (- //T_/Mem_/Seg_/Lvalue 1) "..")
 (vector-set! //P/P_/Closing (- //T_/Mem_/Seg_/Lvalue 1) "]")
 (vector-set! //P/P_/Indent (- //T_/Mem_/Seg_/Lvalue 1) 2)
 (vector-set! //P/P_/Sub_/Indent (- //T_/Mem_/Seg_/Lvalue 1) 2)
 (vector-set! //P/P_/Type (- //T_/Mem_/Rel 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Mem_/Rel 1) "@[")
 (vector-set! //P/P_/Operator (- //T_/Mem_/Rel 1) ", ")
 (vector-set! //P/P_/Operator1 (- //T_/Mem_/Rel 1) ",")
 (vector-set! //P/P_/Closing (- //T_/Mem_/Rel 1) "]")
 (vector-set! //P/P_/Indent (- //T_/Mem_/Rel 1) 2)
 (vector-set! //P/P_/Sub_/Indent (- //T_/Mem_/Rel 1) 2)
 (vector-set! //P/P_/Type (- //T_/Mem_/Rel_/Lvalue 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Mem_/Rel_/Lvalue 1) "@[")
 (vector-set! //P/P_/Operator (- //T_/Mem_/Rel_/Lvalue 1) ", ")
 (vector-set! //P/P_/Operator1 (- //T_/Mem_/Rel_/Lvalue 1) ",")
 (vector-set! //P/P_/Closing (- //T_/Mem_/Rel_/Lvalue 1) "]")
 (vector-set! //P/P_/Indent (- //T_/Mem_/Rel_/Lvalue 1) 2)
 (vector-set! //P/P_/Sub_/Indent (- //T_/Mem_/Rel_/Lvalue 1) 2)
 ; The basic infix operators with () as Opening and Closing 
 ; Operator precidences: 
 (set! //Prec_/Struct 130)
 (set! //Prec_/Get 120)
 (set! //Prec_/Exponent 110)
 (set! //Prec_/Times 100)
 (set! //Prec_/Mod 95)
 (set! //Prec_/Plus 90)
 (set! //Prec_/Intersection 70)
 (set! //Prec_/Union 60)
 (set! //Prec_/Diff 50)
 (set! //Prec_/Rel 40)
 (set! //Prec_/Not 30)
 (set! //Prec_/And 20)
 (set! //Prec_/Or 10)
 ; List of non-associative operators: 
 (set! //P/P_/Non_/Assoc_/Ops (list //T_/Minus //T_/Divide //T_/Set_/Diff))
 (set! //P/P_/Prec_/Increment 3)
 ; List of Type_Split types where we may omit the parentheses 
 ; (a special test in Split_Preprocess) 
 (set! //P/P_/No_/Parentheses (list //T_/M/W_/Proc_/Call //T_/M/W_/Funct_/Call //T_/M/W_/B/Funct_/Call))
 (vector-set! //P/P_/Type (- //T_/Struct 1) //Type_/Special)
 (vector-set! //P/P_/Opening (- //T_/Struct 1) "")
 (vector-set! //P/P_/Operator (- //T_/Struct 1) ".")
 (vector-set! //P/P_/Operator1 (- //T_/Struct 1) "")
 (vector-set! //P/P_/Operator2 (- //T_/Struct 1) ".")
 (vector-set! //P/P_/Closing (- //T_/Struct 1) "")
 (vector-set! //P/P_/Indent (- //T_/Struct 1) 0)
 (vector-set! //P/P_/Sub_/Indent (- //T_/Struct 1) 0)
 (vector-set! //P/P_/Prec (- //T_/Struct 1) //Prec_/Struct)
 (vector-set! //P/P_/Type (- //T_/Struct_/Lvalue 1) //Type_/Special)
 (vector-set! //P/P_/Opening (- //T_/Struct_/Lvalue 1) "")
 (vector-set! //P/P_/Operator (- //T_/Struct_/Lvalue 1) ".")
 (vector-set! //P/P_/Operator1 (- //T_/Struct_/Lvalue 1) "")
 (vector-set! //P/P_/Operator2 (- //T_/Struct_/Lvalue 1) ".")
 (vector-set! //P/P_/Closing (- //T_/Struct_/Lvalue 1) "")
 (vector-set! //P/P_/Indent (- //T_/Struct_/Lvalue 1) 0)
 (vector-set! //P/P_/Sub_/Indent (- //T_/Struct_/Lvalue 1) 0)
 (vector-set! //P/P_/Prec (- //T_/Struct_/Lvalue 1) //Prec_/Struct)
 (vector-set! //P/P_/Type (- //T_/Not 1) //Type_/Prefix)
 (vector-set! //P/P_/Opening (- //T_/Not 1) "(")
 (vector-set! //P/P_/Operator (- //T_/Not 1) "NOT ")
 (vector-set! //P/P_/Operator1 (- //T_/Not 1) "")
 (vector-set! //P/P_/Operator2 (- //T_/Not 1) "NOT ")
 (vector-set! //P/P_/Closing (- //T_/Not 1) ")")
 (vector-set! //P/P_/Prec (- //T_/Not 1) //Prec_/Not)
 (@PP_Infix //T_/Plus "+" //Prec_/Plus)
 (@PP_Infix //T_/Minus "-" //Prec_/Plus)
 (@PP_Infix //T_/Times "*" //Prec_/Times)
 (@PP_Infix //T_/Divide "/" //Prec_/Times)
 (@PP_Infix //T_/Exponent "**" //Prec_/Exponent)
 (@PP_Infix //T_/Mod "MOD" //Prec_/Mod)
 (@PP_Infix //T_/Div "DIV" //Prec_/Mod)
 (@PP_Infix //T_/Intersection (string-append "/" //Backslash) //Prec_/Intersection)
 (@PP_Infix //T_/Union (string-append //Backslash "/") //Prec_/Union)
 (@PP_Infix //T_/Set_/Diff //Backslash //Prec_/Diff)
 (@PP_Infix //T_/Concat "++" //Prec_/Union)
 (@PP_Infix //T_/And "AND" //Prec_/And)
 (@PP_Infix //T_/Or "OR" //Prec_/Or)
 (@PP_Infix //T_/Equal "=" //Prec_/Rel)
 (@PP_Infix //T_/Not_/Equal "<>" //Prec_/Rel)
 (@PP_Infix //T_/Less "<" //Prec_/Rel)
 (@PP_Infix //T_/Greater ">" //Prec_/Rel)
 (@PP_Infix //T_/Less_/Eq "<=" //Prec_/Rel)
 (@PP_Infix //T_/Greater_/Eq ">=" //Prec_/Rel)
 (@PP_Infix //T_/In "IN" //Prec_/Rel)
 (@PP_Infix //T_/Not_/In "NOTIN" //Prec_/Rel)
 (vector-set! //P/P_/Type (- //T_/Get_n 1) //Type_/Infix)
 (vector-set! //P/P_/Operator (- //T_/Get_n 1) "^")
 (vector-set! //P/P_/Operator2 (- //T_/Get_n 1) "^")
 (vector-set! //P/P_/Prec (- //T_/Get_n 1) //Prec_/Get)
 (vector-set! //P/P_/Type (- //T_/Get 1) //Type_/Infix)
 (vector-set! //P/P_/Operator (- //T_/Get 1) "^^")
 (vector-set! //P/P_/Operator2 (- //T_/Get 1) "^^")
 (vector-set! //P/P_/Prec (- //T_/Get 1) //Prec_/Get)
 (vector-set! //P/P_/Type (- //T_/If 1) //Type_/Split)
 (vector-set! //P/P_/Split (- //T_/If 1) 1)
 (vector-set! //P/P_/Opening (- //T_/If 1) "IF ")
 (vector-set! //P/P_/Operator (- //T_/If 1) (list "" " THEN " " ELSE "))
 (vector-set! //P/P_/Operator1 (- //T_/If 1) (list "" "" "" ""))
 (vector-set! //P/P_/Operator2 (- //T_/If 1) (list "" "THEN " "ELSE "))
 (vector-set! //P/P_/Closing (- //T_/If 1) " FI")
 ; Function-like expressions and conditions: 
 (@PP_Funct //T_/Abs "ABS")
 (@PP_Funct //T_/Frac "FRAC")
 (@PP_Funct //T_/Int "INT")
 (@PP_Funct //T_/Sgn "SGN")
 (@PP_Funct //T_/Max "MAX")
 (@PP_Funct //T_/Min "MIN")
 (@PP_Funct //T_/Powerset "POWERSET")
 (@PP_Funct //T_/Array "ARRAY")
 (@PP_Funct //T_/Head "HEAD")
 (@PP_Funct //T_/Tail "TAIL")
 (@PP_Funct //T_/Last "LAST")
 (@PP_Funct //T_/Butlast "BUTLAST")
 (@PP_Funct //T_/Length "LENGTH")
 (@PP_Funct //T_/Slength "SLENGTH")
 (@PP_Funct //T_/Index "INDEX")
 (@PP_Funct //T_/Substr "SUBSTR")
 (@PP_Funct //T_/Reverse "REVERSE")
 (@PP_Funct //T_/Even "EVEN?")
 (@PP_Funct //T_/Odd "ODD?")
 (@PP_Funct //T_/Empty "EMPTY?")
 (@PP_Funct //T_/Subset "SUBSET?")
 (@PP_Funct //T_/Member "MEMBER?")
 (@PP_Funct //T_/Implies "IMPLIES?")
 (@PP_Funct //T_/Sequenceq "SEQUENCE?")
 (@PP_Funct //T_/Numberq "NUMBER?")
 (@PP_Funct //T_/Stringq "STRING?")
 (@PP_Funct //T_/Address_/Of "ADDRESS_OF")
 (vector-set! //P/P_/Type (- //T_/Set 1) //Type_/Infix)
 (vector-set! //P/P_/Opening (- //T_/Set 1) "{")
 (vector-set! //P/P_/Operator (- //T_/Set 1) "|")
 (vector-set! //P/P_/Operator1 (- //T_/Set 1) "")
 (vector-set! //P/P_/Operator2 (- //T_/Set 1) "|")
 (vector-set! //P/P_/Closing (- //T_/Set 1) "}")
 ; These are `prefix' operators: 
 (vector-set! //P/P_/Type (- //T_/Negate 1) //Type_/Prefix)
 (vector-set! //P/P_/Opening (- //T_/Negate 1) "(")
 (vector-set! //P/P_/Operator (- //T_/Negate 1) "-")
 (vector-set! //P/P_/Operator1 (- //T_/Negate 1) "")
 (vector-set! //P/P_/Operator2 (- //T_/Negate 1) "-")
 (vector-set! //P/P_/Closing (- //T_/Negate 1) ")")
 (vector-set! //P/P_/Prec (- //T_/Negate 1) //Prec_/Plus)
 (vector-set! //P/P_/Type (- //T_/Invert 1) //Type_/Prefix)
 (vector-set! //P/P_/Opening (- //T_/Invert 1) "(")
 (vector-set! //P/P_/Operator (- //T_/Invert 1) "1/")
 (vector-set! //P/P_/Operator1 (- //T_/Invert 1) "")
 (vector-set! //P/P_/Operator2 (- //T_/Invert 1) "1/")
 (vector-set! //P/P_/Closing (- //T_/Invert 1) ")")
 (vector-set! //P/P_/Prec (- //T_/Invert 1) //Prec_/Times)
 (@PP_Fill //T_/Fill_/Stat "Statement")
 (@PP_Fill //T_/Fill_/Expn "Expression")
 (@PP_Fill //T_/Fill_/Cond "Condition")
 (@PP_Fill //T_/Fill_/Defn "Definition")
 (@PP_Fill //T_/Fill_/Lvalue "Lvalue")
 (@PP_Fill //T_/Fill_/Assign "Assign")
 (@PP_Fill //T_/Fill_/Guarded "Guarded")
 (@PP_Fill //T_/Fill_/Action "Action")
 (@PP_Fill //T_/Fill_/Stats "Statements")
 (@PP_Fill //T_/Fill_/Expns "Expressions")
 (@PP_Fill //T_/Fill_/Lvalues "Lvalues")
 (@PP_Fill //T_/Fill_/Assigns "Assigns")
 (@PP_Fill //T_/Fill_/Defns "Definitions")
 ; End of @PP_Init 
 #t
 (set! /type /type-save))
(define (@PP_dummy)
 (display-list //Data_/Names //Data_/Lengths //Data_/Origlen //Data_/Repeats //Data_/Fields //Data_/Types //Data_/Values //Init_/Types //Init_/Values //Init_/String //Equ_/Symbol //D/S/E/C/T_/Tag //Comment //Orig_/Name //C/I/C/S_/Maps)
 (display-list //Symbol_/Equ //Max_/Split_/Line)
 (display-list //F/C_/Business //F/C_/Business_/End //F/C_/Tech //F/C_/Tech_/End //F/C_/Newline //F/C_/Turn_/On //F/C_/Turn_/Off))

; ----------------------------------------------------------------------- 


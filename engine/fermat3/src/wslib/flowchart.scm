;;; Scheme translation of WSL code
(define (/foreach-flowchart-1 //Depth //A/S_/Type)
 (cond
  ((and (= (@ST (@I)) //T_/Comment) (@H_FermaT? (@I)))
   (@Paste_Over (@Make //T_/Comment (substr (@V (@I)) 0 17) '())))))

(define (/foreach-flowchart-2 //Depth //A/S_/Type)
 (@Down)
 (while (and (or (not (= //T_/A_/Proc_/Call (@ST (@I)))) (not-member (@V (@Get_n (@I) 1)) /terminal)) (@Right?)) 
  (@Right))
 (cond
  ((and (= //T_/A_/Proc_/Call (@ST (@I))) (member (@V (@Get_n (@I) 1)) /terminal))
   (@Delete_Rest))))

(define (/foreach-flowchart-3 //Depth //A/S_/Type)
 (cond
  ((= (@ST (@I)) //T_/Comment)
   (set! //R (cons (@V (@I)) //R)))))

(define (/foreach-flowchart-4 //Depth //A/S_/Type)
 (cond
  ((= (@ST (@I)) //T_/Struct)
   (cond
    ((not (null? (gethash //Orig_/Name (@V (@Get_n (@I) 1)))))
     (@Down)
     (@Paste_Over (@Name (gethash //Orig_/Name (@V (@I))))))))
  ((= (@ST (@I)) //T_/Variable)
   (cond
    ((not (null? (gethash //Orig_/Name (@V (@I)))))
     (@Paste_Over (@Make //T_/Variable (gethash //Orig_/Name (@V (@I))) '())))))))

(define (/foreach-flowchart-5 //Depth //A/S_/Type)
 (cond
  ((= (@ST (@I)) //T_/Struct_/Lvalue)
   (cond
    ((not (null? (gethash //Orig_/Name (@V (@Get_n (@I) 1)))))
     (@Down)
     (@Paste_Over (@Name (gethash //Orig_/Name (@V (@I))))))))
  ((= (@ST (@I)) //T_/Var_/Lvalue)
   (cond
    ((not (null? (gethash //Orig_/Name (@V (@I)))))
     (@Paste_Over (@Make //T_/Var_/Lvalue (gethash //Orig_/Name (@V (@I))) '())))))))

(define (/foreach-flowchart-6 //Depth //A/S_/Type)
 (cond
  ((= (@ST (@I)) //T_/Proc_/Call)
   (cond
    ((not (null? (gethash //Orig_/Name (@V (@Get_n (@I) 1)))))
     (@Down)
     (@Paste_Over (@Name (gethash //Orig_/Name (@V (@I)))))))))
 (cond
  ((= (@ST (@I)) //T_/Where)
   (@Down_To 2)
   (@Down)
   ; to first defn 
   (set! /fl_flag1 0)
   (while (= /fl_flag1 0) 
    (begin
     (cond
      ((= (@ST (@I)) //T_/Proc)
       (cond
        ((not (null? (gethash //Orig_/Name (@V (@Get_n (@I) 1)))))
         (@Down)
         (@Paste_Over (@Name (gethash //Orig_/Name (@V (@I)))))
         (@Up)))))
     (cond
      ((not (@Right?))
       (set! /fl_flag1 1))
      (#t
       (@Right)
       (set! /fl_flag1 0))))))))

(define (/foreach-flowchart-7 //Depth //A/S_/Type)
 (cond
  ((= (@ST (@I)) //T_/Struct)
   (@Paste_Over (@Make //T_/Variable (@V (@Get_n (@I) 1)) '())))))

(define (/foreach-flowchart-8 //Depth //A/S_/Type)
 (cond
  ((= (@ST (@I)) //T_/Struct_/Lvalue)
   (@Paste_Over (@Make //T_/Var_/Lvalue (@V (@Get_n (@I) 1)) '())))))

(define (/foreach-flowchart-9 //Depth //A/S_/Type)
 (let ((/__/O/K 1))
  (set! /__/O/K (@New_Match  /%const__flowchart__1 (@I) /__/O/K))
  (cond
   ((= /__/O/K 1)
    (let ((/__e_save /e)
          (/__v_save /v))
     (set! /e (vector-ref /__/Match_array 1))
     (set! /v (vector-ref /__/Match_array 0))
     (cond
      ((and (= (@ST /v) //T_/Var_/Lvalue) (= (@ST /e) //T_/Variable) (not (null? (gethash //Data_/Types (list (@V /v))))) (equal? (gethash //Data_/Types (list (@V /v))) /struct_p) (member (@V /e) /registers))
       (set! /str (string-append (concat (string-append (string-append "{" (@H_Rename (@V /v))) " is addressed by ") (@N_String (@V /e))) "}"))
       (@Paste_Over (@Make //T_/Stat_/Pseudo /str '()))))
     (set! /e /__e_save)
     (set! /v /__v_save))))))

(define (/foreach-flowchart-10 //Depth //A/S_/Type)
 (let ((/__/O/K 1))
  (set! /__/O/K (@New_Match  /%const__flowchart__2 (@I) /__/O/K))
  (cond
   ((= /__/O/K 1)
    (let ((/__flag_save /flag)
          (/__var_save /var))
     (set! /flag (vector-ref /__/Match_array 1))
     (set! /var (vector-ref /__/Match_array 0))
     (@Down_To 2)
     (@Down_To 2)
     ; to flag 
     (@FC_Replace_Flag /var /flag /sym_val_flag)
     (set! /flag /__flag_save)
     (set! /var /__var_save))))))

(define (/foreach-flowchart-11 //Depth //A/S_/Type)
 (let ((/__/O/K 1))
  (set! /__/O/K (@New_Match  /%const__flowchart__3 (@I) /__/O/K))
  (cond
   ((= /__/O/K 1)
    (let ((/__var_save /var)
          (/__flag_save /flag))
     (set! /var (vector-ref /__/Match_array 1))
     (set! /flag (vector-ref /__/Match_array 0))
     (@Down_To 2)
     (@Down)
     ; to flag 
     (@FC_Replace_Flag /var /flag /sym_val_flag)
     (set! /var /__var_save)
     (set! /flag /__flag_save))))))

(define (/foreach-flowchart-12 //Depth //A/S_/Type)
 (let ((/__/O/K 1))
  (set! /__/O/K (@New_Match  /%const__flowchart__4 (@I) /__/O/K))
  (cond
   ((= /__/O/K 1)
    (let ((/__var_save /var)
          (/__e_save /e))
     (set! /var (vector-ref /__/Match_array 1))
     (set! /e (vector-ref /__/Match_array 0))
     (cond
      ((and (= (@ST /e) //T_/String) (@Starts_With? (@V /e) "hex 0x"))
       (let ((/hex (@Num_To_Hex (- 255 (@Hex_To_Num (substr (@V /e) 6))))))
        (set! /e (@Make //T_/String (string-append "hex 0x" /hex) '()))
        (@Down_To 2)
        (@Down)
        (@Paste_Over (@Make 221 '() (list (@Make 206 "hex 0xFF" '()) (@Var_To_Expn /e)))))))
     (set! /var /__var_save)
     (set! /e /__e_save))))))

(define (/foreach-flowchart-13 //Depth //A/S_/Type)
 (let ((/__/O/K 1))
  (set! /__/O/K (@New_Match  /%const__flowchart__5 (@I) /__/O/K))
  (cond
   ((= /__/O/K 1)
    (let ((/__var_save /var)
          (/__flag_save /flag)
          (/__e_save /e))
     (set! /var (vector-ref /__/Match_array 2))
     (set! /flag (vector-ref /__/Match_array 1))
     (set! /e (vector-ref /__/Match_array 0))
     (@Down_To 2)
     (@Down)
     (@Down_To 2)
     (@FC_Replace_Flag /var /flag /sym_val_flag)
     (set! /var /__var_save)
     (set! /flag /__flag_save)
     (set! /e /__e_save))))))

(define (/foreach-flowchart-14 //Depth //A/S_/Type)
 (let ((/__/O/K 1))
  (set! /__/O/K (@New_Match  /%const__flowchart__2 (@I) /__/O/K))
  (cond
   ((= /__/O/K 1)
    (let ((/__flag_save /flag)
          (/__var_save /var))
     (set! /flag (vector-ref /__/Match_array 1))
     (set! /var (vector-ref /__/Match_array 0))
     (cond
      ((or (= (@ST /var) //T_/Variable) (= (@ST /var) //T_/Struct))
       (@FC_Bit_Test /var /flag)))
     (set! /flag /__flag_save)
     (set! /var /__var_save)))))
 (let ((/__/O/K 1))
  (set! /__/O/K (@New_Match  /%const__flowchart__6 (@I) /__/O/K))
  (cond
   ((= /__/O/K 1)
    (let ((/__flag_save /flag)
          (/__var_save /var))
     (set! /flag (vector-ref /__/Match_array 1))
     (set! /var (vector-ref /__/Match_array 0))
     (cond
      ((or (= (@ST /var) //T_/Variable) (= (@ST /var) //T_/Struct))
       (@FC_Bit_Test /var /flag)))
     (set! /flag /__flag_save)
     (set! /var /__var_save))))))

(define (/foreach-flowchart-15 //Depth //A/S_/Type)
 (let ((/__/O/K 1))
  (set! /__/O/K (@New_Match  /%const__flowchart__3 (@I) /__/O/K))
  (cond
   ((= /__/O/K 1)
    (let ((/__var_save /var)
          (/__flag_save /flag))
     (set! /var (vector-ref /__/Match_array 1))
     (set! /flag (vector-ref /__/Match_array 0))
     (@FC_Bit_Set //F/C_/Turn_/On /flag /var)
     (set! /var /__var_save)
     (set! /flag /__flag_save)))))
 (let ((/__/O/K 1))
  (set! /__/O/K (@New_Match  /%const__flowchart__5 (@I) /__/O/K))
  (cond
   ((= /__/O/K 1)
    (let ((/__var_save /var)
          (/__flag_save /flag)
          (/__e_save /e))
     (set! /var (vector-ref /__/Match_array 2))
     (set! /flag (vector-ref /__/Match_array 1))
     (set! /e (vector-ref /__/Match_array 0))
     (@FC_Bit_Set //F/C_/Turn_/Off /flag /var)
     (set! /var /__var_save)
     (set! /flag /__flag_save)
     (set! /e /__e_save))))))

(define (/foreach-flowchart-16 //Depth //A/S_/Type)
 (cond
  ((not (= (@ST (@I)) //T_/Variable))
   #t)
  ((and (= (@Posn_n) 1) (or (= (@ST (@Parent)) //T_/Aref) (= (@ST (@Parent)) //T_/Sub_/Seg) (= (@ST (@Parent)) //T_/Rel_/Seg)))
   #t)
  ((and (> (gen-length (gethash //Data_/Names (@V (@I)))) 1) (not (null? (gethash //Comment (@V (@I))))))
   (@Paste_Over (@Make //T_/Expn_/Pseudo (concat (string-append (concat (string-append (concat (@N_String (@V (@I))) //F/C_/Business) "{") (gethash //Comment (@V (@I)))) "}") //F/C_/Business_/End) '())))))

(define (/foreach-flowchart-17 //Depth //A/S_/Type)
 (cond
  ((not (= (@ST (@I)) //T_/Var_/Lvalue))
   #t)
  ((and (= (@Posn_n) 1) (or (= (@ST (@Parent)) //T_/Aref_/Lvalue) (= (@ST (@Parent)) //T_/Sub_/Seg_/Lvalue) (= (@ST (@Parent)) //T_/Rel_/Seg_/Lvalue)))
   #t)
  ((and (> (gen-length (gethash //Data_/Names (@V (@I)))) 1) (not (null? (gethash //Comment (@V (@I))))))
   (@Paste_Over (@Make //T_/Lvalue_/Pseudo (concat (string-append (concat (string-append (concat (@N_String (@V (@I))) //F/C_/Business) "{") (gethash //Comment (@V (@I)))) "}") //F/C_/Business_/End) '())))))

(define (/foreach-flowchart-18 //Depth //A/S_/Type)
 (cond
  ((= (@ST (@I)) //T_/Where)
   (@Down_To 2)
   (@Down)
   ; to first defn 
   (cond
    ((= //T_/Proc (@ST (@I)))
     (@Down)
     (@Paste_Over (@Name (@Make_Name (string-append "PROC " (@N_String (@V (@I)))))))
     (@Up)))
   (while (@Right?) 
    (begin
     (@Right)
     (cond
      ((= //T_/Proc (@ST (@I)))
       (@Down)
       (@Paste_Over (@Name (@Make_Name (string-append "PROC " (@N_String (@V (@I)))))))
       (@Up))))))))

(define (/foreach-flowchart-19 //Depth //A/S_/Type)
 (cond
  ((and (= (@ST (@I)) //T_/String) (@Starts_With? (@V (@I)) "hex 0x"))
   (@Paste_Over (@Make //T_/Expn_/Pseudo (substr (@V (@I)) 4) '())))))

(define /%const__flowchart__1 (@Make 110 '() (list (@Make 6 '() (list (@Make 506 -1 '()) (@Make 217 -2 '()))))))
(define /%const__flowchart__2 (@Make 301 '() (list (@Make 9 (@Make_Name "bit_test?") '()) (@Make 10 '() (list (@Make 217 -1 '()) (@Make 217 -2 '()))))))
(define /%const__flowchart__3 (@Make 101 '() (list (@Make 9 (@Make_Name "bit_or_1") '()) (@Make 10 '() (list (@Make 217 -1 '()) (@Make 205 1 '()))) (@Make 12 '() (list (@Make 506 -2 '()))))))
(define /%const__flowchart__4 (@Make 101 '() (list (@Make 9 (@Make_Name "bit_and_1") '()) (@Make 10 '() (list (@Make 217 -1 '()) (@Make 205 1 '()))) (@Make 12 '() (list (@Make 506 -2 '()))))))
(define /%const__flowchart__5 (@Make 101 '() (list (@Make 9 (@Make_Name "bit_and_1") '()) (@Make 10 '() (list (@Make 221 '() (list (@Make 217 -1 '()) (@Make 217 -2 '()))) (@Make 205 1 '()))) (@Make 12 '() (list (@Make 506 -3 '()))))))
(define /%const__flowchart__6 (@Make 301 '() (list (@Make 9 (@Make_Name "bit_tests?") '()) (@Make 10 '() (list (@Make 217 -1 '()) (@Make 217 -2 '()))))))
;
;==========================================================================
;FermaT Transformation System
;Copyright (C) 2001 Software Migrations Limited.
;Email: martin@gkc.org.uk
;==========================================================================
;  
; Write a VCG-format flowchart for the given program to the given file. 
; If the filename ends in .dot then write a graphviz dot file. 
; We use backedge for loops (FOR, DO...OD and WHILE) and for action calls 
; to higher actions in the system. 
; Conditional statements use labelled bentnearedge type edges. 
; Loop_Exits is a stack which records the node for the end of each enclosing loop. 
(set! //T/P/F_name (@Make_Name "_TPF_"))
(define (@Flowchart //I-par //Filename /data_file)
 (let ((//I-save //I))
  (set! //I //I-par)
  (let ((//Name2/Num-save //Name2/Num)
        (//Z (@Make_Name "Z"))
        (/entry_point-save /entry_point)
        (/dispatch-save /dispatch)
        (//N/O/T_/U/S/E/D (@Make_Name "NOT_USED"))
        (//G/O/B/A/C/K-save //G/O/B/A/C/K)
        (/dispatch_n-save /dispatch_n)
        (/dispatch_node-save /dispatch_node)
        (/exit_flag-save /exit_flag)
        (/terminal-save /terminal)
        (/external-save /external)
        (/new_block-save /new_block)
        (//Next_/Node-save //Next_/Node)
        (//End_/Node-save //End_/Node)
        (//Return_/Node-save //Return_/Node)
        (/entry 0)
        (//Subgraph-save //Subgraph)
        (//Subgraph_/N-save //Subgraph_/N)
        (//Loop_/Exits-save //Loop_/Exits)
        (//Current_/Action-save //Current_/Action)
        (//Options (hash-table))
        (/skipped_vars-save /skipped_vars)
        (//Dispatch_/Nodes-save //Dispatch_/Nodes)
        (//Runtime_/Flow-save //Runtime_/Flow)
        (//Thin_/Back_/Edges-save //Thin_/Back_/Edges)
        (//Max_/Box_/Lines1-save //Max_/Box_/Lines1)
        (//Max_/Box_/Lines2-save //Max_/Box_/Lines2)
        (//Max_/Box_/Chars-save //Max_/Box_/Chars)
        (//Max_/Rhomb_/Chars-save //Max_/Rhomb_/Chars)
        (//Max_/Split_/Line-save //Max_/Split_/Line)
        (//Left_/Justify-save //Left_/Justify)
        (//F/C_/Business-save //F/C_/Business)
        (//F/C_/Business_/End-save //F/C_/Business_/End)
        (//F/C_/Tech-save //F/C_/Tech)
        (//F/C_/Tech_/End-save //F/C_/Tech_/End)
        (//F/C_/Newline-save //F/C_/Newline)
        (//F/C_/Turn_/On-save //F/C_/Turn_/On)
        (//F/C_/Turn_/Off-save //F/C_/Turn_/Off)
        (//F/C_/Dot-save //F/C_/Dot)
        (//Data_/Names-save //Data_/Names)
        (//Data_/Lengths (hash-table))
        (//Data_/Origlen (hash-table))
        (//Data_/Repeats (hash-table))
        (//Data_/Fields (hash-table))
        (//Data_/Types-save //Data_/Types)
        (//Data_/Values (hash-table))
        (//Init_/Types (hash-table))
        (//Init_/Values (hash-table))
        (//Init_/String-save //Init_/String)
        (//Equ_/Symbol-save //Equ_/Symbol)
        (//D/S/E/C/T_/Tag-save //D/S/E/C/T_/Tag)
        (//Comment-save //Comment)
        (//Orig_/Name-save //Orig_/Name)
        (//C/I/C/S_/Maps (hash-table))
        (//Symbol_/Equ-save //Symbol_/Equ))
   (set! //Name2/Num (hash-table))
   (set! /entry_point (@Make_Name "entry_point"))
   (set! /dispatch (@Make_Name "dispatch"))
   (set! //G/O/B/A/C/K (@Make_Name "GOBACK"))
   (set! /dispatch_n (- 1))
   (set! /dispatch_node 0)
   (set! /exit_flag (@Make_Name "exit_flag"))
   (set! /terminal (@Make_Set (my-map @Make_Name (list "ENTNC" "ENTDC" "BACKC" "GOBACK"))))
   (set! /external (@Make_Set (my-map @Make_Name (list "ENTNC" "ENTDC" "ENTRC"))))
   (set! /new_block (@Make_Set (list //T_/Cond //T_/D_/If //T_/While //T_/For //T_/Floop //T_/D_/Do //T_/Call //T_/A_/S //T_/Exit //T_/Var //T_/Where //T_/Proc_/Call)))
   (set! //Next_/Node 2)
   (set! //End_/Node 2)
   (set! //Return_/Node (hash-table))
   (set! //Subgraph 0)
   (set! //Subgraph_/N 0)
   (set! //Loop_/Exits '())
   (set! //Current_/Action 0)
   (set! /skipped_vars (hash-table))
   (set! //Dispatch_/Nodes 1)
   (set! //Runtime_/Flow 0)
   (set! //Thin_/Back_/Edges 1)
   (set! //Max_/Box_/Lines1 8)
   (set! //Max_/Box_/Lines2 2)
   (set! //Max_/Box_/Chars 25)
   (set! //Max_/Rhomb_/Chars 20)
   (set! //Max_/Split_/Line 65)
   (set! //Left_/Justify 1)
   (set! //F/C_/Business "<Business>")
   (set! //F/C_/Business_/End "</Business>")
   (set! //F/C_/Tech "<Tech>")
   (set! //F/C_/Tech_/End "</Tech>")
   (set! //F/C_/Newline //Newline)
   (set! //F/C_/Turn_/On "TURN ON")
   (set! //F/C_/Turn_/Off "TURN OFF")
   (set! //F/C_/Dot 0)
   (set! //Data_/Names (hash-table))
   (set! //Data_/Types (hash-table))
   (set! //Init_/String (hash-table))
   (set! //Equ_/Symbol (hash-table))
   (set! //D/S/E/C/T_/Tag (hash-table))
   (set! //Comment (hash-table))
   (set! //Orig_/Name (hash-table))
   (set! //Symbol_/Equ (hash-table))
   (cond
    ((equal? /data_file "")
     (display-list "Warning: no data file supplied"))
    ((@File_Exists? /data_file)
     (display-list "Loading data file: " /data_file)
     (let ((/-result- (@Load_File  /data_file //Data_/Names //Data_/Lengths //Data_/Origlen //Data_/Repeats //Data_/Fields //Data_/Types //Data_/Values //Init_/Types //Init_/Values //Init_/String //Equ_/Symbol //D/S/E/C/T_/Tag //Comment //Orig_/Name //C/I/C/S_/Maps)))
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
     (display-list "Warning: data file `" /data_file "' not found!")))
   ; Copy any DSECT tag to all symbols in the DSECT: 
   (let ((/elt '()))
    (for-in /name (@Hash_Keys //Data_/Names) 
     (begin
      (set! /elt (gethash //Data_/Names /name))
      (cond
       ((and (> (gen-length /elt) 1) (not (null? (gethash //D/S/E/C/T_/Tag (car /elt)))))
        (puthash //D/S/E/C/T_/Tag (last-1 /elt) (gethash //D/S/E/C/T_/Tag (car /elt))))
       ((> (gen-length /elt) 1)
        (puthash //D/S/E/C/T_/Tag (last-1 /elt) (@N_String (car /elt))))))))
   (for-in /equ (@Hash_Keys //Equ_/Symbol) 
    (puthash //Symbol_/Equ (gethash //Equ_/Symbol /equ) (union-n (gethash //Symbol_/Equ (gethash //Equ_/Symbol /equ)) (list /equ))))
   ; Convert Init_String to hex if there is an Equ_Symbol: 
   (for-in /name (@Hash_Keys //Equ_/Symbol) 
    (cond
     ((and (not (null? (gethash //Init_/String (list /name)))) (@Digits? (gethash //Init_/String (list /name))))
      (puthash //Init_/String (list /name) (string-append "hex 0x" (@Num_To_Hex (@String_To_Num (gethash //Init_/String (list /name)))))))))
   (@Write_To //Filename)
   (cond
    ((@Ends_With? //Filename ".dot")
     (set! //F/C_/Dot 1)))
   (set! //Options (@Read_Options_File //Options_/File))
   (cond
    ((not (null? (gethash //Options "Dispatch_Nodes")))
     (set! //Dispatch_/Nodes (gethash //Options "Dispatch_Nodes"))))
   (cond
    ((not (null? (gethash //Options "Runtime_Flow")))
     (set! //Runtime_/Flow (gethash //Options "Runtime_Flow"))))
   (cond
    ((not (null? (gethash //Options "Thin_Back_Edges")))
     (set! //Thin_/Back_/Edges (gethash //Options "Thin_Back_Edges"))))
   (cond
    ((not (null? (gethash //Options "Max_Box_Lines1")))
     (set! //Max_/Box_/Lines1 (gethash //Options "Max_Box_Lines1"))))
   (cond
    ((not (null? (gethash //Options "Max_Box_Lines2")))
     (set! //Max_/Box_/Lines2 (gethash //Options "Max_Box_Lines2"))))
   (cond
    ((not (null? (gethash //Options "Max_Box_Chars")))
     (set! //Max_/Box_/Chars (gethash //Options "Max_Box_Chars"))))
   (cond
    ((not (null? (gethash //Options "Max_Rhomb_Chars")))
     (set! //Max_/Rhomb_/Chars (gethash //Options "Max_Rhomb_Chars"))))
   (cond
    ((not (null? (gethash //Options "Max_Split_Line")))
     (set! //Max_/Split_/Line (gethash //Options "Max_Split_Line"))))
   (cond
    ((not (null? (gethash //Options "Left_Justify")))
     (set! //Left_/Justify (gethash //Options "Left_Justify"))))
   (@Edit)
   (@New_Program //I)
   ; Pre-process the WSL code before generating flowchart 
   ; Check which variables to skip: 
   (puthash /skipped_vars //N/O/T_/U/S/E/D 1)
   (let ((/v-save /v))
    (set! /v '())
    (for-in /v (@Variables (@Program)) 
     (cond
      ((@Starts_With? /v "NOTUSED_")
       (puthash /skipped_vars /v 1))))
    (set! /v /v-save))
   ; Trim <FermaT> comments: 
   (@Foreach_Statement /foreach-flowchart-1 0 (@AS_Type) 0)
   (cond
    ((null? (@Program))
     (@New_Program (@Skips))))
   ; Delete unreachable code: 
   (@Foreach_Stats /foreach-flowchart-2 0 (@AS_Type) 0)
   (cond
    ((null? (@Program))
     (@New_Program (@Skips))))
   (@FC_Business_Tech_Process //Orig_/Name 1)
   (display-list "Writing flowchart...")
   (cond
    ((= //F/C_/Dot 0)
     (@FC_Initialise))
    (#t
     (@FC_Dot_Initialise)))
   ; The trick is to work _backwards_ through the program, from the end node 
   ; to the start node. Each fragment of the flowchart may have several 
   ; outgoing edges (eg exits from a loop body) but a single incoming edge. 
   ; So, to process an item we pass it the node to which it is to link 
   ; its outcoming edges and it returns the node which is its entry point. 
   ; (loop exits and action body entry nodes are stored in global variables) 
   ; A SKIP statement just returns the exit node as its entry: ie it adds 
   ; no nodes or edges to the flowchart. 
   ; We pass a negated node number to indicate to the item that the node 
   ; it is linking to is _above_ it: ie any linking edges must be backedge types. 
   (@FC_Start_Subgraph "start" 0)
   (@FC_Node "ellipse" 0 "start" "" "" "")
   ; Generate a flowchart for @Program and link it to node 1: 
   ; (Each link to node 1 creates a new end node) 
   (set! /entry (@FC_Generic (@Program) 1))
   ; Write the start node and link it in: 
   (@FC_Edge "edge" "" 0 (abs /entry))
   (cond
    ((= //Subgraph 1)
     (@FC_End_Subgraph)))
   (@FC_Finalise)
   (display-list "Done.")
   (@End_Write)
   (@Undo_Edit)
   (set! //Name2/Num //Name2/Num-save)
   (set! /entry_point /entry_point-save)
   (set! /dispatch /dispatch-save)
   (set! //G/O/B/A/C/K //G/O/B/A/C/K-save)
   (set! /dispatch_n /dispatch_n-save)
   (set! /dispatch_node /dispatch_node-save)
   (set! /exit_flag /exit_flag-save)
   (set! /terminal /terminal-save)
   (set! /external /external-save)
   (set! /new_block /new_block-save)
   (set! //Next_/Node //Next_/Node-save)
   (set! //End_/Node //End_/Node-save)
   (set! //Return_/Node //Return_/Node-save)
   (set! //Subgraph //Subgraph-save)
   (set! //Subgraph_/N //Subgraph_/N-save)
   (set! //Loop_/Exits //Loop_/Exits-save)
   (set! //Current_/Action //Current_/Action-save)
   (set! /skipped_vars /skipped_vars-save)
   (set! //Dispatch_/Nodes //Dispatch_/Nodes-save)
   (set! //Runtime_/Flow //Runtime_/Flow-save)
   (set! //Thin_/Back_/Edges //Thin_/Back_/Edges-save)
   (set! //Max_/Box_/Lines1 //Max_/Box_/Lines1-save)
   (set! //Max_/Box_/Lines2 //Max_/Box_/Lines2-save)
   (set! //Max_/Box_/Chars //Max_/Box_/Chars-save)
   (set! //Max_/Rhomb_/Chars //Max_/Rhomb_/Chars-save)
   (set! //Max_/Split_/Line //Max_/Split_/Line-save)
   (set! //Left_/Justify //Left_/Justify-save)
   (set! //F/C_/Business //F/C_/Business-save)
   (set! //F/C_/Business_/End //F/C_/Business_/End-save)
   (set! //F/C_/Tech //F/C_/Tech-save)
   (set! //F/C_/Tech_/End //F/C_/Tech_/End-save)
   (set! //F/C_/Newline //F/C_/Newline-save)
   (set! //F/C_/Turn_/On //F/C_/Turn_/On-save)
   (set! //F/C_/Turn_/Off //F/C_/Turn_/Off-save)
   (set! //F/C_/Dot //F/C_/Dot-save)
   (set! //Data_/Names //Data_/Names-save)
   (set! //Data_/Types //Data_/Types-save)
   (set! //Init_/String //Init_/String-save)
   (set! //Equ_/Symbol //Equ_/Symbol-save)
   (set! //D/S/E/C/T_/Tag //D/S/E/C/T_/Tag-save)
   (set! //Comment //Comment-save)
   (set! //Orig_/Name //Orig_/Name-save)
   (set! //Symbol_/Equ //Symbol_/Equ-save))
  (set! //I //I-save)))

(define (@FC_Generic //I-par /to)
 (let ((//I-save //I)
       (//G/T (@GT //I-par))
       (/node /to)
       (funct-result '()))
  (set! //I //I-par)
  (cond
   ((= //G/T //T_/Statement)
    (set! /node (@FC_Statement //I /to)))
   ((= //G/T //T_/Assigns)
    (set! /node (@FC_Block //I /to)))
   ((= //G/T //T_/Expression)
    (set! /node (@FC_Block //I /to)))
   ((= //G/T //T_/Condition)
    (set! /node (@FC_Block //I /to)))
   ((= //G/T //T_/Definition)
    (set! /node (@FC_Definition //I /to)))
   ((= //G/T //T_/Lvalue)
    (set! /node (@FC_Block //I /to)))
   ((= //G/T //T_/Guarded)
    (set! /node (@FC_Guarded //I /to)))
   ((= //G/T //T_/Action)
    (set! /node (@FC_Action //I /to)))
   ((= //G/T //T_/Statements)
    (set! /node (@FC_Statements //I /to)))
   ((= //G/T //T_/Expressions)
    (set! /node (@FC_Block //I /to)))
   ((= //G/T //T_/Lvalues)
    (set! /node (@FC_Block //I /to)))
   ((= //G/T //T_/Definitions)
    (set! /node (@FC_Definitions //I /to)))
   ((= //G/T //T_/Actions)
    (set! /node (@FC_Actions //I /to)))
   ((= //G/T //T_/Guardeds)
    (set! /node (@FC_Guardeds //I /to)))
   (#t
    (display-list (string-append (concat (string-append (string-append "UNRECOGNISED TYPE " (@Type_Name (@GT //I))) "(") (@String (@GT //I))) ")"))))
  (set! funct-result /node)
  (set! //I //I-save)
  funct-result))

; Fill in the flowchart for the given statement and join it to node to. 
(define (@FC_Statement //I-par /to)
 (let ((//I-save //I)
       (//S/T (@ST //I-par))
       (/node /to)
       (funct-result '()))
  (set! //I //I-par)
  (cond
   ((= //S/T //T_/A_/Proc_/Call)
    (set! /node (@FC_Block //I /to)))
   ((= //S/T //T_/X_/Proc_/Call)
    (set! /node (@FC_Block //I /to)))
   ((= //S/T //T_/M/W_/Proc)
    (set! /node (@FC_Block //I /to)))
   ((= //S/T //T_/Assignment)
    (set! /node (@FC_Block //I /to)))
   ((= //S/T //T_/A_/S)
    (set! /node (@FC_A_S //I /to)))
   ((= //S/T //T_/Call)
    (set! /node (@FC_Call //I /to)))
   ((= //S/T //T_/Comment)
    (set! /node (@FC_Block //I /to)))
   ((= //S/T //T_/Cond)
    (set! /node (@FC_Cond //I /to)))
   ((= //S/T //T_/Exit)
    (set! /node (@FC_Exit //I /to)))
   ((= //S/T //T_/For)
    (set! /node (@FC_For //I /to)))
   ((= //S/T //T_/Floop)
    (set! /node (@FC_Floop //I /to)))
   ((= //S/T //T_/Proc_/Call)
    (set! /node (@FC_Block //I /to)))
   ((= //S/T //T_/Skip)
    (set! /node (@FC_Block //I /to)))
   ((= //S/T //T_/Abort)
    (set! /node (@FC_Abort //I /to)))
   ((= //S/T //T_/Var)
    (set! /node (@FC_Var //I /to)))
   ((= //S/T //T_/Where)
    (set! /node (@FC_Where //I /to)))
   ((= //S/T //T_/While)
    (set! /node (@FC_While //I /to)))
   ((= //S/T //T_/D_/If)
    (set! /node (@FC_D_If //I /to)))
   ((= //S/T //T_/Print)
    (set! /node (@FC_Block //I /to)))
   (#t
    (display-list (string-append (concat (string-append (string-append "UNRECOGNISED STATEMENT: " (@Type_Name (@ST //I))) "(") (@String (@ST //I))) ") */"))))
  (set! funct-result /node)
  (set! //I //I-save)
  funct-result))

(define (@FC_Statements //I /to)
 
 (@FC_Statement_List (reverse (@Cs //I)) /to))

; Process a sequence of statements: 
; First try to construct a block of statements with no CALLs or IFs, 
; starting at the end of the sequence. 
; If this can't be done, then process the last statement and try again. 
; NB: list contains the sequence of statements in reverse order. 
(define (@FC_Statement_List /list /to)
 (let ((/block '())
       (/node /to)
       (/stat '()))
  (for-in /stat /list 
   (cond
    ((@FC_Terminating_Stat? /stat)
     (set! /to 0))))
  (while (and (not (null? /list)) (@FC_Block_OK? (car /list))) 
   (begin
    (set! /stat (car /list))
    (cond
     ((and (= (@ST /stat) //T_/Assignment) (= (@Size /stat) 1) (= (@ST (@Get_n (@Get_n /stat 1) 2)) //T_/Variable) (not (null? (gethash /skipped_vars (@V (@Get_n (@Get_n /stat 1) 2))))))
      #t)
     ((and (= (@ST /stat) //T_/Assignment) (= (@ST (@Get_n (@Get_n /stat 1) 1)) //T_/Var_/Lvalue) (equal? (@V (@Get_n (@Get_n /stat 1) 1)) /exit_flag) (= (@ST (@Get_n (@Get_n /stat 1) 2)) //T_/Number) (<= (@V (@Get_n (@Get_n /stat 1) 2)) 1))
      #t)
     ((and (= (@ST /stat) //T_/A_/Proc_/Call) (equal? (@V (@Get_n /stat 1)) //G/O/B/A/C/K))
      #t)
     (#t
      (set! /block (cons /stat /block))))
    (set! /list (cdr /list))))
  (cond
   ((not (null? /block))
    ; Create a node for the block, use one line per statement 
    (set! /node (@FC_Multi_Block /block /to))))
  ; If there are any statements left, then process the first one: 
  (cond
   ((not (null? /list))
    (set! /node (@FC_Statement (car /list) /node))
    ; Process the rest of the list, if any: 
    (set! /node (@FC_Statement_List (cdr /list) /node))))
  /node))

; A simple basic block (expression, condition etc.) 
; This does nothing if the label would be empty (eg an empty expression list) 
(define (@FC_Block //I-par /to)
 (let ((//I-save //I)
       (/code (@FC_Code //I-par))
       (/comments (@FC_Comments //I-par))
       (/label "")
       (/node /to)
       (/colour "")
       (funct-result '()))
  (set! //I //I-par)
  (cond
   ((@FC_Terminating_Stat? //I)
    (set! /to 0)))
  (cond
   ((not (equal? /code ""))
    (set! /label /code))
   (#t
    (set! /label /comments)))
  (cond
   ((> (string-length /label) //Max_/Box_/Chars)
    (set! /label (string-append (substr /label 0 (- //Max_/Box_/Chars 1)) "|"))))
  (cond
   ((not (equal? /label ""))
    (cond
     ((member //T/P/F_name (@Assigned //I))
      (set! /colour "#FFCCCB")))
    (set! /node //Next_/Node)
    (set! //Next_/Node (+ //Next_/Node 1))
    (@FC_Node "box" /node /label /code /comments /colour)
    (@FC_Edge "edge" "" /node /to)))
  (set! funct-result /node)
  (set! //I //I-save)
  funct-result))

(define (@FC_Terminating_Stat? //I-par)
 (let ((//I-save //I)
       (//R-save //R)
       (funct-result '()))
  (set! //I //I-par)
  (set! //R 0)
  (cond
   ((and (= (@ST //I) //T_/Assignment) (= (@ST (@Get_n (@Get_n //I 1) 1)) //T_/Var_/Lvalue) (equal? (@V (@Get_n (@Get_n //I 1) 1)) /exit_flag) (= (@ST (@Get_n (@Get_n //I 1) 2)) //T_/Number) (= (@V (@Get_n (@Get_n //I 1) 2)) 1))
    ; This statement terminates the program: 
    (set! //R 1))
   ((and (= (@ST //I) //T_/A_/Proc_/Call) (member (@V (@Get_n //I 1)) /terminal))
    ; This statement terminates the program: 
    (set! //R 1)))
  (set! funct-result (= //R 1))
  (set! //I //I-save)
  (set! //R //R-save)
  funct-result))

; A multi-line basic block, eg to summarise a sequence of statements: 
(define (@FC_Multi_Block /list /to)
 (let ((/code "")
       (/comments "")
       (/label "")
       (/node /to)
       (/colour ""))
  ; Truncate the list, if necessary: 
  (cond
   ((> (gen-length /list) (+ //Max_/Box_/Lines1 //Max_/Box_/Lines2))
    (set! /list (concat (concat (@Sub_Seg /list 1 //Max_/Box_/Lines1) (list (@Make //T_/Comment "..." '()))) (@Final_Seg /list (+ (- (gen-length /list) //Max_/Box_/Lines2) 1))))))
  (for-in //I /list 
   (cond
    ((= (@ST //I) //T_/Skip)
     ; Ignore SKIP statements 
    )
    ((= (@ST //I) //T_/Comment)
     (set! /comments (@FC_Append /comments (@V //I) 0))
     (set! /label (@FC_Append /label (@V //I) //Max_/Box_/Chars)))
    (#t
     (set! /code (@FC_Append /code (@FC_Code //I) 0))
     (set! /comments (@FC_Append /comments (@FC_Comments //I) 0))
     (set! /label (@FC_Append /label (@FC_Code //I) //Max_/Box_/Chars)))))
  ; If the label is still empty, then don't generate a node: 
  (cond
   ((not (equal? /label ""))
    (cond
     ((member //T/P/F_name (@Assigned (@Make //T_/Statements '() /list)))
      (set! /colour "#FFCCCB")))
    (set! /node //Next_/Node)
    (set! //Next_/Node (+ //Next_/Node 1))
    (@FC_Node "box" /node /label /code /comments /colour)
    (@FC_Edge "edge" "" /node /to)))
  /node))

; Append a string to the given string with a newline if necessary. 
; Trim the string before appending if max > 0 
(define (@FC_Append /str-par /new /max)
 (let ((/str-save /str)
       (//R-save //R)
       (funct-result '()))
  (set! /str /str-par)
  (set! //R "")
  (cond
   ((> /max 0)
    (cond
     ((> (string-length /new) /max)
      (set! /new (string-append (substr /new 0 (- /max 1)) "|"))))))
  (cond
   ((and (not (equal? /str "")) (not (equal? /new "")))
    (set! //R (concat (concat /str //Newline) /new)))
   (#t
    (set! //R (concat /str /new))))
  (set! funct-result //R)
  (set! /str /str-save)
  (set! //R //R-save)
  funct-result))

; Write a node to the file: 
; shape is either box, rhomb, ellipse or triangle: 
(define (@FC_Node /shape /title /label /code /comments /colour)
 (set! /title (@FC_Protect /title))
 (set! /label (@FC_Protect /label))
 (set! /code (@FC_Protect /code))
 (set! /comments (@FC_Protect /comments))
 (cond
  ((= //F/C_/Dot 0)
   (@WL (concat (string-append (concat (string-append (string-append "node: { shape: " /shape) " title: ") /title) " label: ") /label))
   (@WL (string-append (concat (string-append (string-append "        info1: " /code) " info2: ") /comments) " }")))
  ((and (equal? /shape "box") (= //Left_/Justify 1))
   (set! /label (@WS_Replace //Newline (string-append //Backslash "l") /label))
   (set! /label (concat (string-append (concat (substr /label 0 (- (string-length /label) 1)) //Backslash) "l") //Quote))
   (@WL (string-append (concat /title (@FC_Shape_Style /shape /label /comments /colour)) ";")))
  (#t
   (@WL (string-append (concat /title (@FC_Shape_Style /shape /label /comments /colour)) ";")))))

(define (@Quote /str)
 
 (concat (concat //Quote /str) //Quote))

; Given vcg shape, return dot attribute string [shape=xxx, style=yyy] 
(define (@FC_Shape_Style_nocomma /shape /label /comments /colour)
 (let ((//R-save //R)
       (funct-result '()))
  (set! //R "")
  (cond
   ((equal? /shape "rhomb")
    (set! /shape "diamond")))
  (set! /label (@WS_Replace //Newline (string-append //Backslash "n") /label))
  (cond
   ((not (equal? /colour ""))
    (set! //R (string-append (concat (string-append (concat (string-append (string-append "[shape = " (@Quote /shape)) " style=filled,color=") (@Quote /colour)) " label=") /label) "]")))
   (#t
    (set! //R (string-append (concat (string-append (string-append "[shape = " (@Quote /shape)) " label=") /label) "]"))))
  (set! funct-result //R)
  (set! //R //R-save)
  funct-result))

(define (@FC_Shape_Style /shape /label /comments /colour)
 (let ((//R-save //R)
       (funct-result '()))
  (set! //R "")
  (cond
   ((equal? /shape "rhomb")
    (set! /shape "diamond")))
  (set! /label (@WS_Replace //Newline (string-append //Backslash "n") /label))
  (cond
   ((not (equal? /colour ""))
    (set! //R (string-append (concat (string-append (concat (string-append (string-append "[shape = " (@Quote /shape)) ", style=filled,color=") (@Quote /colour)) ", label=") /label) "]")))
   (#t
    (set! //R (string-append (concat (string-append (string-append "[shape = " (@Quote /shape)) ", label=") /label) "]"))))
  (set! funct-result //R)
  (set! //R //R-save)
  funct-result))

; Write an edge to the file: 
; type is either edge, nearedge, bentnearedge or backedge. 
; If the target node is negative, then convert an edge to a backedge 
; (unless it is a bentnearedge) and make it thinner if Thin_Back_Edges = 1 
(define (@FC_Edge /type /label /source /target)
 (cond
  ((= /target 0)
   ; No edge: this is coming from an exit node eg BACKC call 
  )
  ((and (= //Runtime_/Flow 0) (or (equal? /source /dispatch_n) (equal? /target /dispatch_n)))
   ; Ignore branches to/from dispatch unless Runtime_Flow is set 
  )
  ((and (equal? /source /dispatch_n) (= (abs /target) 1))
   ; Ignore an edge from dispatch to the end 
  )
  (#t
   (@FC_Edge2 /type /label /source /target))))

(define (@FC_Edge2 /type /label /source /target)
 (let ((/class "")
       (/style "")
       (/thick ""))
  (cond
   ((< /target 0)
    (cond
     ((or (equal? /type "edge") (equal? /type "bentnearedge"))
      (set! /type "backedge")))
    (set! /target (abs /target))
    (cond
     ((= //Thin_/Back_/Edges 1)
      (set! /thick " thickness: 1")))))
  (cond
   ((equal? /source /dispatch_n)
    (cond
     ((equal? /type "edge")
      (set! /type "backedge")))
    (set! /class " class: 2")
    (set! /thick " thickness: 1")
    (cond
     ((= //Dispatch_/Nodes 1)
      (set! /dispatch_node (+ /dispatch_node 1))
      (set! /source (string-append "d" (@String /dispatch_node)))
      (@FC_Node "triangle" /source "?" "" "" "")
      (set! /type "nearedge")
      (set! /label ""))))
   ((equal? /target /dispatch_n)
    (set! /class " class: 3")
    (set! /thick " thickness: 1")
    (cond
     ((= //Dispatch_/Nodes 1)
      (set! /dispatch_node (+ /dispatch_node 1))
      (set! /target (string-append "d" (@String /dispatch_node)))
      (@FC_Node "triangle" /target "?" "" "" "")
      (set! /type "nearedge")
      (set! /label ""))))
   ((= /target 1)
    (set! /target //Next_/Node)
    (set! //Next_/Node (+ //Next_/Node 1))
    (@FC_Node "ellipse" /target "end" "" "" ""))
   ((not (null? (gethash //Return_/Node /target)))
    (set! /target //Next_/Node)
    (set! //Next_/Node (+ //Next_/Node 1))
    (@FC_Node "ellipse" /target "return" "" "" "")))
  (cond
   ((= //F/C_/Dot 0)
    (cond
     ((not (equal? /label ""))
      (set! /label (string-append " label: " (@FC_Protect /label)))))
    (@WS (concat (string-append /type ": { sourcename: ") (@FC_Protect /source)))
    (@WS (string-append " targetname: " (@FC_Protect /target)))
    (@WS (concat (concat (concat /label /class) /style) /thick))
    (@WL " }"))
   (#t
    (@FC_Dot_Edge /type /label /source /target)))))

(define (@FC_Dot_Edge_nocomma /type /label /source /target)
 (let ((/style (if (equal? /label "") "" (string-append "label=" /label))))
  (cond
   ((equal? /type "backedge")
    (cond
     ((not (equal? /style ""))
      (set! /style (string-append /style " "))))
    (set! /style (string-append /style "weight=0 penwidth=0.5 color=red"))))
  (@WL (string-append (concat (string-append (concat (string-append (@Quote /source) " -> ") (@Quote /target)) "[") /style) "];"))))

; NB: Changed backedge weight from 0 to 1 (the default) 
; since it seems to give a better result. 
(define (@FC_Dot_Edge /type /label /source /target)
 (let ((/style (if (equal? /label "") "" (string-append "label=" /label)))
       (/tmp ""))
  (cond
   ((equal? /type "backedge")
    (cond
     ((not (equal? /style ""))
      (set! /style (string-append /style ","))))
    (set! /style (string-append /style "weight=1, penwidth=0.5, color=red"))))
  (@WL (string-append (concat (string-append (concat (string-append (@Quote /source) " -> ") (@Quote /target)) "[") /style) "];"))))

; Protect a string with backslashes and add quotes 
(define (@FC_Protect /str)
 
 (concat (concat //Quote (@WS_Replace //Quote (concat //Backslash //Quote) (@WS_Replace //Backslash (concat //Backslash //Backslash) (@String /str)))) //Quote))

; Return the WSL code for the given item as a string: 
(define (@FC_Code //I-par)
 (let ((//I-save //I)
       (funct-result '()))
  (set! //I //I-par)
  (@New_Program //I)
  (@Trans //T/R_/Delete_/All_/Comments "")
  (set! funct-result (@PP_Multi (@Program) //Max_/Split_/Line))
  (set! //I //I-save)
  funct-result))

(define (@FC_Comments //I-par)
 (let ((//I-save //I)
       (//R-save //R)
       (funct-result '()))
  (set! //I //I-par)
  (set! //R '())
  (@New_Program //I)
  (@Foreach_Statement /foreach-flowchart-3 0 (@AS_Type) 0)
  (cond
   ((null? (@Program))
    (@New_Program (@Skips))))
  (set! funct-result (@Join //Newline (reverse //R)))
  (set! //I //I-save)
  (set! //R //R-save)
  funct-result))

; Check if a statement is suitable for adding to a basic block 
; ie no IF statements, exits, action calls, loops etc.: 
; A proc call must go in a separate block 
(define (@FC_Block_OK_Orig? //I)
 
 (null? (intersection-n (@Stat_Types //I) (@Make_Set (list //T_/Cond //T_/D_/If //T_/While //T_/For //T_/Floop //T_/D_/Do //T_/Call //T_/A_/S //T_/Exit //T_/Var //T_/Where //T_/Proc_/Call)))))

(define (@FC_Block_OK? //I-par)
 (let ((//I-save //I)
       (//R-save //R)
       (funct-result '()))
  (set! //I //I-par)
  (set! //R 1)
  (cond
   ((and (= (@ST //I) //T_/A_/Proc_/Call) (member (@V (@Get_n //I 1)) /external))
    (set! //R 0))
   ((not (null? (intersection-n (@Stat_Types //I) /new_block)))
    (set! //R 0)))
  (set! funct-result (= //R 1))
  (set! //I //I-save)
  (set! //R //R-save)
  funct-result))

; An action system starts by calling the first action. 
; We set up a table giving node numbers for each action, 
; including Z which is mapped to `to' 
; To decide if a call is a backedge we need to know the action name or number 
; for the current action: this is stored in the global variable Current_Action. 
; We process all the action bodies in turn and return the node for the start action. 
(define (@FC_A_S //I-par /to)
 (let ((//I-save //I)
       (//N (@Size (@Get_n //I-par 2)))
       (/node /to)
       (funct-result '()))
  (set! //I //I-par)
  (let ((//A/S_/Type (@System_Type //I))
        (//Bodies (make-vector-eval //N '()))
        (//Names (make-vector-eval (+ //N 1) '()))
        (//Nodes-save //Nodes)
        (//Name2/Num-save //Name2/Num)
        (/dispatch_n-save /dispatch_n))
   (set! //Nodes (make-vector-eval (+ //N 1) '()))
   (set! //Name2/Num (hash-table))
   (set! /dispatch_n (- 1))
   ; Calculate Bodies, Names, Name2Num 
   ; Hash table Name2Num maps action names (keys) to action numbers 
   (@New_Program //I)
   (let ((/-result- (@FD_Init  //N //Bodies //Names //Name2/Num)))
    (set! //Bodies (car /-result-)) (set! /-result- (cdr /-result-))
    (set! //Names (car /-result-)) (set! /-result- (cdr /-result-))
    (set! //Name2/Num (car /-result-)) (set! /-result- (cdr /-result-)))
   ; Create a node for each action: 
   (for /i 1 //N 1 
    (begin
     (wsl-set! //Nodes //Next_/Node /i)
     (set! //Next_/Node (+ //Next_/Node 1))
     (cond
      ((and (equal? (wsl-ref //Names /i) /dispatch) (= //Dispatch_/Nodes 1))
       #t)
      (#t
       (@FC_Node "box" (wsl-ref //Nodes /i) (@N_String (wsl-ref //Names /i)) "" "" "")))))
   ; CALL Z passes control to the next node after the action system: 
   (wsl-set! //Nodes /to (+ //N 1))
   (cond
    ((not (null? (gethash //Name2/Num /dispatch)))
     (set! /dispatch_n (wsl-ref //Nodes (gethash //Name2/Num /dispatch))))
    (#t
     (set! /dispatch_n (- 1))))
   ; Flowchart each action (we know they are all connected, 
   ; since we simplified all action systems): 
   (for /i 1 //N 1 
    (begin
     (set! //Current_/Action /i)
     ; Special case for dispatch action: 
     (cond
      ((equal? (wsl-ref //Names /i) /dispatch)
       (@FC_Dispatch (wsl-ref //Nodes /i) (wsl-ref //Bodies /i)))
      (#t
       (set! /node (@FC_Statements (wsl-ref //Bodies /i) /to))
       ; Link the entry node for the action to its body: 
       (@FC_Edge "edge" "" (wsl-ref //Nodes /i) /node)))))
   ; Return the starting action node: 
   (set! /node (wsl-ref //Nodes (gethash //Name2/Num (@V (@Get_n //I 1)))))
   (set! //Nodes //Nodes-save)
   (set! //Name2/Num //Name2/Num-save)
   (set! /dispatch_n /dispatch_n-save))
  (set! funct-result /node)
  (set! //I //I-save)
  funct-result))

; The dispatch action is a single node with a lot of backedges coming out. 
; (@FC_Edge ensures that edges from dispatch and not to end are backedges) 
(define (@FC_Dispatch /node /body)
 (for-in /call (@Calls /body) 
  (@FC_Edge "edge" "" /node (wsl-ref //Nodes (- (wsl-ref /call 1))))))

; To process a call, we simply return the called node for our predecessor 
; to link to. We negate it if the call is a backedge: 
(define (@FC_Call //I-par /to)
 (let ((//I-save //I)
       (/node (wsl-ref //Nodes (- (@V //I-par))))
       (funct-result '()))
  (set! //I //I-par)
  (cond
   ((and (not (null? (gethash //Name2/Num (@V //I)))) (<= (gethash //Name2/Num (@V //I)) //Current_/Action))
    (set! /node (- /node))))
  (set! funct-result /node)
  (set! //I //I-save)
  funct-result))

(define (@FC_Cond //I /to)
 
 (@FC_Guarded_List (@Cs //I) /to))

; Process a list of guardeds: 
(define (@FC_Guarded_List /list /to)
 (let ((/node /to))
  (cond
   ((null? /list)
    (set! /node /to))
   ((null? (cdr /list))
    ; process the ELSE clause: 
    (set! /node (@FC_Statements (@Get_n (car /list) 2) /to)))
   (#t
    ; Generate a rhombus and link in the two arms: 
    (let ((/true_node (@FC_Statements (@Get_n (car /list) 2) /to))
          (/false_node (@FC_Guarded_List (cdr /list) /to))
          (/test (@FC_Code (@Get_n (car /list) 1))))
     (cond
      ((equal? /test "exit_flag = 1")
       ; this branch cannot be taken 
       (set! /node /false_node))
      ((equal? /test "exit_flag <> 1")
       ; this branch must be taken 
       (set! /node /true_node))
      (#t
       (set! /node //Next_/Node)
       (set! //Next_/Node (+ //Next_/Node 1))
       (@FC_Test (@Get_n (car /list) 1) /node /true_node /false_node 0))))))
  /node))

; Make a rhombus node containing the test with links to the given nodes, 
; type = 0 for an IF, 1 for a WHILE, 2 for a FOR loop: 
(define (@FC_Test /cond /node /true_node /false_node /type)
 (let ((/code (@FC_Code /cond))
       (/label ""))
  ; Chop off the DO SKIP OD which comes from a FOR node: 
  (cond
   ((@Ends_With? /code " DO SKIP OD")
    (set! /code (substr /code 0 (- (string-length /code) 11)))))
  (cond
   ((> (string-length /code) //Max_/Rhomb_/Chars)
    (set! /label (string-append (substr /code 0 (- //Max_/Rhomb_/Chars 1)) "|")))
   (#t
    (set! /label /code)))
  (@FC_Node "rhomb" /node /label /code "" "")
  (cond
   ((= /type 0)
    (@FC_Edge "bentnearedge" "Y" /node /true_node)
    (@FC_Edge "bentnearedge" "N" /node /false_node))
   ((= /type 1)
    (@FC_Edge "edge" "Y" /node /true_node)
    (@FC_Edge "bentnearedge" "N" /node /false_node))
   (#t
    (@FC_Edge "edge" "" /node /true_node)
    (@FC_Edge "bentnearedge" "done" /node /false_node)))))

(define (@FC_Floop //I-par /to)
 (let ((//I-save //I)
       (/node //Next_/Node)
       (/top 0)
       (funct-result '()))
  (set! //I //I-par)
  (set! //Next_/Node (+ //Next_/Node 1))
  ; Create a node for the top of the loop, this is the target node 
  ; for the loop body: 
  (@FC_Node "box" /node (string-append "FLOOP " (@String (+ (gen-length //Loop_/Exits) 1))) "" "" "")
  (set! //Loop_/Exits (cons /to //Loop_/Exits))
  (set! /top (@FC_Statements (@Get_n //I 1) (- /node)))
  (set! //Loop_/Exits (cdr //Loop_/Exits))
  ; Link the loop's node to the top of the body and return the node: 
  (@FC_Edge "edge" "" /node /top)
  (set! funct-result /node)
  (set! //I //I-save)
  funct-result))

; An EXIT returns the appropriate loop exit node: 
(define (@FC_Exit //I-par /to)
 (let ((//I-save //I)
       (/exit 0)
       (funct-result '()))
  (set! //I //I-par)
  (cond
   ((null? //Loop_/Exits)
    (set! /exit 0))
   ((> (@V //I) (gen-length //Loop_/Exits))
    (set! /exit (last-1 //Loop_/Exits)))
   (#t
    (set! /exit (wsl-ref //Loop_/Exits (@V //I)))))
  (set! funct-result /exit)
  (set! //I //I-save)
  funct-result))

; Check for entry points. 
; We use the given node for the first entry point and return its entry. 
; We create separate entry and exit nodes for the other entry points: 
(define (@FC_D_If //I-par /to)
 (let ((//I-save //I)
       (/node /to)
       (/guards (@Cs //I-par))
       (/start 0)
       (/end 0)
       (funct-result '()))
  (set! //I //I-par)
  (cond
   ((and (not (null? /guards)) (@FC_Entry_Point? (@Get_n (@Get_n //I 1) 1)))
    (set! /node (@FC_Statements (@Get_n (car /guards) 2) /to))
    (for-in /guard (cdr /guards) 
     (cond
      ((@FC_Entry_Point? (@Get_n /guard 1))
       (set! /start //Next_/Node)
       (set! //Next_/Node (+ //Next_/Node 1))
       (@FC_Force_To_End /start)
       (set! /end //Next_/Node)
       (set! //Next_/Node (+ //Next_/Node 1))
       (@FC_Start_Subgraph (@V (@Get_n (@Get_n /guard 1) 2)) 1)
       (@FC_Node "ellipse" /start (@V (@Get_n (@Get_n /guard 1) 2)) "" "" "")
       (puthash //Return_/Node /end 1)
       (set! /end (@FC_Statements (@Get_n /guard 2) /end))
       (@FC_Edge "edge" "" /start /end)))))
   (#t
    (set! /node (@FC_Cond //I /to))))
  (set! funct-result /node)
  (set! //I //I-save)
  funct-result))

; Tests for Entry_Point = string: 
(define (@FC_Entry_Point? /cond)
 
 (and (= (@ST /cond) //T_/Equal) (= (@ST (@Get_n /cond 1)) //T_/Variable) (equal? (@V (@Get_n /cond 1)) /entry_point)))

(define (@FC_Guardeds //I /to)
 
 (@FC_Cond //I /to))

; Note that abort doesn't link to the target node: 
(define (@FC_Abort //I-par /to)
 (let ((//I-save //I)
       (/node //Next_/Node)
       (funct-result '()))
  (set! //I //I-par)
  (set! //Next_/Node (+ //Next_/Node 1))
  (@FC_Node "ellipse" /node "ABORT" "ABORT" "ABORT causes an error" "")
  (set! funct-result /node)
  (set! //I //I-save)
  funct-result))

(define (@FC_While //I-par /to)
 (let ((//I-save //I)
       (/test //Next_/Node)
       (/top 0)
       (funct-result '()))
  (set! //I //I-par)
  (set! //Next_/Node (+ //Next_/Node 1))
  ; Process the loop body: it exits by returning to the test node: 
  (set! /top (@FC_Statements (@Get_n //I 2) (- /test)))
  ; Now create the test node and link it to the body 
  (@FC_Test (@Get_n //I 1) /test /top /to 1)
  (set! funct-result /test)
  (set! //I //I-save)
  funct-result))

(define (@FC_For //I-par /to)
 (let ((//I-save //I)
       (/test //Next_/Node)
       (/top 0)
       (/for (@Make //T_/For '() (list (@Get_n //I-par 1) (@Get_n //I-par 2) (@Get_n //I-par 3) (@Get_n //I-par 4) (@Skips))))
       (funct-result '()))
  (set! //I //I-par)
  (set! //Next_/Node (+ //Next_/Node 1))
  ; Process the loop body: it exits by returning to the test node: 
  (set! /top (@FC_Statements (@Get_n //I 5) (- /test)))
  ; Now create the test node and link it to the body 
  (@FC_Test /for /test /top /to 2)
  (set! funct-result /test)
  (set! //I //I-save)
  funct-result))

(define (@FC_Var //I-par /to)
 (let ((//I-save //I)
       (/node 0)
       (funct-result '()))
  (set! //I //I-par)
  (set! /node (@FC_Statements (@Get_n //I 2) /to))
  (cond
   ((not-member /dispatch (@Assigned (@Get_n //I 1)))
    (set! /node (@FC_Block (@Get_n //I 1) /node))))
  (set! funct-result /node)
  (set! //I //I-save)
  funct-result))

(define (@FC_Where //I-par /to)
 (let ((//I-save //I)
       (/node /to)
       (funct-result '()))
  (set! //I //I-par)
  (set! /node (@FC_Statements (@Get_n //I 1) /node))
  (set! /node (@FC_Definitions (@Get_n //I 2) /node))
  (set! funct-result /node)
  (set! //I //I-save)
  funct-result))

; Each definition is a free-standing flowchart on its own, so ignore the given nodes: 
(define (@FC_Definition //I-par /to)
 (let ((//I-save //I)
       (/start //Next_/Node)
       (/end (+ //Next_/Node 1))
       (/comments "")
       (funct-result '()))
  (set! //I //I-par)
  (@FC_Force_To_End /start)
  (set! //Next_/Node (+ //Next_/Node 2))
  (cond
   ((= (@ST //I) //T_/Proc)
    (set! /comments "Procedure definition"))
   (#t
    (set! /comments "Function definition")))
  (@FC_Start_Subgraph (@V (@Get_n //I 1)) 1)
  (@FC_Node "ellipse" /start (@N_String (@V (@Get_n //I 1))) "" /comments "")
  (puthash //Return_/Node /end 1)
  (for-in /comp (reverse (cdr (@Cs //I))) 
   (set! /end (@FC_Generic /comp /end)))
  (@FC_Edge "edge" "" /start /end)
  (set! funct-result /to)
  (set! //I //I-save)
  funct-result))

(define (@FC_Definitions //I-par /to)
 (let ((//I-save //I)
       (/dummy 0)
       (funct-result '()))
  (set! //I //I-par)
  (for-in /comp (@Cs //I) 
   (set! /dummy (@FC_Definition /comp /to)))
  (set! funct-result /to)
  (set! //I //I-save)
  funct-result))

(define (@FC_Guarded //I /to)
 (display-list "ERROR: bare Guarded item encountered!")
 /to)

(define (@FC_Action //I /to)
 (display-list "ERROR: bare Action encountered!")
 /to)

(define (@FC_Actions //I /to)
 (display-list "ERROR: bare Actions encountered!")
 /to)

; Create invisible, priority 0 edges which force this node to appear 
; after all the previous nodes: 
(define (@FC_Force_To_End_ /node)
 (let ((/target (string-append " targetname: " (@FC_Protect (abs /node)))))
  (set! /target (string-append /target " linestyle: invisible priority: 0 }"))
  (for /i //End_/Node (- /node 1) 1 
   (cond
    ((null? (gethash //Return_/Node /i))
     (@WL (concat (string-append "edge: { sourcename: " (@FC_Protect /i)) /target)))))
  (set! //End_/Node /node)))

(define (@FC_Force_To_End /node)
 #t
 #t)

(define (@FC_Dot_Initialise)
 (@WL "digraph {")
 (@WL ""))

(define (@FC_Initialise)
 (@WL (concat (string-append (string-append "graph: { title: " //Quote) "Flowchart") //Quote))
 (@WL "

  width: 1142
  height: 930
  x: 0 
  y: 0

  manhatten_edges: yes
  smanhatten_edges: no
  layoutalgorithm: minbackward
  // layoutalgorithm: dfs
  port_sharing: yes
  edge.thickness: 4
  foldnode.textcolor: red

  color: white
  xmax: 1200
  ymax: 1024
  xbase: 5
  ybase: 5
  xspace: 20
  xlspace: 12
  yspace: 50
  xraster: 1
  xlraster: 1
  yraster: 1
  shrink:  1
  stretch: 1
  layout_downfactor: 100
  layout_upfactor: 1
  layout_nearfactor: 0
  layout_splinefactor: 70
  spreadlevel: 1
  treefactor: 0.500000
  bmax: 50
  cmin: 0
  cmax: 10
  pmin: 0
  pmax: 20
  rmin: 0
  rmax: 30
  smax: 50
  node_alignment: center
  orientation: top_to_bottom
  late_edge_labels: no
  display_edge_labels: yes
  dirty_edge_labels: yes
  finetuning: yes
  nearedges: yes
  splines: no
  ignoresingles: no
  straight_phase: yes
  priority_phase: yes
  crossingphase2: yes
  crossingoptimization: yes
  crossingweight: barymedian
  arrow_mode: free
  colorentry 7 :  85 85 85
  colorentry 8 :  0 0 128
  colorentry 9 :  128 0 0
  colorentry 10 :  0 128 0
  colorentry 11 :  128 128 0
  colorentry 12 :  128 0 128
  colorentry 13 :  0 128 128
  colorentry 14 :  255 215 0
  colorentry 15 :  170 170 170
  colorentry 16 :  128 128 255
  colorentry 17 :  255 128 128
  colorentry 18 :  128 255 128
  colorentry 19 :  255 255 128
  colorentry 20 :  255 128 255
  colorentry 21 :  128 255 255
  colorentry 22 :  238 130 238
  colorentry 23 :  64 224 208
  colorentry 24 :  127 255 212
  colorentry 25 :  240 230 140
  colorentry 26 :  160 32 240
  colorentry 27 :  154 205 50
  colorentry 28 :  255 192 203
  colorentry 29 :  255 165 0
  colorentry 30 :  218 112 214

")
 (let ((/classes (list "normal" "from dispatch" "to dispatch")))
  (for /i 1 3 1 
   (@WL (concat (string-append (string-append "  classname " (@String /i)) " : ") (@FC_Protect (wsl-ref /classes /i))))))
 (@WL "")
 (let ((/names (list "WSL" "comments" "assembler")))
  (for /i 1 3 1 
   (@WL (concat (string-append (string-append "  infoname " (@String /i)) " : ") (@FC_Protect (wsl-ref /names /i))))))
 (@WL ""))

(define (@FC_Finalise)
 (@WL "")
 (@WL "}"))

(define (@FC_Start_Subgraph_ /title /fold)
 ; End a current subgraph if necessary: 
 (cond
  ((= //Subgraph 1)
   (@FC_End_Subgraph)))
 (set! //Subgraph 1)
 (set! //Subgraph_/N (+ //Subgraph_/N 1))
 (@WL "")
 (@WL (concat (string-append (string-append "graph: { title: " (@FC_Protect /title)) " folding: ") (@String /fold)))
 (@WL (string-append "  horizontal_order: " (@String //Subgraph_/N)))
 (@WL ""))

(define (@FC_End_Subgraph_)
 (@WL "}")
 (@WL ""))

(define (@FC_Start_Subgraph /title /fold)
 (@WL ""))

(define (@FC_End_Subgraph)
 (@WL ""))

; Read the options file into a hash table and return it 
(define (@Read_Options_File /file)
 (let ((//Options (hash-table))
       (/port (@Open_Input_File /file))
       (/line '())
       (/var-save /var)
       (/n 0)
       (/m 0)
       (/space (string-append " =" //Tab))
       (/alphanum "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_")
       (/num "0123456789")
       (funct-result '()))
  (set! /var "")
  (display-list "Reading options file: " /file)
  (set! /fl_flag1 0)
  (while (= /fl_flag1 0) 
   (begin
    (set! /line (@Read_Line /port))
    (cond
     ((@EOF? /line)
      (set! /fl_flag1 1))
     ((and (not (equal? /line "")) (not (equal? (substr /line 0 1) "#")))
      ; parse line as var = value 
      (set! /n 0)
      (while (and (not (@Char_In_Str? /line /n /space)) (@Char_In_Str? /line /n /alphanum) (not (= /n (string-length /line)))) 
       (set! /n (+ /n 1)))
      (cond
       ((and (not (@Char_In_Str? /line /n /alphanum)) (not (@Char_In_Str? /line /n /space)))
        (display-list "ERROR 1 in options file, n = " /n)
        (display-list /line)
        (error "@Read_Options_File:")
        (set! /fl_flag1 1))
       (#t
        (set! /var (substr /line 0 /n))
        (while (@Char_In_Str? /line /n /space) 
         (set! /n (+ /n 1)))
        (cond
         ((>= /n (string-length /line))
          ; Skip this blank line 
          (set! /fl_flag1 0))
         ((equal? (substr /line /n 1) //Quote)
          ; Check for string or number: 
          (set! /n (+ /n 1))
          (set! /m /n)
          (while (equal? (substr /line (- (string-length /line) 1) 1) //Backslash) 
           (begin
            (set! /line (substr /line 0 (- (string-length /line) 1)))
            (set! /line (concat /line (@Read_Line /port)))))
          (while (and (< /m (- (string-length /line) 1)) (not (equal? (substr /line /m 1) //Quote))) 
           (set! /m (+ /m 1)))
          (cond
           ((not (equal? (substr /line /m 1) //Quote))
            (display-list "ERROR 3 in options file:")
            (display-list /line)
            (error "@Read_Options_File:")
            (set! /fl_flag1 1))
           (#t
            (cond
             ((null? (gethash //Options /var))
              (puthash //Options /var (substr /line /n (- /m /n))))
             (#t
              (puthash //Options /var (concat (string-append (gethash //Options /var) " ") (substr /line /n (- /m /n))))))
            (cond
             (#f
              (display-list "Options.(" /var ") = " //Quote (gethash //Options /var) //Quote)
              (set! /fl_flag1 0))
             (#t
              (set! /fl_flag1 0))))))
         ((@Char_In_Str? /line /n /num)
          (set! /m /n)
          (while (@Char_In_Str? /line /m /num) 
           (set! /m (+ /m 1)))
          (puthash //Options /var (@String_To_Num (substr /line /n (- /m /n))))
          (cond
           (#f
            (display-list "Options.(" /var ") = " (gethash //Options /var))
            (set! /fl_flag1 0))
           (#t
            (set! /fl_flag1 0))))
         (#t
          (display-list "ERROR 4 in options file:")
          (display-list /line)
          (error "@Read_Options_File:")
          (set! /fl_flag1 1))))))
     (#t
      (set! /fl_flag1 0)))))
  (set! funct-result //Options)
  (set! /var /var-save)
  funct-result))

; !XC bit_test(var, flag) 
(define (@FC_Bit_Sub /var-par /flag-par /comment-par)
 (let ((/comment-save /comment)
       (/flag-save /flag)
       (/var-save /var)
       (funct-result '()))
  (set! /comment /comment-par)
  (set! /flag /flag-par)
  (set! /var /var-par)
  (set! /var (last-1 (@Struct_Elts /var)))
  ; If flag is a hex string, look for an equate for the var which has 
  ; this value and use it as the flag 
  (cond
   ((and (= (@ST /flag) //T_/String) (not (null? (gethash //Symbol_/Equ /var))))
    (let ((/str (@V /flag)))
     (for-in /equ (gethash //Symbol_/Equ /var) 
      (cond
       ((and (not (null? (gethash //Init_/String /equ))) (equal? (gethash //Init_/String /equ) /str))
        (set! /flag /equ)))))))
  ; Check that the flag is valid for this variable 
  (cond
   ((= (@ST /flag) //T_/Variable)
    (set! /flag (@V /flag))
    (cond
     ((and (not (null? (gethash //Equ_/Symbol /flag))) (equal? (gethash //Equ_/Symbol /flag) /var) (not (null? (gethash //Comment /flag))))
      (set! /comment (gethash //Comment /flag))))))
  (set! funct-result (list /var /flag /comment))
  (set! /comment /comment-save)
  (set! /flag /flag-save)
  (set! /var /var-save)
  funct-result))

(define (@FC_Bit_Test /var-par /flag-par)
 (let ((/flag-save /flag)
       (/var-save /var))
  (set! /flag /flag-par)
  (set! /var /var-par)
  (let ((/comment-save /comment)
        (/tag (gethash //D/S/E/C/T_/Tag (last-1 (@WC_Struct_Elts /var)))))
   (set! /comment "")
   (cond
    ((null? /tag)
     (set! /tag "")))
   (let ((/-result- (@FC_Bit_Sub  /var /flag /comment)))
    (set! /var (car /-result-)) (set! /-result- (cdr /-result-))
    (set! /flag (car /-result-)) (set! /-result- (cdr /-result-))
    (set! /comment (car /-result-)) (set! /-result- (cdr /-result-)))
   (cond
    ((not (equal? /comment ""))
     ; Replace the test with the comment for the business version 
     (@FC_Hex)
     (let ((/business (string-append (concat (string-append (concat (string-append /tag "(") (@N_String /flag)) " ") (gethash //Comment /flag)) ")?"))
           (/tech (@PP_Multi (@I) //Max_/Split_/Line)))
      (@Paste_Over (@Make //T_/Cond_/Pseudo (concat (concat (concat (concat (concat (concat //F/C_/Business /business) //F/C_/Business_/End) //F/C_/Newline) //F/C_/Tech) /tech) //F/C_/Tech_/End) '())))))
   (set! /comment /comment-save))
  (set! /flag /flag-save)
  (set! /var /var-save)))

; !P bit_or_1(flag, 1 VAR var) 
(define (@FC_Bit_Set /text /flag-par /var-par)
 (let ((/var-save /var)
       (/flag-save /flag))
  (set! /var /var-par)
  (set! /flag /flag-par)
  (let ((/comment-save /comment)
        (/tag (gethash //D/S/E/C/T_/Tag /var)))
   (set! /comment "")
   (cond
    ((null? /tag)
     (set! /tag "")))
   (let ((/-result- (@FC_Bit_Sub  /var /flag /comment)))
    (set! /var (car /-result-)) (set! /-result- (cdr /-result-))
    (set! /flag (car /-result-)) (set! /-result- (cdr /-result-))
    (set! /comment (car /-result-)) (set! /-result- (cdr /-result-)))
   (cond
    ((not (equal? /comment ""))
     ; Replace the bit op with the comment for the business version 
     (@FC_Hex)
     (let ((/business (string-append (concat (string-append (concat (string-append (concat (string-append /text " ") /tag) "(") (@N_String /flag)) " ") (gethash //Comment /flag)) ")"))
           (/tech (@PP_Multi (@I) //Max_/Split_/Line)))
      (@Paste_Over (@Make //T_/Stat_/Pseudo (concat (concat (concat (concat (concat (concat //F/C_/Business /business) //F/C_/Business_/End) //F/C_/Newline) //F/C_/Tech) /tech) //F/C_/Tech_/End) '())))))
   (set! /comment /comment-save))
  (set! /var /var-save)
  (set! /flag /flag-save)))

; Pretty-print the given item as a string 
; Split the string if it is too long. 
(define (@PP_Multi //I-par /len)
 (let ((//I-save //I)
       (/str-save /str)
       (//L '())
       (/bus "")
       (funct-result '()))
  (set! //I //I-par)
  (set! /str (@PP_1 //I-par 0))
  (cond
   ((and (= (@ST //I) //T_/A_/Proc_/Call) (member //T/P/F_name (@Assigned //I)))
    ; This is a TPF macro call 
    (set! /str (@N_String (@V (@Get_n //I 1))))
    (cond
     ((and (equal? (@V (@Get_n //I 1)) (@Make_Name "SENDA")) (> (@Size (@Get_n //I 2)) 0) (= (@ST (@Get_n (@Get_n //I 2) 1)) //T_/String) (@Starts_With? (@V (@Get_n (@Get_n //I 2) 1)) "MSG='"))
      (set! /str (concat (string-append /str " ") (substr (@V (@Get_n (@Get_n //I 2) 1)) 4))))
     ((>= (@Size (@Get_n //I 2)) 1)
      (set! /str (concat (string-append /str " ") (@PP_1 (@Get_n (@Get_n //I 2) 1) 0)))))
    ; Check for a descriptive string 
    ; DESC is the generic description of the macro for business users 
    ; CALL is the description of this call which is for everyone: 
    (for-in /comp (@Cs (@Get_n //I 2)) 
     (cond
      ((and (= (@ST /comp) //T_/String) (@Starts_With? (@V /comp) "DESC={"))
       (set! /bus (concat (concat (concat /bus //F/C_/Business) (substr (@V /comp) 5)) //F/C_/Business_/End)))))
    (cond
     ((not (equal? /bus ""))
      (set! /str (concat (concat (concat /bus //F/C_/Tech) /str) //F/C_/Tech_/End))))
    (for-in /comp (@Cs (@Get_n //I 2)) 
     (cond
      ((and (= (@ST /comp) //T_/String) (@Starts_With? (@V /comp) "CALL={"))
       (set! /str (concat (concat /str //Newline) (substr (@V /comp) 5)))))))
   ((> (string-length /str) /len)
    ; Need to split up the line 
    (cond
     ((= (@ST //I) //T_/Or)
      (set! /str "")
      (set! //L (@Cs //I))
      (while (not (null? //L)) 
       (begin
        (set! /str (concat /str (@PP_Multi (car //L) (- /len 4))))
        (set! //L (cdr //L))
        (cond
         ((not (null? //L))
          (set! /str (string-append (concat /str //Newline) " OR ")))))))
     ((= (@ST //I) //T_/And)
      (set! /str "")
      (set! //L (@Cs //I))
      (while (not (null? //L)) 
       (begin
        (set! /str (concat /str (@PP_Multi (car //L) (- /len 5))))
        (set! //L (cdr //L))
        (cond
         ((not (null? //L))
          (set! /str (string-append (concat /str //Newline) " AND "))))))))))
  (set! funct-result /str)
  (set! //I //I-save)
  (set! /str /str-save)
  funct-result))

(define (@FC_Rename //Orig_/Name-par)
 (let ((//Orig_/Name-save //Orig_/Name))
  (set! //Orig_/Name //Orig_/Name-par)
  (let ((/assem ""))
   ; Rename variables to original assembler names 
   ; (We need to do this before generating Business/Tech strings) 
   (@Foreach_Expn /foreach-flowchart-4 0 (@AS_Type) 0)
   (cond
    ((null? (@Program))
     (@New_Program (@Skips))))
   (@Foreach_Lvalue /foreach-flowchart-5 0 (@AS_Type) 0)
   (cond
    ((null? (@Program))
     (@New_Program (@Skips))))
   (@Foreach_Statement /foreach-flowchart-6 0 (@AS_Type) 0)
   (cond
    ((null? (@Program))
     (@New_Program (@Skips))))
   ; Add entries in the LL tables for the assembler names: 
   (for-in /name (@Hash_Keys //Orig_/Name) 
    (begin
     (set! /assem (gethash //Orig_/Name /name))
     (cond
      ((not (null? (gethash //Init_/String (list /name))))
       (puthash //Init_/String (list /assem) (gethash //Init_/String (list /name)))))
     (cond
      ((not (null? (gethash //Equ_/Symbol /name)))
       (puthash //Equ_/Symbol /assem (gethash //Equ_/Symbol /name))))
     (cond
      ((not (null? (gethash //D/S/E/C/T_/Tag /name)))
       (puthash //D/S/E/C/T_/Tag /assem (gethash //D/S/E/C/T_/Tag /name))))
     (cond
      ((not (null? (gethash //Comment /name)))
       (puthash //Comment /assem (gethash //Comment /name))))))
   #t)
  (set! //Orig_/Name //Orig_/Name-save)))

; Processing to create Tech and Business pseudocode: 
(define (@FC_Business_Tech_Process //Orig_/Name-par /flowchart)
 (let ((//Orig_/Name-save //Orig_/Name))
  (set! //Orig_/Name //Orig_/Name-par)
  (let ((/sym_val_flag-save /sym_val_flag))
   (set! /sym_val_flag (hash-table))
   (@Foreach_Expn /foreach-flowchart-7 0 (@AS_Type) 0)
   (cond
    ((null? (@Program))
     (@New_Program (@Skips))))
   (@Foreach_Lvalue /foreach-flowchart-8 0 (@AS_Type) 0)
   (cond
    ((null? (@Program))
     (@New_Program (@Skips))))
   ; Assignments to DSECT pointers: 
   (@Foreach_Statement /foreach-flowchart-9 0 (@AS_Type) 0)
   (cond
    ((null? (@Program))
     (@New_Program (@Skips))))
   ; For !XC bit_test?(variable, constant) check if there is an Equ_Symbol 
   ; for a flag which has the same value as constant and maps to variable. 
   ; If so then replace the constant by this flag 
   ; First compute the table which matches a symbol and Init_String value 
   ; to the corresponding flag equate: 
   (for-in /flag (@Hash_Keys //Equ_/Symbol) 
    (cond
     ((not (null? (gethash //Init_/String (list /flag))))
      (puthash /sym_val_flag (list (gethash //Equ_/Symbol /flag) (gethash //Init_/String (list /flag))) /flag))))
   (@Foreach_Cond /foreach-flowchart-10 0 (@AS_Type) 0)
   (cond
    ((null? (@Program))
     (@New_Program (@Skips))))
   (@Foreach_Statement /foreach-flowchart-11 0 (@AS_Type) 0)
   (cond
    ((null? (@Program))
     (@New_Program (@Skips))))
   (@Foreach_Statement /foreach-flowchart-12 0 (@AS_Type) 0)
   (cond
    ((null? (@Program))
     (@New_Program (@Skips))))
   (@Foreach_Statement /foreach-flowchart-13 0 (@AS_Type) 0)
   (cond
    ((null? (@Program))
     (@New_Program (@Skips))))
   (@FC_Rename //Orig_/Name)
   ; For !XC bit_test?(variable, flag) check if Equ_Symbol for flag 
   ; matches variable, if so then we have a business version of this test 
   ; which is: AAA(...comment on the EQUate...)? 
   (@Foreach_Cond /foreach-flowchart-14 0 (@AS_Type) 0)
   (cond
    ((null? (@Program))
     (@New_Program (@Skips))))
   ; Bit set/clear (turn on / turn off) operations 
   (@Foreach_Statement /foreach-flowchart-15 0 (@AS_Type) 0)
   (cond
    ((null? (@Program))
     (@New_Program (@Skips))))
   ; Annotate variables which have comments 
   (@Ateach_Expn /foreach-flowchart-16 0 (@AS_Type) 0)
   (cond
    ((null? (@Program))
     (@New_Program (@Skips))))
   (@Ateach_Lvalue /foreach-flowchart-17 0 (@AS_Type) 0)
   (cond
    ((null? (@Program))
     (@New_Program (@Skips))))
   (@FC_Hex)
   ; Rename procedure definitions for flowchart only: 
   (cond
    ((= /flowchart 1)
     (@Foreach_Statement /foreach-flowchart-18 0 (@AS_Type) 0)
     (cond
      ((null? (@Program))
       (@New_Program (@Skips))))))
   (set! /sym_val_flag /sym_val_flag-save))
  (set! //Orig_/Name //Orig_/Name-save)))

; Process Hex strings in the current item: 
(define (@FC_Hex)
 (@Foreach_Expn /foreach-flowchart-19 0 (@AS_Type) 0)
 (cond
  ((null? (@Program))
   (@New_Program (@Skips)))))

; Replace a constant flag by an equate if one is in sym_val_flag
(define (@FC_Replace_Flag /var-par /flag-par /sym_val_flag-par)
 (let ((/sym_val_flag-save /sym_val_flag)
       (/flag-save /flag)
       (/var-save /var))
  (set! /sym_val_flag /sym_val_flag-par)
  (set! /flag /flag-par)
  (set! /var /var-par)
  (let ((/name-save /name))
   (set! /name '())
   (cond
    ((and (= (@ST /flag) //T_/String) (or (= (@ST /var) //T_/Variable) (= (@ST /var) //T_/Struct) (= (@ST /var) //T_/Var_/Lvalue) (= (@ST /var) //T_/Struct_/Lvalue)))
     (set! /name (gethash /sym_val_flag (list (last-1 (@Struct_Elts /var)) (@V /flag))))
     (cond
      ((not (null? /name))
       (@Paste_Over (@Make //T_/Variable /name '()))))
     #t))
   (set! /name /name-save))
  (set! /sym_val_flag /sym_val_flag-save)
  (set! /flag /flag-save)
  (set! /var /var-save)))

; ----------------------------------------------------------------------- 


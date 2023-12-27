;;; Scheme translation of WSL code
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
(set! //T/R_/Replace_/With_/Variable (@New_TR_Number))
(vector-set! //T/Rs_/Name (- //T/R_/Replace_/With_/Variable 1) "Replace_With_Variable")
(vector-set! //T/Rs_/Proc_/Name (- //T/R_/Replace_/With_/Variable 1) "Replace_With_Variable")
(vector-set! //T/Rs_/Test (- //T/R_/Replace_/With_/Variable 1) (funct (@Replace_With_Variable_Test)))
(vector-set! //T/Rs_/Code (- //T/R_/Replace_/With_/Variable 1) (funct (@Replace_With_Variable_Code)))
(vector-set! //T/Rs_/Keywords (- //T/R_/Replace_/With_/Variable 1) (list "Rewrite"))
(vector-set! //T/Rs_/Help (- //T/R_/Replace_/With_/Variable 1) "This transformation will search for a variable
which is assigned to the selected expression. If found, it will replace the expression
with the variable.")
(vector-set! //T/Rs_/Prompt (- //T/R_/Replace_/With_/Variable 1) "")
(vector-set! //T/Rs_/Data_/Gen_/Type (- //T/R_/Replace_/With_/Variable 1) "")

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
(set! //T/R_/Simplify (@New_TR_Number))
(vector-set! //T/Rs_/Name (- //T/R_/Simplify 1) "Simplify")
(vector-set! //T/Rs_/Proc_/Name (- //T/R_/Simplify 1) "Simplify")
(vector-set! //T/Rs_/Test (- //T/R_/Simplify 1) (funct (@Simplify_Test)))
(vector-set! //T/Rs_/Code (- //T/R_/Simplify 1) (funct (@Simplify_Code)))
(vector-set! //T/Rs_/Keywords (- //T/R_/Simplify 1) (list "Simplify" "L_to_R" "R_to_L"))
(vector-set! //T/Rs_/Help (- //T/R_/Simplify 1) "This transformation will simplify any component as fully as possible.")
(vector-set! //T/Rs_/Prompt (- //T/R_/Simplify 1) "")
(vector-set! //T/Rs_/Data_/Gen_/Type (- //T/R_/Simplify 1) "")

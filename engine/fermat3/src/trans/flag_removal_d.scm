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
(set! //T/R_/Flag_/Removal (@New_TR_Number))
(vector-set! //T/Rs_/Name (- //T/R_/Flag_/Removal 1) "Flag_Removal")
(vector-set! //T/Rs_/Proc_/Name (- //T/R_/Flag_/Removal 1) "Flag_Removal")
(vector-set! //T/Rs_/Test (- //T/R_/Flag_/Removal 1) (funct (@Flag_Removal_Test)))
(vector-set! //T/Rs_/Code (- //T/R_/Flag_/Removal 1) (funct (@Flag_Removal_Code)))
(vector-set! //T/Rs_/Keywords (- //T/R_/Flag_/Removal 1) (list "Simplify"))
(vector-set! //T/Rs_/Help (- //T/R_/Flag_/Removal 1) "Attempt to remove references to flag variables")
(vector-set! //T/Rs_/Prompt (- //T/R_/Flag_/Removal 1) "")
(vector-set! //T/Rs_/Data_/Gen_/Type (- //T/R_/Flag_/Removal 1) "")

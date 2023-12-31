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
(set! //T/R_/Delete_/Unreachable_/Code (@New_TR_Number))
(vector-set! //T/Rs_/Name (- //T/R_/Delete_/Unreachable_/Code 1) "Delete Unreachable Code")
(vector-set! //T/Rs_/Proc_/Name (- //T/R_/Delete_/Unreachable_/Code 1) "Delete_Unreachable_Code")
(vector-set! //T/Rs_/Test (- //T/R_/Delete_/Unreachable_/Code 1) (funct (@Delete_Unreachable_Code_Test)))
(vector-set! //T/Rs_/Code (- //T/R_/Delete_/Unreachable_/Code 1) (funct (@Delete_Unreachable_Code_Code)))
(vector-set! //T/Rs_/Keywords (- //T/R_/Delete_/Unreachable_/Code 1) (list "Simplify"))
(vector-set! //T/Rs_/Help (- //T/R_/Delete_/Unreachable_/Code 1) "Delete Unreachable Code will remove unreachable statements in the selected object. It will also remove unreachable cases in an IF statement, e.g those which follow a TRUE guard.")
(vector-set! //T/Rs_/Prompt (- //T/R_/Delete_/Unreachable_/Code 1) "")
(vector-set! //T/Rs_/Data_/Gen_/Type (- //T/R_/Delete_/Unreachable_/Code 1) "")

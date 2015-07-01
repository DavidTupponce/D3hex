﻿; ##################################################### License / Copyright #########################################
; 
;     D3hex
;     Copyright (C) 2014-2015  David Vogel
; 
;     This program is free software; you can redistribute it and/or modify
;     it under the terms of the GNU General Public License As published by
;     the Free Software Foundation; either version 2 of the License, or
;     (at your option) any later version.
; 
;     This program is distributed in the hope that it will be useful,
;     but WITHOUT ANY WARRANTY; without even the implied warranty of
;     MERCHANTABILITY Or FITNESS For A PARTICULAR PURPOSE.  See the
;     GNU General Public License For more details.
; 
;     You should have received a copy of the GNU General Public License along
;     With this program; if not, write to the Free Software Foundation, Inc.,
;     51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
;
; ##################################################### Dokumentation / Kommentare ##################################
; 
; 
; 
; 
; 
; 
; 
; ##################################################### Includes ####################################################

; ###################################################################################################################
; ##################################################### Public ######################################################
; ###################################################################################################################

DeclareModule Node_Type
  EnableExplicit
  ; ################################################### Prototypes ##################################################
  Prototype   Function_Create(Requester)
  
  ; ################################################### Constants ###################################################
  
  ; ################################################### Structures ##################################################
  Structure Object
    ID.i
    
    UID.s {8}
    
    Name.s
    Description.s
    Category.s
    Author.s
    Date_Creation.q
    Date_Modification.q
    Date_Compilation.q
    Version.l
    
    Function_Create.Function_Create
  EndStructure
  Global NewList Object.Object()
  
  ; ################################################### Functions ###################################################
  Declare   Get_UID(UID.s)
  Declare   Get(ID.i)
  Declare   Create()
  Declare   Delete(*Object_Type.Object)
  
EndDeclareModule

; ###################################################################################################################
; ##################################################### Private #####################################################
; ###################################################################################################################

Module Node_Type
  ; ################################################### Structures ##################################################
  Structure Main
    ID_Counter.i
  EndStructure
  Global Main.Main
  
  ; ################################################### Procedures ##################################################
  Procedure Get_UID(UID.s)
    Protected *Result.Object = #Null
    
    PushListPosition(Object())
    
    ForEach Object()
      If Object()\UID = UID
        *Result = Object()
        Break
      EndIf
    Next
    
    PopListPosition(Object())
    
    ProcedureReturn *Result
  EndProcedure
  
  Procedure Get(ID.i)
    Protected *Result.Object = #Null
    
    PushListPosition(Object())
    
    ForEach Object()
      If Object()\ID = ID
        *Result = Object()
        Break
      EndIf
    Next
    
    PopListPosition(Object())
    
    ProcedureReturn *Result
  EndProcedure
  
  Procedure Create()
    If Not AddElement(Object())
      ProcedureReturn #Null
    EndIf
    
    Object()\Name = "Empty"
    Main\ID_Counter + 1
    Object()\ID = Main\ID_Counter
    
    ProcedureReturn Object()
  EndProcedure
  
  Procedure Delete(*Object_Type.Object)
    If Not *Object_Type
      ProcedureReturn #False
    EndIf
    
    If ChangeCurrentElement(Object(), *Object_Type)
      DeleteElement(Object())
    EndIf
    
    ProcedureReturn #True
  EndProcedure
  
EndModule

; IDE Options = PureBasic 5.31 (Windows - x64)
; CursorPosition = 120
; FirstLine = 93
; Folding = -
; EnableUnicode
; EnableXP
$PBExportHeader$uo_consulta_web.sru
forward
global type uo_consulta_web from internetresult
end type
end forward

global type uo_consulta_web from internetresult
end type
global uo_consulta_web uo_consulta_web

type variables

string isRetornoWEB
end variables
forward prototypes
public function integer internetdata (blob data)
end prototypes

public function integer internetdata (blob data);
//isRetornoWEB = string(data, EncodingANSI!)
isRetornoWEB = string(data)

return 1
end function

on uo_consulta_web.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_consulta_web.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on


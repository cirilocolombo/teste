$PBExportHeader$w_consulta_cnpj_receita_captcha.srw
forward
global type w_consulta_cnpj_receita_captcha from window
end type
type cb_cancelar from commandbutton within w_consulta_cnpj_receita_captcha
end type
type cb_ok from commandbutton within w_consulta_cnpj_receita_captcha
end type
type sle_letras from singlelineedit within w_consulta_cnpj_receita_captcha
end type
type st_1 from statictext within w_consulta_cnpj_receita_captcha
end type
type gb_captcha from groupbox within w_consulta_cnpj_receita_captcha
end type
type gb_letra from groupbox within w_consulta_cnpj_receita_captcha
end type
end forward

global type w_consulta_cnpj_receita_captcha from window
integer width = 1413
integer height = 1172
boolean titlebar = true
string title = "Consulta CNPJ (Site da Receita)"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_cancelar cb_cancelar
cb_ok cb_ok
sle_letras sle_letras
st_1 st_1
gb_captcha gb_captcha
gb_letra gb_letra
end type
global w_consulta_cnpj_receita_captcha w_consulta_cnpj_receita_captcha

type variables

string isCNPJ

uo_consulta_cnpj_receita iuoConsultaCaptcha
uo_consulta_cnpj_receita iuoConsultaJSONRetorno
end variables

forward prototypes
public function boolean wf_valida_cnpj (string cgc, character nat)
public function string wf_replace (string as_source, string as_old, string as_new)
protected subroutine of_obter_captcha (readonly string as_cnpj)
end prototypes

public function boolean wf_valida_cnpj (string cgc, character nat);integer li_y[14],li_x[14]
integer li_indice,li_soma,li_mult,li_q,li_r1,li_r2
long ll_divide

if cgc = "" then
   return true
end if

if nat = 'F' then cgc = '000' + cgc

for li_indice = 1 to 14
    li_x[li_indice] = integer(mid(cgc,li_indice,1))
next

if nat = 'F' then
   li_y[1] = 0
   li_y[2] = 0
   li_y[3] = 0
   li_y[4] = li_x[4] * 10
else 
   li_y[1] = li_x[1] * 5
   li_y[2] = li_x[2] * 4
   li_y[3] = li_x[3] * 3
   li_y[4] = li_x[4] * 2
end if	
	
li_y[5] = li_x[5] * 9
li_y[6] = li_x[6] * 8
li_y[7] = li_x[7] * 7
li_y[8] = li_x[8] * 6
li_y[9] = li_x[9] * 5
li_y[10] = li_x[10] * 4
li_y[11] = li_x[11] * 3
li_y[12] = li_x[12] * 2

li_soma = li_y[1] + li_y[2] + li_y[3] + li_y[4] + li_y[5] + li_y[6] + li_y[7] + li_y[8] + li_y[9] +li_y[10] +li_y[11] +li_y[12]

ll_divide = li_soma / 11

li_mult = truncate(ll_divide * 11,0)
li_q = li_soma - li_mult
li_r1 = 11 - li_q

if li_r1 > 9 then
   li_r1 = 0
end if

if nat = 'F' then
   li_y[1] = 0
   li_y[2] = 0
   li_y[3] = 0
   li_y[4] = li_x[4] * 11
   li_y[5] = li_x[5] * 10
else
   li_y[1] = li_x[1] * 6
   li_y[2] = li_x[2] * 5
   li_y[3] = li_x[3] * 4
   li_y[4] = li_x[4] * 3
   li_y[5] = li_x[5] * 2
end if

li_y[6] = li_x[6] * 9
li_y[7] = li_x[7] * 8
li_y[8] = li_x[8] * 7
li_y[9] = li_x[9] * 6
li_y[10] = li_x[10] * 5
li_y[11] = li_x[11] * 4
li_y[12] = li_x[12] * 3
 
li_y[13] = li_r1 * 2

li_soma = li_y[1] + li_y[2] + li_y[3] + li_y[4] + li_y[5] + li_y[6] + li_y[7] + li_y[8] + li_y[9] +li_y[10] +li_y[11] +li_y[12]+li_y[13]

ll_divide = li_soma / 11

li_mult = truncate(ll_divide * 11,0)
li_q = li_soma - li_mult
li_r2 = 11 - li_q

if li_r2 > 9 then
   li_r2 = 0
end if

if (li_x[13] <> li_r1) or (li_x[14] <> li_r2) then
   //return (99) // erro
	return false
else
   //return (0)
	return true
end if
end function

public function string wf_replace (string as_source, string as_old, string as_new);Long	ll_Start
Long	ll_OldLen
Long	ll_NewLen
String ls_Source

Boolean	ab_IgnoreCase

//Check parameters
If IsNull(as_source) or IsNull(as_old) or IsNull(as_new) or IsNull(ab_ignorecase) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

//Get the string lenghts
ll_OldLen = Len(as_Old)
ll_NewLen = Len(as_New)

//Should function respect case.
If ab_ignorecase Then
	as_old = Lower(as_old)
	ls_source = Lower(as_source)
Else
	ls_source = as_source
End If

//Search for the first occurrence of as_Old
ll_Start = Pos(ls_Source, as_Old)

Do While ll_Start > 0
	// replace as_Old with as_New
	as_Source = Replace(as_Source, ll_Start, ll_OldLen, as_New)
	
	//Should function respect case.
	If ab_ignorecase Then 
		ls_source = Lower(as_source)
	Else
		ls_source = as_source
	End If
	
	// find the next occurrence of as_Old
	ll_Start = Pos(ls_Source, as_Old, (ll_Start + ll_NewLen))
Loop

Return as_Source

end function

protected subroutine of_obter_captcha (readonly string as_cnpj);
if isValid(iuoConsultaCaptcha) then
	destroy iuoConsultaCaptcha
end if

if isValid(iuoConsultaJSONRetorno) then
	destroy iuoConsultaJSONRetorno
end if

//OpenUserObject(iuoConsultaCaptcha, 100, 25) //cirilo: Se redimensionar a tela, mudar esses valores
//OpenUserObject(iuoConsultaJSONRetorno, 1, 940)
OpenUserObject(iuoConsultaCaptcha, gb_captcha.X + 100, gb_captcha.Y + 100)
OpenUserObject(iuoConsultaJSONRetorno, 1, 3000)

iuoConsultaCaptcha.TabOrder = 0
iuoConsultaJSONRetorno.TabOrder = 0

iuoConsultaJSONRetorno.object.silent = true

iuoConsultaJSONRetorno.of_set_tipo_consulta(iuoConsultaJSONRetorno.CONSULTA_CAPTCHA)

iuoConsultaJSONRetorno.of_navegar(iuoConsultaJSONRetorno.of_get_endereco_receita_consulta() + as_cnpj)
iuoConsultaJSONRetorno.Visible = true

do while iuoConsultaJSONRetorno.of_get_documento_completo()
	Yield()
loop

Yield()

iuoConsultaCaptcha.of_navegar(iuoConsultaJSONRetorno.of_get_endereco_receita_captcha())
iuoConsultaCaptcha.Visible = true
end subroutine

on w_consulta_cnpj_receita_captcha.create
this.cb_cancelar=create cb_cancelar
this.cb_ok=create cb_ok
this.sle_letras=create sle_letras
this.st_1=create st_1
this.gb_captcha=create gb_captcha
this.gb_letra=create gb_letra
this.Control[]={this.cb_cancelar,&
this.cb_ok,&
this.sle_letras,&
this.st_1,&
this.gb_captcha,&
this.gb_letra}
end on

on w_consulta_cnpj_receita_captcha.destroy
destroy(this.cb_cancelar)
destroy(this.cb_ok)
destroy(this.sle_letras)
destroy(this.st_1)
destroy(this.gb_captcha)
destroy(this.gb_letra)
end on

event open;
isCNPJ = message.stringparm //cirilo: trocar para uo_args

if isNull(isCNPJ) or Trim(isCNPJ) = "" then //cirilo: transferir todas estas condições p/ o cadastro Emp/Pessoa
	sle_letras.enabled  = false
	cb_ok.enabled = false   
else
	if not wf_valida_cnpj(isCNPJ,'J') then
		MessageBox('Valida CNPJ', 'CNPJ informado é inválido')
	else
		isCNPJ = wf_replace(wf_replace(wf_replace(isCNPJ,'.',''),'-',''),'/','') //cirilo: trocar para o replaceall
		of_obter_captcha(isCNPJ)
		sle_letras.SetFocus()
	end if
end if
end event

type cb_cancelar from commandbutton within w_consulta_cnpj_receita_captcha
event ue_enter pbm_keydown
integer x = 786
integer y = 912
integer width = 320
integer height = 100
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Cancelar"
end type

event ue_enter;if key = KeyEnter! then
	this.event clicked()
end if
end event

event clicked;
close(parent)
end event

type cb_ok from commandbutton within w_consulta_cnpj_receita_captcha
event ue_enter pbm_keydown
integer x = 283
integer y = 912
integer width = 320
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "OK"
end type

event ue_enter;if key = KeyEnter! then
	this.event clicked()
end if //cirilo: trocar os componentes pelos componentes genéricos
end event

event clicked;
string lsLetras
st_consulta_cnpj_receita lstRetorno

lsLetras = sle_letras.Text

if isNull(lsLetras) or Trim(lsLetras) = "" then
	MessageBox('Consulta CNPJ','Informe as letras da Imagem!') //cirilo: trocar todos os mb para global
	sle_letras.SetFocus() 
	return
else
	iuoConsultaJSONRetorno.of_set_tipo_consulta(iuoConsultaJSONRetorno.CONSULTA_JSON)
	iuoConsultaJSONRetorno.object.Document.forms[0].txtTexto_captcha_serpro_gov_br.value = lsLetras
	iuoConsultaJSONRetorno.object.Document.forms[0].submit1.click()
	
	do while iuoConsultaJSONRetorno.of_get_documento_completo()
		yield()
	loop
	
	if iuoConsultaJSONRetorno.of_get_erro() then
		MessageBox('Consulta CNPJ','Não foi possivel obter as informações sobre o CNPJ.~r~nVerifique se as letras foram digitadas corretamente.')
		of_obter_captcha(isCNPJ)
		sle_letras.Text = ""
		sle_letras.SetFocus()
		return
	end if
	
	lstRetorno = iuoConsultaJSONRetorno.istRetorno
	
	lstRetorno.as_cep = wf_replace(wf_replace(lstRetorno.as_cep ,'.',''),'-','')
	lstRetorno.as_nome_empresarial = wf_replace(lstRetorno.as_nome_empresarial,'&amp;','&')
	lstRetorno.as_nome_fantasia = wf_replace(lstRetorno.as_nome_fantasia,'&amp;','&')
	if isnull(lstRetorno.as_nome_fantasia) or trim(lstRetorno.as_nome_fantasia) = '********' then
		lstRetorno.as_nome_fantasia = lstRetorno.as_nome_empresarial
	end if
	lstRetorno.as_cnae20 = wf_replace(wf_replace(Left(lstRetorno.as_cnae20, 10), ".", ""), "-", "")
	lstRetorno.as_natureza_juridica = wf_replace(Left(lstRetorno.as_natureza_juridica, 5), "-", "")
	
	CloseWithReturn(parent, lstRetorno)
end if
end event

type sle_letras from singlelineedit within w_consulta_cnpj_receita_captcha
event ue_enter pbm_keydown
integer x = 338
integer y = 712
integer width = 887
integer height = 88
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event ue_enter;if key = KeyEnter! then
	cb_ok.setfocus()
end if
end event

type st_1 from statictext within w_consulta_cnpj_receita_captcha
integer x = 165
integer y = 728
integer width = 187
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Letras:"
boolean focusrectangle = false
end type

type gb_captcha from groupbox within w_consulta_cnpj_receita_captcha
integer x = 64
integer y = 40
integer width = 1266
integer height = 540
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Captcha"
end type

type gb_letra from groupbox within w_consulta_cnpj_receita_captcha
integer x = 64
integer y = 620
integer width = 1266
integer height = 244
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Informe as letras da imagem acima"
end type


$PBExportHeader$w_teste.srw
forward
global type w_teste from w_base
end type
type cb_8 from commandbutton within w_teste
end type
type cb_7 from commandbutton within w_teste
end type
type tab_1 from tab within w_teste
end type
type tabpage_1 from userobject within tab_1
end type
type sle_1 from singlelineedit within tabpage_1
end type
type cb_4 from commandbutton within tabpage_1
end type
type em_1 from editmask within tabpage_1
end type
type tabpage_1 from userobject within tab_1
sle_1 sle_1
cb_4 cb_4
em_1 em_1
end type
type tabpage_2 from userobject within tab_1
end type
type cb_5 from commandbutton within tabpage_2
end type
type sle_2 from singlelineedit within tabpage_2
end type
type cb_6 from commandbutton within tabpage_2
end type
type mle_1 from multilineedit within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cb_5 cb_5
sle_2 sle_2
cb_6 cb_6
mle_1 mle_1
end type
type tab_1 from tab within w_teste
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type cb_3 from commandbutton within w_teste
end type
type cb_2 from commandbutton within w_teste
end type
type cb_1 from commandbutton within w_teste
end type
type ole_browser from uo_web_browser within w_teste
end type
end forward

global type w_teste from w_base
integer width = 3136
string title = "Testes"
cb_8 cb_8
cb_7 cb_7
tab_1 tab_1
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
ole_browser ole_browser
end type
global w_teste w_teste

type prototypes
	
FUNCTION long ShellExecuteW(ulong hWnd, &
									 string Operation, &
									 string lpFile, &
									 string lpParameters, &
									 string lpDirectory, &
									 int nShowCmd) LIBRARY "shell32.dll"
end prototypes

on w_teste.create
int iCurrent
call super::create
this.cb_8=create cb_8
this.cb_7=create cb_7
this.tab_1=create tab_1
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.ole_browser=create ole_browser
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_8
this.Control[iCurrent+2]=this.cb_7
this.Control[iCurrent+3]=this.tab_1
this.Control[iCurrent+4]=this.cb_3
this.Control[iCurrent+5]=this.cb_2
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.ole_browser
end on

on w_teste.destroy
call super::destroy
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.tab_1)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.ole_browser)
end on

type cb_8 from commandbutton within w_teste
integer x = 2921
integer y = 648
integer width = 187
integer height = 112
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "excluir"
end type

event clicked;/*long ll_linha
long ll_opcao
string ls_nome_arquivo

ll_linha = dw_arquivos.GetSelectedRow(0)
if ll_linha > 0 then
	
	ls_nome_arquivo = dw_arquivos.GetItemString(ll_linha, 'ds_arquivo')
	wf_seleciona_arquivo(0)
	ll_opcao = MessageBox("Atenção", "Deseja excluir o arquivo " + ls_nome_arquivo + "?", Question!, YesNo!)
	if ll_opcao = 1 then
		sleep(4)
		if FileExists(is_local_destino + ls_nome_arquivo) then
			if FileDelete(is_local_destino + ls_nome_arquivo) then
				dw_arquivos.DeleteRow(ll_linha)
			else
				MessageBox("aviso", "Não foi possível excluir, verifique o " + ls_nome_arquivo + ".")
			end if
		else
			dw_arquivos.DeleteRow(ll_linha)
		end if
		if dw_arquivos.Update() <> 1 then
			MessageBox("aviso", "Erro ao gravar arquivos")
		else
//			COMMIT using transaction_horr;
		end if
	else
		wf_seleciona_arquivo(ll_linha)
	end if
end if
true = true
*/
end event

type cb_7 from commandbutton within w_teste
integer x = 2921
integer y = 520
integer width = 183
integer height = 112
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "inserir"
end type

event clicked;/*long ll_file
long ll_linha
long ll_sequencial
string ls_local_origem
string ls_nome_arquivo

GetFileOpenName('Selecione o Arquivo', ls_local_origem, ls_nome_arquivo, 'Todos os arquivos (*.*),*.*')

IsNull(ls_local_origem)

if ls_local_origem = '' then return 1

if FileExists(ls_local_origem) then
	
	if not DirectoryExists(is_local_destino) then CreateDirectory(is_local_destino)
	
	ll_file = FileCopy(ls_local_origem, is_local_destino + ls_nome_arquivo, true)
	
	if ll_file = 1 then
		
		ll_linha = dw_arquivos.InsertRow(0)
		
		ll_sequencial = long(dw_arquivos.Describe("evaluate('max(cd_arquivo)',0)"))
		ll_sequencial++
		
		dw_arquivos.SetItem(ll_linha, 'cod', il_cod)
		dw_arquivos.SetItem(ll_linha, 'cd_arquivo', ll_sequencial)
		dw_arquivos.SetItem(ll_linha, 'ds_arquivo', ls_nome_arquivo)
		dw_arquivos.SetItem(ll_linha, 'dt_arquivo', today())

		if dw_arquivos.Update() <> 1 then
			MessageBox("aviso", 'Erro ao gravar arquivos')
		else
//			COMMIT using transaction_horr;
			wf_seleciona_arquivo(ll_linha)
		end if
	end if
else
	MessageBox("aviso", 'Arquivo não encontrado.')
end if
true = true*/
end event

type tab_1 from tab within w_teste
integer width = 2473
integer height = 1304
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2437
integer height = 1176
long backcolor = 67108864
string text = "Geral"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
sle_1 sle_1
cb_4 cb_4
em_1 em_1
end type

on tabpage_1.create
this.sle_1=create sle_1
this.cb_4=create cb_4
this.em_1=create em_1
this.Control[]={this.sle_1,&
this.cb_4,&
this.em_1}
end on

on tabpage_1.destroy
destroy(this.sle_1)
destroy(this.cb_4)
destroy(this.em_1)
end on

type sle_1 from singlelineedit within tabpage_1
integer x = 50
integer y = 172
integer width = 2327
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_4 from commandbutton within tabpage_1
integer x = 873
integer y = 44
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Extenso"
end type

event clicked;
dec{2} ldcExtenso
uo_extenso luoExtenso

ldcExtenso = dec(em_1.Text)

sle_1.Text = luoExtenso.of_get_valor_extenso(ldcExtenso)
end event

type em_1 from editmask within tabpage_1
integer x = 50
integer y = 48
integer width = 795
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,##0.00"
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2437
integer height = 1176
long backcolor = 67108864
string text = "Receita"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_5 cb_5
sle_2 sle_2
cb_6 cb_6
mle_1 mle_1
end type

on tabpage_2.create
this.cb_5=create cb_5
this.sle_2=create sle_2
this.cb_6=create cb_6
this.mle_1=create mle_1
this.Control[]={this.cb_5,&
this.sle_2,&
this.cb_6,&
this.mle_1}
end on

on tabpage_2.destroy
destroy(this.cb_5)
destroy(this.sle_2)
destroy(this.cb_6)
destroy(this.mle_1)
end on

type cb_5 from commandbutton within tabpage_2
integer x = 1184
integer y = 32
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Captcha"
end type

event clicked;
string lsCNPJ
st_consulta_cnpj_receita lstRetorno

lsCNPJ = sle_2.Text//"27056910000142"

OpenWithParm(w_consulta_cnpj_receita_captcha, lsCNPJ)

lstRetorno = message.powerobjectparm

if isNull(lstRetorno) or not isValid(lstRetorno) then return 

mle_1.Text	= "Data de abertura: " + lstRetorno.as_data_abertura + "~r~n" &
				+ "Nome: " + lstRetorno.as_nome_empresarial + "~r~n" &
				+ "Fantasia: " + lstRetorno.as_nome_fantasia + "~r~n" &
				+ "Endereço: " + lstRetorno.as_logradouro + "~r~n" &
				+ "Número: " + lstRetorno.as_numero + "~r~n" &
				+ "Complemento: " + lstRetorno.as_complemento + "~r~n" &
				+ "CEP: " + lstRetorno.as_cep + "~r~n" &
				+ "Bairro: " + lstRetorno.as_bairro + "~r~n" &
				+ "Município: " + lstRetorno.as_municipio + "~r~n" &
				+ "UF: " + lstRetorno.as_uf + "~r~n" &
				+ "CNAE 2.0: " + lstRetorno.as_cnae20 + "~r~n" &
				+ "Natureza Jurídica: " + lstRetorno.as_natureza_juridica
end event

type sle_2 from singlelineedit within tabpage_2
integer x = 46
integer y = 40
integer width = 512
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "27056910000142"
borderstyle borderstyle = stylelowered!
end type

type cb_6 from commandbutton within tabpage_2
integer x = 613
integer y = 28
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Buscar"
end type

event clicked;
long llRetorno
string lsURL
string lsCNPJ
Inet lInet
uo_consulta_web luoConsultaWeb

//lInet = create Inet

llRetorno = GetContextService("Internet", lInet)

if llRetorno = 1 then
	luoConsultaWeb = create uo_consulta_web
	
	lsCNPJ = sle_2.Text//"27056910000142"
	
	//lsURL = "http://api.postmon.com.br/v1/cep/" + ls_cep
	//lsURL = "https://www.receitaws.com.br/v1/cnpj/" + lsCNPJ
	//lsURL = "http://www.google.com.br"
	lsURL = "http://177.200.195.22:8088/maximusweb/dispositivo-versao.ajax.php"
	
	llRetorno = lInet.GetURL(lsURL, luoConsultaWeb)
else
	MessageBox("Erro", "Erro ao tentar iniciar a conexão com o servidor principal.", stopsign!)
	return
end if

mle_1.Text = luoConsultaWeb.isRetornoWEB

destroy lInet
end event

type mle_1 from multilineedit within tabpage_2
integer x = 32
integer y = 176
integer width = 2373
integer height = 976
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within w_teste
integer x = 2496
integer y = 760
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Abrir arquivo"
end type

event clicked;
long llRet
string ls_null
//string ls_filename = "\\10.1.1.103\HorrRS\Chamados\25287\tnc ped ipad.jpg"
string ls_filename = "d:\Dúvidas.txt"

SetNull(ls_null)

llRet = ShellExecuteW(handle(parent), "open", ls_filename, ls_null, ls_null, 1)

messagebox('', llRet) //2 não achou o arquivo

/*long ll_ret

ll_ret = -1

try 
	ll_ret = ShellExecuteW(handle(THIS), "open", as_filename, is_null, is_null, 1)
catch (Exception e)
	//Saves the error message in the instance variable.
	this.is_error_msg = e.GetMessage()
end try


return ll_ret*/
end event

type cb_2 from commandbutton within w_teste
integer x = 2496
integer y = 640
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "conexão"
end type

event clicked;
long ll_retorno

Inet i_net
uo_consulta_web lo_requisicao

lo_requisicao = create uo_consulta_web

i_net = create Inet
ll_retorno = i_net.geturl( "http://www.google.com.br", lo_requisicao )

if ll_retorno = 1 then
	if pos(upper(lo_requisicao.isRetornoWEB), "404 NOT FOUND") > 0 then
		destroy lo_requisicao
		destroy i_net
		
//		return false
	else
		destroy lo_requisicao
		destroy i_net
		
//		return true
	end if
else
	destroy lo_requisicao
	destroy i_net
	
//	return false
end if
end event

type cb_1 from commandbutton within w_teste
integer x = 2496
integer y = 516
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "OLE"
end type

event clicked;
long ll_total
long ll_indice
string ls_arquivo

//ls_arquivo = "d:\Dúvidas.txt"

//Se tirar o controle de verificar se o arquivo existe, este OLE abre o endereço abaixo
//ls_arquivo = "https://upload.wikimedia.org/wikipedia/commons/e/eb/Ash_Tree_-_geograph.org.uk_-_590710.jpg"
ls_arquivo = "https://chart.googleapis.com/chart?chs=150x150&cht=qr&chl=https://dfe-portal.svrs.rs.gov.br/mdfe/qrCode?chMDFe=35190710142785000190580010000000071086438399&tpAmb=2"
ls_arquivo = "d:\Dúvidas.txt"

/*if al_linha > 0 then
	ls_arquivo = dw_arquivos.GetItemString(al_linha, 'ds_arquivo')
	
	ll_total = dw_arquivos.RowCount()
	for ll_indice = 1 to ll_total
		dw_arquivos.SelectRow(ll_indice, false)
	next
	
	dw_arquivos.SelectRow(al_linha, true)
	tab_1.tabpage_2.st_branco.Visible = false
else
	ls_arquivo = ''
	tab_1.tabpage_2.st_branco.Visible = true
end if*/

if ls_arquivo = '' then
	ole_browser.object.navigate('')
else
	if FileExists(ls_arquivo) then
		ole_browser.object.navigate(ls_arquivo)
	else
//		tab_1.tabpage_2.st_branco.Visible = true
		MessageBox("aviso", 'Arquivo não encontrado. Verifique se o arquivo está disponivel em : ' + ls_arquivo)
	end if
end if

end event

type ole_browser from uo_web_browser within w_teste
integer x = 2510
integer y = 920
integer width = 594
integer height = 356
string binarykey = "w_teste.win"
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
02w_teste.bin 
2900000a00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000100000000000000000000000000000000000000000000000000000000b805b10001d58e7b00000003000001800000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000009c00000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff000000038856f96111d0340ac0006ba9a205d74f00000000b805b10001d58e7bb805b10001d58e7b000000000000000000000000004f00430054004e004e00450053005400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000030000009c000000000000000100000002fffffffe0000000400000005fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000004c00000d70000009330000000000000000000000000000000000000000000000000000004c0000000000000000000000010057d0e011cf3573000869ae62122e2b00000008000000000000004c0002140100000000000000c0460000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004c00000d70000009330000000000000000000000000000000000000000000000000000004c0000000000000000000000010057d0e011cf3573000869ae62122e2b00000008000000000000004c0002140100000000000000c0460000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12w_teste.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point

$PBExportHeader$uo_consulta_cnpj_receita.sru
forward
global type uo_consulta_cnpj_receita from olecustomcontrol
end type
end forward

global type uo_consulta_cnpj_receita from olecustomcontrol
integer width = 1065
integer height = 360
boolean border = false
boolean focusrectangle = false
string binarykey = "uo_consulta_cnpj_receita.udo"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
event statustextchange ( string text )
event progresschange ( long progress,  long progressmax )
event commandstatechange ( long command,  boolean enable )
event downloadbegin ( )
event downloadcomplete ( )
event titlechange ( string text )
event propertychange ( string szproperty )
event beforenavigate2 ( oleobject pdisp,  any url,  any flags,  any targetframename,  any postdata,  any headers,  ref boolean ab_cancel )
event newwindow2 ( ref oleobject ppdisp,  ref boolean ab_cancel )
event navigatecomplete2 ( oleobject pdisp,  any url )
event documentcomplete ( oleobject pdisp,  any url )
event onquit ( )
event onvisible ( boolean ocx_visible )
event ontoolbar ( boolean toolbar )
event onmenubar ( boolean menubar )
event onstatusbar ( boolean statusbar )
event onfullscreen ( boolean fullscreen )
event ontheatermode ( boolean theatermode )
event windowsetresizable ( boolean resizable )
event windowsetleft ( long left )
event windowsettop ( long top )
event windowsetwidth ( long ocx_width )
event windowsetheight ( long ocx_height )
event windowclosing ( boolean ischildwindow,  ref boolean ab_cancel )
event clienttohostwindow ( ref long cx,  ref long cy )
event setsecurelockicon ( long securelockicon )
event filedownload ( boolean activedocument,  ref boolean ab_cancel )
event navigateerror ( oleobject pdisp,  any url,  any frame,  any statuscode,  ref boolean ab_cancel )
event printtemplateinstantiation ( oleobject pdisp )
event printtemplateteardown ( oleobject pdisp )
event updatepagestatus ( oleobject pdisp,  any npage,  any fdone )
event privacyimpactedstatechange ( boolean bimpacted )
event setphishingfilterstatus ( long phishingfilterstatus )
event newprocess ( long lcauseflag,  oleobject pwb2,  ref boolean ab_cancel )
event redirectxdomainblocked ( oleobject pdisp,  any starturl,  any redirecturl,  any frame,  any statuscode )
end type
global uo_consulta_cnpj_receita uo_consulta_cnpj_receita

type variables

constant string ENDERECO_RECEITA_CONSULTA = "http://www.receita.fazenda.gov.br/PessoaJuridica/CNPJ/cnpjreva/Cnpjreva_Solicitacao3.asp?cnpj="
constant string ENDERECO_RECEITA_CAPTCHA = "www.receita.fazenda.gov.br/PessoaJuridica/CNPJ/cnpjreva/captcha/gerarCaptcha.asp"

constant string CONSULTA_JSON = "J"
constant string CONSULTA_CAPTCHA = "C"

string isTipoConsulta

boolean ibErro
boolean ibNavegando
boolean ibDocumentoCompleto

st_consulta_cnpj_receita istRetorno
end variables
forward prototypes
public function boolean of_navegar (readonly string as_endereco)
public subroutine of_set_tipo_consulta (readonly string as_tipo_consulta)
public function string of_get_endereco_receita_consulta ()
public function string of_get_endereco_receita_captcha ()
public function boolean of_get_documento_completo ()
public function boolean of_get_erro ()
protected function string of_get_valor_campo (readonly string as_campo)
end prototypes

event beforenavigate2(oleobject pdisp, any url, any flags, any targetframename, any postdata, any headers, ref boolean ab_cancel);
ibNavegando				= true
ibDocumentoCompleto	= true
ibErro					= false
end event

event navigatecomplete2(oleobject pdisp, any url);
ibNavegando = false
end event

event documentcomplete(oleobject pdisp, any url);
choose case isTipoConsulta
	case CONSULTA_CAPTCHA
		
	case CONSULTA_JSON
		if Pos(this.object.document.body.outerhtml, "Erro na Consulta") > 0 then
			ibErro = true
		else
			istRetorno.as_data_abertura = of_get_valor_campo("DATA DE ABERTURA")
			istRetorno.as_nome_empresarial = of_get_valor_campo("NOME EMPRESARIAL")
			istRetorno.as_logradouro = of_get_valor_campo("LOGRADOURO")
			istRetorno.as_nome_fantasia = of_get_valor_campo("TÍTULO DO ESTABELECIMENTO (NOME DE FANTASIA)")
			istRetorno.as_numero = of_get_valor_campo("NÚMERO")
			istRetorno.as_complemento = of_get_valor_campo("COMPLEMENTO")
			istRetorno.as_cep = of_get_valor_campo("CEP")
			istRetorno.as_bairro = of_get_valor_campo("BAIRRO/DISTRITO")
			istRetorno.as_municipio = of_get_valor_campo("MUNICÍPIO")
			istRetorno.as_uf = of_get_valor_campo("UF")
			istRetorno.as_cnae20 = of_get_valor_campo("CÓDIGO E DESCRIÇÃO DA ATIVIDADE ECONÔMICA PRINCIPAL")
			istRetorno.as_natureza_juridica = of_get_valor_campo("CÓDIGO E DESCRIÇÃO DA NATUREZA JURÍDICA")
		end if
end choose

ibDocumentoCompleto = false
end event

event navigateerror(oleobject pdisp, any url, any frame, any statuscode, ref boolean ab_cancel);
ibErro = true
end event

public function boolean of_navegar (readonly string as_endereco);
this.object.Navigate(as_endereco)

/*do while ibNavegando
	yield()
loop*/

return not ibErro
end function

public subroutine of_set_tipo_consulta (readonly string as_tipo_consulta);
isTipoConsulta = as_tipo_consulta
end subroutine

public function string of_get_endereco_receita_consulta ();
return ENDERECO_RECEITA_CONSULTA
end function

public function string of_get_endereco_receita_captcha ();
return ENDERECO_RECEITA_CAPTCHA
end function

public function boolean of_get_documento_completo ();
return ibDocumentoCompleto
end function

public function boolean of_get_erro ();
return ibErro
end function

protected function string of_get_valor_campo (readonly string as_campo);
string lsFonte

lsFonte = this.object.document.body.outerhtml

lsFonte = Mid(lsFonte, Pos(lsFonte, as_campo + " </FONT>"))

lsFonte = Mid(lsFonte, Pos(lsFonte, "face=Arial><B>") + 14)

lsFonte = Mid(lsFonte, 1, Pos(lsFonte, "</B>") - 1)
	
return lsFonte
end function

on uo_consulta_cnpj_receita.create
end on

on uo_consulta_cnpj_receita.destroy
end on

event error;ibNavegando = false
ibDocumentoCompleto = false
ibErro = true
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
09uo_consulta_cnpj_receita.bin 
2300000a00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000100000000000000000000000000000000000000000000000000000000ef49ddd001d58e4900000003000001800000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000009c00000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff000000038856f96111d0340ac0006ba9a205d74f00000000ef49ddd001d58e49ef49ddd001d58e49000000000000000000000000004f00430054004e004e00450053005400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000030000009c000000000000000100000002fffffffe0000000400000005fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Cffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000004c000018150000094d0000000000000000000000000000000000000000000000000000004c0000000000000000000000010057d0e011cf3573000869ae62122e2b00000008000000000000004c0002140100000000000000c0460000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004c000018150000094d0000000000000000000000000000000000000000000000000000004c0000000000000000000000010057d0e011cf3573000869ae62122e2b00000008000000000000004c0002140100000000000000c0460000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
19uo_consulta_cnpj_receita.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point

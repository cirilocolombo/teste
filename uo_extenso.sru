$PBExportHeader$uo_extenso.sru
forward
global type uo_extenso from nonvisualobject
end type
end forward

global type uo_extenso from nonvisualobject autoinstantiate
end type

type variables

string isNomeCelulaSingular
string isNomeCelulaPlural
string isNomeMoedaSingular
string isNomeMoedaPlural

string MoedaSingular='real', MoedaPlural='reais'
end variables

forward prototypes
public subroutine of_set_nome_moeda (readonly string as_celula_singular, readonly string as_celula_plural, readonly string as_moeda_singular, readonly string as_moeda_plural)
protected function string of_get_valor_extenso_centena (readonly long al_centena)
protected function string of_get_valor_extenso_dezena (readonly long al_dezena)
protected function string of_get_valor_extenso_unidade (readonly long al_unidade)
protected function string of_get_valor_extenso_milhar (readonly long al_milhar, readonly long al_centena)
public function string of_get_valor_extenso (readonly long al_valor)
public function string of_get_valor_extenso (readonly decimal adc_valor)
end prototypes

public subroutine of_set_nome_moeda (readonly string as_celula_singular, readonly string as_celula_plural, readonly string as_moeda_singular, readonly string as_moeda_plural);
isNomeCelulaSingular	= as_celula_singular
isNomeCelulaPlural	= as_celula_plural
isNomeMoedaSingular	= as_moeda_singular
isNomeMoedaPlural		= as_moeda_plural
end subroutine

protected function string of_get_valor_extenso_centena (readonly long al_centena);
long llDigito
long llDezena
string lsValorExtensoCentena

llDigito = al_centena / 100

llDezena = al_centena - (llDigito * 100)

if llDigito > 0 then
	choose case llDigito
		case 9
			lsValorExtensoCentena = "novecentos "
			
		case 8
			lsValorExtensoCentena = "oitocentos "
			
		case 7
			lsValorExtensoCentena = "setecentos "
			
		case 6
			lsValorExtensoCentena = "seiscentos "
			
		case 5
			lsValorExtensoCentena = "quinhentos "
			
		case 4
			lsValorExtensoCentena = "quatrocentos "
			
		case 3
			lsValorExtensoCentena = "trezentos "
			
		case 2
			lsValorExtensoCentena = "duzentos "
			
		case 1
			if llDezena > 0 then
				lsValorExtensoCentena = "cento "
			else
				lsValorExtensoCentena = "cem "
			end if
	end choose
	
	if llDezena > 0 then lsValorExtensoCentena += "e "
end if

if llDezena > 0 then
	lsValorExtensoCentena += of_get_valor_extenso_dezena(llDezena)
end if

return lsValorExtensoCentena
end function

protected function string of_get_valor_extenso_dezena (readonly long al_dezena);
long llDigito
long llUnidade
string lsValorExtensoDezena

llDigito = al_dezena / 10

llUnidade = al_dezena - (llDigito * 10)

if llDigito > 0 then
	choose case llDigito
		case 9
			lsValorExtensoDezena = "noventa "
			
		case 8
			lsValorExtensoDezena = "oitenta "
			
		case 7
			lsValorExtensoDezena = "setenta "
			
		case 6
			lsValorExtensoDezena = "sessenta "
			
		case 5
			lsValorExtensoDezena = "cinqüenta "
			
		case 4
			lsValorExtensoDezena = "quarenta "
			
		case 3
			lsValorExtensoDezena = "trinta "
			
		case 2
			lsValorExtensoDezena = "vinte "
			
		case 1
			if llUnidade > 0 then
				choose case llUnidade
					case 9
						lsValorExtensoDezena = "dezenove "
						
					case 8
						lsValorExtensoDezena = "dezoito "
						
					case 7
						lsValorExtensoDezena = "dezessete "
						
					case 6
						lsValorExtensoDezena = "dezesseis "
						
					case 5
						lsValorExtensoDezena = "quinze "
						
					case 4
						lsValorExtensoDezena = "quatorze "
						
					case 3
						lsValorExtensoDezena = "treze "
						
					case 2
						lsValorExtensoDezena = "doze "
						
					case 1
						lsValorExtensoDezena = "onze "
				end choose
			else
				lsValorExtensoDezena = "dez "
			end if
	end choose
	
	if llDigito <> 1 and llUnidade > 0 then lsValorExtensoDezena += "e "
end if

if llDigito <> 1 and llUnidade > 0 then
	lsValorExtensoDezena += of_get_valor_extenso_unidade(llUnidade)
end if

return lsValorExtensoDezena
end function

protected function string of_get_valor_extenso_unidade (readonly long al_unidade);
string lsValorExtensoUnidade

choose case al_unidade
	case 9
		lsValorExtensoUnidade = "nove "
		
	case 8
		lsValorExtensoUnidade = "oito "
		
	case 7
		lsValorExtensoUnidade = "sete "
		
	case 6
		lsValorExtensoUnidade = "seis "
		
	case 5
		lsValorExtensoUnidade = "cinco "
		
	case 4
		lsValorExtensoUnidade = "quatro "
		
	case 3
		lsValorExtensoUnidade = "três "
		
	case 2
		lsValorExtensoUnidade = "dois "
		
	case 1
		lsValorExtensoUnidade = "um "
end choose

return lsValorExtensoUnidade
end function

protected function string of_get_valor_extenso_milhar (readonly long al_milhar, readonly long al_centena);
string lsValorExtensoMilhar

choose case al_milhar
	case 4
		lsValorExtensoMilhar = "tril"
		
	case 3
		lsValorExtensoMilhar = "bil"
		
	case 2
		lsValorExtensoMilhar = "mil"
		
	case 1
		lsValorExtensoMilhar = "mil "
end choose

if al_centena > 1 and al_milhar > 1 then
	lsValorExtensoMilhar += "hões "
elseif al_milhar > 1 then
	lsValorExtensoMilhar += "hão "
end if

return lsValorExtensoMilhar
end function

public function string of_get_valor_extenso (readonly long al_valor);
decimal ldcValorDecimal

ldcValorDecimal = al_valor

return of_get_valor_extenso(ldcValorDecimal)
end function

public function string of_get_valor_extenso (readonly decimal adc_valor);
long llIndice
long llCentena
long llPosicao
long llCentavos
dec{2} ldcValor
string lsValorFormatado
string lsValorPorExtenso
boolean lbIniciouTexto

llPosicao = 1

ldcValor = Abs(adc_valor)

lsValorFormatado = string(ldcValor, "000,000,000,000.00")

for llIndice = 3 to 0 step -1
	llCentena = long(Mid(lsValorFormatado, llPosicao, 3))
	
	if llCentena > 0 then
		if lbIniciouTexto then lsValorPorExtenso += "e "
		
		lsValorPorExtenso += of_get_valor_extenso_centena(llCentena) + of_get_valor_extenso_milhar(llIndice, llCentena)
		
		lbIniciouTexto = true
	end if
	
	llPosicao += 4
next

if Right(lsValorPorExtenso, 6) = "ilhão " or Right(lsValorPorExtenso, 7) = "ilhões " then
	lsValorPorExtenso += "de "
end if

if ldcValor >= 2 then
	lsValorPorExtenso += MoedaPlural + " "
elseif ldcValor > 0 then
	lsValorPorExtenso += MoedaSingular + " "
end if

llCentavos = long(Mid(lsValorFormatado, llPosicao, 2))

if llCentavos > 0 then
	if lbIniciouTexto then lsValorPorExtenso += "e "
	
	lsValorPorExtenso += of_get_valor_extenso_dezena(llCentavos)
	
	if llCentavos > 1 then
		lsValorPorExtenso += "centavos"
	elseif llCentavos = 1 then
		lsValorPorExtenso += "centavo"
	end if
end if

if Right(lsValorPorExtenso, 1) = " " then
	lsValorPorExtenso = Left(lsValorPorExtenso, Len(lsValorPorExtenso) - 1)
end if

if lbIniciouTexto then
	lsValorPorExtenso = Upper(Left(lsValorPorExtenso, 1)) &
							+ Mid(lsValorPorExtenso, 2, Len(lsValorPorExtenso) - 1) + "."
end if

return lsValorPorExtenso
end function

on uo_extenso.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_extenso.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on


$PBExportHeader$uo_web_browser.sru
forward
global type uo_web_browser from olecustomcontrol
end type
end forward

global type uo_web_browser from olecustomcontrol
integer width = 1655
integer height = 1032
integer taborder = 10
boolean border = false
string binarykey = "uo_web_browser.udo"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
event statustextchange ( string as_text )
event progresschange ( long progress,  long progressmax )
event commandstatechange ( long command,  boolean enable )
event downloadbegin ( )
event downloadcomplete ( )
event titlechange ( string as_text )
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
end type
global uo_web_browser uo_web_browser

type prototypes
Function long ShellExecute ( &
	long hwindow, &
	string lpOperation, &
	string lpFile, &
	string lpParameters, &
	string lpDirectory, &
	long nShowCmd &
	) Library "shell32.dll" Alias for "ShellExecuteA"

Function long GetDesktopWindow ( &
	) Library "user32.dll"

Function ulong CreateFile ( &
	string lpFileName, &
	ulong dwDesiredAccess, &
	ulong dwShareMode, &
	ulong lpSecurityAttributes, &
	ulong dwCreationDisposition, &
	ulong dwFlagsAndAttributes, &
	ulong hTemplateFile &
	) Library "kernel32.dll" Alias For "CreateFileA"

Function boolean ReadFile ( &
	ulong hFile, &
	Ref blob lpBuffer, &
	ulong nNumberOfBytesToRead, &
	Ref ulong lpNumberOfBytesRead, &
	ulong lpOverlapped &
	) Library "kernel32.dll"

Function boolean WriteFile ( &
	ulong hFile, &
	blob lpBuffer, &
	ulong nNumberOfBytesToWrite, &
	Ref ulong lpNumberOfBytesWritten, &
	ulong lpOverlapped &
	) Library "kernel32.dll"

Function boolean CloseHandle ( &
	ulong hObject &
	) Library "kernel32.dll"

end prototypes

type variables

//-- constants for CreateFile API function
constant ULong INVALID_HANDLE_VALUE = -1
constant ULong GENERIC_READ     = 2147483648
constant ULong GENERIC_WRITE    = 1073741824
constant ULong FILE_SHARE_READ  = 1
constant ULong FILE_SHARE_WRITE = 2
constant ULong CREATE_NEW			= 1
constant ULong CREATE_ALWAYS		= 2
constant ULong OPEN_EXISTING		= 3
constant ULong OPEN_ALWAYS			= 4
constant ULong TRUNCATE_EXISTING = 5

integer OLECMDEXECOPT_DODEFAULT			= 0
integer OLECMDEXECOPT_PROMPTUSER			= 1
integer OLECMDEXECOPT_DONTPROMPTUSER	= 2
integer OLECMDEXECOPT_SHOWHELP			= 3

integer OLECMDID_OPEN					= 1
integer OLECMDID_NEW						= 2
integer OLECMDID_SAVE					= 3
integer OLECMDID_SAVEAS					= 4
integer OLECMDID_SAVECOPYAS			= 5
integer OLECMDID_PRINT					= 6
integer OLECMDID_PRINTPREVIEW			= 7
integer OLECMDID_PAGESETUP				= 8
integer OLECMDID_SPELL					= 9
integer OLECMDID_PROPERTIES			= 10
integer OLECMDID_CUT						= 11
integer OLECMDID_COPY					= 12
integer OLECMDID_PASTE					= 13
integer OLECMDID_PASTESPECIAL			= 14
integer OLECMDID_UNDO					= 15
integer OLECMDID_REDO					= 16
integer OLECMDID_SELECTALL				= 17
integer OLECMDID_CLEARSELECTION		= 18
integer OLECMDID_ZOOM					= 19
integer OLECMDID_GETZOOMRANGE			= 20
integer OLECMDID_UPDATECOMMANDS		= 21
integer OLECMDID_REFRESH				= 22
integer OLECMDID_STOP					= 23
integer OLECMDID_HIDETOOLBARS			= 24
integer OLECMDID_SETPROGRESSMAX		= 25
integer OLECMDID_SETPROGRESSPOS		= 26
integer OLECMDID_SETPROGRESSTEXT		= 27
integer OLECMDID_SETTITLE				= 28
integer OLECMDID_SETDOWNLOADSTATE	= 29
integer OLECMDID_STOPDOWNLOAD			= 30
integer OLECMDID_ONTOOLBARACTIVATED	= 31
integer OLECMDID_FIND					= 32
integer OLECMDID_DELETE					= 33
integer OLECMDID_HTTPEQUIV				= 34
integer OLECMDID_HTTPEQUIV_DONE		= 35
integer OLECMDID_ENABLE_INTERACTION	= 36
integer OLECMDID_ONUNLOAD				= 37
integer OLECMDID_PROPERTYBAG2			= 38
integer OLECMDID_PREREFRESH			= 39
integer OLECMDID_SHOWSCRIPTERROR        = 40 
integer OLECMDID_SHOWMESSAGE            = 41 
integer OLECMDID_SHOWFIND               = 42 
integer OLECMDID_SHOWPAGESETUP          = 43 
integer OLECMDID_SHOWPRINT              = 44 
integer OLECMDID_CLOSE                  = 45 
integer OLECMDID_ALLOWUILESSSAVEAS      = 46 
integer OLECMDID_DONTDOWNLOADCSS        = 47 
integer OLECMDID_UPDATEPAGESTATUS       = 48 
integer OLECMDID_PRINT2                 = 49 
integer OLECMDID_PRINTPREVIEW2          = 50 
integer OLECMDID_SETPRINTTEMPLATE       = 51 
integer OLECMDID_GETPRINTTEMPLATE       = 52 
integer OLECMDID_PAGEACTIONBLOCKED      = 55
integer OLECMDID_PAGEACTIONUIQUERY      = 56
integer OLECMDID_FOCUSVIEWCONTROLS      = 57
integer OLECMDID_FOCUSVIEWCONTROLSQUERY = 58
integer OLECMDID_SHOWPAGEACTIONMENU     = 59
integer OLECMDID_ADDTRAVELENTRY         = 60
integer OLECMDID_UPDATETRAVELENTRY      = 61
integer OLECMDID_UPDATEBACKFORWARDSTATE = 62
integer OLECMDID_OPTICAL_ZOOM           = 63
integer OLECMDID_OPTICAL_GETZOOMRANGE   = 64
integer OLECMDID_WINDOWSTATECHANGED     = 65
integer OLECMDID_ACTIVEXINSTALLSCOPE    = 66

end variables
event externalexception;action = ExceptionIgnore!

end event

event error;action = ExceptionIgnore!

end event

on uo_web_browser.create
end on

on uo_web_browser.destroy
end on


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Buo_web_browser.bin 
2F00000a00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000010000000000000000000000000000000000000000000000000000000059db29b001d57d3d00000003000001800000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000009c00000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff000000038856f96111d0340ac0006ba9a205d74f0000000059db29b001d57d3d59db29b001d57d3d000000000000000000000000004f00430054004e004e00450053005400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000030000009c000000000000000100000002fffffffe0000000400000005fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
20ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000004c0000256a00001aaa0000000000000000000000000000000000000000000000000000004c0000000000000000000000010057d0e011cf3573000869ae62122e2b00000008000000000000004c0002140100000000000000c0460000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004c0000256a00001aaa0000000000000000000000000000000000000000000000000000004c0000000000000000000000010057d0e011cf3573000869ae62122e2b00000008000000000000004c0002140100000000000000c0460000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Buo_web_browser.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point

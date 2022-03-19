#SCRIPT EN POWERSHELL PARA ANLIZAR DOMINIOS EXTERNOS IDENTIFICADOS EN LOS REGISTROS LOGS DEL DOMINIO BISA.COM
#CREATED BY GIANCARLO PASQUALE BELLIDO - BANCO BISA

#Si se desea analizar todos los dominios que realizaron una redireccion al dominio bisa.com descomente las lineas comentadas.
$log = $args[0]
Get-Content $log |
     Select-String -Pattern '^(\d+\.\d+\.\d+\.\d+)\s\S+\s\S+\s(\S+)\s\S+\s\S+\s(\/personas.php\?\S+)\sHTTP\/\d\.\d\"\s\d+\s\d+\s\"(\S+)\"' |
     Foreach-Object {
        $ip, $fecha, $domain,  $phishing = $_.Matches[0].Groups[1..4].Value
        if(($phishing -NotMatch 'facebook')){
	if($phishing -NotMatch 'google'){
	if($phishing -NotMatch 'bisa.com'){
	if($phishing -NotMatch 'bing'){
	if($phishing -NotLike '-'){
	[PSCustomObject] @{
		IP = $ip
		Fecha = $fecha
        	#Dominios = $domain
		DominioPhishing = $phishing
   	}
     }}}}}}
#SEGMENTO DE ANALISIS PARA IDENTIFICACION DE DOMINIOS REPL.CO
<#$log = $args[0]
Get-Content $log |
     Select-String -Pattern '^(\d+\.\d+\.\d+\.\d+)\s\S+\s\S+\s\[(\S+)\s\S+\s\S+\s(\S+)\sHTTP\/\d\.\d\"\s\d+\s\d+\s\"(\S+(repl.co)\S+)\"' |
     Foreach-Object {
        $ip, $fecha, $domain,  $phishing = $_.Matches[0].Groups[1..4].Value
        [PSCustomObject] @{
		IP = $ip
          	Fecha = $fecha
        #	Dominios = $domain
		DominioPhishing = $phishing
   	}
     } #>
#^\d+\.\d+\.\d+\.\d+\s\S+\s\S+\s\[(\S+)\s\S+\s\S+\s(\/personas\S+)\sHTTP\/\d\.\d\"\s\d+\s\d+\s\"(https\:\/\/(?![www\.bisa\.com])\S+)
#^\d+\.\d+\.\d+\.\d+\s\S+\s\S+\s\[(\S+)\s\S+\s\S+\s(\/personas\S+)\sHTTP\/\d\.\d\"\s\d+\s\d+\s\"(\S+(repl.co)\S+)
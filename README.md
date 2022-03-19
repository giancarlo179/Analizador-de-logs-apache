# Analizador-de-logs-apache![analisis logs apache](https://user-images.githubusercontent.com/32601403/159130362-d7580397-e526-4bfb-b7d1-76636043a5f8.png)

Script en powershell que analiza los Registros (logs) de un servidor apache, identifica posibles IoC de Phishing.

La Taxonomia que utiliza un atacante al momento de realizar un Phishing a un usuario es la siguiente:

1. Copiar la pagina de la empresa afectada
2. Pedir al usuario validar datos
3. En su mayoria, al finalizar el envio de datos por parte de la victima el atacante configura la redireccion hacia una pagina real de la empresa para que la victima no sospeche.


Este script analizara los registros de esa redireccion e identificara desde que dominio se redirigio el acceso.
Realiza un filtro de dominios como buscadores y redes sociales.

Como argumento de entrada el script recibe los logs en cualquier formato de texto.

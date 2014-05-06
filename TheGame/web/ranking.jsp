<%@page contentType="text/html" pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
    <head>
        <title>Led On - The Game</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">                        
        <link href="styles.css" rel="stylesheet">
        <link href="Bootstrap/css/bootstrap.css" rel="stylesheet">
	<link rel="shortcut icon" href="http://arduinolivre.files.wordpress.com/2013/08/lampada_ligada.png">		
    </head>
    <body class="menuBody">
        <div class="menu">
            <div id="ranking" class="text-center"></div> 
            <div class="text-center">
                <button type="button" id="btnVoltar" class="btn btn-primary btnVoltarButton"><b>Voltar</b></button>
            </div>
        </div>
        <script src="JQuery/jquery-1.10.2.js"></script>	 
        <script type="text/javascript">	
            $(document).ready(function(){   
                $("#ranking").load("Controller");
                
                $("#btnVoltar").click(function(){	                
                   location.href = "index.jsp"
                });
            });
	</script>        
    </body>
</html>
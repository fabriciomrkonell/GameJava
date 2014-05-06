<%@page contentType="text/html" pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
    <head>
        <title>Led On - The Game</title>
        <meta charset='utf-8'>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">                        
        <link href="styles.css" rel="stylesheet">
        <link href="Bootstrap/css/bootstrap.css" rel="stylesheet">
	<link rel="shortcut icon" href="http://arduinolivre.files.wordpress.com/2013/08/lampada_ligada.png">		
    </head>
    <body class="menuBody">
        <form name="loadGame" class="menu" id="loadGame" method="post" action="game.jsp"> 
            <input id="inputFase" name="inputFase" class="text-center" type="hidden" value="0">
            <div id="nameIndex" class="text-center">
                <label id="nomeCampo">Seu Nome</label>
                <input placeholder="Ex.: Goku, Vegeta..." id="inputName" name="inputName" class="text-center" type="text">
            </div>
            <button type="button" id="btnGame" class="btn btn-primary" disabled="true" ><b>Jogar</b></button>
            <div id="menusInformation">
                <button type="button" class="infos btn btn-success" disabled><b>Como Jogar</b></button>	 
                <button type="button" class="infos btn btn-success" disabled><b>Sobre</b></button>	 
                <button type="button" class="infos btn btn-success" id="btnRanking"><b>Ranking Nacional</b></button>	 
            </di>    
        </form>
        <script src="JQuery/jquery-1.10.2.js"></script>	 
        <script type="text/javascript">	
            $(document).ready(function(){
                $("#btnGame").click(function(){	                
                   document.loadGame.submit();
                });
                
                $("#btnRanking").click(function(){	                
                   location.href = "ranking.jsp"
                });
                                
                $("#inputName").keyup(function(){                    
                    if ($(this).val().length >= 3){
                       $("#btnGame").attr("disabled", false);	        
                    }else{
                       $("#btnGame").attr("disabled", true);
                    }
                });
            });
	</script>        
    </body>
</html>
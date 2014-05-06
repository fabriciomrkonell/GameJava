<%@page import="conexao.DAO"%>
<%@page import="conexao.Jogadores"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%! public String Nome;
    public String Fase;
    public String Movimentos;
    public String Tempo;    
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Led On - The Game</title>
        <meta charset='utf-8'>
        <script src="JQuery/jquery-1.10.2.js"></script>	 
        <script src="cronometro.js"></script>	 
        <script src="Bootstrap/js/bootstrap.js"></script>	 
        <link href="styles.css" rel="stylesheet">
        <link href="Bootstrap/css/bootstrap.css" rel="stylesheet">
        <link rel="shortcut icon" href="http://arduinolivre.files.wordpress.com/2013/08/lampada_ligada.png">	
    </head>	
    <%
        this.Nome = request.getParameter("inputName");
        this.Fase = request.getParameter("inputFase");
        this.Movimentos = request.getParameter("inputMovimento");
        this.Tempo = request.getParameter("inputTempo");
    
        if(Integer.parseInt(this.Fase) == 0){    
        }else{
            Jogadores Jogo =  new Jogadores();
            Jogo.setNome(Nome);
            Jogo.setFase(Fase);
            Jogo.setMovimento(Movimentos);
            Jogo.setTempo(Tempo);
            DAO Banco =  new DAO();
            Banco.addNew(Jogo);
        }
    %>
    <body class="menuBody">
        <form name="gameForm" id="gameForm" method="post" class="menu" action="game.jsp">        
            <input type="hidden" id="inputName" name="inputName" value="<%=this.Nome%>">
            <input type="hidden" id="inputFase" name="inputFase" value="<%=Integer.parseInt(this.Fase) + 1%>"> 
            <input type="hidden" id="inputMovimento" name="inputMovimento" value="">
            <input type="hidden" id="inputTempo" name="inputTempo" value=""> 
        </form>
        <div id="container" class="container-fluid">
            <div class="row-fluid">
                <div class="span12 "> 
                    <div class="span5">
                        <div class="text-center">                              
                            <form name="information" id="information" method="post">                   
                                <label id="fase">Fase <%=Integer.parseInt(this.Fase) + 1%></label>
                                <p>
                                <label id="movimentos">Movimentos</label>
                                <div class="separador"></div>
                                <label id="movimentoPlacar">0</label>
                                <p>                                
                                <label id="tempo">Tempo</label>
                                <div class="separador"></div>
                                <label id="tempoPlacar">00:00:0</label>
                                <p>  
                                <button type="button" id="btnVoltarHome" class="btn btn-primary btnVoltarButton"><b>Voltar</b></button>
                            </form>                               
                        </div>                        
                    </div>
                    <div class="span7">					
                        <table style="display:inline-block">
                            <tr>
                                <td><button data-value="11" class="myButton btn btn-success"></button></td>
                                <td><button data-value="12" class="myButton btn btn-success"></button></td>
                                <td><button data-value="13" class="myButton btn btn-success"></button></td>
                                <td><button data-value="14" class="myButton btn btn-success"></button></td>				
                                <td><button data-value="15" class="myButton btn btn-success"></button></td>
                            </tr>	
                            <tr>
                                <td><button data-value="21" class="myButton btn btn-success"></button></td>
                                <td><button data-value="22" class="myButton btn btn-success"></button></td>
                                <td><button data-value="23" class="myButton btn btn-success"></button></td>
                                <td><button data-value="24" class="myButton btn btn-success"></button></td>				
                                <td><button data-value="25" class="myButton btn btn-success"></button></td>
                            </tr>	
                            <tr>
                                <td><button data-value="31" class="myButton btn btn-success" ></button></td>
                                <td><button data-value="32" class="myButton btn btn-success" ></button></td>
                                <td><button data-value="33" class="myButton btn btn-success" ></button></td>
                                <td><button data-value="34" class="myButton btn btn-success" ></button></td>				
                                <td><button data-value="35" class="myButton btn btn-success" ></button></td>	
                            </tr>	
                            <tr>
                                <td><button data-value="41" class="myButton btn btn-success" ></button></td>
                                <td><button data-value="42" class="myButton btn btn-success" ></button></td>
                                <td><button data-value="43" class="myButton btn btn-success" ></button></td>
                                <td><button data-value="44" class="myButton btn btn-success" ></button></td>				
                                <td><button data-value="45" class="myButton btn btn-success" ></button></td>
                            </tr>	
                            <tr>
                                <td><button data-value="51" class="myButton btn btn-success" ></button></td>
                                <td><button data-value="52" class="myButton btn btn-success" ></button></td>
                                <td><button data-value="53" class="myButton btn btn-success" ></button></td>
                                <td><button data-value="54" class="myButton btn btn-success" ></button></td>				
                                <td><button data-value="55" class="myButton btn btn-success" ></button></td>
                            </tr>	
                        </table>						                        			
                    </div>
                </div>
            </div>
        </div>

        <div id="nextFase" class="modal hide fade" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-header text-center">    
                <h3 id="myModalLabel">Fase Concluída!</h3>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row-fluid text-center">
                          <label id="melhoresColocados">Melhores Colocados</label>
                        <div class="span12" id="infoTree"></div>
                    </div>
                </div>    
            </div>
            <div class="modal-footer text-center">                
                <button class="btn btn-primary" id="proximaFase">Próxima Fase</button>
            </div>
        </div>
                                <script type="text/javascript"
        <script type="text/javascript">
            $(document).ready(function() {   
                Configuracao();
                 $("#infoTree").load("topTree?Fase="+$("#inputFase").val());
                 $("#nextFase").on('hidden', function () {
                    document.gameForm.submit();
                })
                
                $("#btnVoltarHome").click(function(){
                   location.href = "index.jsp";
                });
                
                var ContadorGrade = 0;
                var Ganhou = 0;     
                var ContadorDisparou = false;
                var resultado, Selecionado, DataValue= ""; 
                
                $("#proximaFase").click(function() {                    
                    document.gameForm.submit();
                });
   

                function Configuracao() { 
                    var Contador = 0;
                    $(".myButton").each(function() {
                        resultado= parseInt(Math.random() * 3)
                        console.debug(resultado);
                        if (resultado > 1) {
                            $(this).removeClass("btn-success").addClass("btn-danger");
                            Contador++;
                        }
                    });

                    if (Contador === 0) {
                        Configuracao();
                        Contador = 0;
                    } else {
                        Contador = 0;
                    }
                };

                $(".myButton").click(function() {
                    Cronometrar = true;
                    if(ContadorDisparou == false){
                        timer();
                        ContadorDisparou = true;
                    };
                    ContadorGrade++;
                    $("#movimentoPlacar").html(ContadorGrade);
                    Ganhou = 0;
                    Selecionado = $(this).attr("data-value");
                    
                    $(".myButton").each(function() {                    
                    DataValue = $(this).attr("data-value");
                        if (DataValue == (parseInt(Selecionado)) || DataValue == (parseInt(Selecionado) + 1) || DataValue == (parseInt(Selecionado) - 1) || DataValue == (parseInt(Selecionado) + 10) || DataValue == (parseInt(Selecionado) - 10)) {
                            if ($(this).hasClass("btn-success") == true) {
                                $(this).removeClass("btn-success").addClass("btn-danger");
                            } else {
                                $(this).removeClass("btn-danger").addClass("btn-success");
                            };
                        };
                    });

                    $(".myButton").each(function() {
                        if ($(this).hasClass("btn-success") == true) {
                            Ganhou++;
                        };
                    });
                    
                    if (Ganhou == 25) {
                        Cronometrar = false;
                        $("#inputTempo").val($("#tempoPlacar").html());
                        $("#inputMovimento").val($("#movimentoPlacar").html());
                        $("#nextFase").modal();
                    };
                });                        
            });
        </script>
    </body>
</html>

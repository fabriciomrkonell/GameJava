var Segundos = 0;
var Minutos = 0;
var Milisegundos = 0;
var Cronometrar = false;

function timer() {
    if (Cronometrar) {
        Milisegundos += 1;
        if (Milisegundos == 10) {
            Milisegundos = 0;
            Segundos += 1;
        }

        if (Segundos == 60) {
            Segundos = 0;
            Minutos += 1;
        }
        Strsec = "" + Segundos;
        Strmin = "" + Minutos;
        Strmil = "" + Milisegundos;

        if (Strsec.length != 2) {
            Strsec = "0" + Segundos;
        }
        if (Strmin.length != 2) {
            Strmin = "0" + Minutos;
        }

        $("#tempoPlacar").html(Strmin+":"+Strsec+":"+Strmil);
        setTimeout("timer()", 100);
    }
}
function startover() {
    Cronometrar = false;
    Segundos = 0;
    Minutos = 0;
    Milisegundos = 0;
    Strsec = "00";
    Strmin = "00";
    Strmil = "00";
}

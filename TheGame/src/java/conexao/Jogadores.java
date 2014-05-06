package conexao;

public class Jogadores {
    
    private int Codigo;
    private String Nome;
    private String Fase;
    private String Movimento;
    private String Tempo;

    public int getCodigo() {
        return Codigo;
    }

    public void setCodigo(int Codigo) {
        this.Codigo = Codigo;
    }

    public String getNome() {
        return Nome;
    }

    public void setNome(String Nome) {
        this.Nome = Nome;
    }

    public String getFase() {
        return Fase;
    }

    public void setFase(String Fase) {
        this.Fase = Fase;
    }

    public String getMovimento() {
        return Movimento;
    }

    public void setMovimento(String Movimento) {
        this.Movimento = Movimento;
    }

    public String getTempo() {
        return Tempo;
    }

    public void setTempo(String Tempo) {
        this.Tempo = Tempo;
    }
           
}
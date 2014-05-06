package conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DAO extends AbstractDAO {

    public final static String SQL_TO_ADD_FASE = "INSERT INTO JOGADORES (Jog_Nome,Jog_Fase,Jog_Movimento,Jog_Tempo) VALUES (?,?,?,?);";  
    public final static String SQL_TO_FINDALL = "SELECT * FROM JOGADORES GROUP BY JOG_NOME, JOG_FASE ORDER BY JOG_MOVIMENTO, JOG_TEMPO  ASC LIMIT 10";  
    public final static String SQL_TO_FINDTREE = "SELECT * FROM JOGADORES WHERE JOG_FASE = ? ORDER BY JOG_MOVIMENTO, JOG_TEMPO ASC LIMIT 3";  
    
    public void addNew(Jogadores o) throws Exception {  
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            con = super.__getConnection();
            stmt = con.prepareStatement(SQL_TO_ADD_FASE, PreparedStatement.RETURN_GENERATED_KEYS);
            stmt.setString(1, o.getNome());
            stmt.setString(2, o.getFase());
            stmt.setInt(3, Integer.parseInt(o.getMovimento()));
            stmt.setString(4, o.getTempo());            
            super.__doDatabaseUpdate(stmt);
            rs = stmt.getGeneratedKeys();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            throw e;
        } finally {
            super.__closeConnection(con, stmt, rs);
        }
    }   
    
    public ArrayList<Jogadores> findAll() throws Exception {
        ArrayList<Jogadores> lst = new ArrayList<Jogadores>();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            con = super.__getConnection();
            stmt = con.prepareStatement(SQL_TO_FINDALL);
            rs = super.__doDatabaseQuery(stmt);
            while (rs.next()) {
                lst.add(this.fillObject(rs));
            }
        } catch (SQLException e) {
           throw e;
        } finally {
            super.__closeConnection(con, stmt, rs);
        }

        return lst;
    }
    public ArrayList<Jogadores> finfTop3(String Fase) throws Exception {
        ArrayList<Jogadores> lst = new ArrayList<Jogadores>();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
          try {
            con = super.__getConnection();
            stmt = con.prepareStatement(SQL_TO_FINDTREE);
            stmt.setString(1, Fase);
            rs = super.__doDatabaseQuery(stmt);
            while (rs.next()) {
                lst.add(this.fillObject(rs));
            }
        } catch (SQLException e) {
           throw e;
        } finally {
            super.__closeConnection(con, stmt, rs);
        }
        return lst;
    }
    
        private Jogadores fillObject(ResultSet rs) throws SQLException {
        Jogadores J = new Jogadores();
        J.setCodigo(rs.getInt("Jog_Codigo"));
        J.setNome(rs.getString("Jog_Nome"));
        J.setFase(rs.getString("Jog_Fase"));        
        J.setMovimento(rs.getString("Jog_Movimento"));        
        J.setTempo(rs.getString("Jog_Tempo"));        
        return J;
    }
    
}

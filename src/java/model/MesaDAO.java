/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author matheus
 */
public class MesaDAO extends DataBaseDAO {

    public void inserir(Mesa m) throws Exception {
        String sql = "INSERT INTO mesa (nome,status) VALUES(?,?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, m.getNome());
        pstm.setString(2, m.getStatus());

        pstm.execute();
        this.desconectar();
    }

    public ArrayList<Mesa> listar() throws Exception {
        String sql = "SELECT * FROM mesa";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        ArrayList<Mesa> lista = new ArrayList<Mesa>();
        while (rs.next()) {
            Mesa m = new Mesa();
            m.setId(rs.getInt("id"));
            m.setNome(rs.getString("nome"));
            m.setStatus(rs.getString("status"));

            lista.add(m);
        }
        this.desconectar();
        return lista;
    }

    public void excluir(int id) throws Exception {
        String sql = "DELETE FROM mesa WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    public Mesa carregaPorId(int id) throws Exception {
        String sql = "SELECT * FROM mesa WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        Mesa m = new Mesa();
        if (rs.next()) {
            m.setId(rs.getInt("id"));
            m.setNome(rs.getString("nome"));
            m.setStatus(rs.getString("status"));

        }
        this.desconectar();
        return m;
    }

    public void alterar(Mesa m) throws Exception {
        String sql = "UPDATE mesa SET nome=?,status=? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, m.getNome());
        pstm.setString(2, m.getStatus());
        pstm.setInt(3, m.getId());
        pstm.execute();
        this.desconectar();
    }
}

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
public class ClienteDAO extends DataBaseDAO {

    public void inserir(Cliente c) throws Exception {
        String sql = "INSERT INTO cliente (nome,cpf,id_mesa) VALUES(?,?,?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, c.getNome());
        pstm.setString(2, c.getCpf());
        
        pstm.setInt(3, c.getMesa().getId());
        
        
        pstm.execute();
        this.desconectar();
    }

    public ArrayList<Cliente> listar() throws Exception {
        String sql = "SELECT * FROM cliente";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        ArrayList<Cliente> lista = new ArrayList<Cliente>();
        while (rs.next()) {
            Cliente c = new Cliente();
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setCpf(rs.getString("cpf"));
            
            MesaDAO meDAO = new MesaDAO();
            c.setMesa(meDAO.carregaPorId(rs.getInt("id_mesa")));

            lista.add(c);
        }
        this.desconectar();
        return lista;
    }

    public void excluir(int id) throws Exception {
        String sql = "DELETE FROM cliente WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    public Cliente carregaPorId(int id) throws Exception {
        String sql = "SELECT * FROM cliente WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        Cliente c = new Cliente();
        if (rs.next()) {
            c.setId(rs.getInt("id"));
            c.setNome(rs.getString("nome"));
            c.setCpf(rs.getString("cpf"));
            
            MesaDAO mDAO = new MesaDAO();
            c.setMesa(mDAO.carregaPorId(rs.getInt("id_mesa")));

        }
        this.desconectar();
        return c;
    }

    public void alterar(Cliente c) throws Exception {
        String sql = "UPDATE cliente SET nome=? , cpf=?, id_mesa=? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, c.getNome());
        pstm.setString(2, c.getCpf());
        pstm.setInt(3, c.getMesa().getId());
        
        pstm.setInt(4, c.getId());
        
       
        
        pstm.execute();
        this.desconectar();
    }
}

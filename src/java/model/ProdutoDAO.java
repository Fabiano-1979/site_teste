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
public class ProdutoDAO extends DataBaseDAO {

    public void inserir(Produto p) throws Exception {
        String sql = "INSERT INTO produto (nome,tipo_produto,volume,valor,descricao,imagem) VALUES(?,?,?,?,?,?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, p.getNome());
        pstm.setString(2, p.getTipoProduto());
        pstm.setString(3, p.getVolume());
        pstm.setDouble(4, p.getValor());
        pstm.setString(5, p.getDescricao());
        pstm.setString(6, p.getImagem());
        
        pstm.execute();
        this.desconectar();
    }

    public ArrayList<Produto> listar() throws Exception {
        String sql = "SELECT * FROM produto";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        ArrayList<Produto> lista = new ArrayList<Produto>();
        while (rs.next()) {
            Produto p = new Produto();
            p.setId(rs.getInt("id")); 
            p.setNome(rs.getString("nome"));
            p.setTipoProduto(rs.getString("tipo_produto"));
            p.setVolume(rs.getString("volume"));
            p.setValor(rs.getDouble("valor"));
            p.setDescricao(rs.getString("descricao"));
            p.setImagem(rs.getString("imagem"));

            lista.add(p);

        }
        this.desconectar();
        return lista;
    }

    public void excluir(int id) throws Exception {
        String sql = "DELETE FROM produto WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    public Produto carregaPorId(int id) throws Exception {
        String sql = "SELECT * FROM produto WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        Produto p = new Produto();
        if (rs.next()) {
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setTipoProduto(rs.getString("tipo_produto"));
            p.setVolume(rs.getString("volume"));
            p.setValor(rs.getDouble("valor"));
            p.setDescricao(rs.getString("descricao"));
            p.setImagem(rs.getString("imagem"));

        }
        this.desconectar();
        return p;
    }

    public void alterar(Produto p) throws Exception {
        String sql = "UPDATE produto SET nome=?,tipo_produto=?,volume=?,valor=?,descricao=?,imagem=? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, p.getNome());
        pstm.setString(2, p.getTipoProduto());
        pstm.setString(3, p.getVolume());
        pstm.setDouble(4, p.getValor());
        pstm.setString(5, p.getDescricao());
        pstm.setString(6, p.getImagem());
        pstm.setInt(7, p.getId());
        pstm.execute();
        this.desconectar();
    }
}

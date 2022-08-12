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
 * @author Administrador
 */
public class PerfilDAO extends DataBaseDAO {

    public void inserir(Perfil p) throws Exception {
        String sql = "INSERT INTO perfil (nome,descricao) VALUES(?,?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, p.getNome());
        pstm.setString(2, p.getDescricao());
        pstm.execute();
        this.desconectar();
    }

    public ArrayList<Perfil> listar() throws Exception {
        String sql = "SELECT * FROM perfil";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        ArrayList<Perfil> lista = new ArrayList<Perfil>();
        while (rs.next()) {
            Perfil p = new Perfil();
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setDescricao(rs.getString("descricao"));
            lista.add(p);
        }
        this.desconectar();
        return lista;
    }

    public void excluir(int id) throws Exception {
        String sql = "DELETE FROM perfil WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        pstm.execute();
        this.desconectar();
    }

    public Perfil carregaPorId(int id) throws Exception {
        String sql = "SELECT * FROM perfil WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        Perfil p = new Perfil();
        if (rs.next()) {
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setDescricao(rs.getString("descricao"));
            p.setMenus(listarMenu(id));
        }
        this.desconectar();
        return p;
    }

    public void alterar(Perfil p) throws Exception {
        String sql = "UPDATE perfil SET nome=?,descricao=? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, p.getNome());
        pstm.setString(2, p.getDescricao());
        pstm.setInt(3, p.getId());
        pstm.execute();
        this.desconectar();
    }
    
    public ArrayList<Menu> listarMenu(int id_perfil) throws Exception {
        String sql = "SELECT m.* FROM menu as m, perfil_menu pm WHERE pm.id_menu=m.id AND pm.id_perfil = ?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id_perfil);
        ResultSet rs = pstm.executeQuery();
        ArrayList<Menu> lista = new ArrayList<Menu>();
        while (rs.next()) {
            Menu m = new Menu();
            m.setId(rs.getInt("id"));
            m.setTitulo(rs.getString("titulo"));
            m.setLink(rs.getString("link"));
            m.setIcone(rs.getString("icone"));
            lista.add(m);
        }
        this.desconectar();
        return lista;
    }

    public ArrayList<Menu> menusNaoPerfil(int id_perfil) throws Exception {
        String sql = "SELECT m.* FROM menu as m WHERE id NOT IN(SELECT id_menu FROM perfil_menu as pm WHERE id_perfil=?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id_perfil);
        ResultSet rs = pstm.executeQuery();
        ArrayList<Menu> lista = new ArrayList<Menu>();
        while (rs.next()) {
            Menu m = new Menu();
            m.setId(rs.getInt("id"));
            m.setTitulo(rs.getString("titulo"));
            m.setLink(rs.getString("link"));
            m.setIcone(rs.getString("icone"));
            lista.add(m);
        }
        this.desconectar();
        return lista;
    }
    
    public void addMenu(int id_perfil, int id_menu) throws Exception {
        String sql = "INSERT INTO perfil_menu (id_perfil,id_menu) VALUES(?,?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id_perfil);
        pstm.setInt(2, id_menu);
        pstm.execute();
        this.desconectar();
    }
    
    public void delMenu(int id_perfil, int id_menu) throws Exception {
        String sql = "DELETE FROM perfil_menu WHERE id_perfil=? AND id_menu=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id_perfil);
        pstm.setInt(2, id_menu);
        pstm.execute();
        this.desconectar();
    }

}

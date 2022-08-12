/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Administrador
 */
public class PedidoDAO extends DataBaseDAO {

    public int registrar(Pedido p) throws Exception {
        String sql = "INSERT INTO pedido (data_venda,id_usuario,id_cliente) VALUES(now(),?,?)";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
        
        pstm.setInt(1, p.getUsuario().getId());
        pstm.setInt(2, p.getCliente().getId());
        
        pstm.execute();

        ResultSet rs = pstm.getGeneratedKeys();
        if (rs.next()) {
            p.setId(rs.getInt(1));
        }
        
        //System.out.println("id"+p.getId());
        
        for (ItemPedido item : p.getItens()) {
            String sql_item = "INSERT INTO item_pedido (id_pedido,id_produto,quantidade,preco) VALUES(?,?,?,?)";
            PreparedStatement pstm_item = conn.prepareStatement(sql_item);
            pstm_item.setInt(1, p.getId());
            pstm_item.setInt(2, item.getProduto().getId());
            pstm_item.setInt(3, item.getQuantidade());
            pstm_item.setDouble(4, item.getProduto().getValor());
            pstm_item.execute();
        }
        this.desconectar();
        return p.getId();
    }

    public int alterar(Pedido p) throws Exception {
        String sql = "UPDATE pedido SET data_venda=now(), id_usuario=?  WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, p.getUsuario().getId());
        pstm.setInt(2, p.getId());
        pstm.execute();

        String sql_excluir_itens = "DELETE FROM item_pedido WHERE id_pedido=?";
        PreparedStatement pstm_excluir_itens = conn.prepareStatement(sql_excluir_itens);
        pstm_excluir_itens.setInt(1, p.getId());
        pstm_excluir_itens.execute();

        for (ItemPedido item : p.getItens()) {
            String sql_item = "INSERT INTO item_pedido (id_pedido,id_produto,quantidade,preco) VALUES(?,?,?,?)";
            PreparedStatement pstm_item = conn.prepareStatement(sql_item);
            pstm_item.setInt(1, p.getId());
            pstm_item.setInt(2, item.getProduto().getId());
            pstm_item.setInt(3, item.getQuantidade());
            pstm_item.setDouble(4, item.getProduto().getValor());
            pstm_item.execute();
        }
        this.desconectar();
        return p.getId();
    }

    public ArrayList<Pedido> listar() throws Exception {
        String sql = "SELECT * FROM pedido";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        
        ArrayList<Pedido> lista = new ArrayList<Pedido>();
        while (rs.next()) {
            Pedido p = new Pedido();
            p.setId(rs.getInt("id"));
            p.setForma_pagamento(rs.getString("forma_pagamento"));
            p.setData_venda(new Date(rs.getDate("data_venda").getTime()));
            if (rs.getDate("data_pagamento") != null) {
                p.setData_pagamento(new Date(rs.getDate("data_pagamento").getTime()));
            }
            
            UsuarioDAO uDAO = new UsuarioDAO();
            p.setUsuario(uDAO.carregaPorId(rs.getInt("id_usuario")));
            ClienteDAO cDAO = new ClienteDAO();
            p.setCliente(cDAO.carregaPorId(rs.getInt("id_cliente")));
            p.setItens(this.carregaItens(rs.getInt("id")));

            lista.add(p);
        }
        this.desconectar();
        return lista;
    }

    public Pedido carregaPorId(int id) throws Exception {
        String sql = "SELECT * FROM pedido WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id);
        ResultSet rs = pstm.executeQuery();
        Pedido p = new Pedido();
        if (rs.next()) {
            p.setId(rs.getInt("id"));
            p.setForma_pagamento(rs.getString("forma_pagamento"));
            p.setData_venda(new java.sql.Date(rs.getDate("data_venda").getTime()));
            if (rs.getDate("data_pagamento") != null) {
                p.setData_pagamento(new Date(rs.getDate("data_pagamento").getTime()));
            }

            UsuarioDAO uDAO = new UsuarioDAO();
            p.setUsuario(uDAO.carregaPorId(rs.getInt("id_usuario")));
            ClienteDAO cDAO = new ClienteDAO();
            p.setCliente(cDAO.carregaPorId(rs.getInt("id_cliente")));
            
            p.setItens(this.carregaItens(id));
        }
        this.desconectar();
        return p;
    }

    public ArrayList<ItemPedido> carregaItens(int id_pedido) throws Exception {
        String sql = "SELECT * FROM item_pedido  WHERE id_pedido=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id_pedido);
        ResultSet rs = pstm.executeQuery();
        ArrayList<ItemPedido> lista = new ArrayList<ItemPedido>();
        while (rs.next()) {
            ItemPedido item = new ItemPedido();
            item.setId(rs.getInt("id"));
            item.setQuantidade(rs.getInt("quantidade"));
            item.setPreco(rs.getDouble("preco"));
            ProdutoDAO pDAO = new ProdutoDAO();
            item.setProduto(pDAO.carregaPorId(rs.getInt("id_produto")));

            lista.add(item);
        }
        this.desconectar();
        return lista;
    }

 

    public int registrarPagamento(Pedido p) throws Exception {
        String sql = "UPDATE pedido SET data_pagamento=now() , forma_pagamento=? WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1 , p.getForma_pagamento());
        pstm.setInt(2, p.getId());
        
        pstm.execute();
        
        //System.out.print("forma pagamento: "+p.getForma_pagamento());
        this.desconectar();
        
        return p.getId();
    }
    
     public void registrarFormaPagamento(int id_pedido) throws Exception {
        String sql = "UPDATE pedido SET  WHERE id=?";
        this.conectar();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setInt(1, id_pedido);
        pstm.execute();
        this.desconectar();
        
        
    }
}


/*
 *      Author ::: Brian Sterling
 *     Program ::: Bases de Datos
 *  Credential ::: SIST0008-G01:SIV
 */

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.Consultor;
import util.DbUtil;

public class ConsultorDAO
{
    private Connection connection;

    public ConsultorDAO()
    {
        connection = DbUtil.getConnection();
    }

    public void addUser(Consultor user)
    {
        try
        {
            PreparedStatement preparedStatement = connection.prepareStatement("insert into consultor(labor) values (?)");
            preparedStatement.setString(1, user.getLabor());
            preparedStatement.executeUpdate();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

    public void deleteUser(int idConsultor)
    {
        try
        {
            PreparedStatement preparedStatement = connection.prepareStatement("delete from consultor where idConsultor=?");
            preparedStatement.setInt(1, idConsultor);
            preparedStatement.executeUpdate();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

    public void updateUser(Consultor user)
    {
        try 
        {
            PreparedStatement preparedStatement = connection.prepareStatement("update consultor set labor=?");
            preparedStatement.setString(1, user.getLabor());
            preparedStatement.executeUpdate();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

    public List<Consultor> getAllUsers()
    {
        List<Consultor> users = new ArrayList<Consultor>();
        
        try
        {
            System.out.println("Llegue hasta aca");
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from consultor");
            
            while (rs.next())
            {
                Consultor user = new Consultor();
                user.setIdConsultor(rs.getInt("idConsultor"));
                user.setLabor(rs.getString("labor"));
                users.add(user);
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return users;
    }

    public Consultor getUserById(int idConsultor)
    {
        Consultor user = new Consultor();
        
        try
        {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from consultor where idConsultor=?");
            preparedStatement.setInt(1, idConsultor);
            ResultSet rs = preparedStatement.executeQuery();
            
            if (rs.next())
            {
                user.setIdConsultor(rs.getInt("idConsultor"));
                user.setLabor(rs.getString("labor"));
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        return user;
    }
}
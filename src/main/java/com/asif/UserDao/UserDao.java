package com.asif.UserDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.asif.Connection.*;
import com.asif.Bean.User;

public class UserDao {
    private Connection connection;

    public UserDao() {
        connection = ConnectionProvider.getConnection();
    }

    public int registerUser(User user) throws SQLException {
        String query = "INSERT INTO users (name, email, password, phone_number, city, user_type) VALUES (?, ?, ?, ?, ?, ?)";

        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, user.getName());
        statement.setString(2, user.getEmail());
        statement.setString(3, user.getPassword());
        statement.setString(4, user.getPhoneNumber());
        statement.setString(5, user.getCity());
        statement.setString(6, user.getUserType());
         int i= statement.executeUpdate();
       statement.close();

        System.out.println(i +" Work Done  ");
		return i;
    }

    public User getUserByEmail(String email) throws SQLException {
        String query = "SELECT * FROM users WHERE email = ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, email);
        ResultSet resultSet = statement.executeQuery();

        User user = null;
        if (resultSet.next()) {
            user = new User(0, query, query, query, query, query, query);
            user.setId(resultSet.getInt("id"));
            user.setName(resultSet.getString("name"));
            user.setEmail(resultSet.getString("email"));
            user.setPassword(resultSet.getString("password"));
            user.setPhoneNumber(resultSet.getString("phone_number"));
            user.setCity(resultSet.getString("city"));
            user.setUserType(resultSet.getString("user_type"));
        }

        resultSet.close();
        statement.close();

        return user;
    }

    public boolean validateUser(String email, String password) throws SQLException {
        String query = "SELECT * FROM users WHERE email = ? AND password = ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, email);
        statement.setString(2, password);
        ResultSet resultSet = statement.executeQuery();

        boolean isValidUser = resultSet.next();

        resultSet.close();
        statement.close();

        return isValidUser;
    }

    public User getUserByEmailAndPassword(String email, String password) throws SQLException {
        User user = null;
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        try (Connection connection = ConnectionProvider.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, email);
            statement.setString(2, password);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    String phoneNumber = resultSet.getString("phone_number");
                    String city = resultSet.getString("city");
                    String userType = resultSet.getString("user_type");
                    user = new User(id, name, email, password, phoneNumber, city, userType);
                }
            }
        }
        return user;
    }

}


package com.example.login;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginController {

    @FXML
    private TextField tfErabiltzailea;   // erabiltzaile izena

    @FXML
    private PasswordField tfPasahitza;   // pasahitza

    @FXML
    private Button btnLogin;             // saioa hasteko botoia

    @FXML
    private Label mezua;          // mezuak erakusteko label-a

    @FXML
    private void handleLogin() {
        String username = tfErabiltzailea.getText();
        String password = tfPasahitza.getText();

        if (username.isEmpty() || password.isEmpty()) {
            mezua.setText("Mesedez, bete bi eremuak.");
            return;
        }

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT id FROM erabiltzaileak WHERE username=? AND password=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int userId = rs.getInt("id");
                messageLabel.setText("Login ondo! Erabiltzaile ID: " + userId);

                // Hemen pantaila aldaketa egin dezakezu
                // App.setRoot("mainView.fxml");
            } else {
                messageLabel.setText("Errorea: erabiltzaile edo pasahitz okerra.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            messageLabel.setText("Datu basearekin arazoa.");
        }
    }
}

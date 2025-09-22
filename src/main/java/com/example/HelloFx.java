package com.example;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;

public class HelloFx extends Application {
    @Override
    public void start(Stage stage) {
        Button btn = new Button("Hello, JavaFX@Codespaces!");
        StackPane root = new StackPane(btn);
        Scene scene = new Scene(root, 400, 300);
        stage.setTitle("JavaFX in noVNC");
        stage.setScene(scene);
        stage.show();
    }
    public static void main(String[] args) { launch(args); }
}

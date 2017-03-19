package bcit.gist8010;

import javafx.application.Application;
import javafx.event.EventHandler;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.stage.Stage;
import javafx.stage.WindowEvent;

//==============================================================================
// File         : MainStage.java
//
// Current Author: Nathan Hildebrand
//
// Previous Author: Robert Hewlett
//
// Contact Info: nathanhldbrnd@gmail.com
//
// Purpose : Create a simple javaFX application that implements ESRI Runtime mapping
// components and connects to a PostgreSQL database.
//
// Dependencies: None
//
// Modification Log :
//    --> Created 01-20-17 (nh)
//    --> Updated MMM-DD-YYYY (xx)
//
// =============================================================================

public class MainStage extends Application implements EventHandler<WindowEvent> {

    @Override
    public void start(Stage primaryStage) throws Exception {
        Parent root = FXMLLoader.load(getClass().getResource("MainStage.fxml"));
        primaryStage.setTitle("GIST 8010 module 3");
        primaryStage.getIcons().add(new Image(getClass().getResourceAsStream("/icons/Map_32x32.png")));
        primaryStage.setScene(new Scene(root, 800, 600));

        primaryStage.show();
        primaryStage.setOnCloseRequest(this);
    }

    public static void main(String[] args) {
        launch(args);
    }

    @Override
    public void handle(WindowEvent event) {
        System.exit(0);
    }
}

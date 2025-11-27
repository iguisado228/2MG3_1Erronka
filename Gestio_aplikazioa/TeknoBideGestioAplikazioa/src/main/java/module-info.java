module com.example.teknobidegestioaplikazioa {
    requires javafx.controls;
    requires javafx.fxml;


    opens com.example.teknobidegestioaplikazioa to javafx.fxml;
    exports com.example.teknobidegestioaplikazioa;
}
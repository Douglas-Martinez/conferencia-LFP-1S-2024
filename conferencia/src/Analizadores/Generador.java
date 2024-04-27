/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Analizadores;

/**
 *
 * @author Douglas
 */
public class Generador {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        generar();
    }
    
    public static void generar() {
        try {
            String ruta = "src/Analizadores/";
            
            String aFlex[] = {ruta + "Lexico.jflex", "-d", ruta};
            jflex.Main.generate(aFlex);
            
            String aCup[] = {"-destdir", ruta, "-parser", "Sintactico", ruta + "Sintactico.cup"};
            java_cup.Main.main(aCup);
            
        } catch(Exception e) {
            System.err.println(e.getMessage());
        }
    }
    
}

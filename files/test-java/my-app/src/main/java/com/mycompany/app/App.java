package com.mycompany.app;

/**
 * Hello world!
 *
 */
public class App {
    private static int a = 0;

    /**
     * @param args
     */
    public static void main(final String[] args) {
        extracted();
        System.out.println("Hello World!");
    }

    private static int extracted() {
        return a = 5;
    }

    @Override
    public String toString() {
        return "App []";
    }

    public static int getA() {
        return a;
    }

    public static void setA(final int a) {
        App.a = a;
    }

    public App() {

    }

}

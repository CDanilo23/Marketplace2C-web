/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.com.uniminuto.util;

/**
 *
 * @author cristian
 */
public class GeneradorMD5 {
    public static String getRandomPass() {
        StringBuilder sb = new StringBuilder(50);
        for (int x = 0; x < 6; x++) {
            sb.append((char) ((int) (Math.random() * 26) + 97));
        }
        return sb.toString();
    }
}

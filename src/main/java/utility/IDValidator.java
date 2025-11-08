/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utility;

/**
 *
 * @author tdgg
 */
public class IDValidator {

    public static boolean isValid(String idStr) {
        if (idStr == null || idStr.trim().isEmpty()) {
            return false;
        }
        try {
            int id = Integer.parseInt(idStr.trim());
            return id > 0;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    public static boolean isValid(int id) {
        return id > 0;
    }

    public static int parseSafe(String idStr) {
        if (isValid(idStr)) {
            return Integer.parseInt(idStr.trim());
        }
        return -1;
    }
}

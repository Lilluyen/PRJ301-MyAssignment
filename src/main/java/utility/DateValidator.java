/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utility;

import java.util.regex.Pattern;

/**
 *
 * @author tdgg
 */
public class DateValidator {

    private static final String DATE_REGEX
            = "^\\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01])$";

    public static boolean isValidSqlDate(String dateStr) {
        return Pattern.matches(DATE_REGEX, dateStr);
    }
}

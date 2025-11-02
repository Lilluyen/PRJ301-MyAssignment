package utility;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.time.*;
import java.time.temporal.*;
import java.sql.Date;

public class WeekHelper {
    public static Date getWeekStart(int offset) {
        LocalDate monday = LocalDate.now().with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY));
        monday = monday.plusWeeks(offset);
        return Date.valueOf(monday);
    }

    public static Date getWeekEnd(int offset) {
        LocalDate sunday = LocalDate.now().with(TemporalAdjusters.nextOrSame(DayOfWeek.SUNDAY));
        sunday = sunday.plusWeeks(offset);
        return Date.valueOf(sunday);
    }
}


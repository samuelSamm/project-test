package com.proyecto.web.util;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Operations {

    private Date date = new Date();
    private static StringBuilder sb;
    Calendar dateInic = Calendar.getInstance();
    Calendar dateFina = Calendar.getInstance();
    Calendar dateEval = Calendar.getInstance();
    Calendar dateEvalFin = Calendar.getInstance();
    private final ArrayList<String> a_jan = new ArrayList();
    private final ArrayList<String> a_feb = new ArrayList();
    private final ArrayList<String> a_mar = new ArrayList();
    private final ArrayList<String> a_apr = new ArrayList();
    private final ArrayList<String> a_may = new ArrayList();
    private final ArrayList<String> a_jun = new ArrayList();
    private final ArrayList<String> a_jul = new ArrayList();
    private final ArrayList<String> a_ago = new ArrayList();
    private final ArrayList<String> a_sep = new ArrayList();
    private final ArrayList<String> a_oct = new ArrayList();
    private final ArrayList<String> a_nov = new ArrayList();
    private final ArrayList<String> a_dec = new ArrayList();
    private String ls_day;
    private String ls_month = "";
    private String ls_year;
    private String s_jan = "";
    private String s_feb = "";
    private String s_mar = "";
    private String s_apr = "";
    private String s_may = "";
    private String s_jun = "";
    private String s_jul = "";
    private String s_ago = "";
    private String s_sep = "";
    private String s_oct = "";
    private String s_nov = "";
    private String s_dec = "";
    private String s_janY = "";
    private String s_febY = "";
    private String s_marY = "";
    private String s_aprY = "";
    private String s_mayY = "";
    private String s_junY = "";
    private String s_julY = "";
    private String s_agoY = "";
    private String s_sepY = "";
    private String s_octY = "";
    private String s_novY = "";
    private String s_decY = "";
    private String[] a_valDay;
    
    public void setDate(Date date) {
        this.date = date;
    }
    
    public String getDate() {
        return getFormat("yyyy-MM-dd").format(date);
    }

    public String getDateFrmt(Date date) {
        return getFormat("dd-MM-yyyy").format(date);
    }

    public String getDateFrmt2() {
        return getFormat("dd/MM/yyyy").format(date);
    }

    public String getDateFrmt3(Date date) {
        return getFormat("dd/MM/yyyy").format(date);
    }

    public String getDateFrmt4(String date) {
        String[] a_val = date.split(blankSupr("/"));

        String l_year = completeDate(a_val[2]);
        String l_month = completeDate(a_val[1]);
        String l_day = completeDate(a_val[0]);

        return l_year + "-" + l_month + "-" + l_day;
    }

    public String getNameFile(Integer s_user) {
        return String.valueOf(s_user) + '_' + getFormat("yyyyMMdd").format(date) + ".xls";
    }

    public Integer getDiffDays(Integer i_dateO, Integer i_dateI) {
        return Integer.valueOf(i_dateO.intValue() - i_dateI.intValue());
    }

    public Integer getSumDays(Integer i_dateO, Integer i_dateI) {
        return Integer.valueOf(i_dateO.intValue() + i_dateI.intValue());
    }

    public String getDateFrmt(String date) {
        String l_year = date.substring(0, 4);
        String l_month = date.substring(5, 7);
        String l_day = date.substring(8, 10);

        return l_day + "/" + l_month + "/" + l_year;
    }

    public String getDateFrmt2(String date) {
        Integer l_day = Integer.valueOf(Integer.parseInt(date.substring(0, 2)));
        Integer l_month = Integer.valueOf(Integer.parseInt(date.substring(3, 5)));
        Integer l_year = Integer.valueOf(Integer.parseInt(date.substring(6, 10)));

        return "\"" + l_day + "-" + l_month + "-" + l_year + "\"";
    }

    public String getDateFrmt3(String date) {
        String[] a_val = date.split(blankSupr("/"));

        String l_year = completeDate(a_val[2]);
        String l_month = completeDate(a_val[1]);
        String l_day = completeDate(a_val[0]);

        return l_day + "/" + l_month + "/" + l_year + ",";
    }

    public String completeDate(String s_value) {
        if (s_value.length() == 1) {
            return "0" + s_value;
        }
        return s_value;
    }

    public String getNameFull(String s_name, String s_lastF, String s_lastM) {
        return s_name.concat(" ").concat(s_lastF).concat(" ").concat(s_lastM);
    }

    public String getDateHour() {
        return getFormat("yyyy-MM-dd HH:mm:ss").format(date);
    }

    public String getDateHourNew() {
        Date d_date = new Date();
        return getFormat("yyyy-MM-dd HH:mm:ss").format(d_date);
    }

    public String getHostName() {
        String hostname = "Unknown";
        try {
            InetAddress addr = InetAddress.getLocalHost();
            hostname = addr.getHostName();
        } catch (UnknownHostException ex) {
            System.out.println("Hostname can not be resolved");
        }
        return hostname;
    }

    public int getDay() {
        return Integer.parseInt(getFormat("dd").format(date));
    }

    public String getDay(String ps_date) {
        return ps_date.substring(8, 10);
    }

    public int getMonth() {
        return Integer.parseInt(getFormat("MM").format(date));
    }

    public String getMonth(String ps_date) {
        return ps_date.substring(5, 7);
    }

    public int getYear() {
        return Integer.parseInt(getFormat("yyyy").format(date));
    }

    public int getYearVacation() {
        return Integer.parseInt(getFormat("yyyy").format(date)) - 2;
    }

    public String getYear(String ps_date) {
        return ps_date.substring(0, 4);
    }

    public DateFormat getFormat(String frmt) {
        DateFormat format = new SimpleDateFormat(frmt);
        return format;
    }

    public static String blankSupr(String data) {
        return data.trim();
    }

    public Integer getDays(String s_dateI, String s_dateO) {
        int day = 0;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            Date fechaInicial = dateFormat.parse(s_dateI);
            Date fechaFinal = dateFormat.parse(s_dateO);

            int dias = (int) ((fechaFinal.getTime() - fechaInicial.getTime()) / 86400000L);
            day = dias;
        } catch (ParseException ex) {
            Logger.getLogger(Operations.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Integer.valueOf(getWeekend(s_dateI, s_dateO, Integer.valueOf(day + 1)));
    }

    public int getWeekend(String s_dateI, String s_dateO, Integer i_days) {
        int diffDays = 0;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            Date fechaInicial = dateFormat.parse(s_dateI);
            Date fechaFinal = dateFormat.parse(s_dateO);

            Calendar fechaIni = Calendar.getInstance();
            Calendar fechaFin = Calendar.getInstance();
            fechaIni.setTime(fechaInicial);
            fechaFin.setTime(fechaFinal);
            this.dateInic = fechaIni;
            this.dateFina = fechaFin;
        } catch (ParseException ex) {
            Logger.getLogger(Operations.class.getName()).log(Level.SEVERE, null, ex);
        }
        while ((this.dateInic.before(this.dateFina)) || (this.dateInic.equals(this.dateFina))) {
            if ((this.dateInic.get(7) == 1) || (this.dateInic.get(7) == 7)) {
                diffDays++;
            }
            this.dateInic.add(5, 1);
        }
        return i_days.intValue() - diffDays;
    }

    public String dateIn(String s_value) {
        String[] a_val = s_value.split(blankSupr(","));

        return a_val[0];
    }

    public String dateOu(String s_value) {
        String[] a_val = s_value.split(blankSupr(","));

        return a_val[(a_val.length - 1)];
    }

    public Integer dayRequested(String s_value) {
        String[] a_val = s_value.split(blankSupr(","));

        return Integer.valueOf(a_val.length);
    }

    public String getDays(String s_value) {
        String[] a_val = s_value.split(blankSupr(","));
        String s_data = "";
        for (String a_val1 : a_val) {
            s_data = s_data.concat(getDateFrmt3(a_val1));
        }
        return blankSupr(s_data.substring(0, s_data.length() - 1));
    }

    public String getDayDate(ArrayList<String> a_value) {
        for (int x = 0; x < a_value.size(); x++) {
            this.a_valDay = ((String) a_value.get(x)).split(blankSupr("/"));
            if (!this.ls_month.equals(this.a_valDay[1])) {
                this.ls_day = "";
            }
            if (this.ls_day.isEmpty()) {
                this.ls_day = this.a_valDay[0].concat(",");
            } else {
                this.ls_day = this.ls_day.concat(this.a_valDay[0]).concat(",");
            }
            this.ls_month = this.a_valDay[1];
        }
        return blankSupr(this.ls_day.substring(0, this.ls_day.length() - 1));
    }

    public String getYearDate(ArrayList<String> a_value) {
        for (int x = 0; x < a_value.size(); x++) {
            this.a_valDay = ((String) a_value.get(x)).split(blankSupr("/"));
            this.ls_year = this.a_valDay[2];
        }
        return blankSupr(this.ls_year);
    }

    public void executeCmd(String s_command) {
        try {
            Process p = Runtime.getRuntime().exec(s_command);
            p.waitFor();
        } catch (IOException e) {
            e.getMessage();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    public String generatePass() {
        try {
            String[] symbols = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"};
            int length = 8;
            Random random = SecureRandom.getInstanceStrong();
            sb = new StringBuilder(length);
            for (int i = 0; i < length; i++) {
                int indexRandom = random.nextInt(symbols.length);
                sb.append(symbols[indexRandom]);
            }
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(Operations.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sb.toString();
    }
    
}

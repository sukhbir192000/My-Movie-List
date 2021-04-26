package utils;

import java.awt.Font;
import java.util.Collections;
import java.util.List;
import java.util.Properties;
import java.util.stream.Collectors;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.apache.commons.lang3.RandomStringUtils;
import java.io.IOException;
import java.util.Properties;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.mail.*;
import javax.mail.internet.*;



public class sendEmail {

    public static String mailPassword(String recipient) throws Exception {
        String tempPass = generateCommonLangPassword();
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.port", "587");

        String email = "mymovielist.MML@gmail.com";
        String password = "misp12345";
        Session ses = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(email, password);
            }
        });

        Message mess = prepMessage(ses, email, recipient, tempPass);
        Transport.send(mess);
        return tempPass;
    }
    
    public static void mailContactUsQuery(String email, String subject, String message){
        if(!message.equals(null)){
                Properties properties = new Properties();
                properties.put("mail.smtp.auth", "true");
                properties.put("mail.smtp.host", "smtp.gmail.com");
                properties.put("mail.smtp.starttls.enable", "true");
                properties.put("mail.smtp.port", "587");

                String email_mine = "mymovielist.MML@gmail.com";
                String password_mine = "misp12345";
                Session ses = Session.getInstance(properties, new Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(email_mine, password_mine);
                    }
                });
                try{
                    Message mess = new MimeMessage(ses);
                    mess.setFrom(new InternetAddress(email, email));
                    mess.setRecipient(Message.RecipientType.TO, new InternetAddress(email_mine));
                    mess.setSubject(subject);
                    mess.setText(message);
                    Transport.send(mess);
                }
                catch(Exception e) {
                    e.printStackTrace();
                }
        }
    }

    private static Message prepMessage(Session ses, String email, String recipient, String tempPass) throws Exception {

        Message mess = new MimeMessage(ses);
        mess.setFrom(new InternetAddress(email));
        mess.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
        mess.setSubject("My Movie List - Temporary Password");
        mess.setText("This email contains a temporary password to login to your My Movie List Account.\n\nPlease change your password after logging in. Your temporary password is: " + tempPass);
        return mess;
    }

    public static String generateCommonLangPassword() {
        String upperCaseLetters = RandomStringUtils.random(2, 65, 90, true, true);
        String lowerCaseLetters = RandomStringUtils.random(2, 97, 122, true, true);
        String numbers = RandomStringUtils.randomNumeric(4);
        String specialChar = RandomStringUtils.random(2, 33, 47, false, false);
        String totalChars = RandomStringUtils.randomAlphanumeric(2);
        String combinedChars = upperCaseLetters.concat(lowerCaseLetters)
                .concat(numbers)
                .concat(specialChar)
                .concat(totalChars);
        List<Character> pwdChars = combinedChars.chars()
                .mapToObj(c -> (char) c)
                .collect(Collectors.toList());
        Collections.shuffle(pwdChars);
        String password = pwdChars.stream()
                .collect(StringBuilder::new, StringBuilder::append, StringBuilder::append)
                .toString();
        return password;
    }
}

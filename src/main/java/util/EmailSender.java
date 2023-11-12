package util;

import entities.CartRow;
import model.CartEntityDAO;
import services.Courier;
import services.SendService;
import models.SendEnhancedRequestBody;
import models.SendEnhancedResponseBody;
import models.SendRequestMessage;
import com.google.gson.Gson;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import entities.UserEntity;

public class EmailSender {
    public static void sendAccountConfirmationEmail(UserEntity user) {
        Courier.init("pk_prod_NN1TZXNX1P45T5JZP61VWN8B0JY2");

        SendEnhancedRequestBody request = new SendEnhancedRequestBody();
        SendRequestMessage message = new SendRequestMessage();

        HashMap<String, String> to = new HashMap<String, String>();
        to.put("email",user.getUserMail());
        message.setTo(to);
        message.setTemplate("YXG0MZM41J4M2MJKAG5S7FCVPQ75");

        HashMap<String, Object> data = new HashMap<String, Object>();
        data.put("userName", user.getUserName());
        message.setData(data);

        request.setMessage(message);
        try {
            SendEnhancedResponseBody response = new SendService().sendEnhancedMessage(request);
            System.out.println(response);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void sendOrderConfirmationEmail(UserEntity user) {
        CartEntityDAO cartDAO = new CartEntityDAO(user.getUserId());
        List<CartRow> cart = cartDAO.getAllCartRows();

        String res ="\nNom du produit \t \tQuantité \t \tPrix total\n";     //TODO gérer le problème d'affichage
        double totalPrice = 0;
        for (CartRow cartRow: cart) {
            res = res + cartRow.getName() + " \t \t" + cartRow.getQuantity() + " \t \t" + cartRow.getPrice()*cartRow.getQuantity() + " euros\n";
            totalPrice += cartRow.getPrice()*cartRow.getQuantity();
        }

        Courier.init("pk_prod_NN1TZXNX1P45T5JZP61VWN8B0JY2");

        SendEnhancedRequestBody request = new SendEnhancedRequestBody();
        SendRequestMessage message = new SendRequestMessage();

        HashMap<String, String> to = new HashMap<String, String>();
        to.put("email",user.getUserMail());
        message.setTo(to);
        message.setTemplate("2RCCS4KFKSMWMEG68DCTJ8DPGDKY");

        HashMap<String, Object> data = new HashMap<String, Object>();
        data.put("userName", user.getUserName());
        data.put("userAddress",user.getUserAddress());
        data.put("orderId","");       //TODO SI on crée une table order
        data.put("orderDate",(new Date()).toString());
        data.put("orderPrice",""+totalPrice+" euros");
        data.put("orderItems",res);
        message.setData(data);

        request.setMessage(message);
        try {
            SendEnhancedResponseBody response = new SendService().sendEnhancedMessage(request);
            System.out.println(response);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void sendContactForm(
            String name,
            String email,
            String objectMessage,
            String typeMessage,
            String message
    ) {

        Courier.init("pk_prod_NN1TZXNX1P45T5JZP61VWN8B0JY2");

        SendEnhancedRequestBody request = new SendEnhancedRequestBody();
        SendRequestMessage messageRequest = new SendRequestMessage();

        HashMap<String, String> to = new HashMap<String, String>();
        to.put("email","barreromai@cy-tech.fr");
        messageRequest.setTo(to);
        messageRequest.setTemplate("TX3XN3C3PKM74CMMGJMQ853KG8SX");

        HashMap<String, Object> data = new HashMap<String, Object>();
        data.put("nameUser", name);
        data.put("emailUser",email);
        data.put("subject", objectMessage);
        data.put("typeMessage", typeMessage);
        data.put("message", message);
        messageRequest.setData(data);

        request.setMessage(messageRequest);
        try {
            SendEnhancedResponseBody response = new SendService().sendEnhancedMessage(request);
            System.out.println(response);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        UserEntity user = new UserEntity();
        user.setUserAddress("123 rue des ...");
        user.setUserMail("guillotluc@cy-tech.fr");
        user.setUserName("Lucas G");
        sendAccountConfirmationEmail(user);
        sendOrderConfirmationEmail(user);
    }
}
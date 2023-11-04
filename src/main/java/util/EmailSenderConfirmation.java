package util;

import services.Courier;
import services.SendService;
import models.SendEnhancedRequestBody;
import models.SendEnhancedResponseBody;
import models.SendRequestMessage;
import java.io.IOException;
import java.util.HashMap;

import entities.UserEntity;

public class EmailSenderConfirmation {
	public static void sendAccountConfirmationEmail(UserEntity user) {
		Courier.init("pk_prod_NN1TZXNX1P45T5JZP61VWN8B0JY2");

		SendEnhancedRequestBody request = new SendEnhancedRequestBody();
		SendRequestMessage message = new SendRequestMessage();

		HashMap<String, String> to = new HashMap<String, String>();
		to.put("email", user.getUserMail());
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
}
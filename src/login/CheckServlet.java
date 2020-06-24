package login;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CheckServlet")
public class CheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private static int width = 60;
    private static int height = 20;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		response.setContentType("image/jpeg");
		ServletOutputStream sos =response.getOutputStream();
		response.setHeader("Fragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics();
		char[] rands = generateCheckCode();
		
		drawBackground(g);
		drawRands(g,rands);
		g.dispose();
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		ImageIO.write(image, "JPEG",bos);
		byte[] buf = bos.toByteArray();
		response.setContentLength(buf.length);
		sos.write(buf);
		bos.close();
		sos.close();
		session.setAttribute("check_code", new String(rands));		
	}
	
	private char[] generateCheckCode(){
		String chars = "0123456789QWERTYUIOPASDFGHJKLZXCVBNM";
		char[] rands =new char[4];
		for(int i=0; i<4; i++){
			int rand = (int)(Math.random()*36);
			rands[i] = chars.charAt(rand);
		}
		return rands;
	}
	
	private void drawRands(Graphics g, char[] rands){
		g.setColor(Color.BLACK);
		g.setFont(new Font(null,Font.ITALIC|Font.BOLD,18));
		g.drawString(""+rands[0], 1, 17);
		g.drawString(""+rands[1], 16,15);
		g.drawString(""+rands[2], 31,18);
		g.drawString(""+rands[3], 46, 16);
		
	}
	
	private void drawBackground(Graphics g){
		g.setColor(new Color(0xDCDCDC));
		g.fillRect(0, 0, width, height);
		for(int i=0; i<120; i++){
			int x = (int)(Math.random()*width);
			int y = (int)(Math.random()*height);
			int red = (int)(Math.random()*255);
			int green = (int)(Math.random()*255);
			int blue = (int)(Math.random()*255);
			g.setColor(new Color(red,green,blue));
			g.drawOval(x, y, 1, 0);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			doGet(request, response);
		}
	
}

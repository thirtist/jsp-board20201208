package mvc.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import mvc.command.NullHandler;

/**
 * Servlet implementation class ControllerUsingURI
 */
//어노테이션 말고 web.xml에서 등록
public class ControllerUsingURI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String prefix = "/WEB-INF/view/";
	private String suffix = ".jsp";
	private Map<String, CommandHandler> map;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControllerUsingURI() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public void init() throws ServletException {
		map = new HashMap<>();
		
		ServletConfig config = getServletConfig();
		String configFilePath = config.getInitParameter("configFile").trim();
		
		// if문으로 요청에대한 handler작동을 수동작성하지말고 WEB-INF에 commandHandlerURI.properties파일을
		// FileReader로 읽어서 처리
		ServletContext application = getServletContext();
		String filePath = application.getRealPath(configFilePath);

		try (FileReader fr = new FileReader(filePath)) {
			Properties properties = new Properties();
			properties.load(fr);

			Set<Object> keys = properties.keySet();

			for (Object key : keys) {
				Object value = properties.get(key);
				String className = (String) value;

				try {
					Class c = Class.forName(className);
					Object o = c.newInstance();
					CommandHandler handler = (CommandHandler) o;
					map.put((String) key, handler);
				} catch (Exception e) {
					e.printStackTrace();
					// TODO: handle exception
				}

			}

		} catch (Exception e2) {
			e2.printStackTrace();
		}

		/*
		 * properties파일이 잘 불러와지는지 확인용 int b = 0;
		 * 
		 * while ((b= fr.read()) != -1 ) { System.out.print((char)b); }
		 */

		// 위에걸로 대체됨
//		if (command.equals("/join.do")) {
//			handler = new JoinHandler();
//		} else if (command.equals("/login.do")) {
//			handler = new LoginHandler();
//		} else if (command.equals("/login.do")) {
//			handler = new LogouHandler();
//		} else {
//			handler = new NullHandler();
//		}

		//

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	protected void process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// doGet메소드, doPost메소드 모두 실행할 메소드를 만듦

		//
		String uri = request.getRequestURI(); // request로부터 uri를 얻을 수 있음 = 이건 ContextPath가 포함된 값
//		System.out.println(uri);
		String root = request.getContextPath(); // 위에서 ContextPath를 빼고 싶기때문에 패스를 얻어서 삭제
//		System.out.println(root);

		String command = "";
		if (uri.startsWith(root)) {
			command = uri.substring(root.length());
		}
//		System.out.println(command);

		CommandHandler handler = map.get(command);

		if (handler == null) {
			handler = new NullHandler();
		}


		
		// NullHandler

		String view = null;
		try {
			view = handler.process(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher(prefix + view + suffix).forward(request, response);
		//

	}

}

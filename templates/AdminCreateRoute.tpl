package Controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Index
 */
@WebServlet("/{{class_name}}")
public class {{class_name}} extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public {{class_name}}() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = 0;

		try
		{
			id = Integer.parseInt(request.getParameter("id"));
			boolean submitButtonPressed = request.getParameter("submit") != null;

			if(submitButtonPressed)
			{
				{{entity}} entry = new {{entity}}();

				entry.set{{pascal_primary_key}}(id);
				{% for name, details in insert_columns.items() %}
				entry.set{{details.pascal}}(request.getAttribute("{{name}}"));{% endfor %}

				{{entity}}Dao dao = new {{entity}}Dao();
				dao.insert(entry);

				response.sendRedirect("AdminTruc");
			}
		} 
		catch (NumberFormatException ex)
		{
			id = 0;
		}

		{{entity}}Dao model = new {{entity}}Dao();
		ArrayList<{{entity}}> records = model.getPage(page);

		request.setParameter("records", records);
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* RIEN */
	}

}

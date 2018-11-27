package myBlog;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "MainServlet")
public class MainServlet extends HttpServlet {
    static final String HTML_FORM = "<html><head><title>MyBlog</title></head><body>%s</body></html>";

    static final List<Article> articleList = new ArrayList<>();
    static {
        articleList.add(new Article("First empty article", "autogenerated", ""));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("do");
        User user = (User)request.getSession().getAttribute("user");
        String username = user.getName();
        String userRole = user.getRole();

        if(action.equals("viewlist")) {
            sortArticlesByDate();
            request.setAttribute("articles", articleList);
            request.getRequestDispatcher("/ArticlesList.jsp").forward(request,response);
        }
        if(action.equals("edit")) {
            long articleDate = Long.parseLong(request.getParameter("date"));
            Article currentArticle = searchArticleByDate(articleDate);
            User currentUser = (User)request.getSession().getAttribute("user");
            request.setAttribute("article", currentArticle);
            request.setAttribute("editing", isEditPossible(currentUser,currentArticle));
            request.getRequestDispatcher("/EditArticle.jsp").forward(request,response);
        }
        if(action.equals("new")) {
            request.getRequestDispatcher("/NewArticle.jsp").forward(request,response);
        }
        if(action.equals("savenew")) {
            newArticle(request);
            request.getRequestDispatcher("/Wellcome.jsp").forward(request,response);
        }
        if(action.equals("saveedit")) {
            deleteArticle(request);
            newArticle(request);
            request.getRequestDispatcher("/Wellcome.jsp").forward(request,response);
        }
        if(action.equals("delete")) {
            deleteArticle(request);
            request.getRequestDispatcher("/Wellcome.jsp").forward(request,response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long articleDate = Long.parseLong(request.getParameter("date"));
        Article currentArticle = searchArticleByDate(articleDate);
        request.setAttribute("article", currentArticle);
        request.getRequestDispatcher("/ReadArticle.jsp").forward(request,response);


    }

    private void newArticle(HttpServletRequest request) {
        long time = System.currentTimeMillis();
        String title = request.getParameter("title");
        String author = request.getParameter("name");
        String article = request.getParameter("article");
        articleList.add(new Article(title, author, article));
    }

    private void deleteArticle (HttpServletRequest request) {
        long date = Long.parseLong(request.getParameter("date"));
        Article article = searchArticleByDate(date);
        articleList.remove(article);
    }

    private void sortArticlesByDate(){
        Collections.sort(articleList, (a, b) -> Long.compare(a.getDate(),b.getDate()));
    }

    private Article searchArticleByDate (long date) {
        for (Article article:articleList) {
            if (date == article.getDate()) {
                return article;
            }
        }
        return null;
    }

    private boolean isEditPossible (User user, Article article) {
        if(user.getRole().equals("admin")){
            return true;
        }
        if(user.getName().equals(article.getAuthor())){
            return true;
        }
        return false;
    }
}
package myBlog;

public class Article {
    private String name;
    private long date;
    private String author;
    private String articleText;

    public Article(String name, String author, String articleText) {
        this.name = name;
        this.date = System.currentTimeMillis();
        this.author = author;
        this.articleText = articleText;
    }

    public Article() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getDate() {
        return date;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getArticleText() {
        return articleText;
    }

    public void setArticleText(String articleText) {
        this.articleText = articleText;
    }
}

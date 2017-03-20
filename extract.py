from newspaper import Article, Config
from lxml.etree import tostring

config = Config()
config.keep_article_html = True

def extract(url):
    article = Article(url=url, config=config)
    article.download()
    article.parse()
    return dict(
            title=article.title,
            text=article.text,
            html=article.html,
            image=article.top_image,
            top=article.clean_top_node,
            authors=article.authors,
            )

if __name__ == '__main__':
    if len(sys.argv) < 2 :
        print("Usage : %s url" % (sys.argv[0]))
        sys.exit(1)

    a = extract(sys.argv[1])
    print(tostring(a['top']))

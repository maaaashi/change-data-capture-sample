```bash
docker compose up
```

```json
# mappingの登録
PUT /blog_posts
{
  "mappings": {
    "properties": {
      "title": { "type": "text" },
      "summary": { "type": "text" },
      "tags": { "type": "keyword" }
    }
  }
}

# データの登録
POST /blog_posts/_doc/1
{
  "title": "Elasticsearchの基本",
  "summary": "Elasticsearchの基本的な使い方について説明します。",
  "tags": ["Elasticsearch", "検索エンジン", "基本"]
}

POST /blog_posts/_doc/2
{
  "title": "高度なElasticsearchの使い方",
  "summary": "Elasticsearchの高度な機能について掘り下げていきます。",
  "tags": ["Elasticsearch", "高度"]
}

# タグ検索
GET /blog_posts/_search
{
  "query": {
    "term": {
      "tags": "基本"
    }
  }
}

# タグかつ部分検索
GET /blog_posts/_search
{
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "tags": "Elasticsearch"
          }
        },
        {
          "match": {
            "summary": "基本的な使い方"
          }
        }
      ]
    }
  }
}

# 検索式
GET /blog_posts/_search
{
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "tags": "Elasticsearch"
          }
        },
        {
          "query_string": {
            "default_field": "summary",
            "query": "+基本的な使い方 -高度な"
          }
        }
      ]
    }
  }
}


```
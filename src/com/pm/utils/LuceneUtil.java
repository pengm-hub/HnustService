package com.pm.utils;

import com.opencsv.CSVReader;
import com.pm.po.WebApi;
import org.apache.commons.io.FileUtils;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.*;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.junit.Test;
import org.wltea.analyzer.lucene.IKAnalyzer;

import java.io.*;
import java.util.*;

/**
 * lucene 工具类
 * @author pengmi
 */
public class LuceneUtil {

    private final String projectPath = this.getClass().getClassLoader().getResource("").getPath();

//    @Test
//    public void excelToLucene() throws Exception {
//        List<Map<String,String>> excelList = new ArrayList<>();
//        CSVReader csvReader = new CSVReader(new FileReader(projectPath+"webapi/webapi.csv"));
//        List<String> useTitles = new ArrayList<>();
//        useTitles.add("api_name");
//        useTitles.add("category");
//        useTitles.add("description");
//        useTitles.add("api_endpoint");
//        useTitles.add("secondary_categories");
//        useTitles.add("architectural_style");
//        String[] titles = csvReader.readNext(); //读取到第一行 是小标题
//        while (true){
//            String[] content = csvReader.readNext();
//            if(content==null) break;
//            Map<String, String> tmp = new HashMap<>();
//            for (int i = 0; i < titles.length; i++) {
//                if(!useTitles.contains(titles[i])) continue;
//                tmp.put(titles[i],content[i]);
////                System.out.println("title:"+titles[i]+" value:"+content[i]);
//            }
//            excelList.add(tmp);
//        }
//        System.out.println("excelToLucene() finished!");
//        createIndexByName(excelList, projectPath+"webapi");
//    }
//
    @Test
    public void testSearch() throws Exception {
        List<String> useTitles = new ArrayList<>();
        useTitles.add("api_name");
        useTitles.add("category");
        useTitles.add("description");
        useTitles.add("api_endpoint");
        useTitles.add("secondary_categories");
        useTitles.add("architectural_style");
        Set keySet = new HashSet(useTitles);
        searchByQuey("google", projectPath+"webapi", keySet);
    }
//
//    @Test
//    public void excelToLuceneMahup() throws Exception {
//        List<Map<String,String>> excelList = new ArrayList<>();
//        CSVReader csvReader = new CSVReader(new FileReader(projectPath+"mashup/mashup.csv"));
//        String[] titles = csvReader.readNext(); //读取到第一行 是小标题
//        while (true){
//            String[] content = csvReader.readNext();
//            if(content==null) break;
//            Map<String, String> tmp = new HashMap<>();
//            for (int i = 0; i < titles.length; i++) {
//                tmp.put(titles[i],content[i]);
//            }
//            excelList.add(tmp);
//        }
//        System.out.println("excelToLuceneMahup() finished!");
//        createIndexByName(excelList, projectPath+"mashup");
//    }
//
//    @Test
//    public void testSearchMahup() throws Exception {
//        List<String> useTitles = new ArrayList<>();
//        useTitles.add("mashup_name");
//        useTitles.add("mashup_tags");
//        useTitles.add("mashup_apis");
//        Set keySet = new HashSet(useTitles);
//        searchByQuey("google", projectPath+"mashup", keySet);
//    }

    public static void createIndexByName(List<Map<String,String>> object, String filepath) throws Exception {

        // 创建文档的集合
        Collection<Document> docs = new ArrayList<>();
        System.out.println(object.get(0).keySet().size());
        for (int i = 0; i < object.size(); i++) {
            //1 创建文档对象
            Document document = new Document();
            Set keySet = object.get(i).keySet();
            for(Object key: keySet){
                String value = object.get(i).get(key);
                // 创建并添加字段信息。参数：字段的名称、字段的值、是否存储，这里选Store.YES代表存储到文档列表。Store.NO代表不存储
                document.add(new TextField(key.toString(),value,Field.Store.YES));
            }
            docs.add(document);
        }
        System.out.println("docs finished!");
        //2 索引目录类,指定索引在硬盘中的位置
        File file = new File(filepath);
        if(!file.exists()) file.mkdir();
        Directory directory = FSDirectory.open(new File(filepath));
        //3 创建分词器对象
        Analyzer analyzer = new IKAnalyzer();
        //4 索引写出工具的配置对象
        IndexWriterConfig conf = new IndexWriterConfig(Version.LATEST, analyzer);
        // 设置打开方式：OpenMode.APPEND 会在索引库的基础上追加新索引。OpenMode.CREATE会先清空原来数据，再提交新的索引
        conf.setOpenMode(IndexWriterConfig.OpenMode.CREATE);
        //5 创建索引的写出工具类。参数：索引的目录和配置信息
        IndexWriter indexWriter = new IndexWriter(directory, conf);
        //6 把文档交给IndexWriter
        indexWriter.addDocuments(docs);
        //7 提交
        indexWriter.commit();
        //8 关闭
        indexWriter.close();
        System.out.println("creating index finished!");
    }

    public static List<Map<String,String>> searchByQuey(String queryStr, String filepath, Set querySet) throws Exception {
        List<Map<String,String>> resList = new ArrayList<>();

        // 索引目录对象
        Directory directory = FSDirectory.open(new File(filepath));
        // 索引读取工具
        IndexReader reader = DirectoryReader.open(directory);
        // 索引搜索工具
        IndexSearcher searcher = new IndexSearcher(reader);
        // 创建查询解析器,两个参数：默认要查询的字段的名称，分词器
        //QueryParser parser = new QueryParser("title", new IKAnalyzer());
        MultiFieldQueryParser multiFieldQueryParser = new MultiFieldQueryParser((String[]) querySet.toArray(new String[querySet.size()]),new IKAnalyzer());
        // 创建查询对象
        Query query = multiFieldQueryParser.parse(queryStr);

        // 搜索数据,两个参数：查询条件对象要查询的最大结果条数
        // 返回的结果是 按照匹配度排名得分前N名的文档信息（包含查询到的总条数信息、所有符合条件的文档的编号信息）。
        TopDocs topDocs = searcher.search(query, 10);
        // 获取总条数
        System.out.println("本次搜索共找到" + topDocs.totalHits + "条数据");
        // 获取得分文档对象（ScoreDoc）数组.SocreDoc中包含：文档的编号、文档的得分
        ScoreDoc[] scoreDocs = topDocs.scoreDocs;
        for (ScoreDoc scoreDoc : scoreDocs) {
            // 取出文档编号
            int docID = scoreDoc.doc;
            // 根据编号去找文档
//            Document doc = reader.document(docID);
//            List<IndexableField> keySet = doc.getFields();
            Map<String, String> tmp = new HashMap<>();
//            for(Object key : keySet){
//                String value = doc.get(key.toString());
//                tmp.put(key.toString(), value);
//            }
            // 取出文档得分
            tmp.put("id",String.valueOf(docID));
            tmp.put("score",String.valueOf(scoreDoc.score));
            System.out.println(tmp);
            resList.add(tmp);
        }
        return resList;
    }

//    @Test
//    public void testCreate(List<Map<String,String>> object, String filepath) throws Exception {
//        // 创建文档的集合
//        Collection<Document> docs = new ArrayList<>();
//
//        for (int i = 0; i < object.size(); i++) {
//            //1 创建文档对象
//            Document document = new Document();
//            Set keySet = object.get(i).keySet();
//            for(Object key: keySet){
//                String value = object.get(i).get(key);
//                // 创建并添加字段信息。参数：字段的名称、字段的值、是否存储，这里选Store.YES代表存储到文档列表。Store.NO代表不存储
//                document.add(new TextField(key.toString(),value,Field.Store.YES));
//            }
//            docs.add(document);
//        }
//
//        //2 索引目录类,指定索引在硬盘中的位置
//        File file = new File(projectPath+filepath);
//        if(!file.exists()) file.mkdir();
//        Directory directory = FSDirectory.open(new File(projectPath+filepath));
//        //3 创建分词器对象
//        Analyzer analyzer = new IKAnalyzer();
//        //4 索引写出工具的配置对象
//        IndexWriterConfig conf = new IndexWriterConfig(Version.LATEST, analyzer);
//        // 设置打开方式：OpenMode.APPEND 会在索引库的基础上追加新索引。OpenMode.CREATE会先清空原来数据，再提交新的索引
//        conf.setOpenMode(IndexWriterConfig.OpenMode.CREATE);
//        //5 创建索引的写出工具类。参数：索引的目录和配置信息
//        IndexWriter indexWriter = new IndexWriter(directory, conf);
//        //6 把文档交给IndexWriter
//        indexWriter.addDocuments(docs);
//        //7 提交
//        indexWriter.commit();
//        //8 关闭
//        indexWriter.close();
//    }
//
//    /**
//     * 1 创建读取目录对象
//     * 2 创建索引读取工具
//     * 3 创建索引搜索工具
//     * 4 创建查询解析器
//     * 5 创建查询对象
//     * 6 搜索数据
//     * 7 各种操作
//     * @throws Exception
//     */
//    @Test
//    public List<Map<String,String>> testSearch(String queryStr, String filepath, Set querySet) throws Exception {
//        List<Map<String,String>> resList = new ArrayList<Map<String,String>>();
//
//        // 索引目录对象
//        Directory directory = FSDirectory.open(new File(projectPath+filepath));
//        // 索引读取工具
//        IndexReader reader = DirectoryReader.open(directory);
//        // 索引搜索工具
//        IndexSearcher searcher = new IndexSearcher(reader);
//        // 创建查询解析器,两个参数：默认要查询的字段的名称，分词器
//        //QueryParser parser = new QueryParser("title", new IKAnalyzer());
//        MultiFieldQueryParser multiFieldQueryParser = new MultiFieldQueryParser((String[]) querySet.toArray(new String[querySet.size()]),new IKAnalyzer());
//        // 创建查询对象
//        Query query = multiFieldQueryParser.parse(queryStr);
//
//        // 搜索数据,两个参数：查询条件对象要查询的最大结果条数
//        // 返回的结果是 按照匹配度排名得分前N名的文档信息（包含查询到的总条数信息、所有符合条件的文档的编号信息）。
//        TopDocs topDocs = searcher.search(query, 100);
//        // 获取总条数
//        System.out.println("本次搜索共找到" + topDocs.totalHits + "条数据");
//        // 获取得分文档对象（ScoreDoc）数组.SocreDoc中包含：文档的编号、文档的得分
//        ScoreDoc[] scoreDocs = topDocs.scoreDocs;
//        for (ScoreDoc scoreDoc : scoreDocs) {
//            // 取出文档编号
//            int docID = scoreDoc.doc;
//            // 根据编号去找文档
//            Document doc = reader.document(docID);
//            List<IndexableField> keySet = doc.getFields();
//            Map<String, String> tmp = new HashMap<>();
//            for(Object key : keySet){
//                String value = doc.get(key.toString());
//                tmp.put(key.toString(), value);
//            }
//            // 取出文档得分
//            tmp.put("score",String.valueOf(scoreDoc.score));
//            System.out.println(tmp);
//            resList.add(tmp);
//        }
//        return resList;
//    }
//
//    @Test
//    public void getPath(){
//        System.out.println(this.getClass().getClassLoader().getResource("").getPath());
//    }
}

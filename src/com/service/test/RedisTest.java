package com.service.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class RedisTest {

    public void redisTester(){
        Jedis jedis = new Jedis("localhost", 6379, 100000);
        int i=0;
        try {
            long start = System.currentTimeMillis();
            while (true){
                long end = System.currentTimeMillis();
                if(end - start >= 1000) break;
                i++;
                jedis.set("test"+i, i+" ");
            }
        }finally {
            jedis.close();
        }
        System.out.println("redis每秒操作：" + i +" 次");
    }

    public void redisPoolTester(){
        //定义redis连接池
        JedisPool jedisPool = null;
        //定义redis实例
        Jedis jedis = null;
        try {
            //映射redis配置文件
            ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:/spring/applicationContext-Redis.xml");
            //获取redis连接池
            jedisPool = (JedisPool) applicationContext.getBean("jedisPool");
            //获取redis实例
            jedis = jedisPool.getResource();
            //存值
            jedis.set("name","pm");
            //取值
            String name = jedis.get("name");
            //输出到控制台
            System.out.println(name);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if(jedis != null) jedis.close();
            if(jedisPool != null) jedisPool.close();
        }
    }

    public static void main(String args[]){
        RedisTest test = new RedisTest();
        //test.redisTester();
        test.redisPoolTester();
    }
}

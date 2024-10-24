package com.ms.diancan.utils;

import java.util.Random;
import java.util.UUID;

/**
 * @author ms_miao
 * @createTime 2020-03-19 21:39
 */
public class UUIDUtils {

    public static String getUUID() {
        return UUID.randomUUID().toString().replace("-", "")+UUID.randomUUID().toString().replace("-","");
    }

    public static String findkeyUtil() {
        String str="ABCDEFGHIJKLMNOPQRSTUVWXYZqwertyuiopasdfghjklzxcvbnm0123456789";
        StringBuilder st=new StringBuilder(4);
        for(int i=0;i<4;i++){
            char ch=str.charAt(new Random().nextInt(str.length()));
            st.append(ch);
        }
        String findkey=st.toString().toLowerCase();
        System.out.println("生成找回的key为："+st.toString());
        return findkey;
    }

    /**
     * 生成15位的UUID
     * @return
     */
    public static String getUUID15() {
        String uuid = UUID.randomUUID().toString().replace("-", "") + UUID.randomUUID().toString().replace("-", "");
        return uuid.substring(0, 15);
    }



    public static void main(String[] args) {

        String uuid = UUIDUtils.getUUID15();
        String s = UUIDUtils.findkeyUtil();

        System.out.println(uuid);
        System.out.println(s);
    }
}

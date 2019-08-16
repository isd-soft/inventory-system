package com.company;

/**
 * Created by Dan on 30.03.2016.
 */

import java.util.Random;

public class CodeGenerator {

    public static String generateCode() {

        char[] chars = "0123456789".toCharArray();
        StringBuilder sb = new StringBuilder();

        Random random = new Random();
        for (int i = 0; i < 5; i++) {
            char c = chars[random.nextInt(chars.length)];
            sb.append(c);
        }
        String output = sb.toString();
        return output;
    }


}

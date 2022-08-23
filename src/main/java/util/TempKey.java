package util;

import java.util.Random;

public class TempKey {
    private int size;

    public String getKey(int size) {
        this.size = size;
        return MakeRandomKey();
    }


    private String MakeRandomKey() {
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        int num = 0;
        do {
            num = random.nextInt(75)+48;
            if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {

                sb.append((char) num);
            } else {
                continue;
            }
        } while (sb.length() <= size);

        return sb.toString();
    }

}

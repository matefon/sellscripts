import static java.lang.System.*;
import java.util.Scanner;
import java.io.IOException;
import java.io.File;

public class randomStatCounter {
    public static void main(String args[])
        throws IOException {
            String filePath = "randomStat.txt";
            int howMany = 10,howManyNum = howMany,pcsNum,readNum,sumNum = 0;
            boolean hasNext;
            for (int i = 1 ; i <= howManyNum ; i++) {
                //out.println(i);
                //cls.main();
                Scanner fileScan = new Scanner(new File(filePath));
                pcsNum = 0;
                do {
                    readNum = fileScan.nextInt();
                    if (readNum == i) {
                        pcsNum++;
                    }
                    hasNext = fileScan.hasNext();
                } while (hasNext == true);
                out.println("Number of " + i + ": " + pcsNum);
                sumNum += pcsNum;
            }
            out.println("The sum is: " + sumNum);
    }
}
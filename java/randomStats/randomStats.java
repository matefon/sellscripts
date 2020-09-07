import static java.lang.System.*;
import java.util.Random;
import java.util.Scanner;
import java.io.PrintWriter;
import java.io.IOException;
import java.io.File;

public class randomStats_10000 {
    static int maxNum = 10; //change if you want to generate in another scale
    static int forNumber = 100000; //change this if you want to generate more/less numbers
    public static void main(String args[])
        throws IOException {
        String filePath = "randomStat.txt";
        int rnd = 0;

        Random rand = new Random();
        PrintWriter writer = new PrintWriter(filePath, "UTF-8");

        for (int i=0 ; i < forNumber ; i++) {
            rnd = rand.nextInt(maxNum)+1;
            writer.println(rnd);
        }
        writer.close();
        printNumStat();
    }
    public static void printNumStat() 
        throws IOException {
        randomStats_10000.printStats();
    }
    public static void printStats()
        throws IOException {
            String filePath = "randomStat.txt";
            int howManyNum = maxNum,pcsNum,readNum,sumNum = 0;
            boolean hasNext;
            for (int i = 1 ; i <= howManyNum ; i++) {
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
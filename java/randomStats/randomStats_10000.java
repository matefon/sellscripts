//import static java.lang.System.*;
import java.util.Random;
import java.io.PrintWriter;
import java.io.IOException;

public class randomStats_10000 {
    public static void main(String args[])
        throws IOException {
        int forNumber = 100000;
        String filePath = "randomStat.txt";
        int rnd = 0;
        int maxNum = 10;

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
        randomStatCounter printStats = new randomStatCounter();
        printStats.main(null);
    }
}
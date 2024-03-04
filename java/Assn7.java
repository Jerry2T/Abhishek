import java.*;
public class Assn7{
    
    public static void reverseString(String input) {
        StringBuilder reversed = new StringBuilder(input).reverse();
        System.out.println(&quot;Original String: \&quot;&quot; + input + &quot;\&quot;&quot;);
        System.out.println(&quot;Reversed String: \&quot;&quot; + reversed + &quot;\&quot;\n&quot;);
    }
        
    public static void convertCase(String input) {
        System.out.println(&quot;Original String: \&quot;&quot; + input + &quot;\&quot;&quot;);
        System.out.println(&quot;Uppercase: \&quot;&quot; + input.toUpperCase() + &quot;\&quot;&quot;);
        System.out.println(&quot;Lowercase: \&quot;&quot; + input.toLowerCase() + &quot;\&quot;\n&quot;);
    }
        
    public static void extractSubstring(String input) {
        int startIndex = input.indexOf(&quot;Example&quot;);
        String substring = input.substring(startIndex);
        System.out.println(&quot;Original String: \&quot;&quot; + input + &quot;\&quot;&quot;);
        System.out.println(&quot;Extracted Substring: \&quot;&quot; + substring + &quot;\&quot;\n&quot;);
    }
        
    public static void concatenateStrings(String str1, String str2) {
        String concatenated = str1 + str2;
        System.out.println(&quot;Concatenated String: \&quot;&quot; + str1 + &quot;\&quot; + \&quot;&quot; + str2 + &quot;\&quot;&quot;);
        System.out.println(&quot;Result: \&quot;&quot; + concatenated + &quot;\&quot;\n&quot;);
    }
        
    public static void compareStrings(String str1, String str2) {
        System.out.println(&quot;Comparison of Strings:&quot;);
        System.out.println(&quot;String1: \&quot;&quot; + str1 + &quot;\&quot;&quot;);
        System.out.println(&quot;String2: \&quot;&quot; + str2 + &quot;\&quot;&quot;);
    
        if (str1.equals(str2)) {
            System.out.println(&quot;The strings are equal.\n&quot;);
        } else {
            System.out.println(&quot;The strings are not equal.\n&quot;);
        }
    }
        
    public static void convertNumberToString(int number) {
        System.out.println(&quot;Number: &quot; + number);
        String convertedString = String.valueOf(number);
        System.out.println(&quot;Converted String: \&quot;&quot; + convertedString + &quot;\&quot;\n&quot;);
    }
       
    public static void main(String[] args) {
        reverseString(&quot;Hello, World!&quot;);
        convertCase(&quot;Java Programming&quot;);
        extractSubstring(&quot;Substring Example&quot;);
        concatenateStrings(&quot;Hello, &quot;, &quot;World!&quot;);
        compareStrings(&quot;Java&quot;, &quot;java&quot;);
        convertNumberToString(42);
    }
}
       
   
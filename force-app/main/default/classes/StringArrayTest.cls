public class StringArrayTest {
    public static List<String> generateStringArray(Integer num) {
        List<String> arr = new List<String>();
        for(Integer i = 0; i < num; i++) {
            arr.add('Test ' + i);
        }
      return arr;
    }
}
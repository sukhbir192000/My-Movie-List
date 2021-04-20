package daos;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class ApiDao {
    private final String BASE_URL = "https://api.themoviedb.org/3",
                         KEY = "192b40bd150b4abb8cc7b490dd6dc075";

    public JSONArray getRequestArray(String url_string) {
        try {
            URL url = new URL(BASE_URL + url_string + "?api_key=" + KEY);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.connect();

            //Getting the response code
            int responsecode = conn.getResponseCode();

            if (responsecode != 200) {
                throw new RuntimeException("HttpResponseCode: " + responsecode);
            } else {

                String inline = "";
                Scanner scanner = new Scanner(url.openStream());

                //Write all the JSON data into a string using a scanner
                while (scanner.hasNext()) {
                    inline += scanner.nextLine();
                }

                //Close the scanner
                scanner.close();
//                System.out.println(inline);

                //Using the JSON simple library parse the string into a json object
                JSONParser parse = new JSONParser();
                Object data_obj = parse.parse(inline);
//                JSONArray array = new JSONArray();
//                array.add(data_obj);
//                System.out.println(array.get(0));

                //Get the required object from the above created object
                JSONObject obj = (JSONObject) data_obj;
                System.out.println(obj.get("results"));
                
                return (JSONArray) obj.get("results");
//
//                //Get the required data using its key
//                System.out.println(obj.get("TotalRecovered"));
//                
//                
//                JSONArray arr = (JSONArray) data_obj.get("Countries");
//
//                for (int i = 0; i < arr.size(); i++) {
//
//                    JSONObject new_obj = (JSONObject) arr.get(i);
//
//                    if (new_obj.get("Slug").equals("albania")) {
//                        System.out.println("Total Recovered: " + new_obj.get("TotalRecovered"));
//                        break;
//                    }
//                }
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
}

package sg.nus.iss.angular.sa45;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.annotation.Resource;
import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import javax.ws.rs.core.MediaType;
import org.json.JSONObject;


/**
 *
 * @author Lim Chang Siang
 */

//I will do both Posting data to Db and getting of data from db using a single servlet
@WebServlet(urlPatterns = "/collections/*")
public class GiphyServlet extends HttpServlet {
    @Resource(lookup = "giphy_project")
    private DataSource connPool;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp){
        
        //Will get pathInfo as  "/userId/collectionName"
        String pathInfo = req.getPathInfo();
        System.out.println(pathInfo);
        //String[] stringArray = pathInfo.split("/");
        //System.out.println(stringArray[1]);
        String userId = pathInfo.split("/")[1];
        //System.out.println(stringArray[0]);
        String collectionName = pathInfo.split("/")[2];
        JsonArrayBuilder giphyArray = Json.createArrayBuilder();
        
        try(Connection conn = connPool.getConnection()){
            
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM angulargiphy.angulargiphy WHERE userId = ? and collectionName = ?");
            ps.setString(1, userId);
            ps.setString(2, collectionName);
            System.out.println(ps.toString());
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                JsonObject obj = Json.createObjectBuilder()
                .add("giphyId", rs.getString("giphyId"))
                .add("userId", rs.getString("userId"))
                .add("collectionName", rs.getString("collectionName"))
                .build();
            giphyArray.add(obj);       
            }
            
            if(giphyArray.build().size() == 0){
                resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            //Remember to close ResultSet and Connection
            rs.close();
            conn.close();
            
            resp.setStatus(HttpServletResponse.SC_OK);
            resp.setContentType(MediaType.APPLICATION_JSON);
            try(PrintWriter pw = resp.getWriter()){
                pw.println(giphyArray.build().toString());
            }
        }catch (Exception ex){
            log(ex.getMessage());
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            return;
        }
    }
    

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException{
        
        //Need to think about how to get Angular to pass Json object back to servlet
        
        //Currently.. This only deal with one JsonObject at a time.
        //Need to think about parsing an array and one shot update multiple....
        JSONObject obj = JSONParser.getJSONFromUrl(req.getInputStream());
        System.out.println(obj.toString());
        try(Connection conn = connPool.getConnection()){
            
            PreparedStatement ps = conn.prepareStatement("INSERT INTO angulargiphy.angulargiphy (giphyId, userId, collectionName) VALUES (? , ?, ?)");
            ps.setString(1, obj.getString("giphyId"));
            ps.setString(2, obj.getString("userId"));
            ps.setString(3, obj.getString("collectionName"));
            Boolean success = ps.execute();
            conn.close();
            
            if(success){
                resp.setStatus(HttpServletResponse.SC_OK);
                resp.setContentType(MediaType.TEXT_PLAIN);
                try(PrintWriter pw = resp.getWriter()){
                    pw.println(success);
            }catch (IOException ex){
                log(ex.getMessage());
            }
            }
        }catch(Exception ex){
            log(ex.getMessage());
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            return;
        }
    }
    
}

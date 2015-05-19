package myTools;

public class utils {
	public static double Distance(double  long1, double lat1, double long2, double lat2 )
    {
        
        double radLat1 = lat1 * Math.PI / 180;
        double radLat2 = lat2 * Math.PI / 180;
        double a = radLat1 - radLat2;
        double b = long1 * Math.PI / 180 - long2 * Math.PI / 180;
       
        double s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2) + Math.cos(radLat1)
                * Math.cos(radLat2) * Math.pow(Math.sin(b / 2), 2)));
        s = s * 6378137.0;// ȡWGS84��׼�ο������еĵ��򳤰뾶(��λ:m)
        s = Math.round(s * 10000) / 10000;

        return s;
    }
}

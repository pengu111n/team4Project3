package util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class CbUploadFileUtils {

    private static final Logger logger =
            LoggerFactory.getLogger(CbUploadFileUtils.class);


    public static String uploadFile(String uploadPath,
                                    String originalName,
                                    byte[] fileData)throws Exception{

        UUID uid = UUID.randomUUID();

        String savedName = uid.toString() +"_"+originalName;

        String savedPath = calcPath(uploadPath);  // C:\\zzz\\upload

        File target = new File(uploadPath +savedPath,savedName);

        FileCopyUtils.copy(fileData, target);

        String formatName = originalName.substring(originalName.lastIndexOf(".")+1);  // (ex).jpg ) .뒤에 확장자를 가져온다

        String uploadedFileName = null;

        if(CbMediaUtils.getMediaType(formatName) != null){
            uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);  //jpg, gif, png일 경우 섬네일 생성
        }else{
            uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
        }

        return uploadedFileName;

    }

    private static  String makeIcon(String uploadPath,
                                    String path,
                                    String fileName)throws Exception{

        String iconName =
                uploadPath + path + File.separator+ fileName;

        return iconName.substring(
                uploadPath.length()).replace(File.separatorChar, '/');
    }


    private static  String makeThumbnail(
            String uploadPath,
            String path,
            String fileName)throws Exception{

        BufferedImage sourceImg =
                ImageIO.read(new File(uploadPath + path, fileName));

        BufferedImage destImg =
                Scalr.resize(sourceImg,
                        Scalr.Method.AUTOMATIC,
                        Scalr.Mode.FIT_TO_HEIGHT,100);

        // C:\\zzz\\upload\\2022\\07\\20\\s_ejklsjkle_파일명.jpg
        String thumbnailName =
                uploadPath + path + File.separator +"s_"+ fileName; //파일명 맨앞에 s_ 를 붙인다

        File newFile = new File(thumbnailName);
        String formatName =
                fileName.substring(fileName.lastIndexOf(".")+1);


        ImageIO.write(destImg, formatName.toUpperCase(), newFile);
        return thumbnailName.substring(
                uploadPath.length()).replace(File.separatorChar, '/');
        //  /2022/07/20/s_ejklsjkle_파일명.jpg
    }


    private static String calcPath(String uploadPath){

        Calendar cal = Calendar.getInstance();

        String yearPath = File.separator+cal.get(Calendar.YEAR); // \\2022

        String monthPath = yearPath +
                File.separator +
                new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1); // \\2022\\07

        String datePath = monthPath +
                File.separator +
                new DecimalFormat("00").format(cal.get(Calendar.DATE)); // \\2022\\07\\20

        makeDir(uploadPath, yearPath,monthPath,datePath); // C:\\zzz\\upload\\2022\\07\\20

        logger.info(datePath);

        return datePath;
    }


    private static void makeDir(String uploadPath, String... paths){

        if(new File(paths[paths.length-1]).exists()){  //datePath = paths[2]
            return;
        }

        for (String path : paths) {

            File dirPath = new File(uploadPath + path);

            if(! dirPath.exists() ){  //존재하지않으면
                dirPath.mkdir();		//만든다
            }
        }
    }


}

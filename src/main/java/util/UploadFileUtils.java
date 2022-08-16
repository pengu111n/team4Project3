package util;

import org.imgscalr.Scalr;
import org.springframework.http.MediaType;
import org.springframework.util.FileCopyUtils;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.UUID;

public class UploadFileUtils {
    private static String uploadFile(String uploadPath, String orignalName, byte[] fileData) throws Exception{
        // 중복된 이름의 파일을 저장하지 않기위해 UUID 키값 생성
        UUID uuid = UUID.randomUUID();
        //실제 저장될 파일명 UUID+_+파일명
        String savedName = uuid.toString()+ "_" + orignalName;
        // 날짜 경로 = 년 + 월 + 일
        String savedPath = calcPath(uploadPath);
        // 파일 객체 생성 = 기본 저장경로 + 날짜경로 + UUID_파일명
        File target = new File(uploadPath + savedPath + savedName);
        // FileData를 파일 객체에 복사
        FileCopyUtils.copy(fileData, target);
        // 파일 확장자 추출
        String formatName = orignalName.substring(orignalName.lastIndexOf(".") + 1);
        // 업로드 파일명 : 썸네일 이미지 파일명 or 일반 파일명
        String uploadFileName = null;
        // 확장자에 따라 썸네일 이미지 생성 or 일반 파일 아이콘 생성
        if(MediaUtils.getMediaType(formatName) != null){
            //썸네일 이미지 생성, 썸네일 이미지 파일명
            uploadFileName = makeThumpnail(uploadPath, savedPath, savedName);
        }else{
            uploadFileName = makeIcon(uploadPath, savedPath, savedName);
        }
        return uploadFileName;
    }

    private static String calcPath(String uploadPath){
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd");
        String yearPath = format.format(calendar.get(Calendar.YEAR));
        String monthPath = format.format(calendar.get(Calendar.MONTH) + 1);
        String datePath = format.format(calendar.get(Calendar.DATE));

        makeDir(uploadPath, yearPath, monthPath, datePath);
        return datePath;
    }

    private static void makeDir(String uploadPath, String ...paths){
        if(new File(uploadPath + paths[paths.length - 1]).exists()){
            return;
        }
        for(String path : paths) {
            File dirPath = new File(uploadPath + path);

            if (!dirPath.exists()) {
                dirPath.mkdir();
            }
        }
    }

    private static String makeThumpnail(String uploadPath, String path, String fileName) throws Exception{
        // byfferedimage : 실제 이미지 x 메모리상의 이미지를 의미하는 객체
        // 원본 이미지 파일을 메모리에 로딩
        BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
        // 정해진 크기에 맞게 원본이미지를 축소
        BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
        // 썸네일 이미지 파일명
        String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
        // 썸네일 이미지 파일 객체 생성
        File newFile = new File(thumbnailName);
        // 파일 확장자 추출
        String formatname = fileName.substring(fileName.lastIndexOf(".") + 1);
        // 썸네일 파일 저장
        ImageIO.write(destImg, formatname.toUpperCase(), newFile);
        return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');

    }

    // 4. 이미지파일이 아닐경우
    private static String makeIcon(String uploadPath, String savedPath, String fileName)throws Exception{
        //아이콘 파일명 = 기본 저장경로 + 날짜경로 + 구분자 + 파일명
        String iconName = uploadPath + savedPath + File.separator + fileName;
        return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
    }

    // 5. 파일 삭제
    public static void removeFile(String uploadPath, String fileName) {
        // 파일 확장자 추출
        String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
        // 파일 확장자를 통해 이미지 파일인지 판별
        MediaType mediaType = MediaUtils.getMediaType(formatName);
        // 이미지 파일일경우, 원본파일 삭제
        if(mediaType != null){
            // 날짜 경로 추출
            String front = fileName.substring(0,12);
            // UUID + 파일명 추출
            String end = fileName.substring(14);
            // 원본 이미지 파일 삭제(구분자 변환)
            new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
        }
        // 파일 삭제(일반파일 or 썸네일 이미지 파일 삭제)
        new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
    }


}

package util;

import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.swing.*;
import java.awt.*;
import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.awt.image.ColorModel;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Marty Pang on 2017/3/8.
 * Description
 */
public class ImageUtils {
    public static void main(String[] args) {
        String src = "F:\\迅雷下载\\cyx.jpg";
        String dest = "F:\\迅雷下载\\out5.jpg";
        // try {
        // File file = new File(src);
        // File outFile = new File(dest);
        // BufferedImage src1 = ImageIO.read(file);
        // BufferedImage tag = new BufferedImage(100, 100,
        // BufferedImage.TYPE_INT_RGB);
        // tag.getGraphics().drawImage(src1, 0, 0, 100, 100, null);
        // ImageIO.write(tag, "jpg", outFile);
        // } catch (Exception e) {
        // // TODO Auto-generated catch block
        // e.printStackTrace();
        // }
        /**
         * try { File file = new File(src); BufferedImage src1 =
         * ImageIO.read(file);
         *
         * Image src2 = src1.getScaledInstance(100, 100,
         * BufferedImage.TYPE_INT_RGB); ByteArrayOutputStream os = new
         * ByteArrayOutputStream(); ImageIO.write(src1, "jpg", os);
         * System.out.println((double)os.size()/1024); } catch (Exception e) {
         * e.printStackTrace(); }
         **/
        // try{
        // File file = new File(src);
        // ImageInputStream is = ImageIO.createImageInputStream(file);
        // BufferedImage src1 = ImageIO.read(file);
        // ByteArrayOutputStream os = new ByteArrayOutputStream();
        // Iterator<ImageReader> ite = ImageIO.getImageReaders(is);
        // if(ite.hasNext()){
        // ImageReader ir = (ImageReader)ite.next();
        // System.out.println(ir.getFormatName());
        // }
        // } catch (Exception e) {
        // e.printStackTrace();
        // }
        /**
         * try { Map<String,Object> detail = getDetail(src); double width =
         * (Double)detail.get("width"); double height =
         * (Double)detail.get("height"); String suffix =
         * (String)detail.get("suffix"); String size =
         * (String)detail.get("size");
         * System.out.println("width:"+width+"\nheight:"
         * +height+"\nsuffix:"+suffix+"\nsize:"+size); } catch
         * (IllegalArgumentException e) { // TODO Auto-generated catch block
         * e.printStackTrace(); } catch (IOException e) { // TODO Auto-generated
         * catch block e.printStackTrace(); } int c = 1;
         */
        try {
            BufferedImage bufImg = getBufferedImage(src);
            writeImage(bufImg.getSubimage(50, 50, 50, 50), dest);
        } catch (Exception e) {

        }
    }

    /**
     * 根据原图文件的路径得到BufferedImage对象
     *
     * @param src
     *            原图文件存放路径
     * @return 得到的BufferedImage对象
     * @throws IOException
     *             未找到文件或读取错误
     */
    public static BufferedImage getBufferedImage(String src) throws IOException {
        File srcFile = new File(src);
        BufferedImage imageTemp = ImageIO.read(srcFile);
        return imageTemp;
    }

    /**
     * 将一个BufferedImage输出到文件
     *
     * @param srcImage
     *            BufferedImage类型的对象
     * @param dest
     *            目标文件，带后缀
     * @throws IOException
     *             输出到文件的时候出错
     *
     */
    public static void writeImage(BufferedImage srcImage, String dest)
            throws IOException, IllegalArgumentException {
        File destFile = new File(dest);
        ImageIO.write(srcImage, dest.substring(dest.lastIndexOf(".") + 1),
                destFile);
    }

    /**
     * 返回图像文件的详细信息
     *
     * @param src
     *            图像文件的路径
     * @return 详细信息的Map;{width:int,height:int,suffix:String,size:String[kb]}
     * @throws IOException
     *             IO错误
     */
    public static Map<String, Object> getDetail(String src) throws IOException {
        Map<String, Object> hashMap = new HashMap<String, Object>();
        File srcFile = new File(src);
        String size = String.format("%.2f", (double) (srcFile.length()) / 1024);
        String suffix = src.substring(src.lastIndexOf(".") + 1);
        BufferedImage bufImg = getBufferedImage(src);
        double width, height;
        width = bufImg.getWidth();
        height = bufImg.getHeight();
        new ByteArrayOutputStream();
        hashMap.put("width", width);
        hashMap.put("height", height);
        hashMap.put("suffix", suffix);
        hashMap.put("size", size);

        return hashMap;
    }

    /**
     * 获得Image对象的宽和高的像素数,
     *
     * @param image
     * @return
     */
    public static int[] getPixel(Image image) {
        int[] pixel = new int[2];
        pixel[0] = image.getWidth(null);
        pixel[1] = image.getHeight(null);
        return pixel;
    }

    /**
     * 对图片进行缩放,将文件输出到目标文件
     *
     * @param src
     *            源文件地址
     * @param dest
     *            缩放后的目标地址
     * @param w
     *            目标文件的宽度
     * @param h
     *            目标文件的高度
     * @throws IOException
     *             源文件未找到或者输出异常
     */
    public static void zoomImage(String src, String dest, double w, double h)
            throws IOException {
        double wr = 0, hr = 0;

        BufferedImage bufImg = getBufferedImage(src);

        BufferedImage Itemp = null;// bufImg.getScaledInstance(w,
        // h,bufImg.SCALE_SMOOTH);
        // 得到应该缩放的比例
        wr = w * 1.0 / bufImg.getWidth();
        hr = h * 1.0 / bufImg.getHeight();
        // 变换矩阵的参数
        AffineTransformOp ato = new AffineTransformOp(AffineTransform
                .getScaleInstance(wr, hr), null);
        // 用这个变换矩阵缩放图片
        Itemp = ato.filter(bufImg, null);
        writeImage(Itemp, dest);
    }

    /**
     * 对原图像进行缩放处理，返回得到的BufferedImage
     *
     * @param bufImg
     *            原图像的BufferedImage
     * @param w
     *            想要修改的宽度
     * @param h
     *            想要修改的高度
     * @return 返回伸缩后的BufferedImage
     * @throws IOException
     *             文件未找到
     */
    public static BufferedImage zoomImage(BufferedImage bufImg, double w,
                                          double h) throws IOException {
        double wr = 0; // 宽度缩放比例
        double hr = 0; // 高度缩放比例
        BufferedImage Itemp = null;
        wr = w * 1.0 / bufImg.getWidth();
        hr = h * 1.0 / bufImg.getHeight();
        AffineTransformOp ato = new AffineTransformOp(AffineTransform
                .getScaleInstance(wr, hr), null);
        Itemp = ato.filter(bufImg, null);
        return Itemp;
    }

    /**
     * 对BufferedImage进行等比例缩放
     *
     * @param bufImg
     *            源文件的BufferedImage
     * @param w
     *            想要修改的宽度,高度按原比例缩放
     * @return 修改后的BufferedImage
     */
    public static BufferedImage zoomImage(BufferedImage bufImg, double w) {
        double rate = 0;
        BufferedImage Itemp = null;
        rate = w * 1.0 / bufImg.getWidth();
        AffineTransformOp ato = new AffineTransformOp(AffineTransform
                .getScaleInstance(rate, rate), null);
        Itemp = ato.filter(bufImg, null);
        return Itemp;
    }

    /**
     * 将iamge对象转换为BufferdImage对象
     *
     * @param image
     *            待转换的Image对象
     * @return 转换后的Image对象
     */
    public static BufferedImage toBufferedImage(Image image) {
        if (image instanceof BufferedImage) {
            // 如果iamge的指向的实例本身就是BufferdImage，则直接转换
            return (BufferedImage) image;
        }

        // 保证该image的所有像素都被加载
        image = new ImageIcon(image).getImage();

		/*
		 * 创建一个默认的，即跟显示器兼容的bufferd image
		 */
        BufferedImage bImage = null;
        GraphicsEnvironment ge = GraphicsEnvironment
                .getLocalGraphicsEnvironment();
        try {
            // 新图片的透明度
            int transparency = Transparency.OPAQUE;// 不透明
			/*
			 * if (hasAlpha) {//以后可以添加个方法判断是否有Alpha通道 transparency =
			 * Transparency.BITMASK; }
			 */

            // 创建BufferdImage
            GraphicsDevice gs = ge.getDefaultScreenDevice();
            GraphicsConfiguration gc = gs.getDefaultConfiguration();
            bImage = gc.createCompatibleImage(image.getWidth(null), image
                    .getHeight(null), transparency);
        } catch (HeadlessException e) {
            // 如果没有显示器的话将会抛出异常，无法创建图形设备，因此BufferedImage也无法创建
        }
		/*
		 * 创建结束
		 */

        if (bImage == null) {
            // 使用默认的颜色模型
            int type = BufferedImage.TYPE_INT_RGB;
			/*
			 * if (hasAlpha) { type = BufferedImage.TYPE_INT_ARGB; }
			 */
            bImage = new BufferedImage(image.getWidth(null), image
                    .getHeight(null), type);
        }

        Graphics g = bImage.createGraphics();

        // 把image图像copy到创建的Buffered Image中
        g.drawImage(image, 0, 0, null);
        g.dispose();

        return bImage;
    }

    /**
     * 压缩图片
     *
     * @param srcFilePath
     * @param descFilePath
     * @return
     * @throws IOException
     */
    @SuppressWarnings("static-access")
    public static boolean compressPic(String srcFilePath, String descFilePath)
            throws IOException {
        File file = null;
        BufferedImage src = null;
        FileOutputStream out = null;
        ImageWriter imgWrier;
        ImageWriteParam imgWriteParams;

        // 指定写图片的方式为 jpg
        imgWrier = ImageIO.getImageWritersByFormatName("jpg").next();
        imgWriteParams = new javax.imageio.plugins.jpeg.JPEGImageWriteParam(
                null);
        // 要使用压缩，必须指定压缩方式为MODE_EXPLICIT
        imgWriteParams.setCompressionMode(imgWriteParams.MODE_EXPLICIT);
        // 这里指定压缩的程度，参数qality是取值0~1范围内，
        imgWriteParams.setCompressionQuality((float) 1);
        imgWriteParams.setProgressiveMode(imgWriteParams.MODE_DISABLED);
        ColorModel colorModel = ImageIO.read(new File(srcFilePath))
                .getColorModel();// ColorModel.getRGBdefault();
        // 指定压缩时使用的色彩模式
        // imgWriteParams.setDestinationType(new
        // javax.imageio.ImageTypeSpecifier(
        // colorModel, colorModel.createCompatibleSampleModel(16, 16)));
        imgWriteParams.setDestinationType(new javax.imageio.ImageTypeSpecifier(
                colorModel, colorModel.createCompatibleSampleModel(16, 16)));

        try {
            if (isBlank(srcFilePath)) {
                return false;
            } else {
                file = new File(srcFilePath);
                System.out.println(file.length());
                src = ImageIO.read(file);
                out = new FileOutputStream(descFilePath);

                imgWrier.reset();
                // 必须先指定 out值，才能调用write方法, ImageOutputStream可以通过任何
                // OutputStream构造
                imgWrier.setOutput(ImageIO.createImageOutputStream(out));
                // 调用write方法，就可以向输入流写图片
                imgWrier.write(null, new IIOImage(src, null, null),
                        imgWriteParams);
                out.flush();
                out.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public static boolean isBlank(String string) {
        if (string == null || string.length() == 0 || string.trim().equals("")) {
            return true;
        }
        return false;
    }
}

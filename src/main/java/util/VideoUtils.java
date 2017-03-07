package util;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class VideoUtils {
	private static final Logger logger = Logger.getLogger(VideoUtils.class);

	private static String ffmpegPath = "";
	private static String mencoderPath = "";

//	public static void main(String[] args) throws InterruptedException {
//		String videoLocation = "E:/Tomcat/apache-tomcat-6.0.26/webapps/Ferrari_Wechat_Manager/upload/video/CarDisplay//2015-09//20150920201844_514.avi";
//		videoLocation = "C:\\Users\\Administrator\\Desktop\\法拉利微信项目\\iamge\\Engine_eng_def-800.mp4";
//		String imageLocation = "f:\\迅雷下载\\test.jpg";
//
//		String ffmpegPath = "f:\\迅雷下载\\ffmpeg";
//		// ffmpegPath =
//		// "E:/Tomcat/apache-tomcat-6.0.26/webapps/Ferrari_Wechat_Manager/tool/ffmpeg/ffmpeg";
//		// VideoUtils.capturePic(videoLocation);
//		// VideoUtils.capturePic(ffmpegPath, 10, 300, 300, videoLocation,
//		// imageLocation);
//		System.out.println(getVideoTime(ffmpegPath, videoLocation));
//		Thread.sleep(10000);
//	}

	/**
	 * 获得视频的size(kb)
	 * 
	 * @param videoPath
	 * @return
	 */
	public static double getVideoSize(String videoPath) {
		File file = new File(videoPath);
		Double size = 0.0;
		size = (double) file.length() / 1024;
		return size;
	}

	/**
	 * 获得视频的时长(s)
	 *
	 * @param videoPath
	 * @return
	 */
	public static Double getVideoTime(String videoPath) {
		List<String> cmd = new ArrayList<String>();
		cmd.add(ffmpegPath);
		cmd.add("-i");
		cmd.add(videoPath);
		Double time = 0.0;
		String temp = "";
		BufferedReader br = null;
		try {
			ProcessBuilder builder = new ProcessBuilder();
			builder.redirectErrorStream(true);
			builder.command(cmd);
			Process process = builder.start();
			br = new BufferedReader(new InputStreamReader(process
					.getInputStream()));
			String line;
			while ((line = br.readLine()) != null) {
				if (line.contains("Duration")) {
					temp = line.substring(line.indexOf(":") + 1,
							line.indexOf(",")).trim();
				}
			}
			br.close();
		} catch (Exception e) {
			logger.error("", e);
		}
		// 00:03:47.00
		String[] times = temp.split(":");

		Double hour = StringUtils.isBlank(times[0]) ? 0 : Double
				.valueOf(times[0]);
		Double min = StringUtils.isBlank(times[0]) ? 0 : Double
				.valueOf(times[1]);
		Double sec = StringUtils.isBlank(times[0]) ? 0 : Double
				.valueOf(times[2]);
		time = sec + min * 60 + hour * 60 * 60;
		return time;
	}

	/**
	 * 截图
	 *
	 * @param picSecond
	 *            在第几秒截图
	 * @param width
	 *            截图的宽度
	 * @param height
	 *            截图的高度
	 * @param videoLocation
	 *            视频存放的位置
	 * @param imageLocation
	 *            截图存放的位置
	 * @return 添加结果
	 */
	public static boolean capturePic(Integer picSecond,
			Integer width, Integer height, String videoLocation,
			String imageLocation) {
		List<String> commend = new ArrayList<String>();
		commend.add(ffmpegPath);// 视频提取工具的位置
		commend.add("-y");
		commend.add("-ss");// 添加参数＂-ss＂，该参数指定截取的起始时间s
		commend.add(picSecond.toString());
		commend.add("-i"); // 添加参数＂-i＂，该参数指定要转换的文件
		commend.add(videoLocation);
		commend.add("-s");// 添加参数＂-s＂，该参数指定截取的图片大小
		commend.add(width.toString() + "x" + height.toString());// 添加截取的图片大小
		commend.add("-frames");
		commend.add("1");
		commend.add("-f");
		commend.add("image2");
		commend.add(imageLocation);// 添加截取的图片的保存路径
		try {
			ProcessBuilder builder = new ProcessBuilder();
			builder.redirectErrorStream(true);
			builder.command(commend);
			Process p = builder.start();
			BufferedReader br = new BufferedReader(new InputStreamReader(p
					.getInputStream()));
			while (br.readLine() != null)
				;
		} catch (Exception e) {
			logger.error("", e);
			return false;
		}
		logger.info("退出截图");
		return true;
	}

	// 对ffmpeg无法解析的文件格式(wmv9，rm，rmvb等), 可以先用别的工具（mencoder）转换为avi(ffmpeg能解析的)格式.
	private static String processAVI(String videoPath) {
		List<String> command = new ArrayList<String>();
		String outputPath = getVideoPath(videoPath) + getVideoName(videoPath)+".avi";
		command.add(mencoderPath);
		command.add(videoPath);
		command.add("-oac");
		command.add("lavc");
		command.add("-lavcopts");
		command.add("acodec=mp3:abitrate=64");
		command.add("-ovc");
		command.add("xvid");
		command.add("-xvidencopts");
		command.add("bitrate=600");
		command.add("-of");
		command.add("avi");
		command.add("-o");
		command.add(outputPath);
		try {
			ProcessBuilder builder = new ProcessBuilder();
			Process process = builder.command(command).redirectErrorStream(true).start();
			new PrintStream(process.getInputStream());
			new PrintStream(process.getErrorStream());
			process.waitFor();
			return outputPath;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// ffmpeg能解析的格式：（asx，asf，mpg，wmv，3gp，mp4，mov，avi，flv等）
	private static boolean processFLV(String videoPath) {
		List<String> command = new ArrayList<String>();
		String outputPath = getVideoPath(videoPath) + getVideoName(videoPath)+".flv";
		command.add(ffmpegPath);
		command.add("-i");
		command.add(videoPath);
		command.add("-ab");
		command.add("56");
		command.add("-ar");
		command.add("22050");
		command.add("-qscale");
		command.add("8");
		command.add("-r");
		command.add("15");
		command.add("-s");
		command.add("600x500");
		command.add(outputPath);

		try {
			Process videoProcess = new ProcessBuilder(command).redirectErrorStream(true).start();

			new PrintStream(videoProcess.getErrorStream()).start();

			new PrintStream(videoProcess.getInputStream()).start();

			videoProcess.waitFor();

			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	//获取视频名称
	private static String getVideoName(String inputPath){
		String name = inputPath.substring(inputPath.lastIndexOf("/") + 1, inputPath.lastIndexOf("."))
				.toLowerCase();
		return name;
	}

	//获取视频路径，不带视频名称
	private static String getVideoPath(String inputPath){
		String path = inputPath.substring(0, inputPath.lastIndexOf("/")+1)
				.toLowerCase();
		return path;
	}

	//获取视频类型
	private static String getVideoType(String inputPath){
		String type = inputPath.substring(inputPath.lastIndexOf(".") + 1, inputPath.length())
				.toLowerCase();
		return type;
	}

	private static int checkContentType(String inputPath) {
		String type = getVideoType(inputPath);
		// ffmpeg能解析的格式：（asx，asf，mpg，wmv，3gp，mp4，mov，avi，flv等）
		if (type.equals("avi")) {
			return 0;
		} else if (type.equals("mpg")) {
			return 0;
		} else if (type.equals("wmv")) {
			return 0;
		} else if (type.equals("3gp")) {
			return 0;
		} else if (type.equals("mov")) {
			return 0;
		} else if (type.equals("mp4")) {
			return 0;
		} else if (type.equals("asf")) {
			return 0;
		} else if (type.equals("asx")) {
			return 0;
		} else if (type.equals("flv")) {
			return 0;
		}
		// 对ffmpeg无法解析的文件格式(wmv9，rm，rmvb等),
		// 可以先用别的工具（mencoder）转换为avi(ffmpeg能解析的)格式.
		else if (type.equals("wmv9")) {
			return 1;
		} else if (type.equals("rm")) {
			return 1;
		} else if (type.equals("rmvb")) {
			return 1;
		}
		return 9;
	}
}
class PrintStream extends Thread {
	java.io.InputStream __is = null;
	public PrintStream(java.io.InputStream is) {
		__is = is;
	}
	public void run() {
		try {
			while (this != null) {
				int _ch = __is.read();
				if (_ch != -1)
					System.out.print((char) _ch);
				else break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
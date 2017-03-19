package util;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class VideoUtils {
	private static final Logger logger = Logger.getLogger(VideoUtils.class);

	private static String ffmpegPath = PropertyUtils.getProperty("FFMPEGPath");
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
//		Map<String,Object> map = new HashMap<String,Object>();
//		map.put("input_path","F:\\IdeaProject\\PetHospitalMS\\target\\PetHospitalMS\\upload\\video\\LPTV.mp4");
//		map.put("logo_path","F:\\IdeaProject\\PetHospitalMS\\target\\PetHospitalMS\\assets\\custom\\images\\success.png");
//		map.put("output_path","F:\\IdeaProject\\PetHospitalMS\\target\\PetHospitalMS\\upload\\video\\watermark.mp4");
//		addLogo(map);
//		String video_path = "F:\\IdeaProject\\PetHospitalMS\\target\\PetHospitalMS\\upload\\video\\bike.flv";
//		processMP4(video_path);
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
		List<String> command = new ArrayList<String>();
		command.add(ffmpegPath);// 视频提取工具的位置
		command.add("-y");
		command.add("-ss");// 添加参数＂-ss＂，该参数指定截取的起始时间s
		command.add(picSecond.toString());
		command.add("-i"); // 添加参数＂-i＂，该参数指定要转换的文件
		command.add(videoLocation);
		command.add("-s");// 添加参数＂-s＂，该参数指定截取的图片大小
		command.add(width.toString() + "x" + height.toString());// 添加截取的图片大小
		command.add("-frames");
		command.add("1");
		command.add("-f");
		command.add("image2");
		command.add(imageLocation);// 添加截取的图片的保存路径
		try {
			ProcessBuilder builder = new ProcessBuilder();
			builder.redirectErrorStream(true);
			builder.command(command);
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

	/**
	 * 添加水印
	 * @param map
	 * @return
	 */
	public static boolean addLogo(JSONObject map)	{
		boolean result = false;
		List<String> cmd = new ArrayList<String>();
		cmd.add(ffmpegPath);
		cmd.add("-y");
		cmd.add("-i");
		cmd.add(map.get("input_path").toString());
		cmd.add("-i");
		cmd.add(map.get("logo_path").toString());
		cmd.add("-filter_complex");
		cmd.add("\"overlay= main_w-overlay_w:main_h-overlay_h\"");
		cmd.add(map.get("output_path").toString());
		try {
			ProcessBuilder builder = new ProcessBuilder();
			builder.command(cmd);
			Process p = builder.start();
			new PrintStream(p.getErrorStream()).start();
			new PrintStream(p.getInputStream()).start();
			p.waitFor();
			//System.out.println("true");
			return true;
		} catch (Exception e) {
			logger.error("加水印发生错误", e);
			return false;
		}
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

	//转换为MP4格式
	public static boolean processMP4(String videoPath) {
		List<String> command = new ArrayList<String>();
		String outputPath = getVideoPath(videoPath) + getVideoName(videoPath)+".mp4";
		command.add(ffmpegPath);
		command.add("-y");
		command.add("-i");
		command.add(videoPath);
		command.add("-ab");
		command.add("96");
		command.add("-acodec");
		command.add("libmp3lame");
		command.add("-ar");
		command.add("22050");
		command.add("-qscale");
		command.add("6");
		command.add(outputPath);
		try {
			Process pMP4 = new ProcessBuilder(command).start();
			new PrintStream(pMP4.getErrorStream()).start();
			new PrintStream(pMP4.getInputStream()).start();
			pMP4.waitFor();
			return true;
		} catch (Exception e) {
			logger.error("",e);
			return false;
		}
	}

	//获取视频名称
	public static String getVideoName(String inputPath){
		String name = inputPath.substring(inputPath.lastIndexOf("/") + 1, inputPath.lastIndexOf("."));
		return name;
	}

	//获取视频路径，不带视频名称
	private static String getVideoPath(String inputPath){
		String path = inputPath.substring(0, inputPath.lastIndexOf("/")+1);
		return path;
	}

	//获取视频类型
	public static String getVideoType(String inputPath){
		String type = inputPath.substring(inputPath.lastIndexOf(".") + 1);
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
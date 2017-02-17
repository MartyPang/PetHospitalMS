package util;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.apache.commons.dbutils.DbUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 配置数据库连接
 */
public class DbControl {
	// 数据源
	private static ComboPooledDataSource ds = null;

	public DbControl() {

	}

	static {
		// 初始化数据源
		init();
	}

	// 初始化数据源
	private static void init() {
		try {
			// 获取数据库驱动信息
			String sDBDriver = PropertyUtil.getProperty("jdbc.driver");//"com.mysql.jdbc.Driver";
			// 获取连接字符串信息
			String sDBConnectString = PropertyUtil.getProperty("jdbc.url");//"jdbc:mysql://10.11.1.42:3306/ouyeeldb?useUnicode=true&characterEncoding=utf-8";
			// 获取数据库登陆用户名
			String sDBUserName = PropertyUtil.getProperty("jdbc.username");//"root";
			// 获取数据库登陆密码
			String sDBPassword = PropertyUtil.getProperty("jdbc.password");//"1";
			String DBMinPoolSize = PropertyUtil.getProperty("DBMinPoolSize");//"2";
			String DBMaxPoolSize = PropertyUtil.getProperty("DBMaxPoolSize");//"200";

			ds = new ComboPooledDataSource();
			// 设置JDBC的Driver类
			ds.setDriverClass(sDBDriver); // 参数由 Config类根据配置文件读取
			// 设置JDBC的URL
			ds.setJdbcUrl(sDBConnectString);
			// 设置数据库的登录用户名
			ds.setUser(sDBUserName);
			// 设置数据库的登录用户密码
			ds.setPassword(sDBPassword);
			// 设置连接池的最大连接数
			ds.setMaxPoolSize(Integer.valueOf(DBMaxPoolSize));
			// 设置连接池的最小连接数
			ds.setMinPoolSize(Integer.valueOf(DBMinPoolSize));
			ds.setTestConnectionOnCheckin(true);
			ds.setIdleConnectionTestPeriod(7200);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 获取连接connection
	 * 
	 * @return Connection connection
	 * @throws SQLException
	 */
	public static Connection getConnection() throws SQLException {
		return ds.getConnection();
	}

	/**
	 * 关闭数据库连接
	 * 
	 * @param connection
	 *            不需要关闭传null
	 * @param statement
	 *            不需要关闭传null
	 * @param resultSet
	 *            不需要关闭传null
	 */
	public static void closeConnection(Connection connection,
			Statement statement, ResultSet resultSet) {
		try {
			if (resultSet != null) {
				DbUtils.close(resultSet);
				resultSet = null;
			}
			if (statement != null) {
				DbUtils.close(statement);
				statement = null;
			}
			if (connection != null) {
				DbUtils.close(connection);
				connection = null;
			}
		} catch (Exception e) {
			System.out.println("数据库连接关闭异常");
			e.printStackTrace();
		} finally {
			if (resultSet != null) {
				resultSet = null;
			}
			if (statement != null) {
				statement = null;
			}
			if (connection != null) {
				connection = null;
			}

		}
	}

	/**
	 * 关闭数据库连接
	 * 
	 * @param connection
	 *            不需要关闭传null
	 */
	public static void closeConnection(Connection connection) {
		try {
			if (connection != null) {
				DbUtils.close(connection);
				connection = null;
			}
		} catch (Exception e) {
			System.out.println("数据库连接关闭异常");
			e.printStackTrace();
		} finally {
			if (connection != null) {
				connection = null;
			}
		}
	}
}

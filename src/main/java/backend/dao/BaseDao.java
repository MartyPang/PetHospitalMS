package backend.dao;

import org.apache.commons.dbutils.QueryRunner;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by PSF on 2017/2/17.
 */
public class BaseDao {
	public Connection conn = null;
	public PreparedStatement ps = null;
	public ResultSet rs = null;

	private QueryRunner queryRunner = null;

	public QueryRunner getQueryRunner() {
		if (null == queryRunner) {
			queryRunner = new QueryRunner();
		}
		return queryRunner;
	}
}

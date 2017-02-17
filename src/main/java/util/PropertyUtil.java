package util;

import java.util.Enumeration;
import java.util.Properties;
import java.util.ResourceBundle;

/**
 * Created by Marty Pang on 2016/12/26.
 */

public class PropertyUtil {
    private static boolean m_bInited = false;
    // �����ļ��е�������Ŀ��
    protected static Properties m_vProperties = new Properties();
    static {
        // ���������ļ�
        loadPropertyFile("config");
    }

    // ���������ļ�
    protected static void loadPropertyFile(String propertyFile) {
        // ����Ѿ���ʼ�����ˣ����ٽ��г�ʼ����
        if (m_bInited)
            return;
        ResourceBundle bundle = null;
        // ��������Ϣת����Properties
        try {
            // ��ȡ�����ļ�
            bundle = ResourceBundle.getBundle(propertyFile);
            Enumeration<?> vEnumeration = bundle.getKeys();
            Object oKey = null;
            Object oValue = null;
            while (vEnumeration.hasMoreElements()) {
                oKey = vEnumeration.nextElement();
                oValue = bundle.getString(oKey.toString());
                m_vProperties.put(oKey, oValue);
            }
            bundle = null;
            m_bInited = true;
        } catch (Exception e) {
            bundle = null;
            m_bInited = false;
            System.out.println("PropertyManager��loadPropertyFile���������쳣��"+e);
        }

    }

    public static Properties loadProperty(String propertyFile) {
        Properties property = new Properties();
        ResourceBundle bundle = null;
        // ��������Ϣת����Properties
        try {
            // ��ȡ�����ļ�
            bundle = ResourceBundle.getBundle(propertyFile);
            Enumeration<?> vEnumeration = bundle.getKeys();
            Object oKey = null;
            Object oValue = null;
            while (vEnumeration.hasMoreElements()) {
                oKey = vEnumeration.nextElement();
                oValue = bundle.getString(oKey.toString());
                property.put(oKey, oValue);
            }
        } catch (Exception e) {
            System.out.println("PropertyManager��loadPropertyFile���������쳣��"+e);
        }
        return property;
    }

    // ����key��ȡ������Ϣ������
    public static String getProperty(String key) {
        return m_vProperties.getProperty(key);
    }
}

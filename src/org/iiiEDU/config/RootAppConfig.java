package org.iiiEDU.config;

import java.util.Properties;

import javax.naming.NamingException;
import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jndi.JndiObjectFactoryBean;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
public class RootAppConfig {

	@Bean
	public DataSource dataSource() throws IllegalArgumentException, NamingException {
		
		JndiObjectFactoryBean jndiBean = new JndiObjectFactoryBean();
		jndiBean.setJndiName("java:comp/env/jdbc/servdb");
		jndiBean.setProxyInterface(DataSource.class);
		jndiBean.setLookupOnStartup(false);
		jndiBean.afterPropertiesSet();
		DataSource ds = (DataSource) jndiBean.getObject();
		return ds;
	}

	@Bean(destroyMethod = "destroy")
	public LocalSessionFactoryBean sessionFactory() throws IllegalArgumentException, NamingException {
		
		LocalSessionFactoryBean factory = new LocalSessionFactoryBean();
		factory.setDataSource(dataSource());
		factory.setPackagesToScan(new String[] { "org.iiiEDU.model" });
		factory.setHibernateProperties(additionalProperties());
		return factory;
	}

	private Properties additionalProperties() {
		
		Properties properties = new Properties();
		properties.put("hibernate.dialect", org.hibernate.dialect.SQLServer2008Dialect.class);
		properties.put("hibernate.show_sql", Boolean.TRUE);
		properties.put("hibernate.format_sql", Boolean.TRUE);
//		properties.put("hibernate.current_session_context_class", "thread");
//		properties.put("default_batch_fetch_size", 10);
//		properties.put("hibernate.hbm2ddl.auto", "validate");
		return properties;
	}

	@Bean(name = "transactionManager")
	@Autowired
	public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
		
		HibernateTransactionManager txManager = new HibernateTransactionManager();
		txManager.setSessionFactory(sessionFactory);
		return txManager;
	}
}

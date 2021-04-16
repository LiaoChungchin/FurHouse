package org.iiiEDU.config;

import java.util.ArrayList;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.oxm.jaxb.Jaxb2Marshaller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;


@Configuration
@EnableWebMvc
@ComponentScan(basePackages= {"org.iiiEDU"})
@EnableTransactionManagement
public class SpringMVCJavaConfig implements WebMvcConfigurer {
	
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		
		configurer.enable();
	}
	
	@Bean
	public MappingJackson2JsonView jsonView() {
		
		MappingJackson2JsonView view = new MappingJackson2JsonView();
		view.setPrettyPrint(true);
		return view;
	}
	
	@Bean
	public ViewResolver contentNegotiatingViewResolver() {
		
		ContentNegotiatingViewResolver contentResolver = new ContentNegotiatingViewResolver();
		ArrayList<View> views = new ArrayList<>();
		views.add(jsonView());
		contentResolver.setDefaultViews(views);
		return contentResolver;
	}
	
	@Bean
	public Jaxb2Marshaller jaxbMarshaller() {
		Jaxb2Marshaller jMashaller = new Jaxb2Marshaller();
//		jMashaller.setClassesToBeBound(null);
		jMashaller.setPackagesToScan(new String[] { "org.iiiEDU.model" });
		return jMashaller;
	}
	
	@Bean
	public InternalResourceViewResolver setViewResolver() {
		
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();		
		viewResolver.setPrefix("/WEB-INF/pages/");
//		viewResolver.setSuffix(".jsp");
		viewResolver.setOrder(6);
		return viewResolver;
	}
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("UTF-8");
		return multipartResolver;
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		registry.addResourceHandler("/images/**").addResourceLocations("/WEB-INF/resources/images/");
	}
}

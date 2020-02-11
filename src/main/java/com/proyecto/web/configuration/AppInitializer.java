package com.proyecto.web.configuration;

import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class AppInitializer
        extends AbstractAnnotationConfigDispatcherServletInitializer {

    private static final String LOCATION = "C:/proyectoWeb/fileUpload/";
    private static final long MAX_FILE_SIZE = 26214400L;
    private static final long MAX_REQUEST_SIZE = 31457280L;
    private static final int FILE_SIZE_THRESHOLD = 0;

    protected Class<?>[] getRootConfigClasses() {
        return new Class[]{AppConfig.class};
    }

    protected Class<?>[] getServletConfigClasses() {
        return null;
    }

    protected String[] getServletMappings() {
        return new String[]{"/"};
    }

    protected void customizeRegistration(ServletRegistration.Dynamic registration) {
        registration.setMultipartConfig(getMultipartConfigElement());
    }

    private MultipartConfigElement getMultipartConfigElement() {
        MultipartConfigElement multipartConfigElement = new MultipartConfigElement("C:/proyectoWeb/fileUpload/", 26214400L, 31457280L, 0);
        return multipartConfigElement;
    }
}
